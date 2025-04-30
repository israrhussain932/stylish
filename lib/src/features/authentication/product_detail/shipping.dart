import 'package:flutter/material.dart';
import 'package:stylish/src/features/authentication/screens/login/widgets/login_button.dart';

class ShippingScreen extends StatefulWidget {
  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Checkout', style: TextStyle(color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,)),

        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Price Summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order', style: TextStyle(color: Colors.grey)),
                Text('₹ 7,000', style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping', style: TextStyle(color: Colors.grey)),
                Text('₹ 30', style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('₹ 7,030', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(height: 32),

            // Payment Options
            Text('Payment',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),

            payment_container(
              image: 'assets/items/paypal.png',
              text: '***********2109',
            ),
        SizedBox(height: 12,),
            payment_container(
              image: 'assets/items/visa 1.png',
              text: '***********2707',
            ),
            SizedBox(height: 12,),
            payment_container(
              image: 'assets/items/maestro 1.png',
              text: '***********1090',
            ),
            Spacer(),
            // Continue Button
            LoginButton(text: 'Continue',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      title: Row(
                        children: const [
                          Icon(Icons.check_circle, color: Colors.green),
                          SizedBox(width: 8),
                          Text('Success'),
                        ],
                      ),
                      content: const Text("Your order has been placed successfully!"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('OK',),
                        ),
                      ],
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}

class payment_container extends StatelessWidget {
    final String image;
    final String text;
  const payment_container({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color:Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black, )
      ),
      child: ListTile(
        leading: Image(
          image: AssetImage(image),
          height: 30,
          width: 60,
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
