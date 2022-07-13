import 'package:calory_tracker/model/model_search.dart';
import 'package:calory_tracker/providers/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchFood extends StatelessWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listProds = SearchFoodModel.dataMock;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'BREACKFAST',
          textAlign: TextAlign.start,
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
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
          ),
          ProductsList(listProds: listProds),
        ],
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({
    Key? key,
    required this.listProds,
  }) : super(key: key);

  final SearchFoodModel listProds;

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
        child: Text('No hay nada'),
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
            decoration: const BoxDecoration(
              color: Colors.white30,
            ),
            child: Text(product.productName ?? ''),
          );
        },
      ),
    );
  }
}
