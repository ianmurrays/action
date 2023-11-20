import 'package:action/shared/providers/settings.provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fastHome = ref.watch(fastHomeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            AutoRouter.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('settings.fastHome.title').tr(),
            subtitle: const Text('settings.fastHome.description').tr(),
            trailing: fastHome.isLoading
                ? const CircularProgressIndicator()
                : Switch.adaptive(
                    value: fastHome.value!,
                    onChanged: (value) {
                      ref.read(fastHomeProvider.notifier).set(value);
                    },
                  ),
            onTap: () {},
          ),
          ListTile(
            title: const Text('settings.about').tr(),
            onTap: () {
              final dialog = AboutDialog(
                applicationName: 'Action!',
                applicationVersion: '1.0.0',
                applicationIcon: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/icon/icon.png'),
                  ),
                ),
                children: [
                  const Text('settings.no_guarantees').tr(),
                ],
              );

              showDialog(
                context: context,
                builder: (context) => dialog,
              );
            },
          ),
        ],
      ),
    );
  }
}
