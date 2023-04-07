import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/provider/detailed_provider.dart';
import 'package:gradproject/provider/recipe_provider.dart';
import 'package:gradproject/provider/relatedrecommendation_provider.dart';
import 'package:provider/provider.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider1 = Provider.of<Detailedprovider>(context);
    var provider2 = Provider.of<Relatedrecipeprovider>(context);
     provider2.getRelatedRecipe(provider1.detailedmodel[0].name);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Image.network("https://i.imgur.com/3A12AW2.png")

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
                          child: Text(
                            provider1.detailedmodel[0].name ?? "",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 30,
                              fontStyle: FontStyle.italic
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite),
                            color: Colors.red[300],
                            iconSize: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                       Icon(Icons.access_alarm),
                        Text(
                          provider1.detailedmodel[0].cooktime,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 7,),
                        Icon(Icons.person),
                        Text(
                          provider1.detailedmodel[0].servings.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.local_fire_department_rounded),
                        Text(
                          "Calories: ",
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
                          BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.deepPurple[100]),
                      child: Padding(
                        padding: const EdgeInsets.all(15),

                        child: TabBar(

                          indicator: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8)),
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: [
                            Tab(text: "Ingredients"),
                            Tab(text: "Instructions"),
                            Tab(text: "Related recipes",),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [Text(provider1.detailedmodel[0].ingredients,style: TextStyle(fontSize:20 ),), Text(provider1.detailedmodel[0].instructions,style: TextStyle(fontSize:20 )),
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
                                          Card(
                                            elevation: 40,
                                            shadowColor: Colors.indigoAccent,
                                            child: Container(
                                              margin: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10.0),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      provider2.relatedrecipe[itemIndex].image),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                decoration:
                                                BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.deepPurple[100]),
                                                child: Text(
                                                  provider2.relatedrecipe[itemIndex].name,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                  ),
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
                          )
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
}
