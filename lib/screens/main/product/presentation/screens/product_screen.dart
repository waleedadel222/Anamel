import 'package:anamel/core/common_widgets/text_form_field_widget.dart';
import 'package:anamel/screens/main/product/domain/cubit/product_cubit.dart';
import 'package:anamel/screens/main/product/presentation/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  final String IdCategory;
  const ProductScreen({super.key, required this.IdCategory});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  void initState() {
    super.initState();
    context.read<ProductCubit>().getproductByCategory(id: widget.IdCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF2EA),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFF2EA),
        centerTitle: true,
        title: TextFormFieldWidget(
          hintText: "Search",
          suffixIcon: const Icon(Icons.search),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductFailure) {
              return Center(child: Text(state.message));
            } else if (state is ProductSeccess) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = state.products[index];
                  return ProductCard(
                    price: product.price.toString(),
                    onTap: () {},
                    title: product.name,
                    image: product.imageUrl,
                    descraption: product.description,
                  );
                },
              );
            } else {
              return const Center(child: Text("Error"));
            }
          },
        ),
      ),
    );
  }
}
