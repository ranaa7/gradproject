import 'package:flutter/material.dart';
import 'package:gradproject/models/user_model.dart';
import 'package:gradproject/provider/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  // final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   body: Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Form(
    //     key: _formKey,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         TextFormField(
    //           controller: _allergy,
    //           validator: (value) {
    //             if (value!.isEmpty) {
    //               return "Please enter your Allergy";
    //             }
    //             return null;
    //           },
    //           decoration: InputDecoration(
    //             label: Text('Allergy'),
    //             prefixIcon: Icon(Icons.person),
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         TextFormField(
    //           controller: _pref,
    //           validator: (value) {
    //             if (value!.isEmpty) {
    //               return "Please enter your preference";
    //             }
    //             return null;
    //           },
    //           decoration: InputDecoration(
    //             label: Text('preference'),
    //             prefixIcon: Icon(Icons.email),
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
    );
  }
}
