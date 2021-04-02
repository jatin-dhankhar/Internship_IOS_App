import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String key;
  final String category;
  final String title;
  final String description;
  final String price;
  final List ImageUri;

  Product({
    @required this.key,
    @required this.category,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.ImageUri,

  });

}
