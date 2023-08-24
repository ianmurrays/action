import 'package:action/components/movie_tile.dart';
import 'package:action/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class Entry {
  final String title;
  final String? posterPath;
  final int year;
  final double voteAverage;

  const Entry(this.title, this.posterPath, this.year, this.voteAverage);
}

class Section extends StatelessWidget {
  final String title;
  final List<Entry> entries;

  const Section({
    super.key,
    required this.title,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Text(title, style: Theme.of(context).textTheme.headlineLarge),
          ),
          SizedBox(
            height: 295,
            child: ListView.builder(
              prototypeItem:
                  const MovieTile(title: '', year: '', voteAverage: 0),
              // itemExtent: 140,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];

                final posterPath = entry.posterPath;
                final title = entry.title;
                final year = entry.year;
                final voteAverage = entry.voteAverage;

                return MovieTile(
                    posterPath: posterPath,
                    title: title,
                    year: year.toString(),
                    voteAverage: voteAverage,
                    onTap: () {
                      AutoRouter.of(context).push(const DetailRoute());
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
