import 'package:flutter/material.dart';

class BuildCalendar extends StatefulWidget {
  const BuildCalendar({super.key});

  @override
  State<BuildCalendar> createState() => _BuildCalendarState();
}

class _BuildCalendarState extends State<BuildCalendar> {
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
    SelectedAddress = addresslist.first;
  }

  @override
  Widget build(BuildContext context) {
    return _Build();
  }

  Widget _Build() {
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
        label: Text(
          'Choice your address',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}
