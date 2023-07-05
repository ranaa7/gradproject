// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:gradproject/provider/auth/auth_provider.dart';
// import 'package:gradproject/view/screens/editscreen.dart';
// import 'package:gradproject/view/widget/clipperclass.dart';
// import 'package:provider/provider.dart';
//
// class ProfileScreen extends StatelessWidget {
//   ProfileScreen({Key? key}) : super(key: key);
//
//   final user =FirebaseAuth.instance.currentUser;
//
//   @override
//   Widget build(BuildContext context) {
//     Provider.of<AuthProvider>(context).getuser();
//     var userprovider = Provider.of<AuthProvider>(context);
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       body: Column(
//         children: [
//           Container(
//             child:
//             Stack(children: <Widget>[ //stack overlaps widgets
//             Opacity( //semi red clippath with more height and with 0.5 opacity
//             opacity: 0.5,
//             child: ClipPath(
//             clipper:WaveClipper(), //set our custom wave clipper
//               child:Container(
//              color:Colors.purple,
//                 height:200,
//                  ),
//                 ),
//             ),
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: IconButton(onPressed: (){
//                   Navigator.of(context).push(MaterialPageRoute(builder:(context)=> EditScreen()
//                   ));
//                 }, icon: Icon(Icons.edit),
//                 ),
//               ),
//               SafeArea(
//               child: Container(
//             child: Column(
//               children: [
//                 Center(
//                     child: ClipOval(
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white,
//                   child: Image.network(
//                         "https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png"),
//                   radius: 75,
//                 ),
//                     )),
//                 SizedBox(height: 20,),
//                  Text("Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                  SizedBox(height: 10 ,),
//                  Text(userprovider.model.name,style: TextStyle(fontSize: 20),),
//
//                 Divider(),
//                 SizedBox(height: 10,),
//                 Text("Email:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                 SizedBox(height: 10,),
//                 Text(userprovider.model.email,style: TextStyle(fontSize: 20),),
//                 Divider(),
//                 SizedBox(height: 10,),
//                 Text("Your Preference",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                 SizedBox(height: 10,),
//                 Text(userprovider.model.preference.toString(),style: TextStyle(fontSize: 20),),
//                 //Image.asset("assets/img.png",height: 300,),
//                 // TextButton(onPressed: (){
//                 //   Navigator.of(context).push(MaterialPageRoute(builder:(context)=> EditScreen()
//                 //   ));
//                 // }, child: Text("Update"))
//
//               ],
//             ),
//           )),
//
//      ] )),
//         ],
//       ));
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/provider/auth/auth_provider.dart';
import 'package:gradproject/view/screens/editscreen.dart';
import 'package:gradproject/view/widget/clipperclass.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final user =FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context).getuser();
    var userprovider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.purple[200]!,
                    Colors.purple[500]!,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 60,
                            backgroundImage: NetworkImage(
                              "https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: Colors.white.withOpacity(0.2),
                      height: 200,
                    ),
                  ),
                  Positioned(
                    right: 16,
                    child: IconButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditScreen()),
                      );
                    }, icon: Icon(Icons.edit),color: Colors.white,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 textt("Name", Colors.purple.shade500 , FontWeight.bold),
                  SizedBox(height: 10),
                  textt(userprovider.model.name, Colors.grey.shade600, FontWeight.normal),
                  SizedBox(height: 20),
                 textt("Email", Colors.purple.shade500, FontWeight.bold),
                  SizedBox(height:10),
                 textt(userprovider.model.email, Colors.grey.shade600, FontWeight.normal),
                  SizedBox(height: 20),
                  textt("Your Prefrence", Colors.purple.shade500 , FontWeight.bold),
                  SizedBox(height: 10),
                  textt(userprovider.model.preference.toString(), Colors.grey.shade600, FontWeight.normal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
    Widget textt (String text , Color color,FontWeight fontWeight){
    return  Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: fontWeight,
        color: color,
      ),
    );
    }
}