import 'package:ai_task/core/utils/constants/app_constants.dart';
import 'package:ai_task/core/widgets/loading/loading.dart';
import 'package:ai_task/screens/mainScreen/cubit/home_cubit.dart';
import 'package:ai_task/screens/mainScreen/widgets/buildProducts/build_products.dart';
import 'package:ai_task/screens/mainScreen/widgets/cartButton/cart_button.dart';
import 'package:ai_task/screens/mainScreen/widgets/customAppBar/custom_app_bar.dart';
import 'package:ai_task/screens/mainScreen/widgets/filterCategories/filter_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/productLoading/product_loading.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    HomeCubit.get(context).seedItemsIfEmpty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  const CustomAppBar(),
                  AppConstants.gap5,
                  state is GetItemsLoading?
                  ProductLoading():
                  Column(
                    children: [
                      FilterCategories(),
                      ProductGridView()
                    ],
                  )
                ],
              ),
              if(state is !GetItemsLoading)
              CartButton()
            ],
          ),
        );
      },
    );
  }
}