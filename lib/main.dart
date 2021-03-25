

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings("@mipmap/ic_launcher");
  final InitializationSettings _initialization = InitializationSettings(android: androidInitializationSettings);

  await flutterLocalNotificationsPlugin.initialize(_initialization);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp(
      title: 'Nextflow Flutter Widget Today',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter 3 นาที: Local Notification'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: RaisedButton(
            child: Text("Click"),
            onPressed: () {
              showNotification();
            },
          ),
        ));
  }

  showNotification() async {
    var android = AndroidNotificationDetails('id', 'channel ', 'description', priority: Priority.high, importance: Importance.max,number: 100);
    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android: android);
    await flutterLocalNotificationsPlugin.show(0, 'Flutter devs', 'Flutter Local Notification Demo', platform,
        payload: 'Welcome to the Local Notification demo');
  }
}
