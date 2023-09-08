import 'package:action/isar/models/pin.dart';
import 'package:action/shared/providers/isar.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin.provider.g.dart';

@riverpod
class PinService extends _$PinService {
  late Isar _db;

  @override
  void build() {
    _db = ref.watch(dbProvider);

    return;
  }

  Stream<List<Pin>> watchAllPins() {
    return _db.pins.where().sortByCreatedAtDesc().watch(fireImmediately: true);
  }

  Stream<Pin?> watchPinByTmdbId(int tmdbId) async* {
    final query = _db.pins.where().tmdbIdEqualTo(tmdbId);

    yield* query
        .watch(fireImmediately: true)
        .asyncMap((event) => event.firstOrNull);
  }

  Future addPin(Pin pin) async {
    return await _db.writeTxn(() async {
      await _db.pins.put(pin);
    });
  }

  Future removePin(Pin pin) async {
    return await _db.writeTxn(() async {
      await _db.pins.delete(pin.id);
    });
  }
}

@riverpod
Stream<Pin?> pin(PinRef ref, int tmdbId) {
  return ref.read(pinServiceProvider.notifier).watchPinByTmdbId(tmdbId);
}

@riverpod
Stream<List<Pin>> pins(PinsRef ref) {
  return ref.read(pinServiceProvider.notifier).watchAllPins();
}
