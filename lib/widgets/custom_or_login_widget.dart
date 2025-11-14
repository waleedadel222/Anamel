import 'package:financeapp/utils/app_styles.dart';
import 'package:financeapp/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOrLoginWidget extends StatelessWidget {
  const CustomOrLoginWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 100.w, child: Divider()),
        const WidthSpace(width: 12),
        Text(
          text,
          style: AppStyles.bkack15boldStyle.copyWith(color: Color(0xff6A707C)),
        ),
        const WidthSpace(width: 12),
        SizedBox(width: 100.w, child: Divider()),
      ],
    );
  }
}
