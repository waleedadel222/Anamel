import 'package:financeapp/utils/app_styles.dart';
import 'package:financeapp/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class CustomNameOfView extends StatelessWidget {
  const CustomNameOfView({
    super.key,
    required this.nameText,
    this.rightIcon = Icons.more_horiz,
  });

  final String nameText;
  final IconData rightIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackButtonWidget(icon: Icons.arrow_back),
        Text(nameText, style: AppStyles.bkackStyle),
        BackButtonWidget(icon: rightIcon),
      ],
    );
  }
}
