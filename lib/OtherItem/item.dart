import 'package:flutter/material.dart';
import 'package:project_30112023/OtherItem/build_post.dart';

void showSnackBar(BuildContext context, String message, Color colortext) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: colortext,
        fontWeight: FontWeight.bold,
      ),
    ),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.grey.shade300,
    dismissDirection: DismissDirection.none,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Widget BuildIconButton(Function onPressed, Icon icons) {
  return IconButton(
    onPressed: onPressed as void Function()? ?? () {},
    icon: icons,
    iconSize: 25,
    color: Colors.black,
  );
}

Widget BuildBoxProducts(String title) {
  return Container(
    height: 500,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: BuildPost(),
        ),
      ],
    ),
  );
}
