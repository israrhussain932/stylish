import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish/src/features/authentication/product_detail/shipping.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/login_button.dart';

class ShoppingBagScreen extends StatefulWidget {
  const ShoppingBagScreen({super.key});

  @override
  State<ShoppingBagScreen> createState() => _ShoppingBagScreenState();
}

class _ShoppingBagScreenState extends State<ShoppingBagScreen> {
  String selectedSize = '42';
  String selectedQty = '1';

  final List<String> sizeOptions = ['38', '40', '42', '44'];
  final List<String> qtyOptions = ['1', '2', '3', '4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Bag'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            )),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    image: AssetImage("assets/product/jordanlong.png"),
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Women's Casual Wear",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Checked Single-Breasted Blazer",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          // Size dropdown
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedSize,
                                items: sizeOptions
                                    .map((size) => DropdownMenuItem<String>(
                                          value: size,
                                          child: Text(
                                            'Size $size',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() => selectedSize = value);
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Qty dropdown
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedQty,
                                items: qtyOptions
                                    .map((qty) => DropdownMenuItem<String>(
                                          value: qty,
                                          child: Text(
                                            'Qty $qty',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() => selectedQty = value);
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text.rich(
                        TextSpan(
                          text: "Delivery by ",
                          style: TextStyle(color: Colors.black54),
                          children: [
                            TextSpan(
                              text: "10 May 2XXX",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.local_offer_outlined, size: 20),
                const SizedBox(width: 8),
                const Text('Apply Coupons',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text('Select',
                      style: TextStyle(color: Colors.pink)),
                ),
              ],
            ),
            const Divider(height: 32),
            const Text(
              "Order Payment Details",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Order Amounts"),
                Text("₹ 7,000.00",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text("Convenience"),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Know More",
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text("Apply Coupon",
                      style: TextStyle(color: Colors.pink)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Fee"),
                Text("Free", style: TextStyle(color: Colors.pink)),
              ],
            ),
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Order Total",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("₹ 7,000.00",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text("EMI Available"),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {},
                  child: const Text("Details",
                      style: TextStyle(color: Colors.pink)),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            LoginButton(
                text: 'Proceed to payment',
                onPressed: () {
              Get.to(ShippingScreen());
                }

            )
          ],
        ),
      ),
    );
  }
}
