// lib/widgets/promo_carousel.dart
import 'package:anamel_home_screen/models/card_model.dart';
import 'package:anamel_home_screen/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PromoCarousel extends StatelessWidget {
  const PromoCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 160,

            viewportFraction: 0.9,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            pauseAutoPlayOnTouch: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            scrollDirection: Axis.horizontal,
          ),
          items: PromoData.promoPages.map((promoPage) {
            return Builder(
              builder: (BuildContext context) {
                return PromoPageWidget(promoPage: promoPage);
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        _buildPageIndicator(),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: PromoData.promoPages.asMap().entries.map((entry) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            color: Colors.grey.withOpacity(0.4),
          ),
        );
      }).toList(),
    );
  }
}
