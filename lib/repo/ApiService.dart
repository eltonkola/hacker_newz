import 'package:hacker_newz/model/AppTabItem.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:hacker_newz/model/HNItem.dart';
import 'package:hacker_newz/model/Conts.dart';

class ApiService {

  Future<List<int>> fetchData(AppTabItem tab) async {
    final response = await http.get(tab.api_url);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON

      var itemList = json.decode(response.body) as List;
      List<int> idListData = itemList.map((i) => int.parse(i.toString())).toList();

      return idListData;

      //return HNItem.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post..');
    }
  }


  Future<HNItem> getItemById(int itemId) async {
    final String URL = Conts.baseUrl + Conts.item + itemId.toString() + Conts.basePostfix;
    final response = await http.get(URL);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return HNItem.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post..');
    }
  }

}