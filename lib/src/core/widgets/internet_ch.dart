import 'dart:io'; //InternetAddress utility
import 'dart:async'; //For StreamController/Stream
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionStatusSingleton {
  static final ConnectionStatusSingleton _singleton =
      ConnectionStatusSingleton._internal();
  ConnectionStatusSingleton._internal();

  static ConnectionStatusSingleton getInstance() => _singleton;

  bool hasConnection = false;
  Timer? _timer;
  final Connectivity _connectivity = Connectivity();

  StreamController<bool> connectionChangeController =
      StreamController<bool>.broadcast();

  // Stream to expose connection changes
  Stream<bool> get connectionChange => connectionChangeController.stream;

  // Initialize with periodic checks for connectivity
  void initialize() {
    _startPeriodicCheck();
  }

  void dispose() {
    _timer?.cancel();
    connectionChangeController.close();
  }

  // Periodically check for connection every 10 seconds
  void _startPeriodicCheck() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) async {
      await checkConnection();
    });
  }

  // Method to check connection and update listeners
  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      // Check if we can reach google.com to determine actual internet connectivity
      final result = await InternetAddress.lookup('example.com');
      hasConnection = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      hasConnection = false;
    }

    // If connection status changes, notify listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }
}
