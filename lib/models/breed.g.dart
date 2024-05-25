// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breed _$BreedFromJson(Map<String, dynamic> json) => Breed(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      referenceImageId: json['reference_image_id'] as String? ?? '',
      temperament: json['temperament'] as String? ?? '',
      origin: json['origin'] as String? ?? '',
      lifeSpan: json['life_span'] as String? ?? '',
      wikipediaUrl: json['wikipedia_url'] as String? ?? '',
      cfaUrl: json['cfa_url'] as String? ?? '',
      vetstreetUrl: json['vetstreet_url'] as String? ?? '',
      vcahospitalsUrl: json['vcahospitals_url'] as String? ?? '',
      adaptability: (json['adaptability'] as num?)?.toInt() ?? 0,
      affectionLevel: (json['affection_level'] as num?)?.toInt() ?? 0,
      childFriendly: (json['child_friendly'] as num?)?.toInt() ?? 0,
      dogFriendly: (json['dog_friendly'] as num?)?.toInt() ?? 0,
      energyLevel: (json['energy_level'] as num?)?.toInt() ?? 0,
      grooming: (json['grooming'] as num?)?.toInt() ?? 0,
      healthIssues: (json['health_issues'] as num?)?.toInt() ?? 0,
      intelligence: (json['intelligence'] as num?)?.toInt() ?? 0,
      sheddingLevel: (json['shedding_level'] as num?)?.toInt() ?? 0,
      socialNeeds: (json['social_needs'] as num?)?.toInt() ?? 0,
      strangerFriendly: (json['stranger_friendly'] as num?)?.toInt() ?? 0,
      vocalisation: (json['vocalisation'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BreedToJson(Breed instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'reference_image_id': instance.referenceImageId,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'life_span': instance.lifeSpan,
      'wikipedia_url': instance.wikipediaUrl,
      'cfa_url': instance.cfaUrl,
      'vetstreet_url': instance.vetstreetUrl,
      'vcahospitals_url': instance.vcahospitalsUrl,
      'adaptability': instance.adaptability,
      'affection_level': instance.affectionLevel,
      'child_friendly': instance.childFriendly,
      'dog_friendly': instance.dogFriendly,
      'energy_level': instance.energyLevel,
      'grooming': instance.grooming,
      'health_issues': instance.healthIssues,
      'intelligence': instance.intelligence,
      'shedding_level': instance.sheddingLevel,
      'social_needs': instance.socialNeeds,
      'stranger_friendly': instance.strangerFriendly,
      'vocalisation': instance.vocalisation,
    };
