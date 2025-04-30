import 'package:flutter/material.dart';

Widget buildCartItem({
  required VoidCallback onTap,
  required String image,
  required String title,
  required double rating,
  required double price,
  required double oldPrice,
  required int discount,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            // child: Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
            child: Image(
              image: AssetImage(image),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(rating.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(width: 4),
                    Row(
                        children: List.generate(5, (index) {
                      return Icon(
                        index < rating.floor() ? Icons.star : Icons.star_half,
                        size: 16,
                        color: Colors.orange,
                      );
                    })),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text("\$ ${price.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(width: 10),
                    Text(
                      "upto $discount% off",
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                    SizedBox(width: 6),
                    Text(
                      "\$ ${oldPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      "Total Order 1 :",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      '\$50',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
