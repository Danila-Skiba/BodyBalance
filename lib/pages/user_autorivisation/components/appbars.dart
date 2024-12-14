import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarsBuild extends StatelessWidget implements PreferredSizeWidget {
  final double hieght;
  final String image1;
  final String image2;
  final Widget? leading;

  const AppBarsBuild(
      {super.key,
      this.leading,
      required this.hieght,
      required this.image1,
      required this.image2});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: FlexibleSpaceBar(
            background: Stack(
          children: [
            Positioned(
                top: -30,
                child: SvgPicture.asset(
                  image1,
                  fit: BoxFit.cover,
                )),
            Positioned(
                top: -40, //-10
                left: 0,
                child: SvgPicture.asset(
                  image2,
                  fit: BoxFit.cover,
                )),
            if (leading != null)
              Positioned(
                left: 10,
                top: 56,
                child: Container(
                  child: leading,
                ),
              ),
          ],
        )));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(hieght);
}
