import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class VideoViewModel with ChangeNotifier {
  VideoPlayerController? _controller;
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  String _selectedQuality = '720p';
  double _playbackSpeed = 1.0;
  bool _isFullScreen = false;
  bool _isInitialized = false;
  bool _isBuffering = false;
  String? _errorMessage;
  bool _showControls = true;
  Timer? _hideControlsTimer;
  bool _isDisposed = false;
  String? _currentVideoUrl;
  bool _isMounted = true;

  VideoPlayerController? get controller => _controller;
  bool get isPlaying => _isPlaying;
  Duration get position => _position;
  Duration get duration => _duration;
  String get selectedQuality => _selectedQuality;
  double get playbackSpeed => _playbackSpeed;
  bool get isFullScreen => _isFullScreen;
  bool get isInitialized => _isInitialized;
  bool get isBuffering => _isBuffering;
  String? get errorMessage => _errorMessage;
  bool get showControls => _showControls;

  VideoViewModel();

  Future<void> setVideoUrl(String videoUrl) async {
    if (_isDisposed || !_isMounted || videoUrl == _currentVideoUrl) {
      print(
          'Skipping setVideoUrl: disposed=$_isDisposed, mounted=$_isMounted, same URL=$videoUrl');
      return;
    }
    _currentVideoUrl = videoUrl;
    print('Setting video URL: $videoUrl');
    await _initializeController(videoUrl);
  }

  Future<void> _initializeController(String videoUrl) async {
    if (_isDisposed || !_isMounted) return;
    try {
      if (_controller != null) {
        print('Disposing controller: ${_controller.hashCode}');
        await _controller!.pause();
        await _controller!.dispose();
        _controller = null;
      }
      _isInitialized = false;
      _errorMessage = null;
      _position = Duration.zero;
      _duration = Duration.zero;
      _showControls = true;
      if (_isMounted) notifyListeners();

      _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
        ..addListener(_updatePosition)
        ..setLooping(false);
      print('Created controller: ${_controller.hashCode}');
      await _controller!.initialize();
      _duration = _controller!.value.duration;
      _isInitialized = true;
      _errorMessage = null;
      print(
          'Controller initialized: ${_controller.hashCode}, duration: $_duration');
      if (_isMounted) notifyListeners();
    } catch (error) {
      _isInitialized = false;
      _errorMessage = 'Failed to load video: $error';
      print('Initialization error: $error');
      if (_isMounted) notifyListeners();
    }
  }

  void _updatePosition() {
    if (_isDisposed || !_isMounted) return;
    final newPosition = _controller?.value.position ?? Duration.zero;
    final newIsPlaying = _controller?.value.isPlaying ?? false;
    final newIsBuffering = _controller?.value.isBuffering ?? false;

    _position = newPosition;

    bool shouldNotify = false;

    if (_isPlaying != newIsPlaying) {
      _isPlaying = newIsPlaying;
      shouldNotify = true;
    }

    // Only notify if buffering status changes
    if (_isBuffering != newIsBuffering) {
      _isBuffering = newIsBuffering;
      shouldNotify = true;
    }

    print(
        'Position updated: $_position, playing: $_isPlaying, buffering: $_isBuffering, showControls: $_showControls');

    // Check for errors
    if (_controller?.value.hasError ?? false) {
      _errorMessage = 'Playback error: ${_controller!.value.errorDescription}';
      print('Playback error: ${_controller!.value.errorDescription}');
      _isPlaying = false;
      _isBuffering = false;
      if (_isMounted) notifyListeners();
      return;
    }

    // Manage controls visibility
    if (_isPlaying && _showControls) {
      _startHideControlsTimer();
    }

    // Always notify when position updates (needed for progress bar)
    if (_isMounted) notifyListeners();
  }

  void _startHideControlsTimer() {
    if (_hideControlsTimer?.isActive ?? false) {
      print('Hide controls timer already active, skipping start');
      return;
    }
    _hideControlsTimer?.cancel();
    print('Starting hide controls timer');
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      if (_isPlaying && !_isDisposed && _isMounted) {
        print('Hiding controls');
        _showControls = false;
        if (_isMounted) notifyListeners();
      }
    });
  }

  void togglePlayPause() {
    if (!_isInitialized || _isDisposed || !_isMounted) {
      print(
          'Cannot toggle play/pause: initialized=$_isInitialized, disposed=$_isDisposed, mounted=$_isMounted');
      return;
    }
    if (_isPlaying) {
      _controller?.pause().catchError((error) {
        _errorMessage = 'Failed to pause video: $error';
        print('Pause error: $error');
        if (_isMounted) notifyListeners();
      });
      _isPlaying = false;
      _hideControlsTimer?.cancel();
      _showControls = true;
      print(
          'Paused video, isPlaying: $_isPlaying, showControls: $_showControls');
    } else {
      _controller?.play().catchError((error) {
        _errorMessage = 'Failed to play video: $error';
        print('Play error: $error');
        if (_isMounted) notifyListeners();
      });
      _isPlaying = true;
      _showControls = true;
      _startHideControlsTimer();
      print(
          'Playing video, isPlaying: $_isPlaying, showControls: $_showControls');
    }
    if (_isMounted) notifyListeners();
  }

  void toggleControls() {
    if (!_isMounted) return;
    _showControls = !_showControls;
    print('Toggling controls, showControls: $_showControls');
    if (_showControls && _isPlaying) {
      _startHideControlsTimer();
    } else {
      _hideControlsTimer?.cancel();
    }
    if (_isMounted) notifyListeners();
  }

  void seekTo(Duration position) {
    if (!_isInitialized || _isDisposed || !_isMounted) return;
    _controller?.seekTo(position);
    _showControls = true;
    _startHideControlsTimer();
    print('Seeking to $position, showControls: $_showControls');
    if (_isMounted) notifyListeners();
  }

  Future<void> setQuality(String quality, String newVideoUrl) async {
    if (_isDisposed || !_isMounted) return;
    try {
      final currentPosition = _position;
      final wasPlaying = _isPlaying;
      _selectedQuality = quality;
      print('Switching quality to $quality with URL: $newVideoUrl');
      await _initializeController(newVideoUrl);
      if (_isInitialized && _isMounted) {
        await _controller?.seekTo(currentPosition);
        if (wasPlaying) {
          await _controller?.play();
          _isPlaying = true;
        }
        _showControls = true;
        _startHideControlsTimer();
      }
    } catch (error) {
      _errorMessage = 'Failed to switch quality: $error';
      print('Quality switch error: $error');
      if (_isMounted) notifyListeners();
    }
  }

  void setPlaybackSpeed(double speed) {
    if (!_isInitialized || _isDisposed || !_isMounted) return;
    _playbackSpeed = speed;
    _controller?.setPlaybackSpeed(speed);
    _showControls = true;
    _startHideControlsTimer();
    print('Set playback speed to $speed, showControls: $_showControls');
    if (_isMounted) notifyListeners();
  }

  void toggleFullScreen() {
    if (!_isMounted) return;
    _isFullScreen = !_isFullScreen;
    if (_isFullScreen) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
    _showControls = true;
    _startHideControlsTimer();
    print('Toggled full screen: $_isFullScreen, showControls: $_showControls');
    if (_isMounted) notifyListeners();
  }

  Future<void> retry(String videoUrl) async {
    if (_isDisposed || !_isMounted) return;
    const maxRetries = 3;
    for (int i = 0; i < maxRetries; i++) {
      print('Retry attempt ${i + 1} for URL: $videoUrl');
      try {
        await _initializeController(videoUrl);
        if (_isInitialized) return;
      } catch (_) {
        if (i == maxRetries - 1) {
          _errorMessage = 'Failed to load video after $maxRetries attempts';
          print('Retry failed: $_errorMessage');
          if (_isMounted) notifyListeners();
        }
      }
    }
  }

  @override
  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;
    _isMounted = false;
    _hideControlsTimer?.cancel();
    _controller?.removeListener(_updatePosition);
    _controller?.pause();
    _controller?.dispose().then((_) {
      print('Controller disposed: ${_controller?.hashCode}');
    });
    _controller = null;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    print('VideoViewModel disposed');
    super.dispose();
  }
}
