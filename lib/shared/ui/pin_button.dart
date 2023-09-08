import 'package:action/isar/models/pin.dart';
import 'package:action/shared/providers/pin.provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef PinBuilderCallback = Pin Function();

class PinButton extends HookConsumerWidget {
  final PinBuilderCallback pinBuilderCallback;
  final int tmdbId;

  const PinButton({
    super.key,
    required this.tmdbId,
    required this.pinBuilderCallback,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pin = ref.watch(pinProvider(tmdbId));

    return pin.when(
      data: (data) => IconButton(
        icon: data != null
            ? const Icon(Icons.push_pin)
            : const Icon(Icons.push_pin_outlined),
        onPressed: () {
          if (data != null) {
            ref.read(pinServiceProvider.notifier).removePin(data);
          } else {
            ref.read(pinServiceProvider.notifier).addPin(pinBuilderCallback());
          }
        },
      ),
      loading: () => const IconButton(
        icon: Icon(Icons.push_pin_outlined),
        onPressed: null,
      ),
      error: (e, trace) {
        debugPrint(e.toString());
        debugPrint(trace.toString());

        return const IconButton(
          icon: Icon(Icons.push_pin_outlined),
          onPressed: null,
        );
      },
    );
  }
}
