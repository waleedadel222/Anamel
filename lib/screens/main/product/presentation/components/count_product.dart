import 'package:anamel/core/styling/app_styles.dart';
import 'package:flutter/material.dart';

class CountProduct extends StatefulWidget {
  int mount;

  CountProduct({super.key, required this.mount});

  @override
  State<CountProduct> createState() => _CountProductState();
}

class _CountProductState extends State<CountProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffFF7A5C),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                if (widget.mount >= 1) {
                  setState(() {});
                } else {
                  setState() {
                    widget.mount--;
                  }
                }
              },
              icon: Icon(Icons.remove, color: Colors.white, size: 26),
            ),
          ),
          Text(widget.mount.toString(), style: AppStyles.text20simiBold),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffFF7A5C),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                widget.mount++;
                setState(() {});
              },
              icon: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
