import 'package:flutter/material.dart';
import '../../utils/color_resource/color_resource.dart';
import '../gap/height/height.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.size, this.isData, this.isLocation, this.color, this.padding, this.paddingBottom});

  final double? size;
  final double? padding;
  final double? paddingBottom;
  final bool? isData;
  final bool? isLocation;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: height(context, isData==true?0.3:padding??0),bottom: height(context, paddingBottom??0)),
        child: SizedBox(height: size??25,width: size??25,child: CircularProgressIndicator(strokeWidth: 1.5,color: isData==true||isLocation==true?ColorResources.primary:color??ColorResources.white,)),
      ),
    );
  }
}
