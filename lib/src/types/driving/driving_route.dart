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

  const DrivingRoute._(
      this.geometry, this.metadata, this.speedLimits, this.jamSegments);

  factory DrivingRoute._fromJson(Map<dynamic, dynamic> json) {
    // print('speed limit');
    // print((json['speedLimits'] as List).length);
    // print(json['speedLimits']);
    // print('jam segments');
    // print((json['jamSegments'] as List).length);
    // print(json['jamSegments']);
    // print('geometry');
    // print(json['geometry']);
    // print((json['geometry'] as List).length);

    final speedLimits = <double>[];

    for (final limit in (json['speedLimits'] as List?) ?? []) {
      try {
        speedLimits.add(double.parse(limit.toString()));
      } catch (e) {
        speedLimits.add(0);
      }
    }

    return DrivingRoute._(
      json['geometry']
          .map<Point>((dynamic resultPoint) => Point._fromJson(resultPoint))
          .toList(),
      DrivingSectionMetadata._fromJson(json['metadata']),
      speedLimits,
      json['jamSegments']
          .map<JamSegment>(
              (dynamic jamSegment) => JamSegment._fromJson(jamSegment))
          .toList(),
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
