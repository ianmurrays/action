import 'package:action/shared/ui/content_tile.dart';
import 'package:action/router/app_router.dart';
import 'package:action/shared/ui/title_subtitle_tile.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

enum EntryType { movie, tv, person }

class Entry {
  final int id;
  final String title;
  final String? posterPath;
  final String? year;
  final double? voteAverage;
  final EntryType type;

  const Entry({
    required this.id,
    required this.title,
    required this.posterPath,
    this.year,
    this.voteAverage,
    required this.type,
  });
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
                Text(title, style: Theme.of(context).textTheme.headlineMedium),
          ),
          SizedBox(
            height: 295,
            child: ListView.builder(
              prototypeItem:
                  const ContentTile(title: '', year: '', voteAverage: 0),
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

                if (entry.type == EntryType.movie ||
                    entry.type == EntryType.tv) {
                  return ContentTile(
                    posterPath: posterPath,
                    title: title,
                    year: year.toString(),
                    voteAverage: voteAverage ?? 0,
                    onTap: () {
                      if (entry.type == EntryType.tv) {
                        AutoRouter.of(context)
                            .push(TVShowDetailRoute(tvShowId: id));
                      } else if (entry.type == EntryType.movie) {
                        AutoRouter.of(context)
                            .push(MovieDetailRoute(movieId: id));
                      }
                    },
                  );
                } else {
                  return TitleSubtitleTile(
                    imagePath: posterPath,
                    title: title,
                    onTap: () {
                      AutoRouter.of(context).push(PersonRoute(personId: id));
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
