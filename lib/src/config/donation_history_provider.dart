import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DonationHistoryProvider with ChangeNotifier {
  String _selectedStatus = 'All';
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isRefreshing = false;

  String get selectedStatus => _selectedStatus;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  bool get isRefreshing => _isRefreshing;

  // Updated transactions with date and verificationCode
  final List<Map<String, dynamic>> _transactions = [
    {
      'amount': '₦ 5000',
      'email': 'Elvisigiebor@gmail.com',
      'status': 'Verified',
      'statusColor': Colors.green,
      'date': '2025-04-02',
      'verificationCode': '1830029269',
    },
    {
      'amount': '₦ 5000',
      'email': 'Elvisigiebor@gmail.com',
      'status': 'Pending',
      'statusColor': Colors.orange,
      'date': '2025-04-01',
      'verificationCode': '1830029269',
    },
    {
      'amount': '₦ 5000',
      'email': 'Elvisigiebor@gmail.com',
      'status': 'Failed',
      'statusColor': Colors.red,
      'date': '2025-03-31',
      'verificationCode': '1830029269',
    },
  ];

  List<Map<String, dynamic>> get filteredTransactions {
    print('Filtered transactions: $_transactions');
    return _transactions.where((transaction) {
      if (transaction['amount'] == null ||
          transaction['email'] == null ||
          transaction['status'] == null ||
          transaction['statusColor'] == null ||
          transaction['date'] == null) {
        print('Skipping invalid transaction: $transaction');
        return false;
      }

      bool statusMatch =
          _selectedStatus == 'All' || transaction['status'] == _selectedStatus;

      bool dateMatch = true;
      if (_startDate != null && _endDate != null) {
        try {
          final transactionDate = DateTime.parse(transaction['date']);
          dateMatch = transactionDate
                  .isAfter(_startDate!.subtract(const Duration(days: 1))) &&
              transactionDate.isBefore(_endDate!.add(const Duration(days: 1)));
        } catch (e) {
          dateMatch = false;
        }
      }

      return statusMatch && dateMatch;
    }).toList();
  }

  void setStatusFilter(String status) {
    _selectedStatus = status;
    notifyListeners();
  }

  void setDateRange(DateTime? start, DateTime? end) {
    _startDate = start;
    _endDate = end;
    notifyListeners();
  }

  void setRefreshing(bool value) {
    _isRefreshing = value;
    notifyListeners();
  }

  void clearDateRange() {
    _startDate = null;
    _endDate = null;
    notifyListeners();
  }
}
