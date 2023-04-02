import 'package:flutter/material.dart';
import 'package:gradproject/provider/search_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Consumer<Searchprovider>(builder:(context,provider,child)
    {
     return Scaffold(
        // appBar: AppBar(title: Image.asset("assets/jamie-oliver.jpg"),),
        appBar: AppBar(
          backgroundColor: Colors.white60,
          title: TextField(
            onChanged: (value) {
             provider.getAllSearchrecipe(value);
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search), hintText: "search",),),
        ),

        body:
        Stack(
          children:[

              Container(
                constraints: BoxConstraints.expand(),
                height: 786,

                child: Image.asset("assets/grapes.jpg", fit: BoxFit.cover,),
              ),


              ListView.builder(itemCount:provider.searchmodel.length, itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  color: Colors.white60,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Image.network(
                              provider.searchmodel[index].image),
                        ),
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
                );
              }),

          ],),
      );
    });
  }
}
