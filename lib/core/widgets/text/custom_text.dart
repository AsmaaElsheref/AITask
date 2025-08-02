import 'package:flutter/material.dart';
import '../../utils/color_resource/color_resource.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double?txtSize;
  final FontWeight?fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final Function()? onTap;
  final bool? isLink;
  final bool? lineThrough;

  const CustomText({super.key, required this.text, this.txtSize, this.fontWeight,this.color,this.textAlign=TextAlign.center, this.onTap, this.isLink, this.textDecoration, this.lineThrough, this.maxLines});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Text((text),
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines??10,
        style: TextStyle(
          color: color??ColorResources.primary,
          fontWeight: fontWeight??FontWeight.w400,
          fontSize: txtSize??14,
          decoration: textDecoration
        )
      ),
    );
  }
}