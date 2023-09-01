import 'dart:math';
import 'dart:ui';

import 'package:action/components/credits_list.dart';
import 'package:action/components/poster.dart';
import 'package:action/models/cast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef MetadataBuilder = Widget Function(BuildContext context);

class DetailView extends HookConsumerWidget {
  final String title;
  final String? backdropPath;
  final String? posterPath;
  final MetadataBuilder buildMetadata;
  final String? summary;
  final List<Cast> cast;
  final List<Cast> crew;

  const DetailView({
    super.key,
    required this.title,
    this.backdropPath,
    this.posterPath,
    required this.buildMetadata,
    this.summary,
    this.cast = const <Cast>[],
    this.crew = const <Cast>[],
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final titleOpacity = useState(0.0);

    scrollController.addListener(() {
      if (scrollController.offset > 250) {
        titleOpacity.value = min(1, (scrollController.offset - 250) / 100);
      } else {
        titleOpacity.value = 0.0;
      }
    });

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
              title,
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
                          imagePath: backdropPath,
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
                                imagePath: posterPath,
                                height: 180,
                                width: 120,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              title,
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: buildMetadata(context),
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
                      summary ?? 'No summary available.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (cast.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Cast",
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                  if (cast.isNotEmpty) CreditsList(people: cast),
                  if (cast.isNotEmpty) const SizedBox(height: 10),
                  if (crew.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Crew",
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                  if (crew.isNotEmpty) CreditsList(people: crew),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
