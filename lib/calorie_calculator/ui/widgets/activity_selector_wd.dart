import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:calory_tracker/information_user/ui/widgets/button_Select_wd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
class ActivitySelector extends StatelessWidget {
  final int selected;
  final Function(int) onPressed;

  const ActivitySelector({
    Key? key,
    required this.onPressed,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12),
          child: Row(
            children: const [
              Icon(
                PhosphorIcons.person_simple_run_fill,
                size: 30,
                color: AppTheme.formColor,
              ),
              SizedBox(width: 10),
              Text(
                'Select your activity lavel ',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonSelect(
              fontSizeText: 16,
              nameButton: 'Low',
              onPressed: () => onPressed(0),
              select: selected == 0,
            ),
            const SizedBox(width: 5),
            ButtonSelect(
              fontSizeText: 16,
              nameButton: 'Medium',
              onPressed: () => onPressed(1),
              select: selected == 1,
            ),
            const SizedBox(width: 5),
            ButtonSelect(
              fontSizeText: 16,
              nameButton: 'High',
              onPressed: () => onPressed(2),
              select: selected == 2,
            ),
          ],
        ),
      ],
    );
  }
}