import 'package:ai_task/core/utils/color_resource/color_resource.dart';
import 'package:ai_task/core/utils/constants/app_constants.dart';
import 'package:ai_task/core/widgets/gap/width/width.dart';
import 'package:ai_task/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/productQuantity/product_quantity.dart';
import '../productImageView/product_image_view.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productName, required this.productImg, required this.productPrice, required this.productId});

  final String productName;
  final String productImg;
  final String productPrice;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageView(productImg: productImg,),
            AppConstants.gap10,
            CustomText(text: productName,fontWeight: FontWeight.w500,maxLines: 1,),
            AppConstants.gap5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: width(context, 0.15),child: CustomText(text: '$productPrice SAR',fontWeight: FontWeight.w500,color: ColorResources.blue,txtSize: 13,maxLines: 1,)),
                ProductQuantity(productId: productId,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
