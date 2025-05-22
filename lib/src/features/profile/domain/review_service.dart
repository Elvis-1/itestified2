import 'package:itestified/src/config/network/api_client.dart';
import 'package:itestified/src/config/network/api_endpoints.dart';
import 'package:itestified/src/config/service_locators.dart';

abstract class ReviewService {
  Future<bool> submitReview(int rating, String text);
}

class ReviewServiceImpl implements ReviewService {
  final ApiClient _apiClient;

  ReviewServiceImpl({ApiClient? apiClient})
      : _apiClient = apiClient ?? sl<ApiClient>();

  @override
  Future<bool> submitReview(int rating, String text) async {
    if (rating == 0) return false;

    try {
      final response = await _apiClient.post(
        reviewEndpoints.submitReview,
        data: {
          'rating': rating,
          'message': text,
        },
      );

      return response.isSuccess;
    } catch (e) {
      return false;
    }
  }
}