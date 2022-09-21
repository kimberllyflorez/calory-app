import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemForm extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final int? valueValidate;
  final String nameForm;
  final Icon iconData;
  final String? initialValue;

  const ItemForm({
    Key? key,
    required this.iconData,
    required this.nameForm,
    this.initialValue,
    this.controller,
    this.valueValidate,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        autofocus: false,
        controller: controller,
        decoration: InputDecoration(
          icon: iconData,
          iconColor: AppTheme.formColor,
          labelText: nameForm,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(valueValidate ?? 6),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
