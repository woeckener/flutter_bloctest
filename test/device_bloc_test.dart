import 'package:bloctest/device_bloc/device_bloc.dart';
import 'package:bloctest/domain/device_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDeviceRepositoryImpl extends Mock implements DeviceRepository {}

void main() {
  late MockDeviceRepositoryImpl deviceRepository;
  late DeviceBloc bloc;

  setUp(() async {
    deviceRepository = MockDeviceRepositoryImpl();
    bloc = DeviceBloc(deviceRepository);
  });

  blocTest(
    'mock three repository calls for one event',
    build: () {
      when(() => deviceRepository.add()).thenAnswer((_) {
        print('add');
        return Future(() {});
      });
      when(() => deviceRepository.disconnect()).thenAnswer((_) {
        print('disconnect');
        return Future(() {});
      });
      when(() => deviceRepository.delay()).thenAnswer((_) {
        print('delay');
        return Future(() {});
      });
      return bloc;
    },
    seed: () => DeviceState(status: 0),
    act: (DeviceBloc bloc) => bloc.add(DeviceEventForTest()),
    expect: () => [
      DeviceState(status: 1),
      DeviceState(status: 2),
      DeviceState(status: 3),
    ],
  );
}
