import 'package:flutter/material.dart';
import 'package:spa_and_beauty_staff/models/CustomerProfile.dart';
import 'package:spa_and_beauty_staff/services/CustomerProfileServices.dart';

import '../../../main.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _loading;
  CustomerProfile _customerProfile;

  @override
  void initState() {
    // TODO: implement initState
    CustomerProfileServices.getCustomerProfile().then((customerProfile) => {
      setState(() {
        _customerProfile = customerProfile;
        _loading = false;
      })
    });

    super.initState();

    print(MyApp.storage.getItem("token"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Full name: "+_customerProfile.data.user.fullname),
    );
  }
}
