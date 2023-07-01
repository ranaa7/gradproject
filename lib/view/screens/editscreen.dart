import 'package:flutter/material.dart';
import 'package:gradproject/provider/auth/auth_provider.dart';
import 'package:gradproject/view/screens/checkmodel.dart';
import 'package:gradproject/view/screens/user_profile_screen.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
   EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
   final _formKey = GlobalKey<FormState>();

   var name = TextEditingController();

   var email = TextEditingController();

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
    var updateprovider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile"),
      backgroundColor: Colors.deepPurple[200],
      actions: [
        TextButton(onPressed: (){
        updateprovider.updateuserinfo(name.text , email.text , names);
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=> ProfileScreen()
             ));
      }, child: Text("Update",style:TextStyle(color: Colors.white),))],),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextFormField(
            controller: name,
            validator: (value) {
              if(value!.isEmpty){
                return "Please update your name";
              }
              return null;
            },
            decoration: InputDecoration(
              label: Text('Name'),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:Colors.deepPurple.shade100)
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: email,
            validator: (value) {
              if(value!.isEmpty){
                return "Please update your email";
              }
              return null;
            },
            decoration: InputDecoration(
              label: Text('Email'),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color:Colors.deepPurple.shade100)
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildToggleCheckbox(allowNotifications),
                Divider(),
                ...notifications.map(buildSingleCheckbox).toList(),
              ],
            ),
          ),



        ],),
      ),

    );
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
