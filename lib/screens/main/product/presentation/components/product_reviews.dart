import 'package:anamel/core/styling/app_fonts.dart';
import 'package:anamel/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductReviews extends StatelessWidget {
  final String productName;
  final int rating;
  final String price;
  const ProductReviews({
    required this.price,
    super.key,
    required this.productName,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(productName, style: AppStyles.text20simiBold),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 31,
                height: 18,
                child: RatingBar.builder(
                  itemSize: 22,
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {},
                ),
              ),
              Text(" 23 reviews ", style: TextStyle(color: Colors.black)),
            ],
          ),

          Text(
            price,
            style: AppStyles.text20simiBold.copyWith(color: Colors.red),
          ),
        ],
      ),
      width: double.infinity,
      height: 159.h,
    );
  }
}
