import 'package:flutter/material.dart';
import 'package:weather/core/code/date_time_code.dart';
import 'package:weather/features/home/presentation/pages/extensions/month_ext.dart';

Column dateInfo(BuildContext context) {
  DateTime now = DateTime.now();

  return Column(
    children: [
      SizedBox(height: MediaQuery.sizeOf(context).height * .05),
      Text(
        '${MonthExt(now).monthName} ${now.day < 10 ? '0${now.day}' : '${now.day}'}',
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
      ),
      Text('Updated ${formatDateTime(now)}',
          style: const TextStyle(color: Colors.white)),
      SizedBox(height: MediaQuery.sizeOf(context).height * .04),
    ],
  );
}
