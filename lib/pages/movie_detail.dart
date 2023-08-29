import 'dart:math';
import 'dart:ui';

import 'package:action/models/cast.dart';
import 'package:action/providers/tmdb.dart';
import 'package:action/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:action/components/poster.dart';
import 'package:action/components/poster_tile.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class MovieDetailPage extends HookConsumerWidget {
  final int movieId;

  // ignore: use_key_in_widget_constructors
  const MovieDetailPage({required this.movieId});

  Widget buildCredits(BuildContext context, List<Cast> people) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 5, right: 0, left: 5),
        scrollDirection: Axis.horizontal,
        itemCount: people.length,
        itemBuilder: (BuildContext context, int index) {
          final person = people[index];
          final id = person.id;
          final imagePath = person.profilePath;
          final title = person.name;

          String subtitle;

          if (person.character != null) {
            subtitle = person.character!;
          } else if (person.job != null) {
            subtitle = person.job!;
          } else {
            subtitle = "";
          }

          return PosterTile(
            key: ValueKey(id),
            imagePath: imagePath,
            title: title!,
            subtitle: subtitle,
            onTap: () {
              // Navigate to PersonPage
              AutoRouter.of(context).push(PersonRoute(personId: id!));
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movie = ref.watch(movieDetailsProvider(movieId));

    final scrollController = useScrollController();
    final titleOpacity = useState(0.0);
    final displayHours = useState(false);

    scrollController.addListener(() {
      if (scrollController.offset > 250) {
        titleOpacity.value = min(1, (scrollController.offset - 250) / 100);
      } else {
        titleOpacity.value = 0.0;
      }
    });

    return movie.when(
      error: (e, trace) {
        debugPrintStack(label: e.toString(), stackTrace: trace);
        return _LoadingScreen();
      },
      loading: () => _LoadingScreen(),
      data: (data) {
        // convert running time to hours and minutes
        var hours = data.runtime! ~/ 60;
        var minutes = data.runtime! % 60 < 10
            ? "0${data.runtime! % 60}"
            : (data.runtime! % 60).toString();

        return Scaffold(
          body: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            slivers: [
              SliverAppBar(
                actions: [
                  IconButton(
                    icon: const Icon(Icons.push_pin),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {},
                  ),
                ],
                backgroundColor:
                    Theme.of(context).colorScheme.background.withAlpha(200),
                title: Text(
                  data.title!,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white.withOpacity(titleOpacity.value)),
                ),
                expandedHeight: 350,
                pinned: true,
                stretch: true,
                flexibleSpace: Stack(
                  children: [
                    Opacity(
                      opacity: 1 - titleOpacity.value,
                      child: FlexibleSpaceBar(
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            Poster(
                              imagePath: data.backdropPath,
                              height: 350,
                              width: double.infinity,
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.8),
                                    Colors.black.withOpacity(0.5)
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 10,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Poster(
                                    imagePath: data.posterPath,
                                    height: 180,
                                    width: 120,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  data.title!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(children: [
                                        const Icon(Icons.calendar_month,
                                            size: 10),
                                        const SizedBox(width: 2),
                                        Text(
                                          data.releaseDate!.year.toString(),
                                        ),
                                      ]),
                                      Row(
                                        children: [
                                          const Icon(Icons.watch_later_outlined,
                                              size: 10),
                                          const SizedBox(width: 2),
                                          displayHours.value
                                              ? Text("$hours:$minutes")
                                              : Text("${data.runtime} min"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.star, size: 10),
                                          const SizedBox(width: 2),
                                          Text(data.voteAverage!
                                              .toStringAsFixed(1)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        stretchModes: const [
                          StretchMode.zoomBackground,
                          StretchMode.blurBackground,
                        ],
                      ),
                    ),
                    Opacity(
                      opacity: titleOpacity.value,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 50),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Summary",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          data.overview!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Cast",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      buildCredits(context, data.credits!.cast!),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Crew",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      buildCredits(context, data.credits!.crew!),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  final Color baseColor = Colors.grey[500]!;
  final Color highlightColor = Colors.grey[300]!;

  Widget _shimmer({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _shimmer(width: 150, height: 30),
        actions: [
          IconButton(
            icon: const Icon(Icons.push_pin),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
        backgroundColor:
            Theme.of(context).colorScheme.background.withAlpha(200),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _shimmer(width: 120, height: 180),
            const SizedBox(height: 10),
            _shimmer(width: 260, height: 35),
            const SizedBox(height: 10),
            _shimmer(width: 110, height: 35),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _shimmer(width: 50, height: 15),
                _shimmer(width: 50, height: 15),
                _shimmer(width: 50, height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
