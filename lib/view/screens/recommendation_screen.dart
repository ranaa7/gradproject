import 'package:flutter/material.dart';
import 'package:gradproject/provider/detailed_provider.dart';
import 'package:gradproject/provider/search_provider.dart';
import 'package:provider/provider.dart';

class RecommendedScreen extends StatelessWidget {
  const RecommendedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Searchprovider>(context);
    var provider2 = Provider.of<Detailedprovider>(context);
    return Scaffold(body: ListView.builder(
        itemCount: provider.searchmodel.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              provider2.getdetails(provider.searchmodel[index].id);

            },
            child: Card(
              elevation: 5,
              color: Colors.white60,
              child: Row(
                children: [
                  Expanded(
                    child: FadeInImage.assetNetwork(image : provider.searchmodel[index].image=="character(0)"?"https://i.imgur.com/3A12AW2.png":provider.searchmodel[index].image, placeholder: "assets/jamie-oliver.jpg"),
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
        }),);
  }
}
