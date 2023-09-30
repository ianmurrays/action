import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum ItemType {
  movie,
  tv,
  person,
}

class OpenWebsiteMenu extends StatelessWidget {
  final int? tmdbId;
  final String? imdbId;
  final ItemType type;

  const OpenWebsiteMenu({
    super.key,
    this.tmdbId,
    this.imdbId,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_horiz),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 300,
              color: Theme.of(context).colorScheme.background,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "More",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  if (tmdbId != null)
                    ListTile(
                      leading: const Icon(Icons.open_in_new),
                      title: const Text("detail.open_in_tmdb").tr(),
                      onTap: () {
                        String path;

                        switch (type) {
                          case ItemType.movie:
                            path = "movie";
                            break;
                          case ItemType.tv:
                            path = "tv";
                            break;
                          case ItemType.person:
                            path = "person";
                            break;
                        }

                        launchUrl(
                          Uri.parse(
                            "https://www.themoviedb.org/$path/$tmdbId",
                          ),
                        );
                      },
                    ),
                  if (imdbId != null)
                    ListTile(
                      leading: const Icon(Icons.open_in_new),
                      title: const Text("detail.open_in_imdb").tr(),
                      onTap: () {
                        launchUrl(
                          Uri.parse(
                            "https://www.imdb.com/${type == ItemType.person ? 'name' : 'title'}/$imdbId",
                          ),
                        );
                      },
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
