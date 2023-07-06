import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gradproject/provider/auth/fav_provider.dart';
import 'package:gradproject/provider/auth/rating_provider.dart';
import 'package:gradproject/provider/detailed_provider.dart';
import 'package:gradproject/provider/recipe_provider.dart';
import 'package:gradproject/provider/relatedrecommendation_provider.dart';
import 'package:provider/provider.dart';

class DetailedScreen extends StatelessWidget {
  DetailedScreen({Key? key}) : super(key: key);
   List ratings =[] ;
   List detailedid=[];
   List<String> names=[];
  Color _iconColor = Colors.grey.shade400;
  @override
  Widget build(BuildContext context) {
    var provider1 = Provider.of<Detailedprovider>(context);
    var provider2 = Provider.of<Relatedrecipeprovider>(context);
    var provider3 = Provider.of<RatingProvider>(context);
    var provider4 = Provider.of<FavProvider>(context);
     provider2.getRelatedRecipe(provider1.detailedmodel[0].name);

    // List detailedrecipeid = provider1.detailedmodel[0].id.list;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(
          children: [
            Stack(
           children: [  
             Positioned(
                left: 0,
                right: 0,
                child: Image.network("https://i.imgur.com/3A12AW2.png")
              ),
             Positioned(
               //left: 100,
               right: 0,
               height: 100,
               child: IconButton(
                 onPressed: () {
                     _iconColor = Colors.red.shade300;
                   names.add(provider1.detailedmodel[0].name);
                  provider4.savefavs(names);

                 },
                 icon: Icon(Icons.favorite),
                 color: _iconColor,
                 iconSize: 40,
               ),
             ),
           ],
           
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 250, //di bntl3 el container el abyd l fo2
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: (Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              provider1.detailedmodel[0].name ?? "",
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 25,
                                fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                         ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children:[
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 25,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          ratings.add(rating);
                          detailedid.add(provider1.detailedmodel[0].id);// Create a new list to hold the ratings
                          // provider3.saveratings(ratings,detailedid);
                          provider3.saveratingss(ratings, detailedid);
                          // print(rating);
                        },
                      ),
                    ]
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                       //Icon(Icons.access_alarm),
                        Text("⏰"),
                        Text(provider1.detailedmodel[0].cooktime,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 15,),
                       // Icon(Icons.person),
                        Text("🧑‍🍳"),
                        Text(
                          provider1.detailedmodel[0].servings.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 15,),
                       // Icon(Icons.local_fire_department_rounded),
                        Text(
                          "🔥 Calories: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          provider1.detailedmodel[0].calories.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: 15,
                        ),


                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "#tags: ",
                          style: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 15,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            provider1.detailedmodel[0].keywords,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(

                      width: double.infinity,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.purple[50]),
                      child: Padding(
                        padding: const EdgeInsets.all(15),

                        child: TabBar(

                           isScrollable: true,
                          indicator: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(8)),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,

                          tabs: [

                            Tab(text: "Ingredients",),
                            Tab(text: "Instructions"),
                            Tab(text: "Related recipes",),
                            Tab(text: "Nutrition Facts",),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(

                                decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.grey[200]),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(provider1.detailedmodel[0].ingredients,style: TextStyle(fontSize:20 ),),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Container(
                                  decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.grey[200]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Text(provider1.detailedmodel[0].instructions,style: TextStyle(fontSize:20 )),
                                  )),
                            ),
                          ),
                          ListView(
                            children: [
                              Expanded(
                                  child: CarouselSlider.builder(
                                    options: CarouselOptions(
                                      height: 200,
                                      enlargeCenterPage: true,
                                      autoPlay: true,
                                      aspectRatio: 16 / 9,
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enableInfiniteScroll: true,
                                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                                      viewportFraction: 0.8,
                                    ),
                                    itemCount: provider2.relatedrecipe.length,
                                    itemBuilder: (context, itemIndex, realIndex) {
                                      return Stack(
                                        children: [
                                          GestureDetector(
                                            onTap:(){
                                              provider1.getdetails(provider2.relatedrecipe[itemIndex].id);

                                      },
                                            child: Card(
                                              elevation: 40,
                                              shadowColor: Colors.purple,
                                              semanticContainer:true,
                                              child: Container(
                                                margin: EdgeInsets.all(50),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  image: DecorationImage(

                                                    image: NetworkImage(
                                                        provider2.relatedrecipe[itemIndex].image,),
                                                    fit: BoxFit.cover,
                                                    alignment: Alignment.topCenter
                                                  ),
                                                ),
                                              ),


                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                provider2.relatedrecipe[itemIndex].name,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.purple,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Container(
                                  decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.grey[200]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(children: [
                                     textnutrition("Fat Content", provider1.detailedmodel[0].FatContent.toString()),
                                      Divider(),
                                      textnutrition("Saturated Fat Content", provider1.detailedmodel[0].SaturatedFatContent.toString()),
                                      Divider(),
                                      textnutrition("Cholestrol Content", provider1.detailedmodel[0].CholesterolContent.toString()),
                                      Divider(),
                                      textnutrition("Sodium Content", provider1.detailedmodel[0].SodiumContent.toString()),
                                      Divider(),
                                      textnutrition("Carbohydrate Content", provider1.detailedmodel[0].CarbohydrateContent.toString()),
                                      Divider(),
                                      textnutrition("Fiber Content", provider1.detailedmodel[0].FiberContent.toString()),
                                      Divider(),
                                    textnutrition("Sugar Content", provider1.detailedmodel[0].SugarContent.toString()),
                                      Divider(),
                                      textnutrition("Protein Content",provider1.detailedmodel[0].ProteinContent.toString()),
                                    ],)
                                  )),
                            ),
                          ),
                       ],
                      ),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget textnutrition (String text1 , String text2){
    return  Row(children: [Expanded(
      child: Text(text1, style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),),
    ),Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Text(text2, style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),),
      ),
    )],);
  }

}
