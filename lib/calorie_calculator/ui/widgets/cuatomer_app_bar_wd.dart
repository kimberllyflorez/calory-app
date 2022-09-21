import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
class CustomerAppBar extends StatelessWidget {
  const CustomerAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.formColor,
                  Color(0xFF556270),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
              )),
          width: double.infinity,
         //    child: Image.asset(
         //   'assets/posterBanner.jpeg',
         //   alignment: Alignment.topCenter,
         //   fit: BoxFit.cover,
         //   height: MediaQuery.of(context).size.height * 0.25,
         // ),
        ),
        Positioned(
          top: 130,
          left: 10,
          child: IconButton(
            icon: const Icon(
              PhosphorIcons.arrow_bend_up_left_fill,
              size: 45,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}