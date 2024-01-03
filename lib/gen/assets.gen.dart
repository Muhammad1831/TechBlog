/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/hash_tag_icon.png
  AssetGenImage get hashTagIcon =>
      const AssetGenImage('assets/icons/hash_tag_icon.png');

  /// File path: assets/icons/home_icon.png
  AssetGenImage get homeIcon =>
      const AssetGenImage('assets/icons/home_icon.png');

  /// File path: assets/icons/microphon.png
  AssetGenImage get microphon =>
      const AssetGenImage('assets/icons/microphon.png');

  /// File path: assets/icons/microphone_icon.png
  AssetGenImage get microphoneIcon =>
      const AssetGenImage('assets/icons/microphone_icon.png');

  /// File path: assets/icons/pencil_bottomsheet.png
  AssetGenImage get pencilBottomsheet =>
      const AssetGenImage('assets/icons/pencil_bottomsheet.png');

  /// File path: assets/icons/pencil_icon.png
  AssetGenImage get pencilIcon =>
      const AssetGenImage('assets/icons/pencil_icon.png');

  /// File path: assets/icons/right_arrow.png
  AssetGenImage get rightArrow =>
      const AssetGenImage('assets/icons/right_arrow.png');

  /// File path: assets/icons/user_icon.png
  AssetGenImage get userIcon =>
      const AssetGenImage('assets/icons/user_icon.png');

  /// File path: assets/icons/writer_icon.png
  AssetGenImage get writerIcon =>
      const AssetGenImage('assets/icons/writer_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        hashTagIcon,
        homeIcon,
        microphon,
        microphoneIcon,
        pencilBottomsheet,
        pencilIcon,
        rightArrow,
        userIcon,
        writerIcon
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/flash_down.png
  AssetGenImage get flashDown =>
      const AssetGenImage('assets/images/flash_down.png');

  /// File path: assets/images/happy_guide_robot.svg
  SvgGenImage get happyGuideRobot =>
      const SvgGenImage('assets/images/happy_guide_robot.svg');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/poster_HomePage.png
  AssetGenImage get posterHomePage =>
      const AssetGenImage('assets/images/poster_HomePage.png');

  /// File path: assets/images/profileAvatar.png
  AssetGenImage get profileAvatar =>
      const AssetGenImage('assets/images/profileAvatar.png');

  /// File path: assets/images/sad_guide_robot.svg
  SvgGenImage get sadGuideRobot =>
      const SvgGenImage('assets/images/sad_guide_robot.svg');

  /// File path: assets/images/single_place_holder.jpg
  AssetGenImage get singlePlaceHolder =>
      const AssetGenImage('assets/images/single_place_holder.jpg');

  /// List of all assets
  List<dynamic> get values => [
        flashDown,
        happyGuideRobot,
        logo,
        posterHomePage,
        profileAvatar,
        sadGuideRobot,
        singlePlaceHolder
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
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
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
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
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
