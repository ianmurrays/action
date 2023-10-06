import 'package:action/shared/ui/poster_tile.dart';
import 'package:flutter/material.dart';

typedef OnTapCallback = void Function();

/// A widget that displays a movie/show tile.
class ContentTile extends StatelessWidget {
  final OnTapCallback? onTap;
  final String? posterPath;
  final String title;
  final String year;
  final double voteAverage;
  final IconData icon;

  final double width;
  final double height;

  const ContentTile({
    super.key,
    this.onTap,
    this.posterPath,
    required this.title,
    required this.year,
    required this.voteAverage,
    this.width = 140,
    this.height = 210,
    this.icon = Icons.image,
  });

  @override
  Widget build(BuildContext context) {
    return PosterTile(
      onTap: onTap,
      posterPath: posterPath,
      width: width,
      height: height,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 5),
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                year,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.grey,
                    ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 10),
                  const SizedBox(width: 2),
                  Text(
                    // round to one decimal place
                    voteAverage.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
