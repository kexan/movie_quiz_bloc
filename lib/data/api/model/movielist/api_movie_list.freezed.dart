// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_movie_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiMovieList _$ApiMovieListFromJson(Map<String, dynamic> json) {
  return _ApiMovieList.fromJson(json);
}

/// @nodoc
mixin _$ApiMovieList {
  int get total => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  List<ApiMovie> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiMovieListCopyWith<ApiMovieList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiMovieListCopyWith<$Res> {
  factory $ApiMovieListCopyWith(
          ApiMovieList value, $Res Function(ApiMovieList) then) =
      _$ApiMovieListCopyWithImpl<$Res, ApiMovieList>;
  @useResult
  $Res call({int total, int totalPages, List<ApiMovie> items});
}

/// @nodoc
class _$ApiMovieListCopyWithImpl<$Res, $Val extends ApiMovieList>
    implements $ApiMovieListCopyWith<$Res> {
  _$ApiMovieListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? totalPages = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ApiMovie>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiMovieListImplCopyWith<$Res>
    implements $ApiMovieListCopyWith<$Res> {
  factory _$$ApiMovieListImplCopyWith(
          _$ApiMovieListImpl value, $Res Function(_$ApiMovieListImpl) then) =
      __$$ApiMovieListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int totalPages, List<ApiMovie> items});
}

/// @nodoc
class __$$ApiMovieListImplCopyWithImpl<$Res>
    extends _$ApiMovieListCopyWithImpl<$Res, _$ApiMovieListImpl>
    implements _$$ApiMovieListImplCopyWith<$Res> {
  __$$ApiMovieListImplCopyWithImpl(
      _$ApiMovieListImpl _value, $Res Function(_$ApiMovieListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? totalPages = null,
    Object? items = null,
  }) {
    return _then(_$ApiMovieListImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ApiMovie>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiMovieListImpl implements _ApiMovieList {
  const _$ApiMovieListImpl(
      {required this.total,
      required this.totalPages,
      required final List<ApiMovie> items})
      : _items = items;

  factory _$ApiMovieListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiMovieListImplFromJson(json);

  @override
  final int total;
  @override
  final int totalPages;
  final List<ApiMovie> _items;
  @override
  List<ApiMovie> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ApiMovieList(total: $total, totalPages: $totalPages, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiMovieListImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, totalPages,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiMovieListImplCopyWith<_$ApiMovieListImpl> get copyWith =>
      __$$ApiMovieListImplCopyWithImpl<_$ApiMovieListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiMovieListImplToJson(
      this,
    );
  }
}

abstract class _ApiMovieList implements ApiMovieList {
  const factory _ApiMovieList(
      {required final int total,
      required final int totalPages,
      required final List<ApiMovie> items}) = _$ApiMovieListImpl;

  factory _ApiMovieList.fromJson(Map<String, dynamic> json) =
      _$ApiMovieListImpl.fromJson;

  @override
  int get total;
  @override
  int get totalPages;
  @override
  List<ApiMovie> get items;
  @override
  @JsonKey(ignore: true)
  _$$ApiMovieListImplCopyWith<_$ApiMovieListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
