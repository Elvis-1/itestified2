import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class DonationDetailsScreen extends StatelessWidget {
  static const String routeName = '/donation-details';

  final Map<String, dynamic> transaction;

  const DonationDetailsScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final themeData = themeProvider.themeData;

    final isFailed =
        (transaction['status']?.toString() ?? 'Unknown').toLowerCase() ==
            'failed';

    String formattedDate = 'N/A';
    try {
      if (transaction['date'] != null) {
        final date = DateTime.parse(transaction['date']);
        formattedDate = DateFormat('dd/MM/yyyy').format(date);
      }
    } catch (e) {
      print('Error formatting date: $e');
    }

    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      appBar: generalAppbar("Donation History", context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 138),
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppIcons.reciptbig),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: 345,
                height: 195,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: themeData.colorScheme.outline,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDetailRow(
                      context,
                      label: 'Status',
                      value: transaction['status']?.toString() ?? 'Unknown',
                      valueWidget: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: (transaction['statusColor'] as Color?) ??
                                AppColors.grey50,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: textWidget(
                          transaction['status']?.toString() ?? 'Unknown',
                          fontSize: themeData.textTheme.bodySmall?.fontSize,
                          color: (transaction['statusColor'] as Color?) ??
                              AppColors.grey50,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    _buildDetailRow(
                      context,
                      label: 'Amount',
                      value: transaction['amount']?.toString() ?? 'N/A',
                    ),
                    _buildDetailRow(
                      context,
                      label: 'Email',
                      value: transaction['email']?.toString() ?? 'N/A',
                    ),
                    _buildDetailRow(
                      context,
                      label: 'Date',
                      value: formattedDate,
                    ),
                    _buildDetailRow(
                      context,
                      label: 'Verification Code',
                      value:
                          transaction['verificationCode']?.toString() ?? 'N/A',
                    ),
                  ],
                ),
              ),
              if (isFailed) ...[
                const SizedBox(height: 24),
                Container(
                  width: 345,
                  height: 116,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.redColor.withOpacity(0.05),
                    border: Border.all(
                      color: AppColors.redColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: textWidget(
                    'This donation has been marked as failed. This means we checked your submitted receipt but did not receive the corresponding funds in our account. If you believe this is an error or need assistance, please contact our support team at ifnotgodtech@gmail.com.',
                    fontSize: themeData.textTheme.bodySmall?.fontSize,
                    color: Colors.red,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required String label,
    required String value,
    Widget? valueWidget,
  }) {
    final themeData = Provider.of<ThemeViewmodel>(context).themeData;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textWidget(
          label,
          fontSize: themeData.textTheme.bodyMedium?.fontSize,
          fontWeight: FontWeight.w600,
          color: themeData.colorScheme.onSurface,
        ),
        valueWidget ??
            textWidget(
              value,
              fontSize: themeData.textTheme.bodyMedium?.fontSize,
              color: themeData.colorScheme.onSurface,
            ),
      ],
    );
  }
}
