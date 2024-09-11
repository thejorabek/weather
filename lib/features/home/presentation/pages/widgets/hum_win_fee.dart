import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class HumWinFee extends StatelessWidget {
  HumWinFee({
    super.key,
    required this.icon,
    required this.title,
    required this.status,
  });

  String title;
  String icon;
  String status;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SvgPicture.asset(icon),
      Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
      Text(status, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700))
    ]);
  }
}
