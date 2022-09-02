part of 'device_bloc.dart';

abstract class DeviceEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DeviceEventForTest extends DeviceEvent {
  DeviceEventForTest();

  @override
  List<Object> get props => [];
}
