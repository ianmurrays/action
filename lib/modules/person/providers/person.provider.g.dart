// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$personDetailsHash() => r'999ac483e7b444052ec917b4ca040011ceabaf07';

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

/// See also [personDetails].
@ProviderFor(personDetails)
const personDetailsProvider = PersonDetailsFamily();

/// See also [personDetails].
class PersonDetailsFamily extends Family<AsyncValue<Person>> {
  /// See also [personDetails].
  const PersonDetailsFamily();

  /// See also [personDetails].
  PersonDetailsProvider call(
    int id,
  ) {
    return PersonDetailsProvider(
      id,
    );
  }

  @override
  PersonDetailsProvider getProviderOverride(
    covariant PersonDetailsProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'personDetailsProvider';
}

/// See also [personDetails].
class PersonDetailsProvider extends AutoDisposeFutureProvider<Person> {
  /// See also [personDetails].
  PersonDetailsProvider(
    int id,
  ) : this._internal(
          (ref) => personDetails(
            ref as PersonDetailsRef,
            id,
          ),
          from: personDetailsProvider,
          name: r'personDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$personDetailsHash,
          dependencies: PersonDetailsFamily._dependencies,
          allTransitiveDependencies:
              PersonDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  PersonDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Person> Function(PersonDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PersonDetailsProvider._internal(
        (ref) => create(ref as PersonDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Person> createElement() {
    return _PersonDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PersonDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PersonDetailsRef on AutoDisposeFutureProviderRef<Person> {
  /// The parameter `id` of this provider.
  int get id;
}

class _PersonDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Person> with PersonDetailsRef {
  _PersonDetailsProviderElement(super.provider);

  @override
  int get id => (origin as PersonDetailsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
