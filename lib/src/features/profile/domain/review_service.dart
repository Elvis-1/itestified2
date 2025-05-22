import 'package:get_it/get_it.dart';
import 'package:itestified/src/config/network/api_client.dart';
import 'package:itestified/src/config/network/api_endpoints.dart';
import 'package:itestified/src/config/service_locators.dart';

abstract class ReviewService {
  int get selectedRating;
  String get reviewText;
  bool get isLoading;
  String? get errorMessage;

  void setRating(int rating);
  void setReviewText(String text);
  Future<bool> submitReview();
  void clear();
}

class ReviewServiceImpl implements ReviewService {
  int _selectedRating = 0;
  String _reviewText = '';
  bool _isLoading = false;
  String? _errorMessage;

  final ApiClient _apiClient;

  ReviewServiceImpl({ApiClient? apiClient})
      : _apiClient = apiClient ?? sl<ApiClient>();

  @override
  int get selectedRating => _selectedRating;

  @override
  String get reviewText => _reviewText;

  @override
  bool get isLoading => _isLoading;

  @override
  String? get errorMessage => _errorMessage;

  @override
  void setRating(int rating) {
    _selectedRating = rating;
  }

  @override
  void setReviewText(String text) {
    _reviewText = text;
  }

  @override
  Future<bool> submitReview() async {
    if (_selectedRating == 0) return false;

    _isLoading = true;
    _errorMessage = null;

    try {
      final response = await _apiClient.post(
        reviewEndpoints.submitReview,
        data: {
          'rating': _selectedRating,
          'message': _reviewText,
        },
      );

      if (response.isSuccess) {
        _isLoading = false;
        return true;
      } else {
        _errorMessage = 'Failed to submit review: ${response.statusCode} - ${response.body}';
        _isLoading = false;
        return false;
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
      _isLoading = false;
      return false;
    }
  }

  @override
  void clear() {
    _selectedRating = 0;
    _reviewText = '';
    _errorMessage = null;
  }
}

