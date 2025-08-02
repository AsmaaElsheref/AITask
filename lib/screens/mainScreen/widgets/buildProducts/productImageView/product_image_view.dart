import 'package:cached_network_image/cached_network_image.dart';
import 'package:ai_task/core/widgets/gap/width/width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/color_resource/color_resource.dart';

class ProductImageView extends StatelessWidget {
  const ProductImageView({super.key, required this.productImg});

  final String productImg;
  final String logo = 'https://static.vecteezy.com/system/resources/previews/019/909/468/non_2x/burger-king-transparent-burger-king-free-free-png.png';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorResources.orange)
            ),
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              radius: 55.sp,
              backgroundColor: ColorResources.white,
              backgroundImage: CachedNetworkImageProvider(productImg),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 35,
              width: width(context, 0.13),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorResources.white,
                border: Border.all(color: ColorResources.orange)
              ),
              child: CachedNetworkImage(
                imageUrl: logo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
