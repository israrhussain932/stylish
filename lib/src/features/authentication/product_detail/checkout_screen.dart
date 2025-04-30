import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish/src/features/authentication/product_detail/place_order.dart';
import 'package:stylish/src/features/authentication/product_detail/widgets/buildCartItem.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color:Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,),
        title:  Text("Checkout", style: TextStyle(color:Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,)),
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery Address
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 20),
                const SizedBox(width: 8),
                const Text("Delivery Address",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                customer_info(),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        width: 0.5,          // Border width
                      ),
                            // Border width
                    ),
                    child:  Icon(Icons.add, size: 24,color: Colors.red),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            const Text("Shopping List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            buildCartItem(
              title: "Men’s outfit",
              rating: 3.2,
              price: 50.00,
              oldPrice: 87.00,
              discount: 45,
              image: 'assets/items/switer.png',
              onTap: () {
                Get.to(ShoppingBagScreen());
              },
            ),
            SizedBox(height: 10,),
            buildCartItem(
              title: "Men’s shoes",
              rating: 4.7,
              price: 61.00,
              oldPrice: 67.00,
              discount: 6,
              image: 'assets/items/long jordan.png',
              onTap: () {},

            ),
          ],
        ),
      ),
    );
  }
}

class customer_info extends StatelessWidget {
  const customer_info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            width: 0.5,          // Border width
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      )),
                  SizedBox(height: 4),
                  Text("216 St Paul's Rd, London N1 2LL, UK",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      )),
                  SizedBox(height: 4),
                  Text("Contact :  +44-784232", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
                ],
              ),
            ),
            const Icon(Icons.edit, size: 18)
          ],
        ),
      ),
    );
  }
}
