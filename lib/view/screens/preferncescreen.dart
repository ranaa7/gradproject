import 'package:flutter/material.dart';
import 'package:gradproject/provider/auth/auth_provider.dart';
import 'package:gradproject/view/screens/checkmodel.dart';
import 'package:provider/provider.dart';

class Preference_screen extends StatefulWidget {
   Preference_screen({Key? key,required this.e,required this.p,required this.n,
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
 // String? veg ;
 // String? lactose ;
 // String? spicy ;

  // String dropdownvalue = 'Dairy product';

  // var items = [
  //   'Dairy product',
  //   'Eggs',
  //   'shellfish',
  //   'Soy',
  //   'Chocolate',
  //   'Nuts',
  //   'Wheat'
  // ];

 final allowNotifications = NotificationSetting(title: 'Dietary restrictions all');

 final notifications = [
   NotificationSetting(title: 'Spicy'),
   NotificationSetting(title: 'Lactose Free'),
   NotificationSetting(title: 'Low Protein'),
   NotificationSetting(title: 'High Protein'),
   NotificationSetting(title: 'Healthy'),
   NotificationSetting(title: 'Vegan'),
   NotificationSetting(title: 'Very Low Carbs'),
   NotificationSetting(title: 'Low Cholestrol'),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: widget.form,
          child: Container(
            child: (Column(
              children: [
                SizedBox(height: 15,),
                Text("2/2", style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey
                ),),
                SizedBox(height: 10,),
                Text("Enter your preference", style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black
                ),),

                // DropdownButton(value:dropdownvalue,items: items.map((String items){
                //   return DropdownMenuItem(child: Text(items),value: items);
                // }).toList(), onChanged: (String? newval){
                //   setState(() {
                //     dropdownvalue=newval!;
                //   });
                // }),
                SizedBox(height: 30,),

    Expanded(
      child: Row(
        children: [
          Expanded(
            child: ListView(
                    children: [
                      buildToggleCheckbox(allowNotifications),
                      Divider(),
                      ...notifications.map(buildSingleCheckbox).toList(),
                    ],
                  ),
          ),
          Expanded(
            child: Align( alignment: Alignment.bottomRight,
                child: Image.asset("assets/img_3.png",height: 350,)),
          ),
        ],
      ),
    ),

                SizedBox(height: 10,),
              Container(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if(widget.form.currentState!.validate()) {
                      Provider.of<AuthProvider>(context,listen: false).signup(widget.e.text, widget.p.text, widget.n.text,names);

                    }
                  },
                  child: Text('Sign up', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      primary: Colors.deepPurple[100]
                  ),
                ),
              ),
              )

              ],
            )),
          ),
        ),
    ));

  }
 Widget buildToggleCheckbox(NotificationSetting notification) => buildCheckbox(
     notification: notification,
     onClicked: () {
       final newValue = !notification.value;

       setState(() {
         allowNotifications.value = newValue;

         notifications.forEach((notification) {
           notification.value = newValue;

         });
       });
     });
 List names=[];
 Widget buildSingleCheckbox(NotificationSetting notification) => buildCheckbox(
   notification: notification,
   onClicked: () {
     setState(() {
       final newValue = !notification.value;
       notification.value = newValue;

       if (!newValue) {
         allowNotifications.value = false;
         names.remove(notification.title);
       } else {
         final allow =
         notifications.every((notification) => notification.value);
         allowNotifications.value = allow;

         names.add(notification.title);

         print(names);
       }
     });
   },
 );

 Widget buildCheckbox({
   required NotificationSetting notification,
   required VoidCallback onClicked,
 }) =>
     ListTile(
       onTap: onClicked,
       leading: Checkbox(
         value: notification.value,
         onChanged: (value) => onClicked(),
       ),
       title: Text(
         notification.title,
         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
       ),
     );
}
