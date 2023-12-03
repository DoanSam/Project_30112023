import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
            onPressed: () {},
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
