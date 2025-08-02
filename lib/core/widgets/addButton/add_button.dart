import 'package:flutter/material.dart';
import '../../utils/color_resource/color_resource.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: ColorResources.primary,
            shape: BoxShape.circle
        ),
        child: Icon(Icons.add,color: ColorResources.white,size: 25,),
      ),
    );
  }
}
