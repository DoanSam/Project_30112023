import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:project_30112023/OtherItem/item.dart';
import 'package:project_30112023/main_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> login() async {
    if (username.text.isEmpty || password.text.isEmpty) {
      showSnackBar(
        context,
        'Vui lòng điền đầy đủ thông tin.',
        Colors.black,
      );
      return;
    }

    String uri = 'http://192.168.0.103/API_Project_30112023/login.php';

    try {
      var res = await http.post(Uri.parse(uri), body: {
        'username': username.text,
        'password': password.text,
      }).timeout(
        Duration(seconds: 10),
      );

      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        if (response["success"] == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MainPage(),
            ),
          );
        } else {
          showSnackBar(
            context,
            'Sai tên người dùng hoặc mật khẩu.',
            Colors.red,
          );
          print("Login failed: ${response["message"]}");
        }
      } else {
        showSnackBar(context, '${res.statusCode}', Colors.red);
      }
    } catch (e) {
      showSnackBar(context, '$e', Colors.black);
    }
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'ĐĂNG KÝ',
                style: TextStyle(
                  color: Colors.blue[400],
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _BuildPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _BuildPage() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'ĐĂNG NHẬP',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          TextField(
            controller: username,
            decoration: InputDecoration(
              label: Text(
                'Tài khoản/ Email',
              ),
              icon: Icon(
                Icons.person,
                size: 30,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onDoubleTap: () {
              print('clicked');
            },
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                label: Text(
                  'Mật Khẩu',
                ),
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                ),
                icon: Icon(
                  Icons.lock,
                  size: 30,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Quên mật khẩu?',
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              login();
            },
            child: Text(
              'ĐĂNG NHẬP',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: Colors.black,
            ),
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hoặc',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300],
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Icon(
                    FontAwesomeIcons.gofore,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300],
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Icon(
                    FontAwesomeIcons.apple,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300],
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.facebook,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
