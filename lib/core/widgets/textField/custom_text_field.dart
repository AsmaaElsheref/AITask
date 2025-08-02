import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/color_resource/color_resource.dart';
import '../text/custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.endPadding,
    this.isNeedHint = true,
    this.suffix,
    this.readOnly = false,
    this.textInputType,
    this.validator,
    this.prefix, this.hintColor, this.text, this.text2, this.textColor, this.isComplain,
    this.height, this.isExpanded, this.gap, this.maxLength, this.onChanged, this.obscureText, this.onSubmit, this.errorText, this.width, this.hintFontWeight, this.inputStyle, this.inputWeight, this.inputDecoration, this.inputColor, this.borderRadius, this.outlineBorder, this.contentPadding, this.nonBorder, this.alignStart, this.fontSize, this.suffixSize, this.borderColor, this.focusedBorderColor, this.onTap, this.backgroundColor,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? text;
  final String? errorText;
  final String? text2;
  final double? endPadding;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? fontSize;
  final double? suffixSize;
  final bool? isNeedHint;
  final Widget? suffix;
  final Widget? prefix;
  final bool? readOnly;
  final bool? outlineBorder;
  final Color? hintColor;
  final Color? textColor;
  final Color? inputColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? backgroundColor;
  final bool? alignStart;
  final FontStyle? inputStyle;
  final FontWeight? inputWeight;
  final TextDecoration? inputDecoration;
  final bool? isComplain;
  final bool? obscureText;
  final bool? isExpanded;
  final int? maxLength;
  final bool? nonBorder;
  final EdgeInsetsGeometry? contentPadding;
  final FontWeight? hintFontWeight;
  final Function(dynamic)? onChanged;
  final Function(dynamic)? onSubmit;
  final Function()? onTap;
  final SizedBox? gap;
  final TextInputType? textInputType;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius??35),
            // border: borderColor==null?null:Border.all(color: borderColor!)
          ),
          child: TextFormField(
            validator: validator,
            readOnly: readOnly!,
            controller: controller,
            keyboardType: textInputType,
            onChanged: onChanged,
            maxLines: isExpanded==true?null:1,
            minLines: null,
            onFieldSubmitted: onSubmit,
            maxLength: maxLength,
            obscureText: obscureText??false,
            expands: isExpanded==true?true:false,
            cursorColor: ColorResources.primary,
            cursorErrorColor: ColorResources.primary,
            textAlign: alignStart==true?TextAlign.start:TextAlign.end,
            onTapOutside: (event){
              FocusScope.of(context).requestFocus(FocusNode());
            },
            onTap: onTap,
            style: TextStyle(fontStyle: inputStyle,fontWeight: inputWeight,decoration: inputDecoration,color: inputColor,fontSize: fontSize),
            decoration: InputDecoration(
              hintText: hintText,
              labelText: text,
              errorText: errorText,
              errorMaxLines: 2,
              counterStyle: TextStyle(color: textColor,),
              contentPadding: contentPadding??const EdgeInsets.symmetric(vertical: 0,horizontal: 15),
              hintStyle: TextStyle(
                color: hintColor??ColorResources.grey,
                fontWeight: hintFontWeight,
                fontSize: 14
              ),
              focusedBorder: nonBorder==true? InputBorder.none:OutlineInputBorder(borderSide: BorderSide(color: focusedBorderColor??ColorResources.primary),borderRadius: BorderRadius.circular(borderRadius??35)),
              focusedErrorBorder: nonBorder==true? InputBorder.none:OutlineInputBorder(borderSide: BorderSide(color: ColorResources.primary),borderRadius: BorderRadius.circular(borderRadius??35)),
              suffixIcon: suffix,
              prefixIcon: prefix,
              suffixIconConstraints: BoxConstraints.tightFor(width: suffixSize,height: suffixSize),
              prefixIconConstraints: BoxConstraints.tightFor(width: suffixSize,height: suffixSize),
              enabledBorder: nonBorder==true? InputBorder.none:OutlineInputBorder(borderSide: BorderSide(color: borderColor??ColorResources.primary),borderRadius: BorderRadius.circular(borderRadius??35)),
              border: nonBorder==true? InputBorder.none:OutlineInputBorder(borderSide: BorderSide(color: ColorResources.primary),borderRadius: BorderRadius.circular(borderRadius??35)),
            ),
          ),
        ),
      ],
    );
  }
}