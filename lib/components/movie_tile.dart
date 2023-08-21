import 'package:action/components/poster.dart';
import 'package:flutter/material.dart';

typedef OnTapCallback = void Function();

/// A widget that displays a movie/show tile.
class MovieTile extends StatelessWidget {
  final OnTapCallback? onTap;
  final String? posterPath;
  final String title;
  final String year;
  final String voteAverage;

  final double width;
  final double height;

  const MovieTile({
    super.key,
    this.onTap,
    this.posterPath,
    required this.title,
    required this.year,
    required this.voteAverage,
    this.width = 140,
    this.height = 210,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Poster(
              imagePath: posterPath,
              width: width,
              height: height,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 5, right: 5),
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
                  Text(year,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.grey,
                          )),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 10),
                      const SizedBox(width: 2),
                      Text(
                        voteAverage,
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
        ),
      ),
    );
  }
}
