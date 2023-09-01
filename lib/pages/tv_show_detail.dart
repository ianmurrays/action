import 'package:action/components/detail_view.dart';
import 'package:action/providers/tmdb.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class TVShowDetailPage extends HookConsumerWidget {
  final int tvShowId;

  // ignore: use_key_in_widget_constructors
  const TVShowDetailPage({required this.tvShowId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final show = ref.watch(tvShowDetailsProvider(tvShowId));

    return show.when(
      error: (_, __) => const _ErrorScreen(),
      loading: () => _LoadingScreen(),
      data: (data) {
        return DetailView(
          title: data.name!,
          backdropPath: data.backdropPath,
          posterPath: data.posterPath,
          summary: data.overview,
          cast: data.aggregateCredits!.cast ?? [],
          crew: data.aggregateCredits!.crew ?? [],
          buildMetadata: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(children: [
                const Icon(Icons.calendar_month, size: 10),
                const SizedBox(width: 2),
                Text(
                  DateFormat.yMMMMd().format(data.firstAirDate!),
                ),
              ]),
              Row(
                children: [
                  const Icon(Icons.camera_roll, size: 10),
                  const SizedBox(width: 2),
                  Text(data.inProduction! ? 'In Production' : 'Finished'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.star, size: 10),
                  const SizedBox(width: 2),
                  Text(data.voteAverage!.toStringAsFixed(1)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (['😢', '😓', '🫠', '🙃']..shuffle()).first,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'An error occurred while loading the movie.',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
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
