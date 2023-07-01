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
                      Colors.grey.shade50,
                      Colors.grey.shade50,
                      Colors.purple.shade200
                    ])),
          ),
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(

                onSubmitted: (value) {
                  List key = provider1.model.preference;


                  provider.getAllSearchrecipe(value, key);

                  print(value);

                  print(key);
                  print(provider.getAllSearchrecipe(value, key));
                  Text(value );
                }, decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(60),
                     ),
                   suffixIcon: Row(
                   mainAxisSize: MainAxisSize.min,
                     children: [
                     IconButton(onPressed: (){}, icon: Icon(Icons.filter_list_alt)),
                     IconButton(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder:(context)=> Homescreen()
      ));
      },icon: Icon(Icons.arrow_back),),],),

                  prefixIcon: Icon(Icons.search),
                  hintText: "search , Ex:pasta,shrimp"),
            ),
              ),
              Expanded(
                child:
                ListView.builder(
                    itemCount: provider.searchmodel.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap:(){provider2.getdetails(provider.searchmodel[index].id);},
                        child: Card(
                          elevation: 10,
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(130),
                                  child: FadeInImage.assetNetwork(image : provider.searchmodel[index].image=="character(0)"?"https://i.imgur.com/3A12AW2.png":provider.searchmodel[index].image, placeholder: "assets/jamie-oliver.jpg"
                                  ,fit: BoxFit.cover,),

                                ),
                              ),
                              // Column(children: [],)
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    provider.searchmodel[index].name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  subtitle: Row(children: [
                                    Text("🍔"),
                                    Text(
                                    provider.searchmodel[index].recipecateg,
                                    style: TextStyle(color: Colors.purple),
                                  ),],)

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
