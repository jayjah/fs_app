///
//  Generated code. Do not modify.
//  source: image.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use imageDescriptor instead')
const Image$json = const {
  '1': 'Image',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'file', '3': 2, '4': 1, '5': 11, '6': '.File', '10': 'file'},
    const {'1': 'createdAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `Image`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageDescriptor = $convert.base64Decode('CgVJbWFnZRIOCgJpZBgBIAEoBVICaWQSGQoEZmlsZRgCIAEoCzIFLkZpbGVSBGZpbGUSOAoJY3JlYXRlZEF0GAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0');
@$core.Deprecated('Use metaDataDescriptor instead')
const MetaData$json = const {
  '1': 'MetaData',
  '2': const [
    const {'1': 'fileName', '3': 1, '4': 1, '5': 9, '10': 'fileName'},
    const {'1': 'extension', '3': 2, '4': 1, '5': 9, '10': 'extension'},
  ],
};

/// Descriptor for `MetaData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metaDataDescriptor = $convert.base64Decode('CghNZXRhRGF0YRIaCghmaWxlTmFtZRgBIAEoCVIIZmlsZU5hbWUSHAoJZXh0ZW5zaW9uGAIgASgJUglleHRlbnNpb24=');
@$core.Deprecated('Use fileDescriptor instead')
const File$json = const {
  '1': 'File',
  '2': const [
    const {'1': 'metaData', '3': 1, '4': 1, '5': 11, '6': '.MetaData', '10': 'metaData'},
    const {'1': 'chunkData', '3': 2, '4': 1, '5': 12, '10': 'chunkData'},
  ],
};

/// Descriptor for `File`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDescriptor = $convert.base64Decode('CgRGaWxlEiUKCG1ldGFEYXRhGAEgASgLMgkuTWV0YURhdGFSCG1ldGFEYXRhEhwKCWNodW5rRGF0YRgCIAEoDFIJY2h1bmtEYXRh');
