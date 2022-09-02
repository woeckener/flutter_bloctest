import 'dart:async';

import '../domain/device_repository.dart';

class DemoDevicesRepoImpl implements DeviceRepository {
  @override
  Future<void> add() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<void> delay() async {
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<void> disconnect() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
