import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gradproject/provider/bottom_navy_provider.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class BottomNavyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavyProvider>(builder: (context,provider,child ){
      // orr ----> var provider1 = Provider.of<ControlProvider>(context);
      return Scaffold(
        body: provider.currentscreen,
        bottomNavigationBar:Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                    backgroundColor:Colors.pink,

                  ),
                  GButton(
                    icon:Icons.fastfood,
                    text: 'Meal plan',
                    backgroundColor:Colors.purpleAccent,
                  ),
                  GButton(
                    icon: Icons.favorite,
                    text: 'Favorite',
                    backgroundColor:Colors.deepPurpleAccent,
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                    backgroundColor:Colors.yellow[600],
                  ),

                ],
                selectedIndex: provider.currentindex,
                onTabChange: (index) {
                  provider.changescreen(index);

                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
