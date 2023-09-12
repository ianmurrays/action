import 'package:action/modules/home/ui/section.dart';
import 'package:action/modules/home/providers/home.provider.dart';
import 'package:action/router/app_router.dart';
import 'package:action/shared/providers/pin.provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:action/shared/ui/blurred_app_bar.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pins = ref.watch(pinsProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final popularTvShows = ref.watch(popularTvShowsProvider);
    final topRatedTvShows = ref.watch(topRatedTvShowsProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BlurredAppBar(
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).push(const SearchRoute());
          },
          icon: const Icon(Icons.search),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.settings),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(const SearchRoute());
        },
        child: const Icon(Icons.search),
      ),
      body: RefreshIndicator.adaptive(
        edgeOffset: 110,
        onRefresh: () {
          return Future.wait([
            ref.refresh(popularMoviesProvider.future),
            ref.refresh(upcomingMoviesProvider.future),
            ref.refresh(popularTvShowsProvider.future),
            ref.refresh(topRatedTvShowsProvider.future),
          ]);
        },
        child: CustomScrollView(
          slivers: [
            const SliverPadding(padding: EdgeInsets.only(top: 110)),
            pins.maybeWhen(
              data: (pins) {
                if (pins.isEmpty) {
                  return const SliverToBoxAdapter();
                }

                return Section(
                  title: "Pinned Items",
                  entries: pins
                      .map((pin) => Entry(
                            id: pin.tmdbId!,
                            title: pin.title!,
                            posterPath: pin.posterPath,
                            year: pin.year,
                            voteAverage: pin.voteAverage,
                            // these two enums match each other, hence we can do this
                            type: EntryType.values[pin.type.index],
                          ))
                      .toList(),
                );
              },
              orElse: () => const _LoadingSection(),
            ),
            popularMovies.maybeWhen(
              data: (movies) {
                return Section(
                  title: "Popular Movies",
                  entries: movies
                      .map((movie) => Entry(
                            id: movie.id!,
                            title: movie.title!,
                            posterPath: movie.posterPath,
                            year: movie.releaseDate!.year.toString(),
                            voteAverage: movie.voteAverage!,
                            type: EntryType.movie,
                          ))
                      .toList(),
                );
              },
              orElse: () => const _LoadingSection(),
            ),
            upcomingMovies.maybeWhen(
              data: (movies) {
                return Section(
                  title: "Upcoming Movies",
                  entries: movies
                      .map((movie) => Entry(
                            id: movie.id!,
                            title: movie.title!,
                            posterPath: movie.posterPath,
                            year: movie.releaseDate!.year.toString(),
                            voteAverage: movie.voteAverage!,
                            type: EntryType.movie,
                          ))
                      .toList(),
                );
              },
              orElse: () => const _LoadingSection(),
            ),
            popularTvShows.maybeWhen(
              data: (tvShows) {
                return Section(
                  title: "Popular TV Shows",
                  entries: tvShows
                      .map((tvShow) => Entry(
                            id: tvShow.id!,
                            title: tvShow.name!,
                            posterPath: tvShow.posterPath,
                            year: tvShow.firstAirDate!.year.toString(),
                            voteAverage: tvShow.voteAverage!,
                            type: EntryType.tv,
                          ))
                      .toList(),
                );
              },
              orElse: () => const _LoadingSection(),
            ),
            topRatedTvShows.maybeWhen(
              data: (tvShows) {
                return Section(
                  title: "Top Rated TV Shows",
                  entries: tvShows
                      .map((tvShow) => Entry(
                            id: tvShow.id!,
                            title: tvShow.name!,
                            posterPath: tvShow.posterPath,
                            year: tvShow.firstAirDate!.year.toString(),
                            voteAverage: tvShow.voteAverage!,
                            type: EntryType.tv,
                          ))
                      .toList(),
                );
              },
              orElse: () => const _LoadingSection(),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
          ],
        ),
      ),
    );
  }
}

class _LoadingSection extends StatelessWidget {
  const _LoadingSection();

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey[500]!;
    final highlightColor = Colors.grey[300]!;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // add a white box to simulate the loading state
              child: Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: SizedBox(
                    width: 200,
                    height: 30,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )),
              )),
          const SizedBox(height: 10),
          SizedBox(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Shimmer.fromColors(
                    baseColor: baseColor,
                    highlightColor: highlightColor,
                    child: SizedBox(
                      width: 140,
                      height: 210,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 4,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
