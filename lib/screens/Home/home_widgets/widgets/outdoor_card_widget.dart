import 'package:anamel/core/const/app_styles.dart';
import 'package:anamel/screens/Home/home_models/models/outdoor_card_model.dart';
import 'package:anamel/screens/main/product/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutdoorCard extends StatelessWidget {
  final ProductModel collection;
  final VoidCallback? onTap;
  final VoidCallback onTapIcon;

  const OutdoorCard({
    Key? key,
    required this.collection,
    this.onTap,
    required this.onTapIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 250.h,
        margin: EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: .2),
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: collection.imageUrl,
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
                    onPressed: onTapIcon,
                    icon: Icon(Icons.add_shopping_cart),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(8.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                    width: 75.w,
                    child: Text(
                      collection.description,
                      maxLines: 1,
                      style: AppStyles.subtitleStyle,
                    ),
                  ),

                  Text(
                    collection.name,
                    style: AppStyles.titleStyles,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    collection.price.toString(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xffFFA03C), size: 14),
                      SizedBox(width: 4),
                      Text(
                        collection.rating.toString(),
                        style: AppStyles.subtitleStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
