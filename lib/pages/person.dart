import 'package:action/providers/tmdb.dart';
import 'package:action/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:action/components/blurred_app_bar.dart';
import 'package:action/components/poster.dart';
import 'package:action/components/poster_tile.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

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
        return 'Not set / not specified';
      case 1:
        return 'Female';
      case 2:
        return 'Male';
      case 3:
        return 'Non-binary';
      default:
        return 'Unknown';
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

      return Container();
    }, loading: () {
      return Container();
    }, data: (data) {
      // Format the birthday using a date formatter
      final birthday = data.birthday != null
          ? DateFormat.yMMMMd().format(data.birthday!)
          : 'Unknown';

      final age = data.birthday != null
          ? DateTime.now().difference(data.birthday!).inDays ~/ 365
          : null;

      String? deathday;

      if (data.deathday != null) {
        deathday = DateFormat.yMMMMd().format(data.deathday!);
      }

      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: BlurredAppBar(
          title: data.name!,
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
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            bottom: 40,
            top: 110,
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
                              label: 'Known For',
                              value: data.knownForDepartment.toString()),
                          ..._personalDetail(context,
                              label: 'Gender', value: _gender(data.gender!)),
                          ..._personalDetail(context,
                              label: 'Birthday',
                              value: "$birthday ($age years old)"),
                          ..._personalDetail(context,
                              label: 'Place of Birth',
                              value: data.placeOfBirth ?? 'Unknown'),
                          if (deathday != null)
                            ..._personalDetail(context,
                                label: 'Died', value: deathday)
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
                child: GestureDetector(
                  onTap: () {
                    showAllBiography.value = !showAllBiography.value;
                  },
                  child: Text(
                    data.biography != null && data.biography!.isNotEmpty
                        ? data.biography!
                        : 'No biography found.',
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
                title: 'Movies',
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
                title: 'TV Shows',
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
      {required String title, required List<Map<String, dynamic>> items}) {
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
        height: 280,
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
                AutoRouter.of(context)
                    .push(MovieDetailRoute(movieId: item['id']));
              },
            );
          },
        ),
      )
    ];
  }
}
