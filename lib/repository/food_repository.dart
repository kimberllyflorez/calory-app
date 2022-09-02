import 'dart:async';

import 'package:calory_tracker/model/model_search.dart';
import 'package:calory_tracker/repository/api_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class FoodRepository {
  // https://world.openfoodfacts.org/cgi/search.pl?search_terms=greek colours&action=process&search_simple=1&fields=product_name,code,image_url,nutriments,serving_size&json=1

  Future<String> getJsonData(String searchTerms) async {

    final storage= FlutterSecureStorage();
    final url = Uri.https(ApiConstants.baseUrl, ApiConstants.segment, {
      'action': ApiConstants.action,
      'json': '1',
      'search_simple': '1',
      'search_terms': searchTerms,
      'fields': ApiConstants.fields,
      'auth':   await storage.read(key: 'token') ?? '',
    });
    final response = await http.get(url);
    return response.body;
  }

  Future<SearchFoodModel> getFoodSearch(String query) async {
    final data = await getJsonData(query);
    final response = SearchFoodModel.fromJson(data);
    return response;
  }

// use this to call service to test
// final food  = FoodProvider();
// final data = await food.getJsonData('ice cream');
}
