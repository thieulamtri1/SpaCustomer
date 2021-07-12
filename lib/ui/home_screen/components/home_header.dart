import 'package:flutter/material.dart';
import 'package:spa_and_beauty_staff/ui/chat/chat_screen.dart';
import 'package:spa_and_beauty_staff/ui/search/search_screen.dart';
import 'package:spa_and_beauty_staff/ui/wish_list/wish_list_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchField(
          focusNode: new AlwaysDisabledFocusNode(),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
            FocusScope.of(context).unfocus();
          },
          width: SizeConfig.screenWidth * 0.6,
          autoFocus: false,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishListScreen()),
              );
            },
            child: Icon(
              Icons.shopping_cart,
              color: Color(0xff808080),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
            },
            child: Icon(
              Icons.chat_outlined,
              color: Color(0xff808080),
            ),
          ),
        ),
      ],
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}