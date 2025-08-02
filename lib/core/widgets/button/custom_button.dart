import 'package:flutter/material.dart';
import '../../utils/color_resource/color_resource.dart';
import '../../utils/constants/app_constants.dart';
import '../loading/loading.dart';
import '../text/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.text,
    this.isSelected,this.onTap, this.color, this.colorTxt, this.isGradient, this.textSize, this.textWeight, this.colorBorder, this.width, this.height, this.secondColor, this.widget, this.paddingRight, this.circular, this.widget2, this.endGradient, this.isSpacer, this.paddingLeft, this.isLoading, this.loadingColor});

  final String text;
  final double? textSize;
  final double? width;
  final double? height;
  final FontWeight? textWeight;
  final bool? isSelected;
  final bool? isGradient;
  final bool? isSpacer;
  final Color? color;
  final Color? secondColor;
  final Color? colorBorder;
  final Color? colorTxt;
  final Widget? widget;
  final Widget? widget2;
  final double? paddingRight;
  final double? paddingLeft;
  final double? circular;
  final AlignmentGeometry? endGradient;
  final GestureTapCallback? onTap;
  final bool? isLoading;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height:height??40,
            width: width??MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(circular??25),
              color: isSelected==true?ColorResources.secondary:color??ColorResources.primary,
              gradient:isGradient==true? LinearGradient(
                colors: [
                  secondColor!,
                  color!,
                ],
                end: endGradient??Alignment.centerRight
              ):null
            ),
            child: isLoading==true?SizedBox():Center(
              child: Padding(
                padding: EdgeInsets.only(right:paddingRight??0,left: paddingLeft??0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget??const SizedBox(height: 0),
                    if(widget!=null)
                      AppConstants.gapW5,
                    CustomText(text:
                    text,textAlign: TextAlign.center,
                      color: isSelected==false?ColorResources.primary:colorTxt??ColorResources.blue,
                      txtSize: textSize,
                      fontWeight:textWeight?? FontWeight.w500,
                    ),
                    if(widget2!=null)
                      AppConstants.gapW5,
                    if(isSpacer==true)
                      const Spacer(),
                    widget2??const SizedBox(height: 0),
                  ],
                ),
              ),
            )),
        ),
        if(isLoading==true)
          Loading(color: loadingColor,)
      ],
    );
  }
}