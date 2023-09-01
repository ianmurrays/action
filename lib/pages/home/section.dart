import 'package:action/components/movie_tile.dart';
import 'package:action/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class Entry {
  final int id;
  final String title;
  final String? posterPath;
  final int year;
  final double voteAverage;

  const Entry(
      this.id, this.title, this.posterPath, this.year, this.voteAverage);
}

enum Type { movie, tv }

class Section extends StatelessWidget {
  final String title;
  final List<Entry> entries;
  final Type type;

  const Section({
    super.key,
    required this.title,
    required this.entries,
    required this.type,
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
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];

                final id = entry.id;
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
                      if (type == Type.tv) {
                        AutoRouter.of(context)
                            .push(TVShowDetailRoute(tvShowId: id));
                      } else if (type == Type.movie) {
                      AutoRouter.of(context)
                          .push(MovieDetailRoute(movieId: id));

                      }
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
