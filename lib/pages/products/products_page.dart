import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_30112023/OtherItem/item.dart';
import 'package:project_30112023/controls/dots_color.dart';
import 'package:project_30112023/pages/products/products_list.dart';

class ProductsPage extends StatefulWidget {
  final ProductsList product;

  const ProductsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    child: ListView.builder(
                      controller: _pageController,
                      itemCount: widget.product.image.length,
                      itemBuilder: (context, index) {
                        String proImage = widget.product.image[index];
                        return _buildImage(context, proImage, index);
                      },
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 5,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.navigate_before_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(.3),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(.3),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 55,
                    top: 5,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        EvaIcons.shoppingCartOutline,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(.3),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 105,
                    top: 5,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        EvaIcons.messageCircleOutline,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(.3),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.product.title}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      NumberFormat.currency(
                        locale: 'vi_VN',
                        symbol: '₫',
                      ).format(
                        double.parse(widget.product.price),
                      ),
                      style: TextStyle(
                        fontFamily: 'RobotoBold',
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Màu:',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        DotColors(
                          color: Colors.black,
                        ),
                        DotColors(
                          color: Colors.blue,
                        ),
                        DotColors(
                          color: Colors.red,
                        ),
                        DotColors(
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Text('${widget.product.image}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, String produc, int index) {
    return Container(
      width: double.infinity,
      height: 250,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/${produc}'),
          fit: BoxFit.cover,
        ),
      ),
      child: Text(
        'assets/images/${produc}',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
