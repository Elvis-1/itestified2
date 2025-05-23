import 'package:flutter/material.dart';
import 'package:itestified/src/config/network/api_client.dart';

abstract class DonationService {
  List<Map<String, dynamic>> getTransactions();
}

class DonationServicesImp implements DonationService {
  final ApiClient _apiClient;

  DonationServicesImp(this._apiClient);

  @override
  List<Map<String, dynamic>> getTransactions() {
  
    return [
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
  }
}