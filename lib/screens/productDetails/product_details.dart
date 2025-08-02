import 'package:ai_task/core/utils/color_resource/color_resource.dart';
import 'package:ai_task/core/widgets/button/custom_button.dart';
import 'package:ai_task/core/widgets/gap/gapHeight/gap_height.dart';
import 'package:ai_task/core/widgets/gap/height/height.dart';
import 'package:ai_task/core/widgets/gap/width/width.dart';
import 'package:ai_task/core/widgets/text/custom_text.dart';
import 'package:ai_task/core/widgets/toast/toast.dart';
import 'package:ai_task/models/itemModel/item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/utils/constants/app_constants.dart';
import '../../core/widgets/productQuantity/product_quantity.dart';
import '../mainScreen/widgets/customAppBar/custom_app_bar.dart';

 class ProductDetails extends StatelessWidget {
   const ProductDetails({super.key, required this.product});

   final ItemModel product;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Column(
         children: [
           CustomAppBar(title: 'تفاصيل المنتج',isBack: true,),
           AppConstants.gap5,
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 RepaintBoundary(child: Center(child: ClipRRect(borderRadius: BorderRadius.circular(10),child: CachedNetworkImage(imageUrl: product.image,height: height(context, 0.2))))),
                 AppConstants.gap30,
                 AppConstants.gap30,
                 CustomText(text: product.name,txtSize: 20,fontWeight: FontWeight.w700,textAlign: TextAlign.start,),
                 AppConstants.gap5,
                 CustomText(text: product.price.toString(),txtSize: 20,fontWeight: FontWeight.w700,textAlign: TextAlign.start,color: ColorResources.blue2,),
                 AppConstants.gap20,
                 SizedBox(width: width(context, 0.22),child: ProductQuantity(productId: product.id,)),
                 GapHeight(gap: 0.32),
                 CustomButton(onTap: () => toast(context, msg: 'تمت الإضافة إلى السلة',isSuccess: true),height: 45,text: 'أضف إلى السلة',color: ColorResources.blue2,colorTxt: ColorResources.white,textWeight: FontWeight.w700,textSize: 16,circular: 10,)
               ],
             ),
           )
         ],
       ),
     );
   }
 }
