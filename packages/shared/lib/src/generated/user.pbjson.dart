///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'firstName', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'lastName', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'birthDate', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthDate'},
    const {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEg4KAmlkGAEgASgFUgJpZBIcCglmaXJzdE5hbWUYAiABKAlSCWZpcnN0TmFtZRIaCghsYXN0TmFtZRgDIAEoCVIIbGFzdE5hbWUSOAoJYmlydGhEYXRlGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJYmlydGhEYXRlEhQKBWVtYWlsGAUgASgJUgVlbWFpbA==');
@$core.Deprecated('Use createUserDescriptor instead')
const CreateUser$json = const {
  '1': 'CreateUser',
  '2': const [
    const {'1': 'firstName', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'lastName', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'birthDate', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthDate'},
    const {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 5, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `CreateUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserDescriptor = $convert.base64Decode('CgpDcmVhdGVVc2VyEhwKCWZpcnN0TmFtZRgBIAEoCVIJZmlyc3ROYW1lEhoKCGxhc3ROYW1lGAIgASgJUghsYXN0TmFtZRI4CgliaXJ0aERhdGUYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgliaXJ0aERhdGUSFAoFZW1haWwYBCABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAUgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use updateUserDescriptor instead')
const UpdateUser$json = const {
  '1': 'UpdateUser',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'firstName', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'firstName', '17': true},
    const {'1': 'lastName', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'lastName', '17': true},
    const {'1': 'birthDate', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 2, '10': 'birthDate', '17': true},
    const {'1': 'email', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'email', '17': true},
    const {'1': 'password', '3': 6, '4': 1, '5': 9, '9': 4, '10': 'password', '17': true},
  ],
  '8': const [
    const {'1': '_firstName'},
    const {'1': '_lastName'},
    const {'1': '_birthDate'},
    const {'1': '_email'},
    const {'1': '_password'},
  ],
};

/// Descriptor for `UpdateUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserDescriptor = $convert.base64Decode('CgpVcGRhdGVVc2VyEg4KAmlkGAEgASgFUgJpZBIhCglmaXJzdE5hbWUYAiABKAlIAFIJZmlyc3ROYW1liAEBEh8KCGxhc3ROYW1lGAMgASgJSAFSCGxhc3ROYW1liAEBEj0KCWJpcnRoRGF0ZRgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAlIJYmlydGhEYXRliAEBEhkKBWVtYWlsGAUgASgJSANSBWVtYWlsiAEBEh8KCHBhc3N3b3JkGAYgASgJSARSCHBhc3N3b3JkiAEBQgwKCl9maXJzdE5hbWVCCwoJX2xhc3ROYW1lQgwKCl9iaXJ0aERhdGVCCAoGX2VtYWlsQgsKCV9wYXNzd29yZA==');
@$core.Deprecated('Use loginUserRequestDescriptor instead')
const LoginUserRequest$json = const {
  '1': 'LoginUserRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginUserRequestDescriptor = $convert.base64Decode('ChBMb2dpblVzZXJSZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use loggedInUserRequestDescriptor instead')
const LoggedInUserRequest$json = const {
  '1': 'LoggedInUserRequest',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `LoggedInUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loggedInUserRequestDescriptor = $convert.base64Decode('ChNMb2dnZWRJblVzZXJSZXF1ZXN0EhQKBXRva2VuGAEgASgJUgV0b2tlbg==');
@$core.Deprecated('Use loggedInResponseDescriptor instead')
const LoggedInResponse$json = const {
  '1': 'LoggedInResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `LoggedInResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loggedInResponseDescriptor = $convert.base64Decode('ChBMb2dnZWRJblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = const {
  '1': 'LoginResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'message', '17': true},
    const {'1': 'xAuthToken', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'xAuthToken', '17': true},
    const {'1': 'user', '3': 4, '4': 1, '5': 11, '6': '.User', '9': 2, '10': 'user', '17': true},
  ],
  '8': const [
    const {'1': '_message'},
    const {'1': '_xAuthToken'},
    const {'1': '_user'},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode('Cg1Mb2dpblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSHQoHbWVzc2FnZRgCIAEoCUgAUgdtZXNzYWdliAEBEiMKCnhBdXRoVG9rZW4YAyABKAlIAVIKeEF1dGhUb2tlbogBARIeCgR1c2VyGAQgASgLMgUuVXNlckgCUgR1c2VyiAEBQgoKCF9tZXNzYWdlQg0KC194QXV0aFRva2VuQgcKBV91c2Vy');
