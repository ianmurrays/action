import 'package:action/shared/ui/poster_tile.dart';
import 'package:flutter/material.dart';

/// This tile has a poster, a title and a subtitle.
/// Used for cast and crew, and movie/show for a specific person.
class TitleSubtitleTile extends StatelessWidget {
  final OnTapCallback? onTap;
  final String? imagePath;
  final String title;
  final String? subtitle;
  final IconData icon;

  final double width;
  final double height;

  const TitleSubtitleTile({
    super.key,
    this.onTap,
    this.imagePath,
    required this.title,
    this.subtitle,
    this.width = 140,
    this.height = 210,
    this.icon = Icons.image,
  });

  @override
  Widget build(BuildContext context) {
    return PosterTile(
      onTap: onTap,
      posterPath: imagePath,
      width: width,
      height: height,
      icon: icon,
      children: [
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
    );
  }
}
