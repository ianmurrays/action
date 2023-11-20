import 'package:action/isar/models/pin.dart';
import 'package:action/modules/tv_show/providers/tv_show.provider.dart';
import 'package:action/shared/ui/detail_view.dart';
import 'package:action/shared/ui/error_screen.dart';
import 'package:action/shared/ui/pin_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      error: (_, __) => ErrorScreen(
        message: 'tv_show_detail.error'.tr(),
      ),
      loading: () => _LoadingScreen(),
      data: (data) {
        return DetailView(
          title: data.name!,
          backdropPath: data.backdropPath,
          posterPath: data.posterPath,
          summary: data.overview,
          cast: data.aggregateCredits!.cast ?? [],
          crew: data.aggregateCredits!.crew ?? [],
          tmdbId: data.id,
          isMovie: false,
          buildPinButton: (context) => PinButton(
              tmdbId: data.id!,
              pinBuilderCallback: () => Pin()
                ..tmdbId = data.id!
                ..type = PinType.tv
                ..title = data.name!
                ..posterPath = data.posterPath!
                ..year = data.firstAirDate!.year.toString()
                ..voteAverage = data.voteAverage!),
          buildMetadata: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(children: [
                const Icon(
                  Icons.calendar_month,
                  size: 10,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 2,
                    ),
                  ],
                ),
                const SizedBox(width: 2),
                Text(
                  DateFormat.yMMMMd().format(data.firstAirDate!),
                  style: const TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ]),
              Row(
                children: [
                  const Icon(
                    Icons.camera_roll,
                    size: 10,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  const SizedBox(width: 2),
                  Text(
                    data.inProduction! ? 'In Production' : 'Finished',
                    style: const TextStyle(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(0, 0),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 10,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  const SizedBox(width: 2),
                  Text(
                    data.voteAverage!.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(0, 0),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ],
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
          IconButton(
            icon: const Icon(Icons.more_horiz),
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
