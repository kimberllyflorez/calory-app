import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class MessageValidate extends StatelessWidget {
  final String messageError;

  const MessageValidate({
    Key? key,
    required this.messageError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          messageError,
          style: const TextStyle(color: Colors.red, fontSize: 20),
        ),
        const SizedBox(width: 5),
        const Icon(
          PhosphorIcons.circle_wavy_warning,
          color: Colors.red,
        )
      ],
    );
  }
}
