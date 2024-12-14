import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelperInfo extends StatefulWidget {
  const HelperInfo({super.key});

  @override
  State<HelperInfo> createState() => _HelperInfoState();
}

class _HelperInfoState extends State<HelperInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
              background: Stack(
            children: [
              SvgPicture.asset(
                'assets/images/Vectors/Vector 1.svg',
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: -10,
                  left: 0,
                  child: SvgPicture.asset(
                    'assets/images/Vectors/Vector 1.svg',
                    fit: BoxFit.cover,
                  ))
            ],
          ))),
      body: const Text('Hello'),
    );
  }
}
