import 'package:ai_task/core/widgets/gap/height/height.dart';
import 'package:ai_task/screens/mainScreen/cubit/home_cubit.dart';
import 'package:ai_task/screens/mainScreen/widgets/buildProducts/productCard/product_card.dart';
import 'package:flutter/material.dart';

import '../../../productDetails/product_details.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    // Step 2 & 3: Create a GridView.builder widget and configure gridDelegate.
    final cubit = HomeCubit.get(context);
    return SizedBox(
      height: height(context, 0.8),
      child: GridView.builder(
        padding: EdgeInsets.only(top: 16.0,left: 16,right: 16,bottom: height(context, 0.08)),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 16.0, // Spacing between columns
          mainAxisSpacing: 16.0, // Spacing between rows
          childAspectRatio: 0.8, // Adjust as needed to fit content (width/height)
        ),
        itemCount: cubit.itemModel.length,
        // Step 4: Use the itemBuilder to construct each ProductCard.
        itemBuilder: (context, index) {
          final product = cubit.itemModel[index];
          return RepaintBoundary(
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(product: product,),)),
              child: ProductCard(
                productId: product.id,
                productImg: product.image,
                productName: product.name,
                productPrice: product.price.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
