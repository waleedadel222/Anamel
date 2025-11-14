import 'package:financeapp/utils/app_assets.dart';
import 'package:financeapp/utils/app_color.dart';
import 'package:financeapp/utils/app_styles.dart';
import 'package:financeapp/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({
    super.key,
    required this.hight,
    required this.width,
    this.visaText,
  });
  final double hight;
  final double width;
  final String? visaText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: hight,
          width: width,
          decoration: BoxDecoration(
            color: AppColor.praimaryColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Image.asset(
            AppAssets.layer2,
            color: Colors.white,
            width: 207.w,
            height: 200.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Image.asset(
            AppAssets.layer1,
            color: Colors.white,
            width: 207.w,
            height: 130.h,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 24.w,
          top: 24.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "X_Card",
                style: AppStyles.bkack15boldStyle.copyWith(color: Colors.white),
              ),
              HightSpace(height: 40),
              Text(
                "Balance",
                style: AppStyles.bkack15boldStyle.copyWith(color: Colors.white),
              ),
              HightSpace(height: 10),
              Text(
                "23000 EG",
                style: AppStyles.bkack15boldStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          top: 26.h,
          right: 24.w,
          child: visaText != null
              ? Text(
                  visaText!,
                  style: AppStyles.bkack15boldStyle.copyWith(
                    color: Colors.white,
                  ),
                )
              : const SizedBox.shrink(), // في حالة null ما يعرضش حاجة
        ),

        Positioned(
          bottom: 26.h,
          right: 24.w,
          child: Text(
            "12/24",
            style: AppStyles.bkack15boldStyle.copyWith(color: Colors.white),
          ),
        ),
        HightSpace(height: 30),
        Positioned(
          bottom: 26.h,
          left: 24.w,
          child: Text(
            "****  3434",
            style: AppStyles.bkack15boldStyle.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
