import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../domain/device_repository.dart';

part 'device_event.dart';

part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final DeviceRepository deviceRepository;

  DeviceBloc(this.deviceRepository) : super(DeviceState()) {
    on<DeviceEventForTest>((event, emit) async {
      emit(DeviceState(status: 1));
      await this.deviceRepository.add();
      await this.deviceRepository.disconnect();
      emit(DeviceState(status: 2));
      await this.deviceRepository.delay();
      emit(DeviceState(status: 3));
    });
  }
}
