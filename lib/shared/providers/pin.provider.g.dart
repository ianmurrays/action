// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pinHash() => r'3113009fc715505ed3d53c0ab65260e282bc73c6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [pin].
@ProviderFor(pin)
const pinProvider = PinFamily();

/// See also [pin].
class PinFamily extends Family<AsyncValue<Pin?>> {
  /// See also [pin].
  const PinFamily();

  /// See also [pin].
  PinProvider call(
    int tmdbId,
  ) {
    return PinProvider(
      tmdbId,
    );
  }

  @override
  PinProvider getProviderOverride(
    covariant PinProvider provider,
  ) {
    return call(
      provider.tmdbId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'pinProvider';
}

/// See also [pin].
class PinProvider extends AutoDisposeStreamProvider<Pin?> {
  /// See also [pin].
  PinProvider(
    int tmdbId,
  ) : this._internal(
          (ref) => pin(
            ref as PinRef,
            tmdbId,
          ),
          from: pinProvider,
          name: r'pinProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$pinHash,
          dependencies: PinFamily._dependencies,
          allTransitiveDependencies: PinFamily._allTransitiveDependencies,
          tmdbId: tmdbId,
        );

  PinProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tmdbId,
  }) : super.internal();

  final int tmdbId;

  @override
  Override overrideWith(
    Stream<Pin?> Function(PinRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PinProvider._internal(
        (ref) => create(ref as PinRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tmdbId: tmdbId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Pin?> createElement() {
    return _PinProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PinProvider && other.tmdbId == tmdbId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tmdbId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PinRef on AutoDisposeStreamProviderRef<Pin?> {
  /// The parameter `tmdbId` of this provider.
  int get tmdbId;
}

class _PinProviderElement extends AutoDisposeStreamProviderElement<Pin?>
    with PinRef {
  _PinProviderElement(super.provider);

  @override
  int get tmdbId => (origin as PinProvider).tmdbId;
}

String _$pinsHash() => r'e5e2ed4b458ced4c04c6b7e2f7b1ef166704a142';

/// See also [pins].
@ProviderFor(pins)
final pinsProvider = AutoDisposeStreamProvider<List<Pin>>.internal(
  pins,
  name: r'pinsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pinsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PinsRef = AutoDisposeStreamProviderRef<List<Pin>>;
String _$pinServiceHash() => r'8f86a093fdc1711592d143c26ccc0476c87e8ca7';

/// See also [PinService].
@ProviderFor(PinService)
final pinServiceProvider =
    AutoDisposeNotifierProvider<PinService, void>.internal(
  PinService.new,
  name: r'pinServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pinServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PinService = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
