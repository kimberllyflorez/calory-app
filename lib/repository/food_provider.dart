import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/model_nutrients.dart';

class FoodProvider extends ChangeNotifier {
  final _baseUrl = 'world.openfoodfacts.org';
  final segment = 'cgi/search.pl';
  final json = true;
  final action = 'process';
  final fields = 'product_name,code,image_url,nutriments,serving_size';

  // https://world.openfoodfacts.org/cgi/search.pl?search_terms=greek colours&action=process&search_simple=1&fields=product_name,code,image_url,nutriments,serving_size&json=1

  FoodProvider() {
    getFoodSearch();
  }

  Future<String> getJsonData(String searchTerms) async {
    final url = Uri.https(_baseUrl, segment, {
      'action': action,
      'json': '1',
      'search_simple': '1',
      'search_terms': searchTerms,
      'fields': fields,
    });
    final response = await http.get(url);
    return response.body;
  }

  getFoodSearch() async {
    final data = await getJsonData('');
    final response = Nutriments.fromJson(data);
    notifyListeners();
  }
}
