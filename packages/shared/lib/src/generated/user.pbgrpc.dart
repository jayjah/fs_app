///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'request.pb.dart' as $0;
import 'user.pb.dart' as $5;
import 'response.pb.dart' as $2;
export 'user.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$getOne = $grpc.ClientMethod<$0.IdRequest, $5.User>(
      '/UserService/getOne',
      ($0.IdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.User.fromBuffer(value));
  static final _$getAll = $grpc.ClientMethod<$0.AllRequest, $5.User>(
      '/UserService/getAll',
      ($0.AllRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.User.fromBuffer(value));
  static final _$create = $grpc.ClientMethod<$5.CreateUser, $5.User>(
      '/UserService/create',
      ($5.CreateUser value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.User.fromBuffer(value));
  static final _$update = $grpc.ClientMethod<$5.UpdateUser, $5.User>(
      '/UserService/update',
      ($5.UpdateUser value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.User.fromBuffer(value));
  static final _$delete = $grpc.ClientMethod<$0.IdRequest, $2.Response>(
      '/UserService/delete',
      ($0.IdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Response.fromBuffer(value));
  static final _$login =
      $grpc.ClientMethod<$5.LoginUserRequest, $5.LoginResponse>(
          '/UserService/login',
          ($5.LoginUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $5.LoginResponse.fromBuffer(value));
  static final _$isLoggedIn =
      $grpc.ClientMethod<$5.LoggedInUserRequest, $5.LoggedInResponse>(
          '/UserService/isLoggedIn',
          ($5.LoggedInUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $5.LoggedInResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$5.User> getOne($0.IdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOne, request, options: options);
  }

  $grpc.ResponseStream<$5.User> getAll($0.AllRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getAll, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$5.User> create($5.CreateUser request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$5.User> update($5.UpdateUser request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$2.Response> delete($0.IdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$5.LoginResponse> login($5.LoginUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$5.LoggedInResponse> isLoggedIn(
      $5.LoggedInUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isLoggedIn, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.IdRequest, $5.User>(
        'getOne',
        getOne_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IdRequest.fromBuffer(value),
        ($5.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AllRequest, $5.User>(
        'getAll',
        getAll_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.AllRequest.fromBuffer(value),
        ($5.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.CreateUser, $5.User>(
        'create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.CreateUser.fromBuffer(value),
        ($5.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.UpdateUser, $5.User>(
        'update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.UpdateUser.fromBuffer(value),
        ($5.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IdRequest, $2.Response>(
        'delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IdRequest.fromBuffer(value),
        ($2.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.LoginUserRequest, $5.LoginResponse>(
        'login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.LoginUserRequest.fromBuffer(value),
        ($5.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.LoggedInUserRequest, $5.LoggedInResponse>(
        'isLoggedIn',
        isLoggedIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $5.LoggedInUserRequest.fromBuffer(value),
        ($5.LoggedInResponse value) => value.writeToBuffer()));
  }

  $async.Future<$5.User> getOne_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IdRequest> request) async {
    return getOne(call, await request);
  }

  $async.Stream<$5.User> getAll_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AllRequest> request) async* {
    yield* getAll(call, await request);
  }

  $async.Future<$5.User> create_Pre(
      $grpc.ServiceCall call, $async.Future<$5.CreateUser> request) async {
    return create(call, await request);
  }

  $async.Future<$5.User> update_Pre(
      $grpc.ServiceCall call, $async.Future<$5.UpdateUser> request) async {
    return update(call, await request);
  }

  $async.Future<$2.Response> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$0.IdRequest> request) async {
    return delete(call, await request);
  }

  $async.Future<$5.LoginResponse> login_Pre($grpc.ServiceCall call,
      $async.Future<$5.LoginUserRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$5.LoggedInResponse> isLoggedIn_Pre($grpc.ServiceCall call,
      $async.Future<$5.LoggedInUserRequest> request) async {
    return isLoggedIn(call, await request);
  }

  $async.Future<$5.User> getOne($grpc.ServiceCall call, $0.IdRequest request);
  $async.Stream<$5.User> getAll($grpc.ServiceCall call, $0.AllRequest request);
  $async.Future<$5.User> create($grpc.ServiceCall call, $5.CreateUser request);
  $async.Future<$5.User> update($grpc.ServiceCall call, $5.UpdateUser request);
  $async.Future<$2.Response> delete(
      $grpc.ServiceCall call, $0.IdRequest request);
  $async.Future<$5.LoginResponse> login(
      $grpc.ServiceCall call, $5.LoginUserRequest request);
  $async.Future<$5.LoggedInResponse> isLoggedIn(
      $grpc.ServiceCall call, $5.LoggedInUserRequest request);
}
