import 'package:bloom_body_balance/design/colors.dart';
import 'package:bloom_body_balance/pages/user_autorivisation/user_register/user_info/user_height.dart/heightdata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ScrollWheelInfo extends StatefulWidget {
  final int startitem;
  final int count;
  final String info;
  final FixedExtentScrollController;
  const ScrollWheelInfo(
      {super.key,
      required this.FixedExtentScrollController,
      required this.count,
      required this.info,
      required this.startitem});

  @override
  State<ScrollWheelInfo> createState() => _ScrollWheelInfoState();
}

class _ScrollWheelInfoState extends State<ScrollWheelInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Stack(children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            width: 250,
            height: 155,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: SizedBox(
              width: 150,
              height: 150,
              child: Stack(children: [
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: primaryColorSwitch,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: 140,
                    height: 50,
                  ),
                ),
                ListWheelScrollView.useDelegate(
                  physics: const FixedExtentScrollPhysics(),
                  itemExtent: 52,
                  controller: widget.FixedExtentScrollController,
                  perspective: 0.01,
                  diameterRatio: 2,
                  useMagnifier: true,
                  childDelegate: ListWheelChildBuilderDelegate(
                      childCount: widget.count,
                      builder: (context, index) {
                        return Data(data: index + widget.startitem);
                      }),
                ),
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              widget.info,
              style: GoogleFonts.raleway(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: primaryColorText),
            ),
          )
        ]),
      ]),
    );
  }
}
