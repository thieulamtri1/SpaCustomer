import 'package:flutter/material.dart';
import 'package:spa_and_beauty_staff/ui/bottom_navigation/bottom_navigation.dart';
import 'package:spa_and_beauty_staff/ui/components/profile_pic.dart';
import 'package:spa_and_beauty_staff/ui/profile_detail/profile_detail.dart';

import '../../../constants.dart';
import '../../../main.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(
          height: 30,
        ),
        ProfileMenu(
          icon: Icon(
            Icons.person_outline,
            size: 30,
            color: kPrimaryColor,
          ),
          text: "Thông tin tài khoản",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileDetail()),
            );
          },
        ),
        ProfileMenu(
          icon: Icon(
            Icons.logout,
            size: 30,
            color: kPrimaryColor,
          ),
          text: "Đăng xuất",
          press: () {
            MyApp.storage.deleteItem("token");
            MyApp.storage.deleteItem("customerId");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNavigation()),
            );
          },
        ),
      ],
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.press,
  }) : super(key: key);

  final String text;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            icon,
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
