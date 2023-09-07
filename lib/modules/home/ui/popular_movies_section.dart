import 'package:action/shared/ui/movie_tile.dart';
import 'package:action/shared/providers/tmdb.dart';
import 'package:action/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Section extends HookConsumerWidget {
  const Section({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularMovies = ref.watch(popularMoviesProvider);

    if (popularMovies.isLoading) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("Trending Movies",
                style: Theme.of(context).textTheme.headlineLarge),
          ),
          SizedBox(
            height: 295,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              itemCount: popularMovies.value!.length,
              itemBuilder: (context, index) {
                final movie = popularMovies.value![index];

                final posterPath = movie.posterPath;
                final title = movie.title!;
                final year = movie.releaseDate?.year;
                final voteAverage = movie.voteAverage;

                return MovieTile(
                    posterPath: posterPath,
                    title: title,
                    year: year.toString(),
                    voteAverage: voteAverage!,
                    onTap: () {
                      AutoRouter.of(context).push(MovieDetailRoute(movieId: 0));
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
