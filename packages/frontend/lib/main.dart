import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/app.dart';
import 'package:frontend/src/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kReleaseMode) _prepareErrorHandling();

  await setUpLocator();

  runApp(const App());
}

/// Create error handling
void _prepareErrorHandling() {
  FlutterError.onError = FlutterError.dumpErrorToConsole;
  PlatformDispatcher.instance.onError = (Object error, StackTrace? stack) {
    FlutterError.dumpErrorToConsole(
      FlutterErrorDetails(exception: error, stack: stack),
    );

    return true;
  };
  ErrorWidget.builder = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);

    final Widget error = Material(
      child: Text(
        'Sorry! An error happened: ${details.exception}',
        textAlign: TextAlign.center,
      ),
    );

    return error;
  };
}
