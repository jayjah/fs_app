///
//  Generated code. Do not modify.
//  source: status.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'status.pb.dart' as $4;
export 'status.pb.dart';

class StatusServiceClient extends $grpc.Client {
  static final _$ping = $grpc.ClientMethod<$4.StatusRequest, $4.Status>(
      '/StatusService/ping',
      ($4.StatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Status.fromBuffer(value));

  StatusServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$4.Status> ping($4.StatusRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$ping, request, options: options);
  }
}

abstract class StatusServiceBase extends $grpc.Service {
  $core.String get $name => 'StatusService';

  StatusServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.StatusRequest, $4.Status>(
        'ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.StatusRequest.fromBuffer(value),
        ($4.Status value) => value.writeToBuffer()));
  }

  $async.Future<$4.Status> ping_Pre(
      $grpc.ServiceCall call, $async.Future<$4.StatusRequest> request) async {
    return ping(call, await request);
  }

  $async.Future<$4.Status> ping(
      $grpc.ServiceCall call, $4.StatusRequest request);
}
