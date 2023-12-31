import 'dart:async';

import 'package:action/isar/models/recent_search.dart';
import 'package:action/isar/models/search_item.dart';
import 'package:action/modules/search/providers/recent_taps.provider.dart';
import 'package:action/modules/search/providers/search_items.provider.dart';
import 'package:action/modules/search/ui/latest_searches.dart';
import 'package:action/modules/search/ui/latest_tapped_results.dart';
import 'package:action/shared/ui/content_tile.dart';
import 'package:action/shared/ui/title_subtitle_tile.dart';
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

    useEffect(() {
      searchBarFocusNode.requestFocus();

      return null;
    }, []);

    useEffect(() {
      scrollViewController.addListener(() {
        if (scrollViewController.position.pixels ==
                scrollViewController.position.maxScrollExtent &&
            searchResultsController.viewState == SearchViewState.results) {
          ref.read(searchPageControllerProvider.notifier).searchMore();
        }
      });

      return null;
    }, []);

    Future storeSearchItem() {
      return ref.read(searchItemsServiceProvider.notifier).addSearchItem(
            SearchItem()..query = searchBarTextController.text,
          );
    }

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
              return TitleSubtitleTile(
                imagePath: item.profilePath,
                title: item.name!,
                icon: Icons.person,
                width: MediaQuery.of(context).size.width / 3 - 2 * 4,
                height: (MediaQuery.of(context).size.width / 3 - 2 * 8) * 1.5,
                maxLines: 2,
                onTap: () {
                  storeSearchItem();

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
                  year = '';
                }

                name = item.title!;
              } else {
                try {
                  year = item.firstAirDate!.year.toString();
                } catch (e) {
                  year = '';
                }

                name = item.name!;
              }

              return ContentTile(
                posterPath: item.posterPath,
                title: name,
                year: year,
                voteAverage: item.voteAverage!,
                width: MediaQuery.of(context).size.width / 3 - 2 * 4,
                height: (MediaQuery.of(context).size.width / 3 - 2 * 8) * 1.5,
                icon: item.mediaType == MediaType.tv ? Icons.tv : Icons.movie,
                onTap: () {
                  storeSearchItem();

                  ref.read(recentTapsProvider.notifier).addRecentTap(
                        RecentSearch()
                          ..tmdbId = item.id
                          ..title = name
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

    final cancelTimer = useState<Timer?>(null);

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
              onChanged: (value) {
                if (cancelTimer.value?.isActive ?? false) {
                  cancelTimer.value!.cancel();
                }

                cancelTimer.value =
                    Timer(const Duration(milliseconds: 300), () {
                  ref.read(searchPageControllerProvider.notifier).search(value);
                });
              },
              onSubmitted: (value) {
                ref.read(searchPageControllerProvider.notifier).search(value);
              },
              hintText: 'search.search'.tr(),
              leading: searchResultsController.viewState ==
                      SearchViewState.results
                  ? IconButton(
                      onPressed: () {
                        searchBarTextController.clear();
                        searchBarFocusNode.requestFocus();
                        ref.read(searchPageControllerProvider.notifier).reset();
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.chevron_left)),
              trailing: [
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
            LatestSearches(
              onSearch: (query) {
                searchBarTextController.text = query;

                ref
                    .read(searchPageControllerProvider.notifier)
                    .search(searchBarTextController.text);
              },
            ),
          if (searchResultsController.viewState == SearchViewState.idle)
            const LatestTappedResults(),
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
