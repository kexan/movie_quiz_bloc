// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_movie_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiMovieListImpl _$$ApiMovieListImplFromJson(Map<String, dynamic> json) =>
    _$ApiMovieListImpl(
      total: (json['total'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ApiMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ApiMovieListImplToJson(_$ApiMovieListImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalPages': instance.totalPages,
      'items': instance.items,
    };
