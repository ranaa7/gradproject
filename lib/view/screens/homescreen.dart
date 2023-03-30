import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/provider/auth/auth_provider.dart';
import 'package:gradproject/view/screens/searchscreen.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Text(
              "Find Best Recipe For Cooking",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontStyle: FontStyle.italic),
            ),
              Row(children: [
                Expanded(
                  child: IconButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SearchScreen()
                  ));
              }, icon: Icon(Icons.search)),
                ),
                Expanded(child: Image.asset("assets/chef_hat.jpg",height: 100,width: 100,)),
                Expanded(
                  child: IconButton(onPressed: (){
                    Provider.of<AuthProvider>(context,listen: false).signout();
                  }, icon: Icon(Icons.logout)),
                ),],),

            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  Expanded(
                    child: CarouselSlider(
                      items: [
                        Container(
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://img.freepik.com/free-photo/flat-lay-batch-cooking-composition_23-2148765597.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://img.freepik.com/premium-photo/juicy-american-burger-hamburger-cheeseburger-with-two-beef-patties-with-sauce-basked-black-space_124865-5964.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 380.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    ),
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
