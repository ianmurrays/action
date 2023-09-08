import 'package:action/shared/ui/poster.dart';
import 'package:flutter/material.dart';

typedef OnTapCallback = void Function();

/// This tile has a poster, a title and a subtitle.
/// Used for cast and crew, and movie/show for a specific person.
class PosterTile extends StatelessWidget {
  final OnTapCallback? onTap;
  final String? imagePath;
  final String title;
  final String? subtitle;

  final double width;
  final double height;

  const PosterTile({
    super.key,
    this.onTap,
    this.imagePath,
    required this.title,
    this.subtitle,
    this.width = 140,
    this.height = 210,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: width,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Poster(imagePath: imagePath, height: height, width: width),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 5),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  subtitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
