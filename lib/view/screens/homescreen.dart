import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/provider/auth/auth_provider.dart';
import 'package:gradproject/provider/detailed_provider.dart';
import 'package:gradproject/provider/recipe_provider.dart';
import 'package:gradproject/view/screens/breakfastscreen.dart';
import 'package:gradproject/view/screens/dessertscreen.dart';
import 'package:gradproject/view/screens/lunchscreen.dart';
import 'package:gradproject/view/screens/searchscreen.dart';
import 'package:gradproject/view/widget/button.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<Recipeprovider>(context);
    var provider1 = Provider.of<Detailedprovider>(context);
    return Scaffold(
      body: SafeArea(
          child: Container(

        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                      },
                      icon: Icon(Icons.search),color: Colors.black,),
                ),
                Expanded(
                    child: Image.asset("assets/cookly3.jpeg")),
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        Provider.of<AuthProvider>(context, listen: false)
                            .signout();
                      },
                      icon: Icon(Icons.logout),color: Colors.black,),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Popular Categories",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      // fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BreakfastScreen()));
                  },
                  icon: CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                          "https://images.immediate.co.uk/production/volatile/sites/30/2013/05/Healthy-porridge-bowl-b1f9205.jpg",
                          fit: BoxFit.cover
                      ),
                    ),
                    radius: 21,
                  ),
                  label: Text("Breakfast"),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      primary: Colors.purple[400]
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LunchScreen()));
                  },
                  icon: CircleAvatar(
                    child: ClipOval(
                      child: Image.network(
                          "https://www.acouplecooks.com/wp-content/uploads/2022/01/Hummus-Bowl-016.jpg",
                          fit: BoxFit.cover
                      ),
                    ),
                    radius: 21,
                  ),
                  label: Text("Lunch"),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      primary: Colors.purple[400]
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DessertScreen()));
                  },
                  icon: CircleAvatar(
                    child: ClipOval(
                      child: Image.network("https://resize.img.allw.mn/thumbs/00/surd8r8ca2rka63zdt9in_1080_1225.jpg?width=1200&height=1200",fit: BoxFit.cover)
                    ),
                    radius: 20,
                  ),
                  label: Text("Dessert"),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      primary: Colors.purple[400]
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Top Rated Recipes",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                children: [
                  Expanded(
                      child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 380.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                    itemCount: provider.recipemodel.length,
                    itemBuilder: (context, itemIndex, realIndex) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap:(){
                              provider1.getdetails(provider.recipemodel[itemIndex].id);
                              print(provider.recipemodel[itemIndex].id);
                            },
                            child: Card(
                              elevation: 50,
                              semanticContainer: true,
                              //clipBehavior: Clip.antiAliasWithSaveLayer,
                              shadowColor: Colors.purple,

                              child: Container(
                               // height:double.infinity,
                                margin: EdgeInsets.all(55),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  image: DecorationImage(
                                    image:
                                    NetworkImage(
                                        provider.recipemodel[itemIndex].image),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,


                                  ),
                                ),
                              ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                provider.recipemodel[itemIndex].name,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.purple[600], fontWeight: FontWeight.bold
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
            )
          ],
        ),
      )),
    );
  }
}
