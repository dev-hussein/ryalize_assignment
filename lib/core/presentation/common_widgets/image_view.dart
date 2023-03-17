


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ryalize_assignment/generated/assets.dart';


///
/// Common class which handles all type of images.
///
enum ImageType {url}

class ImageView extends StatelessWidget {
  final String path;
  final ImageType type;
  final String placeHolderImagePath;
  final double? height, width;
  final double? radius;
  final BoxFit? fit;
  final bool isCircular;
  final Color? backgroundColor;
  final Color? imageColor;

  final int? maxCacheHeight;
  final int? maxCacheWidth;

  const ImageView(
     {
       super.key,
       required this.path,
       required this.type,
    this.placeHolderImagePath = Assets.drawableImagePlaceholder,
    this.height,
    this.width,

    this.fit,
    this.isCircular = false,
    this.backgroundColor,
    this.imageColor,
    this.radius,
    this.maxCacheHeight,
    this.maxCacheWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: backgroundColor??Colors.transparent,
          shape: isCircular?BoxShape.circle:BoxShape.rectangle,
            borderRadius: radius!=null?BorderRadius.circular(radius!):null
        ),
        child: showImage(
            context, path, type, height, width, placeHolderImagePath, fit));
  }


  /// returns suitable Image widget.
  Widget showImage(BuildContext context, String path, ImageType type, double? height, double? width,
      String placeHolderImagePath, BoxFit? fit){
    if (path.isNotEmpty) {
      switch (type) {
        case ImageType.url:
          try {
            PrecacheImages.cacheImage(context, path);
            return SizedBox(
              width: width,
              height: height,
              child: CachedNetworkImage(
                imageUrl: path,
                placeholder: (context, url) => loadingWidget(height, width),
                errorWidget: (context, url, error) => _placeHolder(
                    placeHolderImagePath: placeHolderImagePath,
                    height: height,
                    width: width,
                    fit: fit),
                height: height,
                fit: fit,
              ),
            );
          } catch (e) {
            return _placeHolder(
                placeHolderImagePath: placeHolderImagePath,
                height: height,
                width: width,
                fit: fit);
          }
      }
    } else {
      return _placeHolder(
          placeHolderImagePath: placeHolderImagePath,
          height: height,
          width: width,
          fit: fit);
    }
  }


  /// A Placeholder widget.
  Widget _placeHolder(
      {required String placeHolderImagePath,
      double? height,
      double? width,
      BoxFit? fit}) {

    return Image.asset(
      placeHolderImagePath,
      height: height,
      width: width,
      fit: fit,
    );
  }

 /// A loader widget
  Widget loadingWidget(double? height,double? width){

    return LottieBuilder.asset(Assets.lottieLoadingImg,height:height ,width:width,);
  }
}


class PrecacheImages {

  PrecacheImages();

  static Future cacheImage(BuildContext context, String? imageUrl) => precacheImage(
    CachedNetworkImageProvider(imageUrl!),
    context,
  );
}
