import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchModel extends ChangeNotifier {

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<item> _suggestions = history;
  List<item> get suggestions => _suggestions;

  String _query = '';
  String get query => _query;

  void onQueryChanged(String query) async {
    if (query == _query) return;
    _query = query;
    _isLoading = true;
    notifyListeners();

    if (query.isEmpty) {
      _suggestions = history;
    } else {

    }

    _isLoading = false;
    notifyListeners();
  }

  void clear() {
    _suggestions = history;
    notifyListeners();
  }
}

const List<item> history = [

];

class item extends StatelessWidget {
  item({this.val});
  String val;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: Text("$val")),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
