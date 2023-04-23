///
//  Generated code. Do not modify.
//  source: news.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use newsDescriptor instead')
const News$json = const {
  '1': 'News',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'shortDescription', '3': 3, '4': 1, '5': 9, '10': 'shortDescription'},
    const {'1': 'text', '3': 4, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'createdAt', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'image', '3': 6, '4': 1, '5': 11, '6': '.Image', '9': 0, '10': 'image', '17': true},
  ],
  '8': const [
    const {'1': '_image'},
  ],
};

/// Descriptor for `News`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsDescriptor = $convert.base64Decode('CgROZXdzEg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEioKEHNob3J0RGVzY3JpcHRpb24YAyABKAlSEHNob3J0RGVzY3JpcHRpb24SEgoEdGV4dBgEIAEoCVIEdGV4dBI4CgljcmVhdGVkQXQYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSIQoFaW1hZ2UYBiABKAsyBi5JbWFnZUgAUgVpbWFnZYgBAUIICgZfaW1hZ2U=');
@$core.Deprecated('Use createNewsDescriptor instead')
const CreateNews$json = const {
  '1': 'CreateNews',
  '2': const [
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'shortDescription', '3': 3, '4': 1, '5': 9, '10': 'shortDescription'},
    const {'1': 'text', '3': 4, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'imageId', '3': 5, '4': 1, '5': 5, '9': 0, '10': 'imageId', '17': true},
  ],
  '8': const [
    const {'1': '_imageId'},
  ],
};

/// Descriptor for `CreateNews`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createNewsDescriptor = $convert.base64Decode('CgpDcmVhdGVOZXdzEhIKBG5hbWUYAiABKAlSBG5hbWUSKgoQc2hvcnREZXNjcmlwdGlvbhgDIAEoCVIQc2hvcnREZXNjcmlwdGlvbhISCgR0ZXh0GAQgASgJUgR0ZXh0Eh0KB2ltYWdlSWQYBSABKAVIAFIHaW1hZ2VJZIgBAUIKCghfaW1hZ2VJZA==');
@$core.Deprecated('Use updateNewsDescriptor instead')
const UpdateNews$json = const {
  '1': 'UpdateNews',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'shortDescription', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'shortDescription', '17': true},
    const {'1': 'text', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'text', '17': true},
    const {'1': 'imageId', '3': 5, '4': 1, '5': 5, '9': 3, '10': 'imageId', '17': true},
  ],
  '8': const [
    const {'1': '_name'},
    const {'1': '_shortDescription'},
    const {'1': '_text'},
    const {'1': '_imageId'},
  ],
};

/// Descriptor for `UpdateNews`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNewsDescriptor = $convert.base64Decode('CgpVcGRhdGVOZXdzEg4KAmlkGAEgASgFUgJpZBIXCgRuYW1lGAIgASgJSABSBG5hbWWIAQESLwoQc2hvcnREZXNjcmlwdGlvbhgDIAEoCUgBUhBzaG9ydERlc2NyaXB0aW9uiAEBEhcKBHRleHQYBCABKAlIAlIEdGV4dIgBARIdCgdpbWFnZUlkGAUgASgFSANSB2ltYWdlSWSIAQFCBwoFX25hbWVCEwoRX3Nob3J0RGVzY3JpcHRpb25CBwoFX3RleHRCCgoIX2ltYWdlSWQ=');
