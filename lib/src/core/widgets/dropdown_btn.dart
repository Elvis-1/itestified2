import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class DropdownBTN extends StatefulWidget {
  const DropdownBTN({super.key});

  @override
  State<DropdownBTN> createState() => _DropdownBTNState();
}

class _DropdownBTNState extends State<DropdownBTN> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
      decoration: BoxDecoration(
        color: themeProvider.themeData.colorScheme.outline,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              color: themeProvider.themeData.colorScheme.tertiary,
            ),
          ),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 14,
                        color: themeProvider.themeData.colorScheme.tertiary,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
            });
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          dropdownStyleData: DropdownStyleData(

            decoration: BoxDecoration(
              color: themeProvider.themeData.colorScheme.outline,
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 8,
            maxHeight: 200,
            padding: const EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
      ),
    );
  }
}
