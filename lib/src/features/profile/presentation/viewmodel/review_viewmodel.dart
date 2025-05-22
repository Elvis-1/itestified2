import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/features/profile/domain/review_service.dart';

class ReviewViewModel extends ChangeNotifier {
  int _selectedRating = 0;
  String _reviewText = '';
  bool _isLoading = false;
  String? _errorMessage;

  final ReviewService _reviewService;

  ReviewViewModel({ReviewService? reviewService})
      : _reviewService = reviewService ?? GetIt.I<ReviewService>();

  int get selectedRating => _selectedRating;
  String get reviewText => _reviewText;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setRating(int rating) {
    print('ReviewViewModel: Setting rating to $rating');
    _selectedRating = rating;
    notifyListeners();
  }

  void setReviewText(String text) {
    print('ReviewViewModel: Setting review text to $text');
    _reviewText = text;
    notifyListeners();
  }

  Future<bool> submitReview() async {
    if (_selectedRating == 0) return false;

    print(
        'ReviewViewModel: Submitting review: rating=$_selectedRating, text=$_reviewText');
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final success =
          await _reviewService.submitReview(_selectedRating, _reviewText);
      _isLoading = false;
      _errorMessage = success ? null : 'Failed to submit review';
      notifyListeners();
      return success;
    } catch (e) {
      print('ReviewViewModel: Error submitting review: $e');
      _isLoading = false;
      _errorMessage = 'Error: $e';
      notifyListeners();
      return false;
    }
  }

  void clear() {
    print('ReviewViewModel: Clearing state');
    _selectedRating = 0;
    _reviewText = '';
    _isLoading = false;
    _errorMessage = null;
    notifyListeners();
  }
}
