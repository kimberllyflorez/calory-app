import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:calory_tracker/information_user/ui/widgets/button_Select_wd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class GenderSelector extends StatelessWidget {
  final int selected;
  final Function(int) onPressed;

  const GenderSelector({
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
                PhosphorIcons.gender_intersex_fill,
                size: 30,
                color: AppTheme.formColor,
              ),
              SizedBox(width: 12),
              Text(
                'Select your gender ',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonSelect(
              fontSizeText: 20,
              nameButton: 'women',
              onPressed: () => onPressed(0),
              select: selected == 0,
            ),
            const SizedBox(width: 5),
            ButtonSelect(
              fontSizeText: 16,
              nameButton: 'man',
              onPressed: () => onPressed(1),
              select: selected == 1,
            ),
          ],
        ),
      ],
    );
  }
}