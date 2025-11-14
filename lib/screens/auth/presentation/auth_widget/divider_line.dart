import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerLine extends StatelessWidget {
  final String title;

  const DividerLine({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 1.5.h)),

        SizedBox(width: 12.w),

        Text(title, style: TextStyle(fontWeight: FontWeight.w400)),

        SizedBox(width: 12.w),

        Expanded(child: Divider(thickness: 1.5.h)),
      ],
    );
  }
}
