import 'package:action/isar/models/recent_search.dart';
import 'package:action/modules/search/providers/recent_taps.provider.dart';
import 'package:action/router/app_router.dart';
import 'package:action/shared/ui/content_tile.dart';
import 'package:action/shared/ui/title_subtitle_tile.dart';
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

    removeFromRecentTaps(RecentSearch recentSearch) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Remove from recent taps?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  ref
                      .read(recentTapsProvider.notifier)
                      .removeRecentTap(recentSearch);
                  Navigator.of(context).pop();
                },
                child: const Text('Remove'),
              ),
            ],
          );
        },
      );
    }

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
            return TitleSubtitleTile(
              imagePath: item.posterPath,
              title: item.title!,
              width: MediaQuery.of(context).size.width / 3 - 2 * 4,
              height: (MediaQuery.of(context).size.width / 3 - 2 * 8) * 1.5,
              maxLines: 2,
              onTap: () {
                AutoRouter.of(context)
                    .push(PersonRoute(personId: item.tmdbId!));
              },
              onLongPress: () {
                removeFromRecentTaps(item);
              },
            );
          } else {
            final posterPath = item.posterPath;
            final title = item.title ?? '';
            final year = item.year;

            return ContentTile(
              posterPath: posterPath,
              title: title,
              year: year.toString(),
              voteAverage: item.voteAverage!,
              icon: item.type == SearchType.movie ? Icons.movie : Icons.tv,
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
              onLongPress: () {
                removeFromRecentTaps(item);
              },
            );
          }
        },
      ),
    );
  }
}
