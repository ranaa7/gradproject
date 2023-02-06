import 'package:flutter/material.dart';
import 'package:gradproject/view/screens/homescreen.dart';
import 'package:gradproject/view/widget/bottom_navy_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  Container(
      width: 500,
      height:double.infinity,
      decoration: BoxDecoration(image: DecorationImage(
          image: AssetImage("assets/food.jpg"),
          fit: BoxFit.cover),),
      child: Stack(
        children: [
          Center(
            child: Text("Cooking Experience Like a Chef",
              style: TextStyle(color: Colors.white, fontSize: 40,),),
          ),
          // Text("Let's make a delicious dish",
          //     style: TextStyle(color: Colors.white, fontSize: 20)),
          Align(alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text('Get Start'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  // side: BorderSide(color: Colors.yellow, width: 5),
                  textStyle: const TextStyle(
                      color: Colors.white, fontSize: 40, fontStyle: FontStyle.normal),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>BottomNavyScreen()
                  ));
                },
              ),
            ),
          )
        ],
      ),
    ),);
  }
}
