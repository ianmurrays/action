import 'package:action/isar/models/recent_search.dart';
import 'package:action/modules/search/providers/recent_taps.provider.dart';
import 'package:action/router/app_router.dart';
import 'package:action/shared/ui/movie_tile.dart';
import 'package:action/shared/ui/poster_tile.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LatestTappedResults extends HookConsumerWidget {
  const LatestTappedResults({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentTaps = ref.watch(watchRecentTapsProvider);

    if (!recentTaps.hasValue) {
      return const SliverToBoxAdapter();
    }

    final taps = recentTaps.value!;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 2 / 4.1,
        ),
        itemCount: taps.length,
        itemBuilder: (context, index) {
          final item = taps[index];

          if (item.type == SearchType.person) {
            return PosterTile(
                imagePath: item.posterPath,
                title: item.title!,
                width: MediaQuery.of(context).size.width / 3 - 2 * 4,
                height: (MediaQuery.of(context).size.width / 3 - 2 * 8) * 1.5,
                onTap: () {
                  AutoRouter.of(context)
                      .push(PersonRoute(personId: item.tmdbId!));
                });
          } else {
            final posterPath = item.posterPath;
            final title = item.title ?? '';
            final year = item.year;

            return MovieTile(
              posterPath: posterPath,
              title: title,
              year: year.toString(),
              voteAverage: item.voteAverage!,
              width:
                  MediaQuery.of(context).size.width / 3 - 2 * 4, // see delegate
              height: (MediaQuery.of(context).size.width / 3 - 2 * 8) * 1.5,
              onTap: () {
                if (item.type == SearchType.tv) {
                  AutoRouter.of(context)
                      .push(TVShowDetailRoute(tvShowId: item.tmdbId!));
                } else if (item.type == SearchType.movie) {
                  AutoRouter.of(context)
                      .push(MovieDetailRoute(movieId: item.tmdbId!));
                }
              },
            );
          }
        },
      ),
    );
  }
}
