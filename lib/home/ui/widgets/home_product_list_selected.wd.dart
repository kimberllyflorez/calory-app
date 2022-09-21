import 'package:calory_tracker/products/model/model_product.dart';
import 'package:calory_tracker/products/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';

class ProductListSelected extends StatelessWidget {
  final int listIndex;

  const ProductListSelected({
    Key? key,
    required this.listIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductsProvider>().getListFoods(listIndex);
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return SelectProductToList(
          product: products[index],
          index: listIndex,
        );
        //Text(products[index].productName ?? 'no name');
      },
    );
  }
}

// Text(products[index].productName ?? 'no name')
class SelectProductToList extends StatelessWidget {
  final Product product;
  final int index;

  const SelectProductToList({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.purple,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            width: width * 0.2,
            height: height * 0.1,
            child: FadeInImage(
              placeholder: const AssetImage('assets/loading.gif'),
              image: productImageValidate(),
              fit: BoxFit.contain,
            ),
          ),
          Flexible(child: Text(product.productName ?? '')),
          Row(
            children: [
              Column(
                children: [
                  Text(product.nutriments?.proteins.toString() ?? ':('),
                  const Text('protein'),
                ],
              ),
              const SizedBox(width: 5),
              Column(
                children: [
                  Text(product.nutriments?.carbohydrates.toString() ?? '(:'),
                  const Text('carbs'),
                ],
              ),
              const SizedBox(width: 5),
              Column(
                children: [
                  Text(product.nutriments?.fat.toString() ?? ':('),
                  const Text('fat'),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              final provider = Provider.of<ProductsProvider>(context, listen: false);
              provider.removeProduct(product, index);
              //Navigator.pop(context);
            },
            icon: const Icon(
              PhosphorIcons.minus_circle,
              //color:,
              size: 30,
            ),
          )
        ],
      ),
    );
  }

  ImageProvider<Object> productImageValidate() {
    final imageUrl = product.imageUrl ?? '';
    if (imageUrl.isNotEmpty) {
      return NetworkImage(imageUrl);
    }
    return AssetImage('assets/ic_dinner.png');
  }
}
