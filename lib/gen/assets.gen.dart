/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImgGen {
  const $AssetsImgGen();

  $AssetsImgPostsGen get posts => const $AssetsImgPostsGen();
}

class $AssetsImgPostsGen {
  const $AssetsImgPostsGen();

  $AssetsImgPostsLargeGen get large => const $AssetsImgPostsLargeGen();
  $AssetsImgPostsSmallGen get small => const $AssetsImgPostsSmallGen();
}

class $AssetsImgPostsLargeGen {
  const $AssetsImgPostsLargeGen();

  /// File path: assets/img/posts/large/large_post_1.jpg
  AssetGenImage get largePost1 =>
      const AssetGenImage('assets/img/posts/large/large_post_1.jpg');

  /// File path: assets/img/posts/large/large_post_2.jpg
  AssetGenImage get largePost2 =>
      const AssetGenImage('assets/img/posts/large/large_post_2.jpg');

  /// File path: assets/img/posts/large/large_post_3.jpg
  AssetGenImage get largePost3 =>
      const AssetGenImage('assets/img/posts/large/large_post_3.jpg');

  /// File path: assets/img/posts/large/large_post_4.jpg
  AssetGenImage get largePost4 =>
      const AssetGenImage('assets/img/posts/large/large_post_4.jpg');

  /// File path: assets/img/posts/large/large_post_5.jpg
  AssetGenImage get largePost5 =>
      const AssetGenImage('assets/img/posts/large/large_post_5.jpg');

  /// File path: assets/img/posts/large/large_post_6.jpg
  AssetGenImage get largePost6 =>
      const AssetGenImage('assets/img/posts/large/large_post_6.jpg');
}

class $AssetsImgPostsSmallGen {
  const $AssetsImgPostsSmallGen();

  /// File path: assets/img/posts/small/small_post_1.jpg
  AssetGenImage get smallPost1 =>
      const AssetGenImage('assets/img/posts/small/small_post_1.jpg');

  /// File path: assets/img/posts/small/small_post_2.jpg
  AssetGenImage get smallPost2 =>
      const AssetGenImage('assets/img/posts/small/small_post_2.jpg');

  /// File path: assets/img/posts/small/small_post_3.jpg
  AssetGenImage get smallPost3 =>
      const AssetGenImage('assets/img/posts/small/small_post_3.jpg');

  /// File path: assets/img/posts/small/small_post_4.jpg
  AssetGenImage get smallPost4 =>
      const AssetGenImage('assets/img/posts/small/small_post_4.jpg');
}

class Assets {
  Assets._();

  static const String file = 'assets/file.mp4';
  static const AssetGenImage flutterLogoPng =
      AssetGenImage('assets/flutterLogoPng.png');
  static const $AssetsImgGen img = $AssetsImgGen();
  static const AssetGenImage musicCover =
      AssetGenImage('assets/musicCover.jpg');
  static const SvgGenImage pinMapIcon = SvgGenImage('assets/pinMapIcon.svg');
  static const SvgGenImage test = SvgGenImage('assets/test.svg');
  static const String testMusic = 'assets/testMusic.mp3';
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
