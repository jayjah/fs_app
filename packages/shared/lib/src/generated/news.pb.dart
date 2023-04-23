///
//  Generated code. Do not modify.
//  source: news.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $6;
import 'image.pb.dart' as $1;

class News extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'News', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shortDescription', protoName: 'shortDescription')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..aOM<$6.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', protoName: 'createdAt', subBuilder: $6.Timestamp.create)
    ..aOM<$1.Image>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image', subBuilder: $1.Image.create)
    ..hasRequiredFields = false
  ;

  News._() : super();
  factory News({
    $core.int? id,
    $core.String? name,
    $core.String? shortDescription,
    $core.String? text,
    $6.Timestamp? createdAt,
    $1.Image? image,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (shortDescription != null) {
      _result.shortDescription = shortDescription;
    }
    if (text != null) {
      _result.text = text;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory News.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory News.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  News clone() => News()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  News copyWith(void Function(News) updates) => super.copyWith((message) => updates(message as News)) as News; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static News create() => News._();
  News createEmptyInstance() => create();
  static $pb.PbList<News> createRepeated() => $pb.PbList<News>();
  @$core.pragma('dart2js:noInline')
  static News getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<News>(create);
  static News? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get shortDescription => $_getSZ(2);
  @$pb.TagNumber(3)
  set shortDescription($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasShortDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearShortDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get text => $_getSZ(3);
  @$pb.TagNumber(4)
  set text($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasText() => $_has(3);
  @$pb.TagNumber(4)
  void clearText() => clearField(4);

  @$pb.TagNumber(5)
  $6.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($6.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $6.Timestamp ensureCreatedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Image get image => $_getN(5);
  @$pb.TagNumber(6)
  set image($1.Image v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasImage() => $_has(5);
  @$pb.TagNumber(6)
  void clearImage() => clearField(6);
  @$pb.TagNumber(6)
  $1.Image ensureImage() => $_ensure(5);
}

class CreateNews extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateNews', createEmptyInstance: create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shortDescription', protoName: 'shortDescription')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageId', $pb.PbFieldType.O3, protoName: 'imageId')
    ..hasRequiredFields = false
  ;

  CreateNews._() : super();
  factory CreateNews({
    $core.String? name,
    $core.String? shortDescription,
    $core.String? text,
    $core.int? imageId,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (shortDescription != null) {
      _result.shortDescription = shortDescription;
    }
    if (text != null) {
      _result.text = text;
    }
    if (imageId != null) {
      _result.imageId = imageId;
    }
    return _result;
  }
  factory CreateNews.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateNews.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateNews clone() => CreateNews()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateNews copyWith(void Function(CreateNews) updates) => super.copyWith((message) => updates(message as CreateNews)) as CreateNews; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateNews create() => CreateNews._();
  CreateNews createEmptyInstance() => create();
  static $pb.PbList<CreateNews> createRepeated() => $pb.PbList<CreateNews>();
  @$core.pragma('dart2js:noInline')
  static CreateNews getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateNews>(create);
  static CreateNews? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get shortDescription => $_getSZ(1);
  @$pb.TagNumber(3)
  set shortDescription($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasShortDescription() => $_has(1);
  @$pb.TagNumber(3)
  void clearShortDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get text => $_getSZ(2);
  @$pb.TagNumber(4)
  set text($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(4)
  void clearText() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get imageId => $_getIZ(3);
  @$pb.TagNumber(5)
  set imageId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasImageId() => $_has(3);
  @$pb.TagNumber(5)
  void clearImageId() => clearField(5);
}

class UpdateNews extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateNews', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shortDescription', protoName: 'shortDescription')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'text')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageId', $pb.PbFieldType.O3, protoName: 'imageId')
    ..hasRequiredFields = false
  ;

  UpdateNews._() : super();
  factory UpdateNews({
    $core.int? id,
    $core.String? name,
    $core.String? shortDescription,
    $core.String? text,
    $core.int? imageId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (shortDescription != null) {
      _result.shortDescription = shortDescription;
    }
    if (text != null) {
      _result.text = text;
    }
    if (imageId != null) {
      _result.imageId = imageId;
    }
    return _result;
  }
  factory UpdateNews.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNews.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNews clone() => UpdateNews()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateNews copyWith(void Function(UpdateNews) updates) => super.copyWith((message) => updates(message as UpdateNews)) as UpdateNews; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateNews create() => UpdateNews._();
  UpdateNews createEmptyInstance() => create();
  static $pb.PbList<UpdateNews> createRepeated() => $pb.PbList<UpdateNews>();
  @$core.pragma('dart2js:noInline')
  static UpdateNews getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNews>(create);
  static UpdateNews? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get shortDescription => $_getSZ(2);
  @$pb.TagNumber(3)
  set shortDescription($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasShortDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearShortDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get text => $_getSZ(3);
  @$pb.TagNumber(4)
  set text($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasText() => $_has(3);
  @$pb.TagNumber(4)
  void clearText() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get imageId => $_getIZ(4);
  @$pb.TagNumber(5)
  set imageId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImageId() => $_has(4);
  @$pb.TagNumber(5)
  void clearImageId() => clearField(5);
}

