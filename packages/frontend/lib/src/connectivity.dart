import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/src/env/env.dart';
import 'package:frontend/src/locator.dart';
import 'package:frontend/src/repository/status_repository.dart';
import 'package:frontend/src/screens/widgets/widgets.dart' show ShowSnackbar;
import 'package:shared/shared.dart' hide context;

class Connectivity extends StatefulWidget {
  const Connectivity({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  State<Connectivity> createState() => _ConnectivityState();
}

class _ConnectivityState extends State<Connectivity> {
  late final Timer _timer;
  late final StatusRepository _statusRepository;
  late final ClientChannel _channel;

  @override
  void initState() {
    super.initState();
    _channel = ClientChannel(
      Env.serverHost,
      port: Env.port,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        connectionTimeout: const Duration(seconds: 2),
        idleTimeout: const Duration(seconds: 2),
        backoffStrategy: (_) => const Duration(seconds: 2),
      ),
    );
    _statusRepository = StatusRepository(
      StatusServiceClient(
        _channel,
        interceptors: <ClientInterceptor>[locator<AuthTokenInterceptor>()],
      ),
    );
    _timer = Timer.periodic(const Duration(seconds: 8), _onTimerTick);
  }

  Future<void> _onTimerTick(Timer t) => _statusRepository
      .status()
      .match(
        (Object error) => context.showSnackBar(
          'No connection to backend $error',
        ),
        (Status status) => context.showSnackBar(
          'Server time: ${status.createdAt.toDateTime().toBeautifyString}',
        ),
      )
      .run();

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    _timer.cancel();
    _channel.shutdown();
    super.dispose();
  }
}

extension on DateTime {
  String get toBeautifyString =>
      '$day.$month.$year ${hour < 10 ? '0$hour' : hour}:${minute < 10 ? '0$minute' : minute}:${second < 10 ? '0$second' : second}';
}
