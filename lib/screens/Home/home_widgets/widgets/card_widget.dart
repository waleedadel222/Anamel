import 'package:anamel/screens/home/home_models/models/card_model.dart';
import 'package:flutter/material.dart';

class PromoPageWidget extends StatelessWidget {
  final PromoPage promoPage;

  const PromoPageWidget({Key? key, required this.promoPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: promoPage.backgroundColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  promoPage.discountText,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: promoPage.textColor,
                  ),
                ),
                Text(
                  promoPage.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  promoPage.imagePath,
                  width: 180,
                  height: 83,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 2),
                Text(
                  promoPage.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Color.fromARGB(255, 142, 143, 145),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
