import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:go_router/go_router.dart';
import 'package:anamel/core/routes/app_routing.dart';
import 'package:anamel/core/styling/app_styles.dart';
import 'package:anamel/core/const/app_assets_path.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final onboardingItems = [
    {
      "image": AppAssetsPath.onboardingImage_1,
      "title": "Discover Unique Handmade Products.",
      "subtitle": "Crafted with love and passion",
    },
    {
      "image": AppAssetsPath.onboardingImage_2,
      "title": "Shop Easily & Safely.",
      "subtitle": "Choose, order, and receive without hassle.",
    },
    {
      "image": AppAssetsPath.onboardingImage_3,
      "title": "Support Local Artisans.",
      "subtitle": "Authentic crafts from talented creators.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isLast = currentPage == onboardingItems.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // PageView
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: onboardingItems.length,
                    onPageChanged: (index) {
                      setState(() => currentPage = index);
                    },
                    itemBuilder: (_, index) {
                      final item = onboardingItems[index];

                      return Center(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.asset(
                                item["image"]!,
                                height: 300.h,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 24.h),
                              Text(
                                item["title"]!,
                                textAlign: TextAlign.start,
                                style: AppStyles.logoTitleStyle.copyWith(
                                  fontSize: 22.sp,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                item["subtitle"]!,
                                textAlign: TextAlign.start,
                                style: AppStyles.logoSubtitleStyle,

                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // SizedBox(height: 5.h),

                // Expanding Dots
                SmoothPageIndicator(
                  controller: _controller,
                  count: onboardingItems.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 11,
                    dotWidth: 11,
                    expansionFactor: 3,
                    spacing: 5,
                    activeDotColor: Theme.of(context).colorScheme.primary,
                  ),
                ),

                SizedBox(height: 32.h),

                // Next / Start Button
                GestureDetector(
                  onTap: () {
                    if (!isLast) {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                      );
                    } else {
                      GoRouter.of(context).pushReplacement(AppRouting.login);
                    }
                  },
                  child: AnimatedContainer(
                    padding: EdgeInsets.all(10),
                    duration: Duration(milliseconds: 300),
                    height: 50.h,
                    width: 280.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      isLast ? "Start" : "Next",
                      style: AppStyles.logoSubtitleStyle.copyWith(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                 SizedBox(height: 120.h),
              ],
            ),

            //  Skip button
            Positioned(
              top: 16.h,
              right: 16.w,
              child: IgnorePointer(
                ignoring: false,
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(AppRouting.login);
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Skip",
                      style: AppStyles.logoSubtitleStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
