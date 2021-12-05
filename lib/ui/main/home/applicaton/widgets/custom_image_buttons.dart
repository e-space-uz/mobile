import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_space_mobile/core/constants/constants.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:flutter/material.dart';


class AddPhotoButton extends StatelessWidget {
  const AddPhotoButton({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 100,
        width: 120,
        margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(width: 2,color: AppColors.black3),
            borderRadius: BorderRadius.circular(8)
        ),
        child: const Icon(Icons.add_box_outlined,size: 32,color: AppColors.black3,),
      ),
    );
  }
}

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    Key? key,
    this.onTap,
    required this.imageUrl,
  }) : super(key: key);
  final Function()? onTap;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
              height: 100,
              width: 120,
              placeholder: (con,url)=>const Icon(Icons.error_outline,size: 24),
              imageUrl: '${Constants.imageBaseUrl}$imageUrl',
        ),
      ),
    )
    );
  }
}
