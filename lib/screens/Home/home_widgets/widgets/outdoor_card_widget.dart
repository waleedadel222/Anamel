import 'package:anamel/core/const/app_styles.dart';
import 'package:anamel/screens/Home/home_models/models/outdoor_card_model.dart';
import 'package:flutter/material.dart';

class OutdoorCard extends StatelessWidget {
  final OutdoorCardModel collection;
  final VoidCallback? onTap;

  const OutdoorCard({Key? key, required this.collection, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 270,
        margin: EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                image: DecorationImage(
                  image: AssetImage(collection.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(collection.subtitle, style: AppStyles.subtitleStyle),
                  SizedBox(height: 4),
                  Text(
                    collection.title,
                    style: AppStyles.titleStyles,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    collection.price,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xffFFA03C), size: 14),
                      SizedBox(width: 4),
                      Text(
                        collection.rating.toString(),
                        style: AppStyles.subtitleStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
