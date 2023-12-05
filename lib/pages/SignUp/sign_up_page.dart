import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  DateTime SelectedDate = DateTime.now();
  bool male = false;
  bool female = false;
  bool other = false;

  String? SelectedAddress;
  List<String> addresslist = [
    'Ha Noi',
    'HCM',
    'Da Nang',
    'Lao Cai',
  ];
  @override
  void initState() {
    super.initState();
    SelectedAddress = null;
  }

  Future<void> _SelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: SelectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != SelectedDate) {
      setState(() {
        SelectedDate = picked;
      });
    }
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
              child: Text(
                'ĐĂNG NHẬP',
                style: TextStyle(
                  color: Colors.blue[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'ĐĂNG KÝ',
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
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                  vertical: 10,
                  horizontal: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              label: Text(
                'Họ và tên',
              ),
              icon: Icon(
                FontAwesomeIcons.userTag,
                size: 25,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.calendar_month,
                size: 30,
              ),
              SizedBox(width: 18),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(SelectedDate),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => _SelectDate(context),
                        icon: Icon(
                          Icons.change_circle_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(
                Icons.transgender_rounded,
                size: 30,
              ),
              SizedBox(width: 18),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                male = !male;
                                female = false;
                                other = false;
                              });
                            },
                            icon: !male
                                ? Icon(
                                    Icons.circle_outlined,
                                  )
                                : Icon(
                                    Icons.check_circle_outline,
                                  ),
                          ),
                          Text('Nam'),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                female = !female;
                                male = false;
                                other = false;
                              });
                            },
                            icon: !female
                                ? const Icon(
                                    Icons.circle_outlined,
                                  )
                                : Icon(
                                    Icons.check_circle_outline,
                                  ),
                          ),
                          Text('Nữ'),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                other = !other;
                                male = false;
                                female = false;
                              });
                            },
                            icon: !other
                                ? Icon(
                                    Icons.circle_outlined,
                                  )
                                : Icon(
                                    Icons.check_circle_outline,
                                  ),
                          ),
                          Text('Khác'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          _BuildAddress(),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              label: Text(
                'Email',
              ),
              icon: Icon(
                Icons.mail,
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
          TextField(
            decoration: InputDecoration(
              label: Text(
                'Số điện thoại',
              ),
              icon: Icon(
                Icons.phone,
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
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'ĐĂNG KÝ',
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
          SizedBox(height: 40),
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
          SizedBox(height: 20),
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

  Widget _BuildAddress() {
    return DropdownButtonFormField(
      value: SelectedAddress,
      onChanged: (value) {
        setState(() {
          SelectedAddress = value;
        });
      },
      items: addresslist.map((e) {
        return DropdownMenuItem(
          child: Text(e),
          value: e,
        );
      }).toList(),
      decoration: InputDecoration(
        icon: Icon(
          Icons.location_on_sharp,
          size: 30,
          color: Colors.black,
        ),
        label: Text(
          'Địa chỉ',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
      ),
      dropdownColor: Colors.white,
      style: TextStyle(),
    );
  }
}
