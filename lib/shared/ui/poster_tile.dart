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
    this.width = 150,
    this.height = 225,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: 150,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Poster(imagePath: imagePath, height: height, width: width),
            const SizedBox(height: 5),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            if (subtitle != null)
              Text(
                subtitle!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }
}
