import 'package:anamel/core/Apis/api_constans.dart';
import 'package:anamel/core/Apis/api_functions.dart';
import 'package:anamel/core/common_widgets/main_elevated_button.dart';
import 'package:anamel/core/routes/app_routing.dart';
import 'package:anamel/core/styling/app_styles.dart';
import 'package:anamel/screens/main/product/models/product_model.dart';
import 'package:anamel/screens/main/product/presentation/components/count_product.dart';
import 'package:anamel/screens/main/product/presentation/components/product_reviews.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductDetails extends StatefulWidget {
  final VoidCallback onTap;
  final ProductModel model;
  const ProductDetails({super.key, required this.model, required this.onTap});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    super.initState();
    DioHelper.init();
  }

  @override
  Widget build(BuildContext context) {
    int mount = 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFF2EA),
        centerTitle: true,
        title: Text(" Product Details ", style: AppStyles.text16NormalStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: widget.model.imageUrl,
                      width: double.infinity,
                      height: 170.h,
                      fit: BoxFit.fill,
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
                      onPressed: widget.onTap,
                      icon: Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.black,
                        size: 28.sp,
                      ),
                    ),
                  ),
                ],
              ),
              ProductReviews(
                productName: widget.model.name,
                rating: 5,
                price: widget.model.price.toString() + " \$",
              ),
              Divider(color: Color(0xffE0E0E0), thickness: 1.5),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Descraption :",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(widget.model.description, style: TextStyle()),
              SizedBox(height: 12.h),
              Divider(color: Color(0xffE0E0E0), thickness: 1.5),
              CountProduct(mount: mount),

              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: MainElevatedButton(
                    textOnButton: "Add To Cart ",
                    onButtonTap: () {
                      try {
                        DioHelper dio = DioHelper();
                        DioHelper.postRequest(
                          headers: {
                            "Authorization": "Bearer ${ApiConstans.token}",
                          },
                          endPionts: ApiConstans.addCart,
                          data: {
                            "productId": widget.model.id,
                            "quantity": mount,
                          },
                        );
                        GoRouter.of(context).pushNamed(AppRouting.cart);
                      } catch (e) {
                        print(e);
                      }
                    },
                    width: double.infinity,
                    height: 35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
