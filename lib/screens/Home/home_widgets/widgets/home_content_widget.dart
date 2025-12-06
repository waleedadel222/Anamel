import 'package:anamel/core/const/app_color.dart';
import 'package:anamel/core/const/app_styles.dart';
import 'package:anamel/screens/Home/home_models/models/outdoor_card_model.dart';
import 'package:anamel/screens/home/home_models/models/top_salling_card_model.dart';
import 'package:anamel/screens/home/home_widgets/widgets/top_salling_card_widget.dart';
import 'package:flutter/material.dart';

import 'outdoor_card_widget.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories
          _buildCategoriesSection(),

          // Top Selling
          _buildTopSellingSection(),

          // Outdoor Collection
          _buildOutdoorCollectionSection(),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
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
              _CategoryIcon(icon: Icons.palette, label: "Painting"),
              _CategoryIcon(icon: Icons.brush, label: "Calligraphy"),
              _CategoryIcon(icon: Icons.style, label: "Knitting"),
              _CategoryIcon(icon: Icons.diamond, label: "Jewelry"),
              _CategoryIcon(icon: Icons.toys, label: "Crochet"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopSellingSection() {
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

  Widget _buildOutdoorCollectionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Outdoor Collection",
            style: AppStyles.primaryHeadLineStyle,
          ),
        ),
        Container(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 12, right: 12),
            itemCount: OutdoorCollectionData.collection.length,
            itemBuilder: (context, index) {
              return OutdoorCard(
                collection: OutdoorCollectionData.collection[index],
                onTap: () {
                  print(
                    "‘${OutdoorCollectionData.collection[index].title}’ has been clicked",
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryIcon({required this.icon, required this.label});

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
