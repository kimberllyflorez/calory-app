import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:calory_tracker/home/ui/widgets/products_macros_values_wd.dart';
import 'package:calory_tracker/products/model/model_product.dart';
import 'package:calory_tracker/products/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';

class SelectProduct extends StatefulWidget {
  final Product product;
  final int index;

  const SelectProduct({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  State<SelectProduct> createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            child: FadeInImage(
              placeholder: const AssetImage('assets/loading.gif'),
              image: productImageValidate(),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                widget.product.productName ?? '',
                maxLines: 1,
                style:
                    const TextStyle(overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold),
              ),
            ),
            MacrosProductSelect(index: widget.index, product: widget.product),
            Row(
              children: [
                ValueSelect(
                  controller: controller,
                ),
                IconButton(
                  onPressed: () {
                    final newProduct = widget.product.copyWith(
                      addedOn: DateTime.now(),
                    );
                    final provider = Provider.of<ProductsProvider>(context, listen: false);
                    provider.addProduct(newProduct, widget.index);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    PhosphorIcons.heart_fill,
                    color: AppTheme.primary,
                    size: 30,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  ImageProvider<Object> productImageValidate() {
    final imageUrl = widget.product.imageUrl ?? '';
    if (imageUrl.isNotEmpty) {
      return NetworkImage(imageUrl);
    }
    return const AssetImage('assets/ic_dinner.png');
  }
}


class ValueSelect extends StatelessWidget {
  final TextEditingController controller;

  const ValueSelect({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: 100,
      child: TextFormField(
        textAlign: TextAlign.center,
        autofocus: false,
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(4),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}