import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/features/profile/domain/review_service.dart';

class ReviewState {
  final int rating;
  final String text;
  final bool isLoading;
  final String? errorMessage;

  ReviewState({
    this.rating = 0,
    this.text = '',
    this.isLoading = false,
    this.errorMessage,
  });

  ReviewState copyWith({
    int? rating,
    String? text,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ReviewState(
      rating: rating ?? this.rating,
      text: text ?? this.text,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class ReviewViewModel extends ValueNotifier<ReviewState> {
  final ReviewService _reviewService;

  ReviewViewModel({ReviewService? reviewService})
      : _reviewService = reviewService ?? GetIt.I<ReviewService>(),
        super(ReviewState());

  int get selectedRating => value.rating;
  String get reviewText => value.text;
  bool get isLoading => value.isLoading;
  String? get errorMessage => value.errorMessage;

  void setRating(int rating) {
    print('ReviewViewModel: Setting rating to $rating');
    value = value.copyWith(rating: rating);
  }

  void setReviewText(String text) {
    print('ReviewViewModel: Setting review text to $text');
    value = value.copyWith(text: text);
  }

  Future<bool> submitReview() async {
    if (value.rating == 0) return false;

    print(
        'ReviewViewModel: Submitting review: rating=${value.rating}, text=${value.text}');
    value = value.copyWith(isLoading: true, errorMessage: null);

    try {
      final success =
          await _reviewService.submitReview(value.rating, value.text);
      value = value.copyWith(
        isLoading: false,
        errorMessage: success ? null : 'Failed to submit review',
      );
      return success;
    } catch (e) {
      print('ReviewViewModel: Error submitting review: $e');
      value = value.copyWith(
        isLoading: false,
        errorMessage: 'Error: $e',
      );
      return false;
    }
  }

  void clear() {
    print('ReviewViewModel: Clearing state');
    value = ReviewState();
  }
}
