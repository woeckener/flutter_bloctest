part of 'device_bloc.dart';

class DeviceState extends Equatable {
  const DeviceState({this.status = 0});

  final int status;

  @override
  List<Object?> get props => [status];
}
