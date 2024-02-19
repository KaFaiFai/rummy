// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      json['rank'] as int,
      json['suit'] as int,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'rank': instance.rank,
      'suit': instance.suit,
    };
