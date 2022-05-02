import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:values/values.dart';
import 'package:widgets/widgets.dart';

class NetworkImageService extends StatelessWidget {
  final String imageUrl;
  final double imageWidth, imageHeight;
  final bool isBannerImage;
  final bool isProductImage;
  final bool isImagePreviewer;
  final bool isCoverImage;
  final Widget errorWidget;
  final ColorFilter colorFilter;
  final double radius;
  final bool isMovieDetailPage;
  final bool isListingBanner;
  final bool isRestaurent;
  BoxFit fit;
  final BorderRadius borderRadius;

  NetworkImageService(
      {this.imageUrl,
        this.borderRadius,
      this.imageWidth,
      this.imageHeight,
      this.radius,
      this.colorFilter,
      this.isBannerImage = false,
      this.isProductImage = false,
      this.isImagePreviewer = false,
      this.isCoverImage = false,
      this.fit = BoxFit.cover,
      this.isMovieDetailPage = false,
      this.isRestaurent = false,
      this.errorWidget,
      this.isListingBanner = false});

  @override
  Widget build(BuildContext context) {
    return !isNullOrEmpty(imageUrl)
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              decoration: isBannerImage || isListingBanner
                  ? BoxDecoration(
                      borderRadius: isMovieDetailPage
                          ? BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))
                          : BorderRadius.only(
                              topLeft: Radius.circular(radius ?? 0),
                              topRight: Radius.circular(radius ?? 0),
                              bottomLeft: Radius.circular(radius ?? 0),
                              bottomRight: Radius.circular(radius ?? 0)),
                      image: DecorationImage(
                          image: imageProvider,
                          fit: fit,
                          colorFilter: colorFilter),
                    )
                  : BoxDecoration(
                      borderRadius: borderRadius,
                      image: DecorationImage(
                          image: imageProvider, colorFilter: colorFilter,fit: BoxFit.fill),
                    ),
            ),
            alignment: Alignment.center,
            memCacheHeight: getScreenHeight(context).toInt(),
            memCacheWidth: getScreenWidth(context).toInt(),
            placeholder: (context, url) => ImageLoadingShimmer(
              height: imageHeight,
              width: imageWidth,
            ),
            errorWidget: (context, url, error) =>
                errorWidget ?? buildErrorWidget(),
          )
        : errorWidget ?? buildErrorWidget();
  }

  Widget buildErrorWidget() {
    return Container(
      width: imageWidth,
      height: !isRestaurent?imageHeight:0.0,
      child: !isRestaurent?SvgPicture.asset(Assets.dashBoard):Container(),
    );
  }
}

class NetworkImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Image'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Image.network(
          'https://toppng.com/uploads/preview/batman-png-11553978541s9xp0sddf1.png',
          frameBuilder: (BuildContext context, Widget child, int frame,
                  bool wasSynchronouslyLoaded) =>
              wasSynchronouslyLoaded
                  ? child
                  : AnimatedOpacity(
                      child: child,
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeOut,
                    ),
          loadingBuilder: (context, child, progress) => progress == null
              ? child
              : LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
          errorBuilder:
              (BuildContext context, Object exception, StackTrace stackTrace) =>
                  Text('Failed to load image'),
        ),
      ),
    );
  }
}
