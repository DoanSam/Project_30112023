import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_30112023/OtherItem/item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: _BuildPage(),
        ),
      ),
    );
  }

  Widget _BuildPage() {
    return Container(
      margin: EdgeInsets.all(3),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bk-1.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/ava-my.jpg'),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Quoc Doan Sam',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.check_circle,
                                color: Colors.blue[700],
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                FontAwesomeIcons.coins,
                                color: Colors.yellow[700],
                              ),
                              SizedBox(width: 10),
                              Text(
                                '572.048.578',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'Admin',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.navigate_next_rounded,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey.withOpacity(.5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          _BuildOders(),
          SizedBox(height: 20),
          BuildBoxProducts('Bài đăng của bạn'),
        ],
      ),
    );
  }

  Widget _BuildOders() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.list_alt_rounded,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  'Đơn mua',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  'Lịch sử mua hàng',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Icon(
                      Icons.wallet,
                      color: Colors.black,
                      size: 30,
                    ),
                    Text(
                      'Xác nhận',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Icon(
                      EvaIcons.shoppingBag,
                      color: Colors.black,
                      size: 30,
                    ),
                    Text(
                      'Lấy hàng',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Icon(
                      EvaIcons.car,
                      color: Colors.black,
                      size: 30,
                    ),
                    Text(
                      'Giao hàng',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Icon(
                      EvaIcons.star,
                      color: Colors.black,
                      size: 30,
                    ),
                    Text(
                      'Đánh giá',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
