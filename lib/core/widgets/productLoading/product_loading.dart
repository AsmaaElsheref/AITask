import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/color_resource/color_resource.dart';

class ProductLoading extends StatelessWidget {
  const ProductLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.2,mainAxisSpacing: 13,crossAxisSpacing: 13),
        padding: EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: ColorResources.grey3,
          highlightColor: ColorResources.white,
          child: Container(
            decoration: BoxDecoration(
              color: ColorResources.primary,
              borderRadius: BorderRadius.circular(20)
            ),
          ),
        ),
        itemCount: 8,
      ),
    );
  }
}
