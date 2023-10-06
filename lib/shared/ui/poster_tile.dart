import 'package:action/shared/ui/poster.dart';
import 'package:flutter/material.dart';

typedef OnTapCallback = void Function();

/// A widget that displays a movie/show tile.
class PosterTile extends StatelessWidget {
  final OnTapCallback? onTap;
  final String? posterPath;
  final IconData icon;

  final double width;
  final double height;

  final List<Widget> children;

  const PosterTile({
    super.key,
    this.onTap,
    this.posterPath,
    this.width = 140,
    this.height = 210,
    this.icon = Icons.image,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        margin: const EdgeInsets.all(5),
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Poster(
              imagePath: posterPath,
              width: width,
              height: height,
              icon: icon,
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
