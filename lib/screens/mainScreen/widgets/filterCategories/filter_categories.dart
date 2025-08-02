import 'package:ai_task/core/utils/color_resource/color_resource.dart';
import 'package:ai_task/core/utils/constants/app_constants.dart';
import 'package:ai_task/core/utils/extensions/stringExtensions/string_extensions.dart';
import 'package:ai_task/core/widgets/button/custom_button.dart';
import 'package:ai_task/core/widgets/gap/width/width.dart';
import 'package:ai_task/screens/mainScreen/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/gap/height/height.dart';

class FilterCategories extends StatelessWidget {
  const FilterCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return SizedBox(
      height: height(context, 0.07),
      width: width(context, 1),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) => CustomButton(onTap: () => cubit.updateCategoryIndex(index),height: 35,width: cubit.categories[index].width(),text: cubit.categories[index],color: ColorResources.grey,isSelected: cubit.selectedIndex==index,widget: cubit.selectedIndex==index?Icon(Icons.check,color: ColorResources.primary,):null,textWeight: FontWeight.w700,),
        separatorBuilder: (context, index) => AppConstants.gapW10,
        itemCount: cubit.categories.length
      ),
    );
  }
}