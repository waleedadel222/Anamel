import 'package:anamel/core/const/app_color.dart';
import 'package:anamel/core/const/app_styles.dart';
import 'package:anamel/core/routes/app_routing.dart';
import 'package:anamel/screens/Home/cubit/home_cubit.dart';
import 'package:anamel/screens/home/home_models/models/top_salling_card_model.dart';
import 'package:anamel/screens/home/home_widgets/widgets/top_salling_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'outdoor_card_widget.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => HomeContentState();
}

class HomeContentState extends State<HomeContent> {
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories
          buildCategoriesSection(),

          // Top Selling
          buildTopSellingSection(),

          // Outdoor Collection
          buildOutdoorCollectionSection(),
        ],
      ),
    );
  }

  Widget buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Categories", style: AppStyles.primaryHeadLineStyle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              CategoryIcon(icon: Icons.palette, label: "Painting"),
              CategoryIcon(icon: Icons.brush, label: "Calligraphy"),
              CategoryIcon(icon: Icons.style, label: "Knitting"),
              CategoryIcon(icon: Icons.diamond, label: "Jewelry"),
              CategoryIcon(icon: Icons.toys, label: "Crochet"),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTopSellingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Top Selling", style: AppStyles.primaryHeadLineStyle),
        ),
        Container(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 12, right: 12),
            itemCount: ProductData.products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: ProductData.products[index],
                onTap: () {
                  print(
                    'has been clicked ${ProductData.products[index].title}',
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildOutdoorCollectionSection() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeFailure) {
          return Center(child: Text(state.error));
        } else if (state is HomeSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Products ", style: AppStyles.primaryHeadLineStyle),
              ),
              Container(
                height: 290.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  itemCount: state.productList.length,
                  itemBuilder: (context, index) {
                    final product = state.productList[index];

                    return OutdoorCard(
                      onTapIcon: () {},
                      collection: product,
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRouting.productDetails, extra: product);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: AppColor.mainColor.withOpacity(0.2),
          child: Icon(icon, size: 28, color: AppColor.mainColor),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
