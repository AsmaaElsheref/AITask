import 'package:ai_task/core/utils/color_resource/color_resource.dart';
import 'package:ai_task/core/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../screens/mainScreen/cubit/home_cubit.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorResources.secondary
          ),
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => cubit.decreaseQuantity(productId),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(Icons.remove, size: 17,color: cubit.getQuantity(productId)==0?ColorResources.grey2:ColorResources.blue,),
                ),
              ),
              CustomText(text: cubit.getQuantity(productId).toString(),fontWeight: FontWeight.w500,),
              GestureDetector(
                onTap: () => cubit.increaseQuantity(productId),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(Icons.add, size: 15,color: ColorResources.blue,),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
