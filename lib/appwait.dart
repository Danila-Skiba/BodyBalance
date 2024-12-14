import 'package:flutter/material.dart';

class ProgressMain extends StatefulWidget {
  const ProgressMain({super.key});

  @override
  State<ProgressMain> createState() => _ProgressMainState();
}

class _ProgressMainState extends State<ProgressMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Stack(
        fit: StackFit.expand, // Ensures the stack covers the entire screen
        children: [
          // Background image
          Image.asset(
            'assets/images/logo_main.png',
            fit: BoxFit.cover,
          ),

          Image.asset('assets/images/shadow_logo.png',
          
          fit: BoxFit.cover,),
          // Foreground image
       Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Positioned(
                  top: 100, // Adjust as needed for positioning
                  left: 100, // Adjust as needed for positioning
                  child: Image.asset(
                    'assets/icons/logo_green.png',
                    width: 200,
                    height: 200,
                  ),
                ),

                Image.asset('assets/images/BloomBody_title.png'),

                Image.asset('assets/images/Balance_title.png')
              ],
          ),
        ],
      )
    );
  }
}