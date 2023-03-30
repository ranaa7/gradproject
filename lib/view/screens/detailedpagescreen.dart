import 'package:flutter/material.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Column(children: [
      Expanded(
        child: Container(
          child: Image.network("https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"),
        ),
      ),
      Text("ioucf"),
      Text("ioucf"),
      Text("ioucf"),
    ],),),);
  }
}
