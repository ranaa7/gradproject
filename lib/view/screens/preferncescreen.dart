import 'package:flutter/material.dart';
import 'package:gradproject/provider/auth/auth_provider.dart';
import 'package:provider/provider.dart';

class Preference_screen extends StatefulWidget {
   Preference_screen({Key? key,required this.e,required this.p,required this.n
   }) : super(key: key);

// final Key formkey;
//   final GlobalKey<FormState> form ;
  final form = GlobalKey<FormState>();
  var e = TextEditingController();

  var p = TextEditingController();

  var n = TextEditingController();


  State<Preference_screen> createState() => _Preference_screenState();
}

class _Preference_screenState extends State<Preference_screen> {
  // final _formKey = GlobalKey<FormState>();
 String? veg ;
 String? lactose ;
 String? spicy ;

  // String dropdownvalue = 'Dairy product';

  var items = [
    'Dairy product',
    'Eggs',
    'shellfish',
    'Soy',
    'Chocolate',
    'Nuts',
    'Wheat'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: widget.form,
          child: Container(
            child: (Column(
              children: [
                SizedBox(height: 15,),
                Text("2/2", style: TextStyle(
                    fontSize: 18
                ),),
                SizedBox(height: 15,),
                // DropdownButton(value:dropdownvalue,items: items.map((String items){
                //   return DropdownMenuItem(child: Text(items),value: items);
                // }).toList(), onChanged: (String? newval){
                //   setState(() {
                //     dropdownvalue=newval!;
                //   });
                // }),
                SizedBox(height: 30,),
                Text("Are you vegeterian or not?", style: TextStyle(
                    fontSize: 18
                ),),

                Divider(),

                RadioListTile(
                  title: Text("Vegeterian"),
                  value: "Vegeterian",
                  groupValue: veg,
                  onChanged: (value){
                    setState(() {
                      veg = value.toString();
                    });
                  },
                ),

                RadioListTile(
                  title: Text("Non vegeterian"),
                  value: "Non vegeterian",
                  groupValue: veg,
                  onChanged: (value){
                    setState(() {
                      veg = value.toString();
                    });
                  },
                ),

                SizedBox(height: 30,),
                Text("Are you lactose-free?", style: TextStyle(
                    fontSize: 18
                ),),

                Divider(),

                RadioListTile(
                  title: Text("yes"),
                  value: "yes",
                  groupValue: lactose,
                  onChanged: (value){
                    setState(() {
                      lactose = value.toString();
                    });
                  },
                ),

                RadioListTile(
                  title: Text("No, i don't mind"),
                  value: "No, i don't mind",
                  groupValue: lactose,
                  onChanged: (value){
                    setState(() {
                      lactose= value.toString();
                    });
                  },
                ),
                SizedBox(height: 30,),
                Text("Do you prefer spicy food or not?", style: TextStyle(
                    fontSize: 18
                ),),

                Divider(),

                RadioListTile(
                  title: Text("Spicy"),
                  value: "Spicy",
                  groupValue: spicy,
                  onChanged: (value){
                    setState(() {
                      spicy = value.toString();
                    });
                  },
                ),

                RadioListTile(
                  title: Text("Not spicy"),
                  value: "Not spicy",
                  groupValue: spicy,
                  onChanged: (value){
                    setState(() {
                      spicy = value.toString();
                    });
                  },
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      if(widget.form.currentState!.validate()) {
                        Provider.of<AuthProvider>(context,listen: false).signup(widget.e.text, widget.p.text, widget.n.text,veg.toString(),lactose.toString(),spicy.toString());

                      }
                    },
                    child: Text('Sign up', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
