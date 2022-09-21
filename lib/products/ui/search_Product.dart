import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:calory_tracker/home/ui/widgets/selected_product_wd.dart';
import 'package:calory_tracker/products/model/model_search.dart';
import 'package:calory_tracker/products/providers/food_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchFood extends StatelessWidget {
  final int index;

  const SearchFood({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listProds = SearchFoodModel.dataMock;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Product',
          style: TextStyle(color: AppTheme.primary),
          textAlign: TextAlign.start,
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: AppTheme.primary,
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          const _SearchBar(),
          _SearchProduct(
            listProds: listProds,
            listIndex: index,
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          autofocus: true,
          onChanged: (String query) {
            Provider.of<FoodProvider>(context, listen: false).fetchFoodByQuery(query);
          },
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.grey,
            suffixIcon: Icon(Icons.search, color: Colors.white),
            hintText: 'What do want to eat?',
            labelStyle: TextStyle(
              color: Colors.green,
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class _SearchProduct extends StatelessWidget {
  const _SearchProduct({
    Key? key,
    required this.listProds,
    required this.listIndex,
  }) : super(key: key);

  final SearchFoodModel listProds;
  final int listIndex;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FoodProvider>(context);
    final foodList = provider.searchFood;
    final isLoading = provider.isLoading;
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (foodList == null) {
      return const Center(
        child: Text('Ingresa un valor para buscar'),
      );
    }
    if (foodList.products.isEmpty) {
      return const Center(
        child: Text('data not found'),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: foodList.products.length,
        itemBuilder: (_, index) {
          final product = foodList.products[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 2.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white30,
            ),
            child: SelectProduct(
              product: product,
              index: listIndex,
            ),
          );
        },
      ),
    );
  }
}
