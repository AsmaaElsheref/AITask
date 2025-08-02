import 'package:ai_task/core/widgets/gap/height/height.dart';
import 'package:ai_task/core/widgets/gap/width/width.dart';
import 'package:ai_task/core/widgets/toast/toast.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/color_resource/color_resource.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/widgets/gap/gapWidth/gap_width.dart';
import '../../../../core/widgets/text/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.title, this.isBack});

  final String? title;
  final bool? isBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorResources.secondary,
      padding: EdgeInsets.only(top: height(context, 0.07),bottom: height(context, 0.02)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          isBack==true?
          IconButton(onPressed: (){Navigator.pop(context);},highlightColor: ColorResources.secondary, icon: Icon(Icons.arrow_back_ios,size: 20,color: ColorResources.primary,),visualDensity: VisualDensity(horizontal: -4,vertical: -4),padding: EdgeInsets.only(right: width(context, 0.15)),):
          const GapWidth(gap: 0.23),
          CustomText(text: title??'التصنيفات',fontWeight: FontWeight.w800,txtSize: 17,color: ColorResources.primary,),
          AppConstants.gapW20,
          GestureDetector(onTap: () => toast(context, msg: 'Navigate to Search Screen'),child: Icon(Icons.search,color: ColorResources.primary,size: 23,))
        ],
      ),
    );
  }
}
