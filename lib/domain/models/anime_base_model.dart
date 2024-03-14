// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kraken_anime/domain/models/anime_model.dart';
import 'package:kraken_anime/domain/models/anime_pagination_model.dart';

class AnimeBaseModel {
  final AnimePaginationModel? pagination;
  final List<AnimeModel>? data;
  AnimeBaseModel({
    this.pagination,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pagination': pagination?.toJson(),
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }

  factory AnimeBaseModel.fromMap(Map<String, dynamic> map) {
    return AnimeBaseModel(
      pagination: map['pagination'] != null
          ? AnimePaginationModel.fromJson(map['pagination'])
          : null,
      data: map['data'] != null
          ? (map['data'] as List).map((e) => AnimeModel.fromJson(e)).toList()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimeBaseModel.fromJson(String source) =>
      AnimeBaseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
