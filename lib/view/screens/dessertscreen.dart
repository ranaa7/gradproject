// import 'package:flutter/material.dart';
// import 'package:gradproject/provider/detailed_provider.dart';
// import 'package:gradproject/provider/relatedrecommendation_provider.dart';
// import 'package:provider/provider.dart';
//
// class Breakfastscreen extends StatelessWidget {
//   const Breakfastscreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<Relatedrecipeprovider>(context);
//     var provider2 = Provider.of<Detailedprovider>(context);
//     provider.getBreakfast();
//     return Scaffold(
//       body:
//       ListView.builder(
//           itemCount: provider.relatedrecipe.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap:(){provider2.getdetails(provider.relatedrecipe[index].id);},
//               child: Card(
//                 elevation: 5,
//                 color: Colors.grey[50],
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: ClipOval(
//                         child: FadeInImage.assetNetwork(image : provider.relatedrecipe[index].image=="character(0)"?"https://i.imgur.com/3A12AW2.png":provider.relatedrecipe[index].image, placeholder: "assets/jamie-oliver.jpg"),
//                       ),
//                     ),
//                     // Column(children: [],)
//                     Expanded(
//                       child: ListTile(
//                           title: Text(
//                             provider.relatedrecipe[index].name,
//                             style: TextStyle(color: Colors.purple),
//                           ),
//                           // subtitle: Row(children: [
//                           //   Text("🍔"),
//                           //   Text(
//                           //     provider.relatedrecipe[index].,
//                           //     style: TextStyle(color: Colors.pink),
//                           //   ),],)
//
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }
//
//
import 'package:flutter/material.dart';
import 'package:gradproject/provider/category_provider.dart';
import 'package:gradproject/provider/detailed_provider.dart';
import 'package:gradproject/provider/relatedrecommendation_provider.dart';
import 'package:provider/provider.dart';

class DessertScreen extends StatelessWidget {
  const DessertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Categoryprovider>(context);
    var provider2 = Provider.of<Detailedprovider>(context);
    provider.getDessert();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Dessert Recipes🧁',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 7),
            Expanded(
              child: ListView.builder(
                itemCount: provider.categorymodel.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      provider2.getdetails(provider.categorymodel[index].id);
                    },
                    child: Card(
                      elevation: 5,
                      color: Colors.grey[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: FadeInImage.assetNetwork(
                                image: provider.categorymodel[index].image == "character(0)" ? "https://i.imgur.com/3A12AW2.png" : provider.categorymodel[index].image,
                                placeholder: "assets/jamie-oliver.jpg",
                                width: 130,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider.categorymodel[index].name,
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
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
          ],
        ),
      ),
    );
  }
}