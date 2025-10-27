import 'package:anamel/core/styling/app_styles.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final String mainText;
  final String subText;
  final Function? onTap;

  const RichTextWidget({
    super.key,
    required this.mainText,
    required this.subText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap as Function()?,

        child: RichText(
          text: TextSpan(
            text: mainText,
            style: AppStyles.richTextStyle.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            children: [
              TextSpan(
                text: subText,
                style: AppStyles.richTextStyle.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
