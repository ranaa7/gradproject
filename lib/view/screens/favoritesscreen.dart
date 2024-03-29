import 'package:flutter/material.dart';
import 'package:gradproject/provider/auth/fav_provider.dart';
import 'package:gradproject/provider/detailed_provider.dart';
import 'package:provider/provider.dart';

// class FavoritesScreen extends StatelessWidget {
//   const FavoritesScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<FavProvider>(context);
//     var provider2 = Provider.of<Detailedprovider>(context);
//     provider.getfavs();
//
//     return ListView.builder(
//         itemCount: provider.favModel.name.length,
//         itemBuilder: (context, index) {
//           return Card(
//             elevation: 5,
//             color: Colors.deepPurple[50],
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: ClipOval(
//                     child:
//                     SizedBox.fromSize(
//                       size: Size.fromRadius(85),
//                       // Image radius
//                       child: Image.network('https://www.saveur.com/uploads/2019/02/08/SQIQQS52O6YXGS4G27OTCF4DYQ.jpg?auto=webp', fit: BoxFit.cover),
//                     ),
//
//                   ),
//                 ),
// // Column(children: [],)
//                 Expanded(
//                   child: ListTile(
//                     title: Text(
//                       provider.favModel.name[index],
//                       style: TextStyle(color: Colors.black),
//                     ),
// // subtitle: Row(children: [
// //   Text("🍔"),
// //   Text(
// //     provider.relatedrecipe[index].,
// //     style: TextStyle(color: Colors.pink),
// //   ),],)
//
//                   ),
//                 )
//               ],
//             ),
//           );
//         });
//
//   }
// }


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

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FavProvider>(context);
    var provider2 = Provider.of<Detailedprovider>(context);
    provider.getfavs();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 25),
            Text(
              'Favorite Recipes',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 7),
            Expanded(
              child: ListView.builder(
                itemCount: provider.favModel.name.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                    //  provider2.getdetails(provider.relatedrecipe[index].id);
                    },
                    child: Card(
                      elevation: 10,
                      color: Colors.grey[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 130,
                            child: Image.asset(
                               'assets/img_4.png',
                                height: 130,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider.favModel.name[index],
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