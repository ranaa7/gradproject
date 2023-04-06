
import 'package:flutter/material.dart';
import 'package:gradproject/view/screens/checkmodel.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final allowNotifications = NotificationSetting(title: 'Dietary restrictions all');

  final notifications = [
    NotificationSetting(title: 'Spicy'),
    NotificationSetting(title: 'Lactose Free'),
    NotificationSetting(title: 'Low protein'),
    NotificationSetting(title: 'High protein'),
    NotificationSetting(title: 'Healthy'),
    NotificationSetting(title: 'Vegan'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: ListView(
      children: [
        buildToggleCheckbox(allowNotifications),
        Divider(),
        ...notifications.map(buildSingleCheckbox).toList(),
      ],
    ),
  );

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