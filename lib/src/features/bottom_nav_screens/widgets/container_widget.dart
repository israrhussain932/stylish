import 'package:flutter/material.dart';

class conainerWidget extends StatelessWidget {
  final String image;
  final String text;
  const conainerWidget({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Column(
        children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(image),
              )
          ),
          Text(text)
        ],
      ),
    );
  }
}
