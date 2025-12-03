import 'package:anamel/core/styling/app_colors.dart';
import 'package:anamel/core/styling/app_fonts.dart';
import 'package:anamel/core/styling/app_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final String descraption;
  const CategoryItem({
    super.key,
    required this.title,
    required this.image,
    required this.descraption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        width: 350.w,
        height: 132.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: AppStyles.text20simiBold.copyWith(fontSize: 13.sp),
              ),
            ),

            // ignore: sized_box_for_whitespace
            Container(
              width: 160.w,
              height: 150.h,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(style: BorderStyle.solid, width: 1.5.w),
              ),
              child: CachedNetworkImage(
                width: 160.w,
                height: 150.h,
                imageUrl: image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
