import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Poster extends StatelessWidget {
  final String? imagePath;
  final double width;
  final double height;
  final IconData? icon;

  const Poster({
    super.key,
    required this.imagePath,
    this.width = 110,
    this.height = 145,
    this.icon,
  });

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
            child: icon != null
                ? Icon(
                    icon,
                    color: Colors.grey,
                    size: 50,
                  )
                : null,
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              fadeInDuration: Duration.zero,
              fadeOutDuration: Duration.zero,
              imageUrl: "https://image.tmdb.org/t/p/original$imagePath",
              fit: BoxFit.cover,
              height: height,
              width: width,
              maxHeightDiskCache: 700,
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[500]!,
                  highlightColor: Colors.grey[300]!,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                    ),
                    height: height,
                    width: width,
                  ),
                );
              },
            ),
          );
  }
}
