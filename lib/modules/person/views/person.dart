import 'dart:math';

import 'package:action/isar/models/pin.dart';
import 'package:action/modules/person/providers/person.provider.dart';
import 'package:action/router/app_router.dart';
import 'package:action/shared/ui/open_website_menu.dart';
import 'package:action/shared/ui/pin_button.dart';
import 'package:action/shared/ui/search_floating_action_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:action/shared/ui/blurred_app_bar.dart';
import 'package:action/shared/ui/poster.dart';
import 'package:action/shared/ui/poster_tile.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

enum CreditType { movie, tv }

@RoutePage()
class PersonPage extends HookConsumerWidget {
  final int personId;

  // ignore: use_key_in_widget_constructors
  const PersonPage({required this.personId});

  List<Widget> _personalDetail(BuildContext context,
      {required String label, required String value}) {
    return [
      Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              // bold
              fontWeight: FontWeight.w700,
            ),
      ),
      Text(
        value,
        style: Theme.of(context).textTheme.labelLarge,
      ),
      const SizedBox(height: 10),
    ];
  }

  String _gender(int gender) {
    switch (gender) {
      case 0:
        return 'person.genders.not_set'.tr();
      case 1:
        return 'person.genders.female'.tr();
      case 2:
        return 'person.genders.male'.tr();
      case 3:
        return 'person.genders.non_binary'.tr();
      default:
        return 'person.genders.unknown'.tr();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(personDetailsProvider(personId));
    final showAllBiography = useState(false);

    return person.when(error: (e, stack) {
      debugPrint('error with $personId');
      debugPrint(e.toString());
      debugPrint(stack.toString());

      return const Scaffold();
    }, loading: () {
      return _LoadingScreen();
    }, data: (data) {
      // Format the birthday using a date formatter
      final birthday = data.birthday != null
          ? DateFormat.yMMMMd().format(data.birthday!)
          : 'person.unknown'.tr();

      final age = data.birthday != null
          ? DateTime.now().difference(data.birthday!).inDays ~/ 365
          : null;

      String? deathday;

      if (data.deathday != null) {
        deathday =
            DateFormat.yMMMMd().format(data.deathday!);
      }

      return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: const SearchFloatingActionButton(),
        appBar: BlurredAppBar(
          title: data.name!,
          actions: [
            PinButton(
                tmdbId: data.id!,
                pinBuilderCallback: () => Pin()
                  ..tmdbId = data.id!
                  ..type = PinType.person
                  ..title = data.name!
                  ..posterPath = data.profilePath!),
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                Share.shareUri(
                  Uri.parse(
                    "https://www.themoviedb.org/person/${data.id}",
                  ),
                );
              },
            ),
            OpenWebsiteMenu(
              tmdbId: data.id,
              imdbId: data.imdbId,
              type: ItemType.person,
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            bottom: 40,
            top: 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Poster(
                      imagePath: data.profilePath,
                      height: 250,
                      width: 166,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ..._personalDetail(context,
                              label: 'person.known_for'.tr(),
                              value: data.knownForDepartment.toString()),
                          ..._personalDetail(context,
                              label: 'person.gender'.tr(),
                              value: _gender(data.gender!)),
                          if (age != null)
                            ..._personalDetail(context,
                                label: 'person.birthday'.tr(),
                              value: "$birthday ($age years old)"),
                          ..._personalDetail(context,
                              label: 'person.place_of_birth'.tr(),
                              value: data.placeOfBirth ?? 'Unknown'),
                          if (deathday != null)
                            ..._personalDetail(context,
                                label: 'person.deathday'.tr(), value: deathday)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'person.biography',
                  style: Theme.of(context).textTheme.headlineSmall,
                ).tr(),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    showAllBiography.value = !showAllBiography.value;
                  },
                  child: Text(
                    data.biography != null && data.biography!.isNotEmpty
                        ? data.biography!
                        : 'person.no_biography'.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: showAllBiography.value ? null : 5,
                    overflow:
                        showAllBiography.value ? null : TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ...buildCredits(
                context,
                type: CreditType.movie,
                title: 'person.movies'.tr(),
                items: (data.movieCredits?.cast ?? [])
                    .map((e) => {
                          'posterPath': e.posterPath,
                          'title': e.originalTitle,
                          'subtitle': e.character,
                          'id': e.id,
                        })
                    .toList(),
              ),
              ...buildCredits(
                context,
                type: CreditType.tv,
                title: 'person.tv_shows'.tr(),
                items: (data.tvCredits?.cast ?? [])
                    .map((e) => {
                          'posterPath': e.posterPath,
                          'title': e.originalName,
                          'subtitle': e.character,
                          'id': e.id,
                        })
                    .toList(),
              ),
              ...buildCredits(
                context,
                type: CreditType.movie,
                title: 'Movies (as crew)',
                items: (data.movieCredits?.crew ?? [])
                    .map((e) => {
                          'posterPath': e.posterPath,
                          'title': e.originalTitle,
                          'subtitle': e.job,
                          'id': e.id,
                        })
                    .toList(),
              ),
              ...buildCredits(
                context,
                type: CreditType.tv,
                title: 'TV Shows (as crew)',
                items: (data.tvCredits?.crew ?? [])
                    .map((e) => {
                          'posterPath': e.posterPath,
                          'title': e.originalName,
                          'subtitle': e.job,
                          'id': e.id,
                        })
                    .toList(),
              ),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> buildCredits(BuildContext context,
      {
    required String title,
    required List<Map<String, dynamic>> items,
    required CreditType type,
  }) {
    if (items.isEmpty) {
      return [];
    }

    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      SizedBox(
        height: 295,
        child: ListView.builder(
          padding: const EdgeInsets.only(right: 5, left: 5),
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return PosterTile(
              imagePath: item['posterPath'],
              title: item['title'] ?? '',
              subtitle: item['subtitle'],
              onTap: () {
                if (type == CreditType.movie) {
                  AutoRouter.of(context).push(
                    MovieDetailRoute(movieId: item['id']),
                  );
                } else {
                  AutoRouter.of(context).push(
                    TVShowDetailRoute(tvShowId: item['id']),
                  );
                }
              },
            );
          },
        ),
      )
    ];
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

  List<Widget> _personalDetail(BuildContext context, {required String label}) {
    return [
      Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              // bold
              fontWeight: FontWeight.w700,
            ),
      ),
      _shimmer(width: Random().nextInt(80) + 60, height: 20),
      const SizedBox(height: 10),
    ];
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmer(width: 166, height: 250),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ..._personalDetail(context, label: 'Known For'),
                        ..._personalDetail(context, label: 'Gender'),
                        ..._personalDetail(context, label: 'Birthday'),
                        ..._personalDetail(context, label: 'Place of Birth'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Biography',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmer(
                    width: 0.9 * MediaQuery.of(context).size.width,
                    height: 10,
                  ),
                  const SizedBox(height: 5),
                  _shimmer(
                    width: 0.85 * MediaQuery.of(context).size.width,
                    height: 10,
                  ),
                  const SizedBox(height: 5),
                  _shimmer(
                    width: 0.95 * MediaQuery.of(context).size.width,
                    height: 10,
                  ),
                  const SizedBox(height: 5),
                  _shimmer(
                    width: 0.50 * MediaQuery.of(context).size.width,
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
