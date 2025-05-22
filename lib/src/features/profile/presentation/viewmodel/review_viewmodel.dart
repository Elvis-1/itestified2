import 'package:get_it/get_it.dart';
import 'package:itestified/src/features/profile/domain/review_service.dart';

class ReviewViewModel {
  final ReviewService _reviewService;

  ReviewViewModel({ReviewService? reviewService})
      : _reviewService = reviewService ?? GetIt.I<ReviewService>();

  int get selectedRating => _reviewService.selectedRating;
  String get reviewText => _reviewService.reviewText;
  bool get isLoading => _reviewService.isLoading;
  String? get errorMessage => _reviewService.errorMessage;

  void setRating(int rating) => _reviewService.setRating(rating);
  void setReviewText(String text) => _reviewService.setReviewText(text);
  Future<bool> submitReview() => _reviewService.submitReview();
  void clear() => _reviewService.clear();
}