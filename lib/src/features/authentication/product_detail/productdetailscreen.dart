import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stylish/src/constants/colors.dart';
import 'package:stylish/src/features/authentication/product_detail/checkout_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedSize = '7 UK';
  int selectedSimilarItem = -1; // -1 means nothing selected
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:  Icon(Icons.arrow_back,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,

          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Carousel
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: 4, // Number of images
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){},
                    child: Column(
                      children: [
                        Container(
                            height: 220,
                            width: 320,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(image: AssetImage("assets/product/jordanshoes.png"), fit: BoxFit.cover,))
                            )


                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            // Size Selection
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Size:", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK']
                        .map((size) => ChoiceChip(
                      label: Text(size),
                      selected: selectedSize == size,
                      onSelected: (selected) {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      selectedColor:TColors.buttonPrimary,
                      labelStyle: TextStyle(
                        color: selectedSize == size ? Colors.white : Colors.black,
                      ),
                      backgroundColor: Colors.grey.shade200,
                    ))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  // Product Title
                  const Text(
                    "Nike Sneakers",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Vision Alta Men's Shoes Size (All Colours)",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  // Rating and Price
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const Text("4.0"),
                      const SizedBox(width: 4),
                      const Text("(56,890)", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Text(
                        "₹2,999",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "₹1,500",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "50% Off",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Product Details
                  const Text(
                    "Product Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Perhaps the most iconic sneaker of all-time, this original "
                        "\"Chicago\" colorway is the cornerstone to any sneaker collection. "
                        "Made famous in 1985 by Michael Jordan, the shoe has stood the test "
                        "of time...",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.shopping_cart,color: Colors.white,),
                          label: const Text("Go to cart",style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.flash_on,color: Colors.white,),
                          label: const Text("Buy Now",style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            Get.to(CheckoutScreen());
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Delivery Info
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      "Delivery in 1 within Hour",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                 Padding(padding: EdgeInsets.zero),
                  // View Similar / Compare
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.remove_red_eye_outlined),
                          label: const Text("View Similar"),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.compare_arrows),
                          label: const Text("Add to Compare"),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Similar Items
                  const Text(
                    "Similar To",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        bool isSelected = selectedSimilarItem == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSimilarItem = index;
                            });
                          },
                          // BELOW CRARD
                          child: Container(
                            width: 160,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.black12 : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image(image: AssetImage("assets/items/long jordan.png"),height: 120,
                                    width: 160,
                                    fit: BoxFit.cover,)
                                ),
                                const SizedBox(height: 8),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "Nike Sneakers",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "Nike Air Jordan Retro 1 Low",
                                    style: TextStyle(color: Colors.grey, fontSize: 12),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "₹1,900",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.star, size: 14, color: Colors.amber),
                                      Text("4.0"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
