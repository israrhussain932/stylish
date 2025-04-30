import 'package:flutter/material.dart';

class offer_card extends StatelessWidget {
  const offer_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 120,
        width: 340,

        decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(12)
        ),
        child: ListTile(
          title: Row(
            children: [
              Image(image: AssetImage("assets/logos/stylish.png",),height: 30,),
              SizedBox(width: 10,),
              Text('Special Offers 😍',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),),
            ],
          ),
          subtitle: Text('We make sure you get the offer \nyou need at best prices,',style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
