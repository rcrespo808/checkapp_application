import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'shop_record.g.dart';

abstract class ShopRecord implements Built<ShopRecord, ShopRecordBuilder> {
  static Serializer<ShopRecord> get serializer => _$shopRecordSerializer;

  @nullable
  String get uuid;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'is_open')
  bool get isOpen;

  @nullable
  BuiltList<String> get tags;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ShopRecordBuilder builder) => builder
    ..uuid = ''
    ..name = ''
    ..isOpen = false
    ..tags = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shop');

  static Stream<ShopRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ShopRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ShopRecord._();
  factory ShopRecord([void Function(ShopRecordBuilder) updates]) = _$ShopRecord;

  static ShopRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createShopRecordData({
  String uuid,
  String name,
  bool isOpen,
}) =>
    serializers.toFirestore(
        ShopRecord.serializer,
        ShopRecord((s) => s
          ..uuid = uuid
          ..name = name
          ..isOpen = isOpen
          ..tags = null));
