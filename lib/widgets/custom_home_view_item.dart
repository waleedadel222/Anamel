import 'package:financeapp/utils/app_styles.dart';
import 'package:financeapp/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeViewItem extends StatelessWidget {
  const CustomHomeViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  final Widget icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE3E9ED), width: 1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
              Container(
                height: 48.h,
                width: 48.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffECF1F6),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: icon,
              ),
              HightSpace(height: 12),
              Text(
                title,
                style: AppStyles.bkack15boldStyle.copyWith(fontSize: 20),
              ),
              HightSpace(height: 4),
              Text(subTitle, style: AppStyles.subTitleStyles),
            ],
          ),
        ),
      ),
    );
  }
}
