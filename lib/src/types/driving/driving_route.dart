part of yandex_mapkit;

/// Driving route.
/// A route consists of multiple sections
/// Each section has a corresponding annotation that describes the action at the beginning of the section.
class DrivingRoute extends Equatable {
  /// Route geometry.
  final List<Point> geometry;

  /// The route metadata.
  final DrivingSectionMetadata metadata;

  /// Speed limit
  final List<double> speedLimits;

  /// Jam Segment
  final List<JamSegment> jamSegments;

  const DrivingRoute._(this.geometry, this.metadata, this.speedLimits, this.jamSegments);

  factory DrivingRoute._fromJson(Map<dynamic, dynamic> json) {
    return DrivingRoute._(
      json['geometry'].map<Point>((dynamic resultPoint) => Point._fromJson(resultPoint)).toList(),
      DrivingSectionMetadata._fromJson(json['metadata']),
      ((json['speedLimits'] as List?) ?? []).map((e) => double.parse(e.toString())).toList(),
      json['jamSegments'].map<JamSegment>((dynamic jamSegment) => JamSegment._fromJson(jamSegment)).toList(),
    );
  }

  @override
  List<Object> get props => <Object>[
        geometry,
        metadata,
        speedLimits,
        jamSegments,
      ];

  @override
  bool get stringify => true;
}
