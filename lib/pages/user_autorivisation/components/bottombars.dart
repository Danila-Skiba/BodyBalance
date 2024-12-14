import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarsBuild extends StatelessWidget implements PreferredSizeWidget {
  final double hieght;
  final String image1;
  final String image2;
  final double size;
  const BottomBarsBuild(
      {super.key,
      required this.hieght,
      required this.image1,
      required this.image2,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.all(0),
      color: Colors.transparent,
      height: hieght,
      child: Stack(
        children: [
          Positioned(
            bottom: size, //-50
            child: SvgPicture.asset(
              image1,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: size - 20,
              child: SvgPicture.asset(
                image2,
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(hieght);
}
