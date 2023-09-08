// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$personDetailsHash() => r'7ea5b4d2f793e67efa88180dbe2a00bb37758365';

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

typedef PersonDetailsRef = AutoDisposeFutureProviderRef<Person>;

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
    this.id,
  ) : super.internal(
          (ref) => personDetails(
            ref,
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
        );

  final int id;

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
