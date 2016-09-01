// Copyright (c) 2016, John Ryan. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

@JS('AWS')
library aws;

import 'dart:typed_data';

import 'package:js/js.dart';

external ClientConfig get config;

@JS()
class ClientConfig {
  external void set credentials(Credentials c);
  external void set region(String r);
}

@JS()
class Credentials {
  external factory Credentials(String accessKeyId, String secretAccesKey,
      [String sessionToken]);
}

typedef S3Callback<T>(err, T data);

@JS()
class S3 {
  external factory S3(S3Options options);
  external getObject(
      GetObjectRequest params, S3Callback<GetObjectResponse> callback);
  external putObject(PutObjectRequest params, S3Callback callback);
  external deleteObject(
      DeleteObjectRequest params, S3Callback<DeleteObjectResponse> callback);
  external listObjects(S3Callback<ListObjectV2Response> callback);
  external headObject(HeadObjectRequest params, S3Callback callback);
}

@anonymous
@JS()
class S3Options {
  external S3Params get params;
  external factory S3Options({S3Params params});
}

@anonymous
@JS()
class S3Params {
  external String get Bucket;
  external String get Key;
  external factory S3Params({String Bucket, String Key});
}

@anonymous
@JS()
class GetObjectRequest {
  external set Bucket(String value);
  external set IfMatch(String value);
  dynamic IsModifiedSince;
  dynamic IfNoneMatch;
  dynamic IsUnmodifiedSince;
  external set Key(String value);
  external set Range(String value);
  external set ResponseCacheControl(String value);
  external set ResponseContentDisposition(String value);
  external set ResponseContentEncoding(String value);
  external set ResponseContentLanguage(String value);
  external set ResponseContentType(String value);
  external set ResponseExpires(dynamic value);
  external set VersionId(String value);
  external factory GetObjectRequest();
}

@anonymous
@JS()
class HeadObjectRequest {
  String Bucket;
  String Key;
  String IfMatch;
  DateTime IfModifiedSince;
  String IfNoneMatch;
  String IfUnmodifiedSince;
  String Range;
  String RequestPayer;
  String SSECustomerAlgorithm;
  String SSECustomerKey;
  String SSECustomerKeyMD5;
  String VersionId;
  external factory HeadObjectRequest();
}

@anonymous
@JS()
class GetObjectResponse {
  external Uint8List get Body;
  external String get ContentType;
  external dynamic get Metadata;
}

@anonymous
@JS()
class DeleteObjectRequest {
  external set Bucket(String value);
  external set Key(String value);
  external set MFA(String value);
  external set RequestPayer(String value);
  external set VersionId(String value);
  external factory DeleteObjectRequest();
}


@JS()
class DeleteObjectResponse {}

@anonymous
@JS()
class PutObjectRequest {
  external set ACL(String value);
  external void set Body(dynamic value);
  external void set Bucket(String value);
  external set CacheControl(String value);
  external set ContentDisposition(String value);
  external set ContentEncoding(String value);
  external set ContentLanguage(String value);
  external set ContentLength(String value);
  external set ContentMD5(String value);
  external set ContentType(String value);
  external set Expires(dynamic value);
  external set GrantFullControl(String value);
  external set GrantRead(String value);
  external set GrantReadACP(String value);
  external set GrantWriteACP(String value);
  external void set Key(String value);
  external set Metadata(dynamic value);
  external set ServerSideEncryption(String value);
  external set StorageClass(String value);
  external set WebsiteRedirectLocation(String value);
  external factory PutObjectRequest();
}

@JS()
class ListObjectRequestBase {
  external set Bucket(String value);
  external set Delimiter(String value);
  external set EncodingType(dynamic value);
  external set MaxKeys(num value);
  external set Prefix(String value);
}

@JS()
class ListObjectRequest extends ListObjectRequestBase {
  external set Marker(String value);
}

@JS()
class ListObjectResponseBase {
  external bool get IsTruncated;
  external List<ListObjectContent> get Contents;
  external String get Name;
  external String get Prefix;
  external String get Delimiter;
  external int get MaxKeys;
  external List<dynamic> get CommonPrefixes;
  external dynamic get EncodingType;
}

@JS()
class ListObjectV2Response extends ListObjectResponseBase {
  external num get KeyCount;
  external String get ContinuationToken;
  external String get NextContinuationToken;
  external String get StartAfter;
}

@JS()
class ListObjectContent {
  external String get Key;
  external String get LastModified;
  external String get ETag;
  external num get Size;
  external dynamic get StorageClass;
  external dynamic get Owner;
}
