///
//  Generated code. Do not modify.
//  source: news.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'request.pb.dart' as $0;
import 'news.pb.dart' as $3;
import 'response.pb.dart' as $2;
export 'news.pb.dart';

class NewsServiceClient extends $grpc.Client {
  static final _$getOne = $grpc.ClientMethod<$0.IdRequest, $3.News>(
      '/NewsService/getOne',
      ($0.IdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.News.fromBuffer(value));
  static final _$getAll = $grpc.ClientMethod<$0.AllRequest, $3.News>(
      '/NewsService/getAll',
      ($0.AllRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.News.fromBuffer(value));
  static final _$create = $grpc.ClientMethod<$3.CreateNews, $3.News>(
      '/NewsService/create',
      ($3.CreateNews value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.News.fromBuffer(value));
  static final _$update = $grpc.ClientMethod<$3.UpdateNews, $3.News>(
      '/NewsService/update',
      ($3.UpdateNews value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.News.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$0.IdRequest, $2.Response>(
      '/NewsService/delete',
      ($0.IdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Response.fromBuffer(value));

  NewsServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.News> getOne($0.IdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOne, request, options: options);
  }

  $grpc.ResponseStream<$3.News> getAll($0.AllRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getAll, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$3.News> create($3.CreateNews request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$3.News> update($3.UpdateNews request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$2.Response> delete($0.IdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }
}

abstract class NewsServiceBase extends $grpc.Service {
  $core.String get $name => 'NewsService';

  NewsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.IdRequest, $3.News>(
        'getOne',
        getOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IdRequest.fromBuffer(value),
        ($3.News value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AllRequest, $3.News>(
        'getAll',
        getAll_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.AllRequest.fromBuffer(value),
        ($3.News value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreateNews, $3.News>(
        'create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.CreateNews.fromBuffer(value),
        ($3.News value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateNews, $3.News>(
        'update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.UpdateNews.fromBuffer(value),
        ($3.News value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IdRequest, $2.Response>(
        'delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IdRequest.fromBuffer(value),
        ($2.Response value) => value.writeToBuffer()));
  }

  $async.Future<$3.News> getOne_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IdRequest> request) async {
    return getOne(call, await request);
  }

  $async.Stream<$3.News> getAll_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AllRequest> request) async* {
    yield* getAll(call, await request);
  }

  $async.Future<$3.News> create_Pre(
      $grpc.ServiceCall call, $async.Future<$3.CreateNews> request) async {
    return create(call, await request);
  }

  $async.Future<$3.News> update_Pre(
      $grpc.ServiceCall call, $async.Future<$3.UpdateNews> request) async {
    return update(call, await request);
  }

  $async.Future<$2.Response> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IdRequest> request) async {
    return delete(call, await request);
  }

  $async.Future<$3.News> getOne($grpc.ServiceCall call, $0.IdRequest request);
  $async.Stream<$3.News> getAll($grpc.ServiceCall call, $0.AllRequest request);
  $async.Future<$3.News> create($grpc.ServiceCall call, $3.CreateNews request);
  $async.Future<$3.News> update($grpc.ServiceCall call, $3.UpdateNews request);
  $async.Future<$2.Response> delete(
      $grpc.ServiceCall call, $0.IdRequest request);
}
