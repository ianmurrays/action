import 'dart:math';
import 'dart:ui';

import 'package:action/shared/ui/credits_list.dart';
import 'package:action/shared/ui/long_press_back_button.dart';
import 'package:action/shared/ui/open_website_menu.dart';
import 'package:action/shared/ui/poster.dart';
import 'package:action/shared/models/cast.dart';
import 'package:action/shared/ui/search_floating_action_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

typedef MetadataBuilder = Widget Function(BuildContext context);
typedef PinButtonBuilder = Widget Function(BuildContext context);

typedef OnPinTapped = void Function(bool isPinned);

class DetailView extends HookConsumerWidget {
  final String title;
  final String? backdropPath;
  final String? posterPath;
  final MetadataBuilder buildMetadata;
  final PinButtonBuilder buildPinButton;
  final String? summary;
  final List<Cast> cast;
  final List<Cast> crew;
  final int? tmdbId;
  final String? imdbId;
  final bool isMovie;

  const DetailView({
    super.key,
    required this.title,
    this.backdropPath,
    this.posterPath,
    required this.buildMetadata,
    required this.buildPinButton,
    this.summary,
    this.cast = const <Cast>[],
    this.crew = const <Cast>[],
    required this.tmdbId,
    this.imdbId,
    required this.isMovie,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    isLightMode() => Theme.of(context).brightness == Brightness.light;

    final titleOpacity = useState(0.0);
    final showAllSummary = useState(false);
    final scrollController = PrimaryScrollController.of(context);
    final systemUiOverlayStyle = useState(SystemUiOverlayStyle.light);

    useEffect(() {
      void listener() {
        if (scrollController.offset > 250) {
          titleOpacity.value = min(1, (scrollController.offset - 250) / 100);
          systemUiOverlayStyle.value = isLightMode()
              ? SystemUiOverlayStyle.dark
              : SystemUiOverlayStyle.light;
        } else {
          titleOpacity.value = 0.0;
          systemUiOverlayStyle.value = isLightMode()
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.light;
        }
      }

      scrollController.addListener(listener);

      return () => scrollController.removeListener(listener);
    }, []);

    return Scaffold(
      floatingActionButton: const SearchFloatingActionButton(),
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            systemOverlayStyle: systemUiOverlayStyle.value,
            foregroundColor: titleOpacity.value <= 0.1
                ? Colors.white
                : (isLightMode() ? Colors.black : Colors.white),
            leading: const LongPressBackButton(),
            actions: [
              buildPinButton(context),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  Share.shareUri(
                    Uri.parse(
                      "https://www.themoviedb.org/${isMovie ? 'movie' : 'tv'}/$tmdbId",
                    ),
                  );
                },
              ),
              OpenWebsiteMenu(
                tmdbId: tmdbId,
                imdbId: imdbId,
                type: isMovie ? ItemType.movie : ItemType.tv,
              ),
            ],
            backgroundColor:
                Theme.of(context).colorScheme.background.withAlpha(200),
            title: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: isLightMode()
                      ? Colors.black.withOpacity(titleOpacity.value)
                      : Colors.white.withOpacity(titleOpacity.value)),
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
                                icon: isMovie ? Icons.movie : Icons.tv,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                color: Colors.white,
                                shadows: [
                                  const Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, 0),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
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
                    child: Text(
                      "detail.summary",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ).tr(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        showAllSummary.value = !showAllSummary.value;
                      },
                      child: Text(
                        summary ?? 'detail.no_summary'.tr(),
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: showAllSummary.value ? null : 5,
                        overflow:
                            showAllSummary.value ? null : TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (cast.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "detail.cast",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ).tr(),
                    ),
                  if (cast.isNotEmpty) CreditsList(people: cast),
                  if (cast.isNotEmpty) const SizedBox(height: 10),
                  if (crew.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "detail.crew",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ).tr(),
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
