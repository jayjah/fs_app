// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';
import 'dart:isolate';

import 'package:backend/backend.dart' as backend;

Future<void> main(List<String> arguments) async {
  final int processorNumbers = Platform.numberOfProcessors;
  for (int i = 1; i <= (processorNumbers - 1); i++)
    await Isolate.spawn(createBackendInstance, i);

  await createBackendInstance(processorNumbers);
}

Future<void> createBackendInstance(final int instanceNumber) async {
  final backend.Backend instance = await backend.Backend.createInstance(
    instanceNumber,
  );
  // ignore: avoid_print
  print(instance.serverIsRunningOn);
}
