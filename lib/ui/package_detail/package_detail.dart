import 'package:flutter/material.dart';
import 'package:spa_and_beauty_staff/models/Package.dart';

import '../../constants.dart';
import 'components/body.dart';

class PackageDetailScreen extends StatefulWidget {
  final Datum package;

  const PackageDetailScreen({Key key, this.package}) : super(key: key);

  @override
  _PackageDetailScreenState createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Body(package: widget.package,)
    );
  }
}
