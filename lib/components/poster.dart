import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  final String? imagePath;
  final double width;
  final double height;

  const Poster(
      {super.key,
      required this.imagePath,
      this.width = 110,
      this.height = 145});

  @override
  Widget build(BuildContext context) {
    return imagePath == null
        ? Container(
            decoration: BoxDecoration(
              color: Colors.grey[300]?.withAlpha(128),
              borderRadius: BorderRadius.circular(5),
            ),
            height: height,
            width: width,
          )
        : CachedNetworkImage(
            fadeInDuration: Duration.zero,
            fadeOutDuration: Duration.zero,
            imageUrl: "https://image.tmdb.org/t/p/original$imagePath",
            fit: BoxFit.cover,
            height: height,
            width: width,
            placeholder: (context, url) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(5),
                ),
                height: height,
                width: width,
              );
            });
  }
}
