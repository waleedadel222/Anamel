import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:financeapp/widgets/card_item_widget.dart';
import 'package:financeapp/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarousalWidget extends StatefulWidget {
  const CarousalWidget({super.key});

  @override
  State<CarousalWidget> createState() => _CarousalWidgetState();
}

class _CarousalWidgetState extends State<CarousalWidget> {
  int currentIndexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 263.h,
            padEnds: false,
            viewportFraction: 0.7,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndexPage = index;
              });
            },
          ),
          items: [
            CardItemWidget(hight: 263.h, width: 207.w),
            CardItemWidget(hight: 263.h, width: 207.w),
            CardItemWidget(hight: 263.h, width: 207.w),
          ],
        ),
        const HightSpace(height: 16),
        DotsIndicator(
          dotsCount: 3,
          position: currentIndexPage.toDouble(),
          decorator: DotsDecorator(
            spacing: EdgeInsets.symmetric(horizontal: 4),
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
