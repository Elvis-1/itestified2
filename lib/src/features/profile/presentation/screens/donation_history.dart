import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/appbar2.dart';
import 'package:itestified/src/core/widgets/btn_and_text.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:itestified/src/features/profile/presentation/screens/donation_details.dart';
import 'package:itestified/src/features/profile/presentation/viewmodel/donation_viewmodel.dart';
import 'package:provider/provider.dart';


class DonationHistoryScreen extends StatelessWidget {
  static const String routeName = '/donation-history';

  const DonationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);
    final donationHistoryProvider =
        Provider.of<DonationViewmodel>(context);
    final themeData = themeProvider.themeData;

    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      appBar: generalAppbar("Donation History", context),
      body: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                donationHistoryProvider.setRefreshing(true);

                await Future.delayed(const Duration(seconds: 2));

                donationHistoryProvider.setRefreshing(false);
              },
              builder: (context, refreshState, pulledExtent,
                  refreshTriggerPullDistance, refreshIndicatorExtent) {
                return const SizedBox.shrink();
              },
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _showDateRangeBottomSheet(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              btnAndText(
                                text: "Select Date Range",
                                fontSize:
                                    themeData.textTheme.bodyMedium?.fontSize,
                                containerColor: Colors.transparent,
                                containerWidth: 160,
                                verticalPadding: 10,
                                textColor: AppColors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 24,),
                        GestureDetector(
                          onTap: () => _showStatusFilterBottomSheet(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              btnAndText(
                                text: "Select Status",
                                fontSize:
                                    themeData.textTheme.bodyMedium?.fontSize,
                                containerColor: Colors.transparent,
                                containerWidth: 160,
                                verticalPadding: 10,
                                textColor: AppColors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Consumer<DonationViewmodel>(
                      builder: (context, provider, _) {
                        return provider.isRefreshing
                            ? Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: themeData.colorScheme.outline,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Loading...',
                                      style: TextStyle(
                                        fontSize: themeData
                                            .textTheme.bodyMedium?.fontSize,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 12),
                    textWidget(
                      'April 2025',
                      fontSize: themeData.textTheme.bodyMedium?.fontSize,
                      fontWeight: FontWeight.w600,
                      color: themeData.colorScheme.onSurface,
                    ),
                    const SizedBox(height: 20),
                    ...donationHistoryProvider.filteredTransactions
                        .map((transaction) {
                      print('Transaction: $transaction'); // Debug log
                      // Format date from 'yyyy-MM-dd' to 'dd/MM/yyyy'
                      String formattedDate = 'N/A';
                      try {
                        if (transaction['date'] != null) {
                          final date = DateTime.parse(transaction['date']);
                          formattedDate = DateFormat('dd/MM/yyyy').format(date);
                        }
                      } catch (e) {
                        print('Error formatting date: $e');
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              DonationDetailsScreen.routeName,
                              arguments: transaction,
                            );
                          },
                          child: _buildTransactionContainer(
                            context,
                            amount: transaction['amount']?.toString() ?? 'N/A',
                            email: transaction['email']?.toString() ?? 'N/A',
                            status:
                                transaction['status']?.toString() ?? 'Unknown',
                            statusColor: transaction['statusColor'] as Color? ??
                                AppColors.grey50,
                            date: formattedDate,
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  void _showStatusFilterBottomSheet(BuildContext context) {
    final themeData =
        Provider.of<ThemeViewmodel>(context, listen: false).themeData;
    final donationHistoryProvider =
        Provider.of<DonationViewmodel>(context, listen: false);

    showModalBottomSheet(
      context: context,
      backgroundColor: themeData.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: 264,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textWidget(
                      'Status',
                      fontSize: themeData.textTheme.titleLarge?.fontSize,
                      fontWeight: FontWeight.w600,
                      color: themeData.colorScheme.onSurface,
                    ),
                    GestureDetector(
                      onTap: () {
                        donationHistoryProvider.setStatusFilter('All');
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 24,
                        color: AppColors.grey50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildFilterOption(context, 'All', donationHistoryProvider),
                _buildFilterOption(context, 'Pending', donationHistoryProvider),
                _buildFilterOption(
                    context, 'Verified', donationHistoryProvider),
                _buildFilterOption(context, 'Failed', donationHistoryProvider),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDateRangeBottomSheet(BuildContext context) {
    final themeData =
        Provider.of<ThemeViewmodel>(context, listen: false).themeData;
    final donationHistoryProvider =
        Provider.of<DonationViewmodel>(context, listen: false);

    DateTime? localStartDate = donationHistoryProvider.startDate;
    DateTime? localEndDate = donationHistoryProvider.endDate;

    showModalBottomSheet(
      context: context,
      backgroundColor: themeData.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              width: double.infinity,
              height: 358,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textWidget(
                          'Date Range',
                          fontSize: themeData.textTheme.titleLarge?.fontSize,
                          fontWeight: FontWeight.w600,
                          color: themeData.colorScheme.onSurface,
                        ),
                        GestureDetector(
                          onTap: () {
                            donationHistoryProvider.clearDateRange();
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            size: 24,
                            color: AppColors.grey50,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    textWidget(
                      'Start Date',
                      fontSize: themeData.textTheme.bodyMedium?.fontSize,
                      fontWeight: FontWeight.w600,
                      color: themeData.colorScheme.onTertiary,
                    ),
                    const SizedBox(height: 8),
                    _DatePickerContainer(
                      initialDate: localStartDate,
                      onDateSelected: (date) {
                        setState(() {
                          localStartDate = date;
                        });
                      },
                      provider: donationHistoryProvider,
                    ),
                    const SizedBox(height: 12),
                    textWidget(
                      'End Date',
                      fontSize: themeData.textTheme.bodyMedium?.fontSize,
                      fontWeight: FontWeight.w600,
                      color: themeData.colorScheme.onTertiary,
                    ),
                    const SizedBox(height: 8),
                    _DatePickerContainer(
                      initialDate: localEndDate,
                      onDateSelected: (date) {
                        setState(() {
                          localEndDate = date;
                        });
                      },
                      provider: donationHistoryProvider,
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          donationHistoryProvider.setDateRange(
                            localStartDate,
                            localEndDate,
                          );
                          Navigator.pop(context);
                        },
                        child: btnAndText(
                          text: "Close",
                          fontSize: themeData.textTheme.bodyLarge?.fontSize,
                          containerWidth: 345,
                          verticalPadding: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFilterOption(
      BuildContext context, String status, DonationViewmodel provider) {
    final themeData = Provider.of<ThemeViewmodel>(context).themeData;
    final isSelected = provider.selectedStatus == status;

    return GestureDetector(
      onTap: () {
        provider.setStatusFilter(status);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: textWidget(
                status,
                fontSize: themeData.textTheme.bodyMedium?.fontSize,
                fontWeight: FontWeight.w600,
                color: themeData.colorScheme.onSurface,
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check,
                color: AppColors.primaryColor,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionContainer(
    BuildContext context, {
    required String amount,
    required String email,
    required String status,
    required Color statusColor,
    required String date,
  }) {
    final themeData = Provider.of<ThemeViewmodel>(context).themeData;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeData.colorScheme.surface,
        border: Border.all(
          color: themeData.colorScheme.outline,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: themeData.colorScheme.primary.withOpacity(0.1),
              image: DecorationImage(
                image: AssetImage(AppIcons.recipt),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(
                  amount,
                  fontSize: themeData.textTheme.bodyMedium?.fontSize,
                  fontWeight: FontWeight.w600,
                  color: themeData.colorScheme.onSurface,
                ),
                const SizedBox(height: 4),
                textWidget(
                  email,
                  fontSize: themeData.textTheme.labelSmall?.fontSize,
                  fontWeight: FontWeight.w400,
                  color: themeData.colorScheme.onSurfaceVariant,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 80,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: statusColor, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: textWidget(
                    status,
                    fontSize: themeData.textTheme.bodySmall?.fontSize,
                    color: statusColor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              textWidget(
                date,
                fontSize: themeData.textTheme.bodySmall?.fontSize,
                color: themeData.colorScheme.onTertiary,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DatePickerContainer extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime?) onDateSelected;
  final DonationViewmodel provider;

  const _DatePickerContainer({
    required this.initialDate,
    required this.onDateSelected,
    required this.provider,
  });

  @override
  _DatePickerContainerState createState() => _DatePickerContainerState();
}

class _DatePickerContainerState extends State<_DatePickerContainer> {
  late String _displayText;

  @override
  void initState() {
    super.initState();
    final dateFormat = DateFormat('dd/MM/yyyy');
    _displayText = widget.initialDate != null
        ? dateFormat.format(widget.initialDate!)
        : 'DD/MM/YYYY';
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeViewmodel>(context).themeData;

    return GestureDetector(
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: widget.initialDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: themeData.copyWith(
                colorScheme: themeData.colorScheme.copyWith(
                  primary: AppColors.primaryColor,
                  onPrimary: AppColors.white,
                ),
              ),
              child: child!,
            );
          },
        );

        if (selectedDate != null) {
          final dateFormat = DateFormat('dd/MM/yyyy');
          setState(() {
            _displayText = dateFormat.format(selectedDate);
          });
          widget.onDateSelected(selectedDate);

          if (widget.provider.startDate != null &&
              widget.provider.endDate != null) {
            Navigator.pop(context);
          }
        }
      },
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: themeData.colorScheme.outline,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textWidget(
              _displayText,
              fontSize: themeData.textTheme.bodyMedium?.fontSize,
              color: _displayText != 'DD/MM/YYYY'
                  ? themeData.colorScheme.onSurface
                  : themeData.colorScheme.onSurfaceVariant,
            ),
            const Icon(
              Icons.calendar_today,
              size: 20,
              color: AppColors.grey50,
            ),
          ],
        ),
      ),
    );
  }
}
