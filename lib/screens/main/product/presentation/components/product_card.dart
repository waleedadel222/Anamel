import 'package:anamel/core/styling/app_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String image;
  final String descraption;
  final VoidCallback onTap;
  final String price;
  final VoidCallback iconTap;
  const ProductCard({
    required this.iconTap,
    required this.price,
    required this.onTap,
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
        height: 152.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onTap,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 150,
                        child: Text(
                          textAlign: TextAlign.center,
                          title,
                          style: AppStyles.text20simiBold.copyWith(
                            fontSize: 16,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        textAlign: TextAlign.center,
                        " \$$price",
                        style: AppStyles.text20simiBold.copyWith(
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 31,
                        height: 18,

                        child: RatingBar.builder(
                          itemSize: 20,
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.vertical,
                          itemCount: 5,
                          itemBuilder: (context, _) =>
                              Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ignore: sized_box_for_whitespace
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    width: 160.w,
                    height: 150.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: IconButton(
                    onPressed: iconTap,
                    icon: Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
