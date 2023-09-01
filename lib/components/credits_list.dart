import 'package:action/components/poster_tile.dart';
import 'package:action/models/cast.dart';
import 'package:action/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CreditsList extends StatelessWidget {
  final List<Cast> people;

  const CreditsList({
    super.key,
    required this.people,
  });

  @override
  Widget build(BuildContext context) {
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
}
