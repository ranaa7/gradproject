import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/provider/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final user =FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context).getuser();
    var userprovider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Center(
                child: ClipOval(
                  child: CircleAvatar(
              child: Image.network(
                    "https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png"),
              radius: 90,
            ),
                )),
            SizedBox(height: 20,),
            Text("Name:",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text(userprovider.model.name,style: TextStyle(fontSize: 20),),
            Divider(),
            Text("Email:",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text(userprovider.model.email,style: TextStyle(fontSize: 20),),
            Divider(),
            Text("Your Preference",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text(userprovider.model.preference.toString(),style: TextStyle(fontSize: 20),),
            // SizedBox(height: 10,),
            // Text(userprovider.model.vegan,style: TextStyle(fontSize: 20),),
            // Divider(),
            // Text("Are you lactose-free?:",style: TextStyle(fontSize: 20),),
            // SizedBox(height: 10,),
            // Text(userprovider.model.lactose,style: TextStyle(fontSize: 20),),
            // Divider(),
            // Text("Do you prefer spicy or not?:",style: TextStyle(fontSize: 20),),
            // SizedBox(height: 10,),
            // Text(userprovider.model.spicy,style: TextStyle(fontSize: 20),),
            // Divider(),

          ],
        ),
      )),
    );
  }
}
