class GameModel {
  final List<int> firstZone;
  final List<int> secondZone;
  final List<int> thirdZone;
  final List<int> fourthZone;
  final List<int> fifthZone;
  final List<int> sixthZone;
  final List<int> seventhZone;
  final List<int> allElements;
  final String? selectedUser;

  GameModel({
    required this.firstZone,
    required this.secondZone,
    required this.thirdZone,
    required this.fourthZone,
    required this.fifthZone,
    required this.sixthZone,
    required this.seventhZone,
    required this.allElements,
    required this.selectedUser,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      firstZone: List<int>.from(json['1']),
      secondZone: List<int>.from(json['2']),
      thirdZone: List<int>.from(json['3']),
      fourthZone: List<int>.from(json['4']),
      fifthZone: List<int>.from(json['5']),
      sixthZone: List<int>.from(json['6']),
      seventhZone: List<int>.from(json['7']),
      allElements: List<int>.from(json['allElement']),
      selectedUser: json['selectedUser'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '1': firstZone,
      '2': secondZone,
      '3': thirdZone,
      '4': fourthZone,
      '5': fifthZone,
      '6': sixthZone,
      '7': seventhZone,
      'allElement': allElements,
      'selectedUser': selectedUser,
    };
  }

  @override
  String toString() {
    return '''
GameModel(
  firstZone: $firstZone,
  secondZone: $secondZone,
  thirdZone: $thirdZone,
  fourthZone: $fourthZone,
  fifthZone: $fifthZone,
  sixthZone: $sixthZone,
  seventhZone: $seventhZone,
  allElements: $allElements,
  selectedUser: $selectedUser,
)
''';
  }
}
