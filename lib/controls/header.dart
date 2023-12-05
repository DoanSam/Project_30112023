import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:project_30112023/OtherItem/item.dart';

class HeaderControls extends StatefulWidget {
  const HeaderControls({super.key});

  @override
  State<HeaderControls> createState() => _HeaderControlsState();
}

class _HeaderControlsState extends State<HeaderControls> {
  @override
  Widget build(BuildContext context) {
    return _Build();
  }

  Widget _Build() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'S A M',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Spacer(),
              BuildIconButton(
                () {
                  showSnackBar(
                    context,
                    'hello',
                    Colors.black,
                  );
                },
                Icon(
                  EvaIcons.search,
                ),
              ),
              BuildIconButton(
                () {
                  showSnackBar(
                    context,
                    'hello',
                    Colors.black,
                  );
                },
                Icon(
                  Icons.add_circle_outline_rounded,
                ),
              ),
              BuildIconButton(
                () {
                  showSnackBar(
                    context,
                    'hello',
                    Colors.black,
                  );
                },
                Icon(
                  EvaIcons.shoppingCartOutline,
                ),
              ),
              BuildIconButton(
                () {
                  showSnackBar(
                    context,
                    'hello',
                    Colors.black,
                  );
                },
                Icon(
                  EvaIcons.messageCircleOutline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
