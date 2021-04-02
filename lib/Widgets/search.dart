// import 'package:autocomplete_textfield/autocomplete_textfield.dart';

import 'package:elasto_india/providers/product.dart';
import 'package:elasto_india/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

import 'autocomplete.dart';

class Search extends StatefulWidget {
  final List products;

  Search(this.products);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var _searchText = TextEditingController();

  List<Product> suggestions;

  @override
  void initState() {
    suggestions = widget.products;
    product(suggestions);
    super.initState();
  }

  List<String> product(List<Product> suggestions) {
    List<String> prod = [];
    suggestions.forEach((element) {
      print(element);
      prod.add(element.title);
    });
    // print(prod);
    return prod;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      child: AutoCompleteTextField(
        clearOnSubmit: true,

        decoration: new InputDecoration(
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: "Search",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        controller: _searchText,
        // suggestions: suggestions,
        suggestions: product(suggestions),
        itemSubmitted: (item) {
          print(item);
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
              arguments: suggestions
                  .firstWhere((element) => element.title == item)
                  .key);
        },
        itemFilter: (suggestion, input) =>
            suggestion.toString().toLowerCase().contains(input.toLowerCase()),
        //suggestion.toLowerCase().startsWith(input.toLowerCase()),
        itemSorter: (a, b) => a.compareTo(b),
        itemBuilder: (context, suggestion) => Container(
          height: 30,
          child: Text(
            suggestion,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // padding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
