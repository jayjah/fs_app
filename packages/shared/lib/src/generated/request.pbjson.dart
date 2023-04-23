///
//  Generated code. Do not modify.
//  source: request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use idRequestDescriptor instead')
const IdRequest$json = const {
  '1': 'IdRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `IdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List idRequestDescriptor = $convert.base64Decode('CglJZFJlcXVlc3QSDgoCaWQYASABKAVSAmlk');
@$core.Deprecated('Use allRequestDescriptor instead')
const AllRequest$json = const {
  '1': 'AllRequest',
  '2': const [
    const {'1': 'limit', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'limit', '17': true},
    const {'1': 'offset', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'offset', '17': true},
  ],
  '8': const [
    const {'1': '_limit'},
    const {'1': '_offset'},
  ],
};

/// Descriptor for `AllRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List allRequestDescriptor = $convert.base64Decode('CgpBbGxSZXF1ZXN0EhkKBWxpbWl0GAEgASgNSABSBWxpbWl0iAEBEhsKBm9mZnNldBgCIAEoDUgBUgZvZmZzZXSIAQFCCAoGX2xpbWl0QgkKB19vZmZzZXQ=');
