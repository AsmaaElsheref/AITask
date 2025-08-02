import 'package:ai_task/core/utils/color_resource/color_resource.dart';
import 'package:ai_task/core/widgets/button/custom_button.dart';
import 'package:ai_task/core/widgets/text/custom_text.dart';
import 'package:ai_task/core/widgets/toast/toast.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: CustomButton(onTap: () => toast(context, msg: 'Navigate to Cart Screen'),text: 'عرض السلة',color: ColorResources.blue2,colorTxt: ColorResources.white,widget: Icon(Icons.arrow_back_ios,color: ColorResources.white,),widget2: CustomText(text: '23.85 SAR',color: ColorResources.white,fontWeight: FontWeight.w700,),textWeight: FontWeight.w600,isSpacer: true,paddingLeft: 15,paddingRight: 15,),
    );
  }
}
