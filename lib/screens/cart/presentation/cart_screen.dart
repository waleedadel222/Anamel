import 'package:anamel/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../domain/cart_event.dart';
import '../domain/cart_state.dart';
import '../domain/cart_bloc.dart';
import 'widgets/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(LoadCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF5F0),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF5F0),
        elevation: 0,
        title: Text(
          'Shopping Cart',
          style: AppStyles.bodyStyle.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(getUserFriendlyMessage(state.message)),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          // Loading State
          if (state is CartLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Loading your cart...',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          // Error State
          if (state is CartError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: Colors.red[300],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Oops! Something went wrong',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      getUserFriendlyMessage(state.message),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<CartBloc>().add(LoadCartEvent());
                    },
                    icon: Icon(Icons.refresh),
                    label: Text('Try Again'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          // Empty State
          if (state is CartEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 100,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Your cart is empty",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Add items to get started",
                    style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                  ),
                ],
              ),
            );
          }

          // Loaded State
          if (state is CartLoaded) {
            return Column(
              children: [
                // Cart Items List
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 8, bottom: 16),
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = state.cartItems[index];
                      return CartItemCard(
                        item: item,
                        onIncrease: () {
                          context.read<CartBloc>().add(
                            IncreaseQuantityEvent(item.id!.toInt()),
                          );
                        },
                        onDecrease: () {
                          context.read<CartBloc>().add(
                            DecreaseQuantityEvent(item.id!.toInt()),
                          );
                        },
                        onDelete: () {
                          context.read<CartBloc>().add(
                            RemoveFromCartEvent(item.id!.toInt()),
                          );
                        },
                      );
                    },
                  ),
                ),

                // Bottom Section with Total and Checkout
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, -3),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Total Items Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Items',
                              style: AppStyles.smallCaptionStyle.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              '${state.totalItems}',
                              style: AppStyles.bodyStyle.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),

                        // Total Price Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Price',
                              style: AppStyles.smallCaptionStyle.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              '${state.totalAmount.toStringAsFixed(2)} EGP',
                              style: AppStyles.bodyStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        // Checkout Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Proceeding to checkout...'),
                                  backgroundColor: Theme.of(context).primaryColor,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              padding: EdgeInsets.symmetric(vertical: 16.sp),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 2,
                            ),
                            child: Text(
                              'Checkout',
                              style: AppStyles.bodyStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }

  String getUserFriendlyMessage(String error) {
    if (error.contains('DioException')) {
      return 'Network error. Check your connection.';
    } else if (error.contains('Failed to load cart')) {
      return 'Could not load your cart. Please try again.';
    } else if (error.contains('Failed to add item')) {
      return 'Could not add the item to your cart.';
    }
    return 'Something went wrong. Please try again.';
  }

}