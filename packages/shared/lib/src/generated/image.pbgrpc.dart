///
//  Generated code. Do not modify.
//  source: image.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'request.pb.dart' as $0;
import 'image.pb.dart' as $1;
import 'response.pb.dart' as $2;
export 'image.pb.dart';

class ImageServiceClient extends $grpc.Client {
  static final _$getOne = $grpc.ClientMethod<$0.IdRequest, $1.File>(
      '/ImageService/getOne',
      ($0.IdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.File.fromBuffer(value));
  static final _$getAll = $grpc.ClientMethod<$0.AllRequest, $1.Image>(
      '/ImageService/getAll',
      ($0.AllRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Image.fromBuffer(value));
  static final _$createFile = $grpc.ClientMethod<$1.File, $1.Image>(
      '/ImageService/createFile',
      ($1.File value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Image.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$0.IdRequest, $2.Response>(
      '/ImageService/delete',
      ($0.IdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Response.fromBuffer(value));

  ImageServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$1.File> getOne($0.IdRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getOne, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$1.Image> getAll($0.AllRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getAll, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$1.Image> createFile($async.Stream<$1.File> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$createFile, request, options: options).single;
  }

  $grpc.ResponseFuture<$2.Response> delete($0.IdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }
}

abstract class ImageServiceBase extends $grpc.Service {
  $core.String get $name => 'ImageService';

  ImageServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.IdRequest, $1.File>(
        'getOne',
        getOne_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.IdRequest.fromBuffer(value),
        ($1.File value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AllRequest, $1.Image>(
        'getAll',
        getAll_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.AllRequest.fromBuffer(value),
        ($1.Image value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.File, $1.Image>(
        'createFile',
        createFile,
        true,
        false,
        ($core.List<$core.int> value) => $1.File.fromBuffer(value),
        ($1.Image value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IdRequest, $2.Response>(
        'delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IdRequest.fromBuffer(value),
        ($2.Response value) => value.writeToBuffer()));
  }

  $async.Stream<$1.File> getOne_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IdRequest> request) async* {
    yield* getOne(call, await request);
  }

  $async.Stream<$1.Image> getAll_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AllRequest> request) async* {
    yield* getAll(call, await request);
  }

  $async.Future<$2.Response> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IdRequest> request) async {
    return delete(call, await request);
  }

  $async.Stream<$1.File> getOne($grpc.ServiceCall call, $0.IdRequest request);
  $async.Stream<$1.Image> getAll($grpc.ServiceCall call, $0.AllRequest request);
  $async.Future<$1.Image> createFile(
      $grpc.ServiceCall call, $async.Stream<$1.File> request);
  $async.Future<$2.Response> delete(
      $grpc.ServiceCall call, $0.IdRequest request);
}
