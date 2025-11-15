import 'package:anamel/core/const/app_assets_path.dart';
import 'package:anamel/core/routes/app_routing.dart';
import 'package:anamel/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
      "title": "Welcome to Anamel"
    },
    {
      "image": AppAssetsPath.onboardingImage_2,
      "title": "Beautify your life with unique handmade products ",
    },
    {
      "image": AppAssetsPath.onboardingImage_3,
      "title": "crafted with love and care, made especially for you",
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isLast = currentPage == onboardingItems.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item["image"]!, height: 290.h),

                        SizedBox(height: 24.h),

                        Text(
                          textAlign: TextAlign.center,
                          item["title"]!,
                          style: AppStyles.logoTitleStyle.copyWith(
                            fontSize: 28.sp,
                          ),
                        ),

                        SizedBox(height: 28.h),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 24.h),

            // Expanding Dots
            SmoothPageIndicator(
              controller: _controller,
              count: onboardingItems.length,
              effect: ExpandingDotsEffect(
                dotHeight: 12,
                dotWidth: 12,
                expansionFactor: 3,
                spacing: 6,
                activeDotColor: Theme.of(context).colorScheme.primary,
              ),
            ),

            SizedBox(height: 32.h),

            // Circular Button with Arrow / Check
            GestureDetector(
              onTap: () {
                if (!isLast) {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                  );
                } else {
                  // go to login screen
                  GoRouter.of(context).pushReplacement(AppRouting.login);
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isLast ? Icons.check : Icons.arrow_forward,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }
}
