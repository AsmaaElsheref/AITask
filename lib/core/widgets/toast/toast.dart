import 'package:ai_task/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../utils/color_resource/color_resource.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> toast(context,{required String msg,isSuccess}){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: CustomText(text: msg,color: ColorResources.white,fontWeight: FontWeight.w600,txtSize: 17,textAlign: TextAlign.start,),backgroundColor: isSuccess==true ? ColorResources.green : ColorResources.primary,),
  );
}