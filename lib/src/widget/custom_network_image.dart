import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/constant/asset_list.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {Key? key,
      required this.imageUrl,
      this.height,
      this.width,
      this.borderRadius,
      this.shape, this.errorImage, this.bodyWidget})
      : super(key: key);

  final String imageUrl;

  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape? shape;
  final String? errorImage;
  final Widget? bodyWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height ?? 48.0,
      width: width ?? 48.0,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            shape: shape ?? BoxShape.rectangle,
            borderRadius: shape != BoxShape.circle
                ? borderRadius ?? BorderRadius.circular(12.0)
                : null,
            image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
          ),
          child: bodyWidget,
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          decoration: BoxDecoration(
            shape: shape ?? BoxShape.rectangle,
            borderRadius: shape != BoxShape.circle
                ? borderRadius ?? BorderRadius.circular(12.0)
                : null,
            image: DecorationImage(image: Image.asset(errorImage ?? AssetList.profilePhoto).image, fit: BoxFit.fill),
          ),
          child: bodyWidget,
        );
      },
    );
  }
}
