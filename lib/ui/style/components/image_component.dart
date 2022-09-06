import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../util/app_common_stuffs/string_constants.dart';
import '../style.dart';

class ImageComponent {
  static Widget loadLocalImage({
    required String imageName,
    double? height,
    double? width,
    Color? imageColor,
    BoxFit? boxFit,
  }) {
    return Image.asset(
      "${StringConstant.baseImagePath}/$imageName",
      width: width,
      height: height,
      color: imageColor,
      fit: boxFit,
    );
  }

  static Widget loadLocalImageRound({
    required String imagePath,
    double? height,
    double? width,
    Color? imageColor,
    BoxFit? boxFit,
  }) {
    return ClipOval(
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        color: imageColor,
        fit: boxFit,
      ),
    );
  }

  static Widget loadLocalImageWithBorder({
    required String imagePath,
    double? height,
    double? width,
    Color? imageColor,
    required borderColor,
    BoxFit? boxFit,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        color: imageColor,
        fit: boxFit,
      ),
    );
  }

  static Widget loadNetworkImage({
    required String url,
    double? height,
    double? width,
    BoxFit? boxFit,
    Color? color,
    required double borderRadius,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => const Center(
          child: Text(
            "Loading image",
            style: TextStyle(fontFamily: StringConstant.poppinsFont),
            textAlign: TextAlign.center,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: boxFit,
        height: height,
        width: width,
        color: color,
      ),
    );
  }

  static Widget loadNetworkImageWithBorder({
    required String url,
    double? height,
    double? width,
    BoxFit? boxFit,
    required double borderRadius,
  }) {
    return ClipOval(
      // borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => Center(
          child: CommonStyle.displayLoadingIndicatorWhite(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: boxFit,
        height: height,
        width: width,
      ),
    );
  }

  static Widget loadNetworkImageRound({
    required String? url,
    BoxFit? boxFit,
    double? height,
    double? width,
  }) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: url!,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },
        fit: boxFit,
        height: height,
        width: width,
      ),
    );
  }
}
