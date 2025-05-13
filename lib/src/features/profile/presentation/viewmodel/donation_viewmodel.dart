import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:itestified/src/features/profile/domain/donation_service.dart';

class DonationViewmodel {
  final DonationService _service = GetIt.I<DonationService>();

  List<Map<String, dynamic>> getFilteredTransactions({
    required String selectedStatus,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    final transactions = _service.getTransactions();
    return transactions.where((transaction) {
      if (transaction['amount'] == null ||
          transaction['email'] == null ||
          transaction['status'] == null ||
          transaction['statusColor'] == null ||
          transaction['date'] == null) {
        print('Skipping invalid transaction: $transaction');
        return false;
      }

      bool statusMatch = selectedStatus == 'All' || transaction['status'] == selectedStatus;

      bool dateMatch = true;
      if (startDate != null && endDate != null) {
        try {
          final transactionDate = DateTime.parse(transaction['date']);
          dateMatch = transactionDate
                  .isAfter(startDate.subtract(const Duration(days: 1))) &&
              transactionDate.isBefore(endDate.add(const Duration(days: 1)));
        } catch (e) {
          dateMatch = false;
        }
      }

      return statusMatch && dateMatch;
    }).toList();
  }
}