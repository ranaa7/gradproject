import 'package:flutter/material.dart';
import 'package:gradproject/provider/search_provider.dart';
import 'package:provider/provider.dart';

class RecommendedScreen extends StatelessWidget {
  const RecommendedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Searchprovider>(context);
    return Scaffold(body: ListView.builder(
        itemCount: provider.searchmodel.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            color: Colors.white60,
            child: Row(
              children: [
                Expanded(
                  child: ClipOval(
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
        }),);
  }
}
