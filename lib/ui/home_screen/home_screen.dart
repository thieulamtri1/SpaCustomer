import 'package:flutter/material.dart';
import 'package:spa_and_beauty_staff/models/Package.dart';

import '../../main.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  static List<Datum> cart = new List<Datum>();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("Item trong cart : ");
    print(MyApp.storage.getItem("cart"));

    return Scaffold(
      body: Body(),
    );
  }
}
