import 'package:flutter/material.dart';

import '../assets/constans.dart';

import 'index.dart';

class ImageHandlerWidget extends StatelessWidget {
  final String urlToImage;
  const ImageHandlerWidget({@required this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
          child: FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 500),
            placeholder: placeholderAsset,
            image: urlToImage ?? '',
            imageErrorBuilder: (context, obj, error) =>
                const AssetImageWidget(),
          )),
    );
  }
}
