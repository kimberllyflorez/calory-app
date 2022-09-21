import 'package:flutter/material.dart';

class BackgroundImageProfile extends StatelessWidget {
  final double width;

  const BackgroundImageProfile({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final contentWidth = width;
    final circleWidth = contentWidth * 0.3;
    const scaleFactor = 0.2;
    final heightFactor = (height * scaleFactor);
    return SizedBox(
      height: heightFactor + (circleWidth / 1.7),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/backgrown.jpg',
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
              height: heightFactor,
            ),
          ),
          Positioned(
            top: heightFactor - (circleWidth / 3.0),
            left: (width / 2) - (circleWidth / 2),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //  border: Border.all(color: Colors.black12),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/picture.jpg',
                  width: circleWidth,
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.05,
            left: 10,
            child: IconButton(
              focusColor: Colors.green,
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
