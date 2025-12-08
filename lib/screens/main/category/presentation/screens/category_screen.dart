import 'package:anamel/core/common_widgets/text_form_field_widget.dart';
import 'dart:developer';

import 'package:anamel/core/Apis/api_constans.dart';
import 'package:anamel/core/routes/app_routing.dart';
import 'package:anamel/screens/main/category/domain/cubit/category_cubit_cubit.dart';
import 'package:anamel/screens/main/category/presentation/components/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubitCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF2EA),
      appBar: AppBar(
        backgroundColor: Color(0xffFFF2EA),
        centerTitle: true,
        title: Text(" Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CategoryCubitCubit, CategoryCubitState>(
          builder: (context, state) {
            if (state is CategoryCubitLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryCubitFailure) {
              return Center(child: Text(state.error));
            } else if (state is CategoryCubitSuccess) {
              return ListView.builder(
                itemCount: state.categoryModel.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = state.categoryModel[index];
                  return CategoryItem(
                    onTap: () {
                      log(state.categoryModel[index].id.toString());
                      log(state.categoryModel[index].title);
                      GoRouter.of(context).pushNamed(
                        AppRouting.productByCategory,
                        extra: {
                          "id": state.categoryModel[index].id.toString(),
                          "name": state.categoryModel[index].title,
                        },
                      );
                    },
                    title: category.title,
                    image: category.imageUrl,
                    descraption: category.description,
                  );
                },
              );
            } else {
              return Container(child: Center(child: Text("there is no data")));
            }
          },
        ),
      ),
    );
  }
}
