import 'package:action/modules/search/providers/search_items.provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef SearchCallback = void Function(String query);

class LatestSearches extends HookConsumerWidget {
  final SearchCallback onSearch;

  const LatestSearches({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchItems = ref.watch(watchSearchItemsProvider);

    if (!searchItems.hasValue) {
      return const SliverToBoxAdapter();
    }

    final items = searchItems.value!;

    return SliverPadding(
      padding: const EdgeInsets.only(top: 10, left: 20),
      sliver: SliverList.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              ref
                  .read(searchItemsServiceProvider.notifier)
                  .removeSearchItem(item);
            },
            key: ValueKey(item.id),
            background: Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              // align the child to the right
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete),
            ),
            child: ListTile(
              dense: true,
              title: Text(item.query!),
              trailing: IconButton(
                onPressed: () {
                  ref
                      .read(searchItemsServiceProvider.notifier)
                      .removeSearchItem(item);
                },
                icon: const Icon(Icons.close),
              ),
              onTap: () {
                onSearch(item.query!);
              },
            ),
          );
        },
      ),
    );
  }
}
