import 'package:bureau_base/components/rounded_image_placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../resources/style.dart';

class RoundedImage extends StatelessWidget {
  final String image;
  final double width;
  final double ratio;
  final double? radius;
  const RoundedImage({
    super.key,
    required this.image,
    required this.width,
    required this.ratio,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? Style.largeRoundEdgeRadius),
      child: CachedNetworkImage(
        imageUrl: image,
        width: width,
        fit: BoxFit.fill,
        placeholder: (context, url) {
          return RoundedImagePlaceholder(
            width: width,
            ratio: ratio,
            radius: radius,
          );
        },
        errorWidget: (context, url, error) =>
            const Icon(Icons.error_outline_rounded),
      ),
    );
  }
}
