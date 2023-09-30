import 'package:action/isar/models/recent_search.dart';
import 'package:action/isar/models/search_item.dart';
import 'package:action/modules/search/providers/recent_taps.provider.dart';
import 'package:action/modules/search/providers/search_items.provider.dart';
import 'package:action/shared/ui/movie_tile.dart';
import 'package:action/shared/ui/poster_tile.dart';
import 'package:action/shared/models/search.dart';
import 'package:action/modules/search/models/search_state.dart';
import 'package:action/modules/search/providers/search_page_controller.dart';
import 'package:action/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollViewController = PrimaryScrollController.of(context);
    final searchBarFocusNode = useFocusNode();
    final searchBarTextController = useTextEditingController();

    final searchResultsController = ref.watch(searchPageControllerProvider);

    final searchItems = ref.watch(watchSearchItemsProvider);
    final recentTaps = ref.watch(watchRecentTapsProvider);

    useEffect(() {
      searchBarFocusNode.requestFocus();

      return null;
    }, []);

    useEffect(() {
      scrollViewController.addListener(() {
        if (scrollViewController.position.pixels ==
            scrollViewController.position.maxScrollExtent) {
          ref.read(searchPageControllerProvider.notifier).searchMore();
        }
      });

      return null;
    }, []);

    Widget buildEmptyResults() {
      return SliverFillRemaining(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text(
                (['😢', '😓', '🤷', '🫠', '🙃']..shuffle()).first,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),
              Text(
                'search.no_results',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ).tr(),
            ],
          ),
        ),
      );
    }

    Widget buildResults() {
      return SliverPadding(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
        sliver: SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 2 / 4.1,
          ),
          itemCount: searchResultsController.results!.length,
          itemBuilder: (context, index) {
            final item = searchResultsController.results![index];

            // If it's a person we use the PosterTile, if it's a movie or a show we use the MovieTile
            if (item.mediaType == MediaType.person) {
              return PosterTile(
                imagePath: item.profilePath,
                title: item.name!,
                width: MediaQuery.of(context).size.width / 3 - 2 * 4,
                height: (MediaQuery.of(context).size.width / 3 - 2 * 8) * 1.5,
                onTap: () {
                  ref.read(recentTapsProvider.notifier).addRecentTap(
                        RecentSearch()
                          ..tmdbId = item.id
                          ..title = item.name
                          ..posterPath = item.profilePath
                          ..type = SearchType.person,
                      );

                  AutoRouter.of(context).push(PersonRoute(personId: item.id!));
                },
              );
            } else {
              String year;
              String name;

              // if it's a movie the year is in release_date, if it's a show it's in first_air_date
              if (item.releaseDate != null) {
                try {
                  year = DateTime.parse(item.releaseDate!).year.toString();
                } catch (e) {
                  year = 'search.unknown'.tr();
                }

                name = item.title!;
              } else {
                try {
                  year = item.firstAirDate!.year.toString();
                } catch (e) {
                  year = 'search.unknown'.tr();
                }

                name = item.name!;
              }

              return MovieTile(
                posterPath: item.posterPath,
                title: name,
                year: year,
                voteAverage: item.voteAverage!,
                width: MediaQuery.of(context).size.width / 3 - 2 * 4,
                height: (MediaQuery.of(context).size.width / 3 - 2 * 8) * 1.5,
                onTap: () {
                  ref.read(recentTapsProvider.notifier).addRecentTap(
                        RecentSearch()
                          ..tmdbId = item.id
                          ..title = item.title
                          ..posterPath = item.posterPath
                          ..voteAverage = item.voteAverage
                          ..year = year
                          ..type = item.mediaType == MediaType.movie
                              ? SearchType.movie
                              : SearchType.tv,
                      );

                  if (item.mediaType == MediaType.tv) {
                    AutoRouter.of(context)
                        .push(TVShowDetailRoute(tvShowId: item.id!));
                  } else if (item.mediaType == MediaType.movie) {
                    AutoRouter.of(context)
                        .push(MovieDetailRoute(movieId: item.id!));
                  }
                },
              );
            }
          },
        ),
      );
    }

    Widget buildLatestSearches(List<SearchItem> searchItems) {
      return SliverPadding(
        padding: const EdgeInsets.only(top: 10, left: 20),
        sliver: SliverList.builder(
          itemCount: searchItems.length,
          itemBuilder: (context, index) {
            return Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                ref
                    .read(searchItemsServiceProvider.notifier)
                    .removeSearchItem(searchItems[index]);
              },
              key: ValueKey(searchItems[index].id),
              background: Container(
                color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                // align the child to the right
                alignment: Alignment.centerRight,
                child: const Icon(Icons.delete),
              ),
              child: ListTile(
                dense: true,
                title: Text(searchItems[index].query!),
                trailing: IconButton(
                  onPressed: () {
                    ref
                        .read(searchItemsServiceProvider.notifier)
                        .removeSearchItem(searchItems[index]);
                  },
                  icon: const Icon(Icons.close),
                ),
                onTap: () {
                  searchBarTextController.text = searchItems[index].query!;

                  ref
                      .read(searchPageControllerProvider.notifier)
                      .search(searchBarTextController.text);
                },
              ),
            );
          },
        ),
      );
    }

    Widget buildLatestTappedResults(List<RecentSearch> recentTaps) {
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        sliver: SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 2 / 4.1,
          ),
          itemCount: recentTaps.length,
          itemBuilder: (context, index) {
            final item = recentTaps[index];

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
                width: MediaQuery.of(context).size.width / 3 -
                    2 * 4, // see delegate
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

    return Scaffold(
      body: CustomScrollView(
        controller: scrollViewController,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverAppBar(
            clipBehavior: Clip.none,
            title: SearchBar(
              focusNode: searchBarFocusNode,
              controller: searchBarTextController,
              onSubmitted: (value) {
                ref.read(searchPageControllerProvider.notifier).search(value);
              },
              hintText: 'search.search'.tr(),
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.chevron_left)),
              trailing: [
                if (searchResultsController.viewState ==
                    SearchViewState.results)
                  IconButton(
                    onPressed: () {
                      searchBarTextController.clear();
                      searchBarFocusNode.requestFocus();
                      ref.read(searchPageControllerProvider.notifier).reset();
                    },
                    icon: const Icon(Icons.close),
                  ),
                if (searchResultsController.viewState ==
                    SearchViewState.searching)
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircularProgressIndicator.adaptive(),
                  )
              ],
            ),
            automaticallyImplyLeading: false,
          ),
          if (searchResultsController.viewState == SearchViewState.idle)
            searchItems.maybeWhen(
              data: (items) => items.isNotEmpty
                  ? buildLatestSearches(items)
                  : const SliverToBoxAdapter(),
              orElse: () => const SliverToBoxAdapter(),
            ),
          if (searchResultsController.viewState == SearchViewState.idle)
            recentTaps.maybeWhen(
              data: (items) => items.isNotEmpty
                  ? buildLatestTappedResults(items)
                  : const SliverToBoxAdapter(),
              orElse: () => const SliverToBoxAdapter(),
            ),
          if (searchResultsController.viewState == SearchViewState.results &&
              searchResultsController.searchQuery!.results!.isEmpty)
            buildEmptyResults(),
          if (searchResultsController.viewState == SearchViewState.results &&
              searchResultsController.searchQuery!.results!.isNotEmpty)
            buildResults(),
          if (searchResultsController.viewState == SearchViewState.results &&
              searchResultsController.loadingMore)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
        ],
      ),
    );
  }
}
