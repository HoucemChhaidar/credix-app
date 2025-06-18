import 'package:credix_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  /// Factory for network images
  factory AppImage.network({
    required String url,
    Key? key,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    String? semanticLabel,
    Widget? placeholder,
    BorderRadiusGeometry? borderRadius,
    Widget? errorWidget,
  }) {
    return AppImage._(
      key: key,
      source: url,
      isNetwork: true,
      width: width,
      height: height,
      fit: fit,
      semanticLabel: semanticLabel,
      placeholder: placeholder,
      borderRadius: borderRadius,
      errorWidget: errorWidget,
    );
  }

  /// Factory for local asset images
  factory AppImage.asset({
    required AssetGenImage asset,
    Key? key,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    String? semanticLabel,
    Widget? placeholder,
    BorderRadiusGeometry? borderRadius,
  }) {
    return AppImage._(
      key: key,
      source: asset.path,
      isNetwork: false,
      width: width,
      height: height,
      fit: fit,
      semanticLabel: semanticLabel,
      placeholder: placeholder,
      borderRadius: borderRadius,
    );
  }

  const AppImage._({
    required this.source,
    required this.isNetwork,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.placeholder,
    this.borderRadius,
    this.errorWidget,
  });

  final String source;
  final bool isNetwork;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? semanticLabel;
  final Widget? placeholder;
  final BorderRadiusGeometry? borderRadius;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    final defaultPlaceholder = placeholder ??
        Container(
          width: width,
          height: height,
          color: Colors.grey[300],
        );

    Widget image = isNetwork
        ? Image.network(
            source,
            width: width,
            height: height,
            fit: fit,
            semanticLabel: semanticLabel,
            errorBuilder: (_, __, ___) => errorWidget ?? const Icon(Icons.broken_image),
            frameBuilder: (_, child, frame, __) {
              if (frame == null) return defaultPlaceholder;
              return child;
            },
          )
        : Image.asset(
            source,
            width: width,
            height: height,
            fit: fit,
            semanticLabel: semanticLabel,
            errorBuilder: (_, __, ___) => errorWidget ?? const Icon(Icons.error),
            frameBuilder: (_, child, frame, __) {
              if (frame == null) return defaultPlaceholder;
              return child;
            },
          );

    if (borderRadius != null) {
      image = ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }
}
