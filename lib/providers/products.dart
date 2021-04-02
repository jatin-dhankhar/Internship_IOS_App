import 'dart:convert';


import 'package:elasto_india/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }
  List<Product> _knittingItems = [];

  List<Product> get knittingItems {
    return [..._knittingItems];
  }

  Future<void> fetchAndSetProduct() async {
    const url = 'https://elastoindia-a7c88.firebaseio.com/Posts.json';
    try {
      final response = await http.get(url);
      print(json.decode(response.body));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        // print('${prodData}\n');
        loadedProducts.add(Product(
          key: prodId,
          category: prodData['category'],
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          ImageUri: prodData['ImageUri'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }

  }

  Product findById(String id) {
    return items.firstWhere((product) => product.key == id);
  }

  List<Product> findByName(String id) {
    _knittingItems =  items.where((element) => element.category == id).toList();
    return knittingItems;
  }
}
