import 'package:action/components/movie_tile.dart';
import 'package:action/components/poster_tile.dart';
import 'package:action/models/search.dart';
import 'package:action/pages/search/models/search_state.dart';
import 'package:action/pages/search/providers/search_page_controller.dart';
import 'package:action/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var recentSearches = [
  'tom',
  'orange is the new black',
  'mr robot',
  'breaking bad',
];

const recentResultsTapped = [
  {
    "id": 640146,
    "poster_path": "/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg",
    "release_date": "2023-02-15",
    "title": "Ant-Man and the Wasp: Quantumania",
    "vote_average": 6.5,
  },
  {
    "id": 502356,
    "poster_path": "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
    "release_date": "2023-04-05",
    "title": "The Super Mario Bros. Movie",
    "vote_average": 7.5,
  },
  {
    "id": 594767,
    "poster_path": "/2VK4d3mqqTc7LVZLnLPeRiPaJ71.jpg",
    "release_date": "2023-03-15",
    "title": "Shazam! Fury of the Gods",
    "vote_average": 6.8,
  },
  {
    "id": 76600,
    "poster_path": "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
    "release_date": "2022-12-14",
    "title": "Avatar: The Way of Water",
    "vote_average": 7.7,
  },
  {
    "id": 948713,
    "poster_path": "/7yyFEsuaLGTPul5UkHc5BhXnQ0k.jpg",
    "release_date": "2023-04-14",
    "title": "The Last Kingdom: Seven Kings Must Die",
    "vote_average": 7.4,
  },
];

@RoutePage()
class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollViewController = useScrollController();
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
                'No results found',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
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
                  year = 'Unknown';
                }

                name = item.title!;
              } else {
                try {
                  year = item.firstAirDate!.year.toString();
                } catch (e) {
                  year = 'Unknown';
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

    Widget buildLatestSearches() {
      return SliverPadding(
        padding: const EdgeInsets.only(top: 10),
        sliver: SliverList.builder(
          itemCount: recentSearches.length,
          itemBuilder: (context, index) {
            return Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                // setState(() {
                //   recentSearches.removeAt(index);
                // });
              },
              key: ValueKey(recentSearches[index]),
              background: Container(
                color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                // align the child to the right
                alignment: Alignment.centerRight,
                child: const Icon(Icons.delete),
              ),
              child: ListTile(
                dense: true,
                title: Text(recentSearches[index]),
                trailing: IconButton(
                  onPressed: () {
                    // setState(() {
                    //   recentSearches.removeAt(index);
                    // });
                  },
                  icon: const Icon(Icons.close),
                ),
                onTap: () {
                  searchBarTextController.text = recentSearches[index];

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

    Widget buildLatestTappedResults() {
      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        sliver: SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            childAspectRatio: 2 / 4.1,
          ),
          itemBuilder: (context, index) {
            var posterPath =
                recentResultsTapped[index]['poster_path'] as String;
            var title = recentResultsTapped[index]['title'] as String;
            var year = DateTime.parse(
                    recentResultsTapped[index]['release_date'] as String)
                .year;

            return MovieTile(
              posterPath: posterPath,
              title: title,
              year: year.toString(),
              voteAverage: recentResultsTapped[index]['vote_average'] as double,
              width:
                  MediaQuery.of(context).size.width / 3 - 2 * 4, // see delegate
              height: (MediaQuery.of(context).size.width / 3 - 2 * 8) * 1.5,
              onTap: () {
                AutoRouter.of(context).push(MovieDetailRoute(movieId: 0));
              },
            );
          },
          itemCount: recentResultsTapped.length,
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
              hintText: 'Search',
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
          // if (searchResultsController.viewState == SearchViewState.idle)
          //   buildLatestSearches(),
          // if (searchResultsController.viewState == SearchViewState.idle)
          //   buildLatestTappedResults(),
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
