import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/provider/auth/auth_provider.dart';
import 'package:gradproject/provider/detailed_provider.dart';
import 'package:gradproject/provider/search_provider.dart';
import 'package:gradproject/view/screens/homescreen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  final user =FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context).getuser();
    var provider1 = Provider.of<AuthProvider>(context);
    var provider2 = Provider.of<Detailedprovider>(context);
    return Consumer<Searchprovider>(builder: (context, provider, child) {
      return Scaffold(
          // appBar: AppBar(title: Image.asset("assets/jamie-oliver.jpg"),),
          // appBar: AppBar(
          //   backgroundColor: Colors.white60,
          //   title: TextField(
          //     onChanged: (value) {
          //       String key = provider1.model.spicy;
          //
          //
          //       provider.getAllSearchrecipe(value, key);
          //
          //       print(value);
          //
          //       print(key);
          //       //print(provider.getAllSearchrecipe(value, key));
          //       //Text(value );
          //     }, decoration: InputDecoration(
          //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
          //     borderSide: BorderSide( )),
          //         suffixIcon: Icon(Icons.search),
          //         hintText: "search , Ex:pasta,shrimp"),
          //   ),
          // ),
          body:SafeArea(

            child:

          Stack(children: [
            Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                      Colors.cyan.shade100,
                      Colors.deepPurple.shade50,
                      Colors.purple.shade200
                    ])),
          ),
            Column(children: [TextField(
              onSubmitted: (value) {
                List key = provider1.model.preference;


                provider.getAllSearchrecipe(value, key);

                print(value);

                print(key);
                print(provider.getAllSearchrecipe(value, key));
                Text(value );
              }, decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                   ),
                 suffixIcon: IconButton(onPressed: (){
                   Navigator.of(context).push(MaterialPageRoute(builder:(context)=> Homescreen()
                   ));
                 },icon: Icon(Icons.arrow_back),),
                prefixIcon: Icon(Icons.search),
                hintText: "search , Ex:pasta,shrimp"),
            ),
              Expanded(
                child:
                ListView.builder(
                    itemCount: provider.searchmodel.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap:(){provider2.getdetails(provider.searchmodel[index].id);},
                        child: Card(
                          elevation: 5,
                          color: Colors.white60,
                          child: Row(
                            children: [
                              Expanded(
                                child: FadeInImage.assetNetwork(image : provider.searchmodel[index].image=="character(0)"?"https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled.png":provider.searchmodel[index].image, placeholder: "assets/jamie-oliver.jpg"),
                                ),
                              // Column(children: [],)
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    provider.searchmodel[index].name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    provider.searchmodel[index].recipecateg,
                                    style: TextStyle(color: Colors.pink),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )],)

          ],




          ),)

      );
    });
  }
}
// Image.asset("assets/grapes.jpg", fit: BoxFit.cover,),
