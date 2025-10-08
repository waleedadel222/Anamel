import 'package:financeapp/utils/app_assets.dart';
import 'package:financeapp/utils/app_color.dart';
import 'package:financeapp/utils/app_styles.dart';
import 'package:financeapp/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopProfileNotificationWidget extends StatelessWidget {
  const TopProfileNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipOval(
              child: Image.asset(
                AppAssets.visa,
                width: 48.w,
                height: 48.h,
                fit: BoxFit.fill,
              ),
            ),
            WidthSpace(width: 11),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome back", style: AppStyles.subTitleStyles),
                Text("Yasmine Mohsen", style: AppStyles.bkack15boldStyle),
              ],
            ),
          ],
        ),
        Container(
          width: 48.w,
          height: 48.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xffE3E9ED)),
          ),
          child: Icon(
            Icons.notifications,
            size: 24.sp,
            color: AppColor.praimaryColor,
          ),
        ),
      ],
    );
  }
}
