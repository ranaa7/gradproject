import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Image.asset("assets/jamie-oliver.jpg"),),
        appBar: AppBar(
          backgroundColor: Colors.white60,
          title: TextField(
            onChanged:(value){
              // provider.getAllSearchArticle(value);
            },
            decoration:InputDecoration(suffixIcon: Icon(Icons.search),hintText:"search",),),
        ),

       body:
      Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              height: 786,

              child: Image.asset("assets/grapes.jpg",fit: BoxFit.cover,),
            ),

            ListView(children: [
              Card(
              elevation: 5,
              color: Colors.white60,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Image.network("https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        "hvhbgkgklbkmlkfmbg",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "uigyttftrybhj",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
            ],),

            // ListView.builder(itemCount:provider.searchList.length,itemBuilder: (context, index) {
            //        return Card(
            //     elevation: 5,
            //          color: Colors.white60,
            //           child: Row(
            //             children: [
            //          Expanded(
            //          child: Container(
            //       child: Image.network(
            //            provider.searchList[index].urltoimg??"https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"),
            //            ),
            //   ),
            //          Expanded(
            //           child: ListTile(
            //             title: Text(
            //     provider.searchList[index].title.toString(),
            //        style: TextStyle(color: Colors.black),
            //           ),
            //          subtitle: Text(
            //            provider.searchList[index].des.toString(),
            //         style: TextStyle(color: Colors.black),
            //        ),
            //        ),
            //           )
            //           ],
            //   ),
            //        );
            //        }) )



          ], )
    );
  }
}
