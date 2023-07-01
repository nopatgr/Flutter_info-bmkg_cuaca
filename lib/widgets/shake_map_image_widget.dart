import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShakeMapImageWidget extends StatelessWidget {
  final String shakeMapUrl;

  const ShakeMapImageWidget({
    super.key,
    required this.shakeMapUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Peta"),
      ),
      body: SizedBox.expand(
        child: CachedNetworkImage(
          imageUrl: shakeMapUrl,
          fit: BoxFit.cover,
          imageBuilder: ((context, imageProvider) {
            return PhotoView(imageProvider: imageProvider);
          }),
          placeholder: (context, url) => const Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) =>
              const Center(child: Text("Maaf, gambar tidak ditemukan"),),
        ),
      ),
    );
  }
}
