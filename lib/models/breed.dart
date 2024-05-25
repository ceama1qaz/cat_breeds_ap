import 'package:json_annotation/json_annotation.dart';

part 'breed.g.dart';

@JsonSerializable()
class Breed {
  final String id;
  final String name;
  final String description;
  
  @JsonKey(name: 'reference_image_id', defaultValue: '')
  final String referenceImageId;
  
  @JsonKey(defaultValue: '')
  final String temperament;
  
  @JsonKey(defaultValue: '')
  final String origin;
  
  @JsonKey(name: 'life_span', defaultValue: '')
  final String lifeSpan;
  
  @JsonKey(name: 'wikipedia_url', defaultValue: '')
  final String wikipediaUrl;
  
  @JsonKey(name: 'cfa_url', defaultValue: '')
  final String cfaUrl;
  
  @JsonKey(name: 'vetstreet_url', defaultValue: '')
  final String vetstreetUrl;
  
  @JsonKey(name: 'vcahospitals_url', defaultValue: '')
  final String vcahospitalsUrl;
  
  @JsonKey(defaultValue: 0)
  final int adaptability;
  
  @JsonKey(name: 'affection_level', defaultValue: 0)
  final int affectionLevel;
  
  @JsonKey(name: 'child_friendly', defaultValue: 0)
  final int childFriendly;
  
  @JsonKey(name: 'dog_friendly', defaultValue: 0)
  final int dogFriendly;
  
  @JsonKey(name: 'energy_level', defaultValue: 0)
  final int energyLevel;
  
  @JsonKey(defaultValue: 0)
  final int grooming;
  
  @JsonKey(name: 'health_issues', defaultValue: 0)
  final int healthIssues;
  
  @JsonKey(defaultValue: 0)
  final int intelligence;
  
  @JsonKey(name: 'shedding_level', defaultValue: 0)
  final int sheddingLevel;
  
  @JsonKey(name: 'social_needs', defaultValue: 0)
  final int socialNeeds;
  
  @JsonKey(name: 'stranger_friendly', defaultValue: 0)
  final int strangerFriendly;
  
  @JsonKey(defaultValue: 0)
  final int vocalisation;

  Breed({
    required this.id,
    required this.name,
    required this.description,
    this.referenceImageId = '',
    this.temperament = '',
    this.origin = '',
    this.lifeSpan = '',
    this.wikipediaUrl = '',
    this.cfaUrl = '',
    this.vetstreetUrl = '',
    this.vcahospitalsUrl = '',
    this.adaptability = 0,
    this.affectionLevel = 0,
    this.childFriendly = 0,
    this.dogFriendly = 0,
    this.energyLevel = 0,
    this.grooming = 0,
    this.healthIssues = 0,
    this.intelligence = 0,
    this.sheddingLevel = 0,
    this.socialNeeds = 0,
    this.strangerFriendly = 0,
    this.vocalisation = 0,
  });

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  Map<String, dynamic> toJson() => _$BreedToJson(this);
}

