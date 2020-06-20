import 'package:better_c25k/data/model/user_location_model.dart';
import 'package:better_c25k/domain/entities/location/user_location_entity.dart';
import 'package:better_c25k/domain/repository/repository.dart';
import 'package:better_c25k/domain/usecases/insert_location.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/domain/repository/repository.dart';

void main() {
  UserLocationsRepository locationRepository;
  LocationService locationService;
  InsertLocation usecase;

  const int workoutId = 0;
  const int locationId = 0;

  setUp(() {
    locationRepository = MockLocationRepository();
    locationService = MockLocationService();

    usecase = InsertLocation(
      locationRepository: locationRepository,
      locationService: locationService,
    );
  });

  test('should get a location and insert it into the repository', () async {
    // arrange
    when(locationService.getLocation()).thenAnswer((_) async => Right(
          UserLocationModel(
              latitude: 0,
              longitude: 0,
              speedInMetersPerSecond: 0,
              time: DateTime.fromMillisecondsSinceEpoch(0)),
        ));
    when(
      locationRepository.insertLocation(
        UserLocationEntity(
            latitude: 0,
            longitude: 0,
            speedInMetersPerSecond: 0,
            time: DateTime.fromMillisecondsSinceEpoch(0)),
        workoutId,
      ),
    ).thenAnswer((_) async => const Right(locationId));

    // act
    final result = await usecase(workoutId);

    // assert
    expect(result, const Right(locationId));

    verify(locationService.getLocation());
    verify(locationRepository.insertLocation(
      UserLocationEntity(
          latitude: 0,
          longitude: 0,
          speedInMetersPerSecond: 0,
          time: DateTime.fromMillisecondsSinceEpoch(0)),
      workoutId,
    ));
    verifyNoMoreInteractions(locationService);
    verifyNoMoreInteractions(locationRepository);
  });
}
