import 'dart:convert';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_30112023/pages/products/products_page.dart';
import 'package:project_30112023/OtherItem/item.dart';
import 'package:project_30112023/pages/products/products_list.dart';
import 'package:http/http.dart' as http;

class BuildPost extends StatefulWidget {
  const BuildPost({Key? key}) : super(key: key);

  @override
  State<BuildPost> createState() => _BuildPostState();
}

class _BuildPostState extends State<BuildPost> {
  List<ProductsList> productslist = [];

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('http://192.168.0.103/API_Project_30112023/getProducts.php'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        productslist = data.map((json) => ProductsList.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (productslist.length / 2).ceil(),
      itemBuilder: (context, rowIndex) {
        int startIndex = rowIndex * 2;
        int endIndex = (rowIndex + 1) * 2;

        if (endIndex > productslist.length) {
          endIndex = productslist.length;
        }

        List<ProductsList> rowProducts =
            productslist.sublist(startIndex, endIndex);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rowProducts.asMap().entries.map(
            (entry) {
              int index = entry.key;
              ProductsList test = entry.value;

              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: _BuildPage(context, test, index + startIndex),
              );
            },
          ).toList(),
        );
      },
    );
  }

  Widget _BuildPage(
    BuildContext context,
    ProductsList productslist,
    int index,
  ) {
    return Container(
      height: 300,
      width: 195,
      padding: EdgeInsets.fromLTRB(3, 3, 3, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topRight,
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/bk-1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    showSnackBar(
                      context,
                      'Clicked',
                      Colors.black,
                    );
                  },
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(.5),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                productslist.name,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: <Widget>[
                    SizedBox(width: 2),
                    Text(
                      NumberFormat.currency(
                        locale: 'vi_VN',
                        symbol: '₫',
                      ).format(
                        double.parse(productslist.price),
                      ),
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      EvaIcons.star,
                      color: Colors.yellow[700],
                      size: 15,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '${productslist.star} / 5',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Đã bán ${productslist.sell}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    _onProductSelected(productslist);
                    print('a');
                  },
                  child: Text(
                    'Xem chi tiết',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onProductSelected(ProductsList selectedProduct) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductsPage(product: selectedProduct),
      ),
    );
  }
}
