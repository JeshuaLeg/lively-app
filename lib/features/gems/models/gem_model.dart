import 'package:flutter/material.dart';

enum GemType {
  ruby,
  emerald,
  sapphire,
  diamond,
  amethyst,
  topaz,
  opal,
  onyx,
}

enum GemRarity {
  common,
  rare,
  epic,
  legendary,
}

class Gem {
  final String id;
  final GemType type;
  final GemRarity rarity;
  final String name;
  final String description;
  final Color color;
  final Color shimmerColor;
  final int baseValue;
  final DateTime? earnedAt;
  final String? sourceAction;

  const Gem({
    required this.id,
    required this.type,
    required this.rarity,
    required this.name,
    required this.description,
    required this.color,
    required this.shimmerColor,
    required this.baseValue,
    this.earnedAt,
    this.sourceAction,
  });

  factory Gem.fromJson(Map<String, dynamic> json) {
    return Gem(
      id: json['id'],
      type: GemType.values[json['type']],
      rarity: GemRarity.values[json['rarity']],
      name: json['name'],
      description: json['description'],
      color: Color(json['color']),
      shimmerColor: Color(json['shimmerColor']),
      baseValue: json['baseValue'],
      earnedAt: json['earnedAt'] != null 
          ? DateTime.parse(json['earnedAt']) 
          : null,
      sourceAction: json['sourceAction'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.index,
      'rarity': rarity.index,
      'name': name,
      'description': description,
      'color': color.value,
      'shimmerColor': shimmerColor.value,
      'baseValue': baseValue,
      'earnedAt': earnedAt?.toIso8601String(),
      'sourceAction': sourceAction,
    };
  }

  Gem copyWith({
    String? id,
    GemType? type,
    GemRarity? rarity,
    String? name,
    String? description,
    Color? color,
    Color? shimmerColor,
    int? baseValue,
    DateTime? earnedAt,
    String? sourceAction,
  }) {
    return Gem(
      id: id ?? this.id,
      type: type ?? this.type,
      rarity: rarity ?? this.rarity,
      name: name ?? this.name,
      description: description ?? this.description,
      color: color ?? this.color,
      shimmerColor: shimmerColor ?? this.shimmerColor,
      baseValue: baseValue ?? this.baseValue,
      earnedAt: earnedAt ?? this.earnedAt,
      sourceAction: sourceAction ?? this.sourceAction,
    );
  }

  int get rarityMultiplier {
    switch (rarity) {
      case GemRarity.common:
        return 1;
      case GemRarity.rare:
        return 2;
      case GemRarity.epic:
        return 4;
      case GemRarity.legendary:
        return 8;
    }
  }

  int get value => baseValue * rarityMultiplier;

  static const Map<GemType, Map<String, dynamic>> gemDefinitions = {
    GemType.ruby: {
      'name': 'Ruby',
      'description': 'A passionate red gem that burns with determination',
      'color': Color(0xFFE74C3C),
      'shimmerColor': Color(0xFFF1948A),
      'baseValue': 10,
    },
    GemType.emerald: {
      'name': 'Emerald',
      'description': 'A vibrant green gem representing growth and harmony',
      'color': Color(0xFF27AE60),
      'shimmerColor': Color(0xFF82E5AA),
      'baseValue': 15,
    },
    GemType.sapphire: {
      'name': 'Sapphire',
      'description': 'A deep blue gem symbolizing wisdom and focus',
      'color': Color(0xFF3498DB),
      'shimmerColor': Color(0xFF85C1E9),
      'baseValue': 20,
    },
    GemType.diamond: {
      'name': 'Diamond',
      'description': 'A brilliant white gem of pure clarity and strength',
      'color': Color(0xFFECF0F1),
      'shimmerColor': Color(0xFFF8F9FA),
      'baseValue': 50,
    },
    GemType.amethyst: {
      'name': 'Amethyst',
      'description': 'A mystical purple gem that enhances spiritual awareness',
      'color': Color(0xFF9B59B6),
      'shimmerColor': Color(0xFFD2B4DE),
      'baseValue': 25,
    },
    GemType.topaz: {
      'name': 'Topaz',
      'description': 'A golden gem that radiates warmth and confidence',
      'color': Color(0xFFF39C12),
      'shimmerColor': Color(0xFFFAD7A0),
      'baseValue': 30,
    },
    GemType.opal: {
      'name': 'Opal',
      'description': 'A mystical gem with shifting colors and endless beauty',
      'color': Color(0xFF6C5CE7),
      'shimmerColor': Color(0xFFA29BFE),
      'baseValue': 75,
    },
    GemType.onyx: {
      'name': 'Onyx',
      'description': 'A dark gem that holds ancient secrets and power',
      'color': Color(0xFF2C3E50),
      'shimmerColor': Color(0xFF566573),
      'baseValue': 40,
    },
  };

  static Gem create({
    required GemType type,
    required GemRarity rarity,
    DateTime? earnedAt,
    String? sourceAction,
  }) {
    final definition = gemDefinitions[type]!;
    return Gem(
      id: '${type.name}_${rarity.name}_${DateTime.now().millisecondsSinceEpoch}',
      type: type,
      rarity: rarity,
      name: definition['name'],
      description: definition['description'],
      color: definition['color'],
      shimmerColor: definition['shimmerColor'],
      baseValue: definition['baseValue'],
      earnedAt: earnedAt ?? DateTime.now(),
      sourceAction: sourceAction,
    );
  }
}

class GemCollection {
  final List<Gem> gems;
  final Map<GemType, int> gemCounts;
  final int totalValue;

  const GemCollection({
    required this.gems,
    required this.gemCounts,
    required this.totalValue,
  });

  factory GemCollection.fromGems(List<Gem> gems) {
    final counts = <GemType, int>{};
    int totalValue = 0;

    for (final gem in gems) {
      counts[gem.type] = (counts[gem.type] ?? 0) + 1;
      totalValue += gem.value;
    }

    return GemCollection(
      gems: gems,
      gemCounts: counts,
      totalValue: totalValue,
    );
  }

  factory GemCollection.empty() {
    return const GemCollection(
      gems: [],
      gemCounts: {},
      totalValue: 0,
    );
  }

  GemCollection addGem(Gem gem) {
    final newGems = List<Gem>.from(gems)..add(gem);
    return GemCollection.fromGems(newGems);
  }

  List<Gem> getGemsByType(GemType type) {
    return gems.where((gem) => gem.type == type).toList();
  }

  List<Gem> getGemsByRarity(GemRarity rarity) {
    return gems.where((gem) => gem.rarity == rarity).toList();
  }

  int getCountByType(GemType type) {
    return gemCounts[type] ?? 0;
  }

  int getCountByRarity(GemRarity rarity) {
    return gems.where((gem) => gem.rarity == rarity).length;
  }
} 