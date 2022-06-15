part of yandex_mapkit;

class JamSegment extends Equatable {
  const JamSegment({
    required this.jamType,
    required this.speed
  });

  final String jamType;
  final double speed;

  @override
  List<Object> get props => <Object>[
    jamType,
    speed
  ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return {
      'latitude': jamType,
      'speed': speed,
    };
  }

  factory JamSegment._fromJson(Map<dynamic, dynamic> json) {
    return JamSegment(
        jamType: json['jamType'].toString(),
        speed: double.parse(json['speed'].toString())
    );
  }
}
