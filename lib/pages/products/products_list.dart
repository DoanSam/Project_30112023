class ProductsList {
  String username;
  String id;
  String image;
  String title;
  String name;
  String quantity;
  String color;
  String size;
  String price;
  String descriptions;
  String star;
  String sell;
  String comments;
  String created;

  ProductsList({
    required this.username,
    required this.id,
    required this.image,
    required this.title,
    required this.name,
    required this.quantity,
    required this.color,
    required this.size,
    required this.price,
    required this.descriptions,
    required this.comments,
    required this.star,
    required this.sell,
    required this.created,
  });

  factory ProductsList.fromJson(Map<String, dynamic> json) {
    return ProductsList(
      username: json['acc_id'],
      image: json['imagepath'] ?? 'assets/images/default-image.png',
      id: json['pro_id'],
      title: json['pro_title'],
      name: json['pro_name'],
      quantity: json['pro_quantity'],
      color: json['color_id'],
      size: json['size_id'],
      price: json['pro_price'],
      descriptions: json['pro_descriptions'],
      comments: json['pro_comments'],
      star: json['pro_star'],
      sell: json['sell_quantity'],
      created: json['pro_created'],
    );
  }
}
