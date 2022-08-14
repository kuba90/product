/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/widgets/custom_button.dart';

/* Local dependencies */
import '../bloc/bloc/product_bloc.dart';
import '../generated/l10n.dart';
import '/models/product_model.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = '/editProduct';

  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var initialValues = {
    'title': '',
    'description': '',
    'image': '',
  };

  Product product = Product(
    id: null,
    title: '',
    description: '',
    image: '',
  );

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductBloc>();

    try {
      product = ModalRoute.of(context)!.settings.arguments as Product;
    } catch (e) {
      product.id == null;
    }

    if (product != null) {
      setState(() {
        initialValues = {
          'title': product.title,
          'description': product.description,
          'image': product.image ?? '',
        };
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product.id == null
            ? S.of(context).addProduct
            : S.of(context).editProduct),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: initialValues['title'],
                decoration: InputDecoration(
                  labelText: S.of(context).titleProducts,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (newValue) {
                  product = Product(
                    id: product.id,
                    title: newValue.toString(),
                    description: product.description,
                    image: product.image,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: initialValues['description'],
                decoration: InputDecoration(
                  labelText: S.of(context).descriptionProducts,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (newValue) {
                  product = Product(
                    id: product.id,
                    title: product.title,
                    description: newValue,
                    image: product.image,
                  );
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: initialValues['image'],
                decoration: InputDecoration(
                  labelText: S.of(context).imageProducts,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (newValue) {
                  product = Product(
                      id: product.id,
                      title: product.title,
                      description: product.description,
                      image: newValue);
                },
              ),
              PrimaryButton(
                child: Text(
                  S.of(context).saveBtn.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (product.id != null) {
                    bloc.add(
                        UpdateProductEvent(product: product, id: product.id!));

                    Navigator.pop(context);
                  } else {
                    product.id = DateTime.now().toString();

                    bloc.add(AddProductEvent(product: product));

                    product.id == null;

                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
