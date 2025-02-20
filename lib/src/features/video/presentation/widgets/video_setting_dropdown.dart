import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itestified/src/config/theme/app_color.dart';
import 'package:itestified/src/core/utils/app_const/app_icons.dart';
import 'package:itestified/src/core/widgets/checkbox.dart';
import 'package:itestified/src/core/widgets/text_widget.dart';
import 'package:itestified/src/features/app_theme/theme_viewmodel.dart';
import 'package:provider/provider.dart';

class VideoSettingsDropdown extends StatefulWidget {
  const VideoSettingsDropdown({super.key});

  @override
  State<VideoSettingsDropdown> createState() => _VideoSettingsDropdownState();
}

class _VideoSettingsDropdownState extends State<VideoSettingsDropdown> {
  OverlayEntry?
      _overlayEntry; // Make it nullable to avoid late initialization errors.
  bool isOpen = false;
  int currentIndex = -1;

  void toggleDropdown(Widget dropD) {
    if (isOpen) {
      closeDropdown();
    } else {
      openDropdown(dropD);
    }
  }

  void updateIndex(int index) {
    setState(() {
      currentIndex = index;
    });
    print('this is called');
    print('index when called $index');
    print('current index when called $currentIndex');
  }

  void openDropdown(Widget dropD) {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry(dropD);
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

  OverlayEntry _createOverlayEntry(Widget dropdown) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    // final size = renderBox.size;
    // final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: closeDropdown,
        // Close dropdown when tapping outside
        child: Stack(
          children: [
            // Positioned.fill(
            //   child: Container(color: AppColors.transparent),
            // ),
            // Dropdown positioned relative to trigger
            Positioned(
                top: 100, //offset.dy + size.height,
                right: 10, //offset.dx,
                child: dropdown),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggleDropdown(videoSettingsDropdown()),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: AppColors.opaqueBlack,
        child: const Icon(
          Icons.settings,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
    super.dispose();
  }

  Widget videoSettingsDropdown() {
    return Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 4,
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  closeDropdown();
                  setState(() {
                    isOpen = false;
                  });

                  toggleDropdown(qualityAndPlaybackOptions(
                    'quality',
                    currentIndex: currentIndex,
                    onChangedCheckBox: updateIndex,
                  ));
                },
                child: qualityAndPlaybackContainer(
                  "Quality",
                  '100p',
                  AppIcons.videoQualityIcon,
                )),
            InkWell(
              onTap: () {
                closeDropdown();
                setState(() {
                  isOpen = false;
                });

                toggleDropdown(qualityAndPlaybackOptions(
                  'playback',
                  currentIndex: currentIndex,
                  onChangedCheckBox: updateIndex,
                ));
              },
              child: qualityAndPlaybackContainer(
                "Playback",
                '1x',
                AppIcons.videoPlaybackIcon,
              ),
            ),
          ],
        ));
  }
}

class options extends StatelessWidget {
  const options(
      this.title, this.index, this.currentIndex, this.onChangedCheckBox,
      {super.key});
  final String title;
  final int index;
  final int currentIndex;
  final Function(int) onChangedCheckBox;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Material(
      child: Container(
        margin: EdgeInsets.only(bottom: 2),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: themeProvider.themeData.colorScheme.background,
        ),
        width: 300.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                CheckBoxWidget(
                  index: index,
                  currentIndex: currentIndex,
                  onCheckboxChanged: onChangedCheckBox,
                ),
                const SizedBox(
                  width: 15,
                ),
                textWidget(title, fontSize: 12)
              ],
            ),

            // chevron
          ],
        ),
      ),
    );
  }
}

class qualityAndPlaybackOptions extends StatelessWidget {
  const qualityAndPlaybackOptions(
    this.type, {
    super.key,
    required this.currentIndex,
    required this.onChangedCheckBox,
    //  required this.options
  });
  final String type;
  final int currentIndex;
  final Function(int) onChangedCheckBox;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: themeProvider.themeData.colorScheme.background),
      child: Column(
        children: [
          if (type == 'quality') ...[
            options('360p', 3, currentIndex, onChangedCheckBox),
            options('480p', 4, currentIndex, onChangedCheckBox),
            options('720p', 5, currentIndex, onChangedCheckBox),
          ],
          if (type == 'playback') ...[
            options('0.25x', 0, currentIndex, onChangedCheckBox),
            options('0.5x', 1, currentIndex, onChangedCheckBox),
            options('0.75x', 2, currentIndex, onChangedCheckBox),
          ]
        ],
      ),
    );
  }
}

class qualityAndPlaybackContainer extends StatelessWidget {
  const qualityAndPlaybackContainer(
    this.title,
    this.value,
    this.icon, {
    super.key,
  });
  final String title;
  final String value;
  final String icon;
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeViewmodel>(context);

    return Container(
      margin: EdgeInsets.only(bottom: 2),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: themeProvider.themeData.colorScheme.background),
      width: 300.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Image.asset(
                icon,
                color: themeProvider.themeData.colorScheme.tertiary,
              ),
              const SizedBox(
                width: 5,
              ),
              textWidget(title, fontSize: 12)
            ],
          ),

          // chevron

          Row(
            children: [
              textWidget(
                value,
                fontSize: 12,
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(Icons.chevron_right)
            ],
          )
        ],
      ),
    );
  }
}
