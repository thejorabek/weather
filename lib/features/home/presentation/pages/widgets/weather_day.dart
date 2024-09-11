import 'package:flutter/material.dart';

Widget weatherDay(String day, Widget icon, String temp, String windSpeed) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 8),
        icon,
        const SizedBox(height: 8),
        Text(
          temp,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(height: 4),
        Text(
          windSpeed,
          style: const TextStyle(color: Colors.white, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }