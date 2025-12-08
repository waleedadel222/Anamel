import 'package:anamel/core/styling/app_styles.dart';
import 'package:anamel/screens/cart/presentation/widgets/quantity_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/cart_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../model/cart_item_model.dart';

class CartItemCard extends StatelessWidget {
  final Items item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;

  const CartItemCard({
    Key? key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.sp,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 4.sp),
          )
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 24.sp, top: 22.sp, bottom: 12.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName ?? 'Product',
                    style: AppStyles.bodyStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12.sp),
                  Text(
                    "${item.totalPrice?.toStringAsFixed(2) ?? '0.00'} EGP",
                  Text(item.name, style: AppStyles.bodyStyle),

                  SizedBox(height: 12.sp),

                  Text(
                    "${item.price * item.quantity} EGP",
                    style: AppStyles.bodyStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.sp),

                  // Item Quantity + Quantity Buttons
                  // Item Quantity +  Quantity Buttons
                  Row(
                    children: [
                      QuantityButton(icon: Icons.remove, onPressed: onDecrease),
                      SizedBox(width: 20.sp),
                      Text(
                        "${item.quantity ?? 0}",
                        "${item.quantity}",
                        style: AppStyles.bodyStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20.sp),
                      QuantityButton(icon: Icons.add, onPressed: onIncrease),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16.sp),

          // Item Image + Delete Button
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: item.imageUrl != null && item.imageUrl!.isNotEmpty
                    ? CachedNetworkImage(
                  imageUrl: item.imageUrl!,
                  width: 145.sp,
                  height: 145.sp,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 145.sp,
                    height: 145.sp,
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 145.sp,
                    height: 145.sp,
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.image_not_supported,
                      color: Colors.grey[400],
                      size: 50,
                    ),
                  ),
                )
                    : Container(
                  width: 145.sp,
                  height: 145.sp,
                  color: Colors.grey[200],
                  child: Icon(
                    Icons.image,
                    color: Colors.grey[400],
                    size: 50,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    width: 30.sp,
                    height: 30.sp,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.delete_outline,
                      color: Theme.of(context).primaryColor,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
