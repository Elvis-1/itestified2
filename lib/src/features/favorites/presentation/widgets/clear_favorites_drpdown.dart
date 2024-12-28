import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/widgets/normal_text_style.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class ClearFavoritesDropDown<T> extends StatefulWidget {
  const ClearFavoritesDropDown({super.key, this.options});

  final List<T>? options;

  // final void Function()? onTap;

  @override
  State<ClearFavoritesDropDown<T>> createState() =>
      _ClearFavoritesDropDownState<T>();
}

class _ClearFavoritesDropDownState<T> extends State<ClearFavoritesDropDown<T>> {
  bool isOpen = false;
  OverlayEntry? _overlayEntry;

  void toggleDropdown() {
    if (isOpen) {
      closeDropdown();
    } else {
      openDropdown();
    }
  }

  openDropdown() {
    if (_overlayEntry == null &&
        widget.options != null &&
        widget.options!.isNotEmpty) {
      _overlayEntry = _createOverlayEntry(dropDown(
        options: widget.options as dynamic,
      ));
      Overlay.of(context).insert(_overlayEntry!);
    }
    setState(() {
      isOpen = true;
    });
  }

  void closeDropdown() {
    if (isOpen && _overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null; // Reset the entry after removing it.
      setState(() {
        isOpen = false;
      });
    }
  }

  @override
  void dispose() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
    super.dispose();
  }

  OverlayEntry _createOverlayEntry(Widget dropDown) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: closeDropdown, // Close dropdown when tapping outside
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(color: AppColors.transparent),
            ),
            // Dropdown positioned relative to trigger
            Positioned(
              top: 100, //offset.dy + size.height,
              right: 10, //offset.dx,
              child: dropDown,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  width: 150,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: toggleDropdown,
            child: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}

class dropDown<T> extends StatelessWidget {
  const dropDown({super.key, required this.options});
  final List<T> options;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return AnimatedContainer(
        duration: const Duration(microseconds: 150),
        child: Material(
          color: themeProvider.themeData.colorScheme.background,
          borderRadius: BorderRadius.circular(10),
          elevation: 4,
          child: Container(
            // height: 50,
            padding: const EdgeInsets.all(8),
            width: 200,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  for (var a in options)
                    Container(
                      child: a as Widget,
                    ),
                ],
              ),
            ),
          ),
        ) //Column(children: list
        // [

        );
  }
}

// Widget dropdown() {
//   var themeProvider = Provider.of<ThemeViewmodel>(context);

//   return AnimatedContainer(
//       duration: const Duration(microseconds: 150),
//       child: Material(
//         color: themeProvider.themeData.colorScheme.background,
//         borderRadius: BorderRadius.circular(10),
//         elevation: 4,
//         child: Container(
//           // height: 50,
//           padding: const EdgeInsets.all(8),
//           width: 200,
//           child: Align(
//             alignment: Alignment.center,
//             child: Column(
//               children: [
//                 for (var a in widget.options!)
//                   Container(
//                     child: a as Widget,
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ) //Column(children: list
//       // [

//       );
// }
