import 'package:flutter/material.dart';

class Time_Limit_Container extends StatelessWidget {
  const Time_Limit_Container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: 320,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: ListTile(
            title: const Text('Deal of the Day',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w400),),
            subtitle: const Text('⏰ 22h 55m 20s remaining',style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w400)),
            trailing: ElevatedButton(onPressed: (){}, child: Text('View all'),

            )
        ),
      ),
    );
  }
}