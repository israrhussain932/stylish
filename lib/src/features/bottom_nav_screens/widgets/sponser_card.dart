import 'package:flutter/material.dart';

class sponser_card extends StatelessWidget {
  const sponser_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 10,
        child: Container(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("Sponsered",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                  )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/product/banner3.png'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, bottom: 40),
                child: Text('up to 50% Off →',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
