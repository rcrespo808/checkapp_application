import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'vehicles_record.g.dart';

abstract class VehiclesRecord
    implements Built<VehiclesRecord, VehiclesRecordBuilder> {
  static Serializer<VehiclesRecord> get serializer =>
      _$vehiclesRecordSerializer;

  @nullable
  String get uuid;

  @nullable
  String get alias;

  @nullable
  String get licencePlate;

  @nullable
  DocumentReference get owner;

  @nullable
  String get make;

  @nullable
  String get model;

  @nullable
  String get year;

  @nullable
  String get color;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(VehiclesRecordBuilder builder) => builder
    ..uuid = ''
    ..alias = ''
    ..licencePlate = ''
    ..make = ''
    ..model = ''
    ..year = ''
    ..color = ''
    ..photoUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vehicles');

  static Stream<VehiclesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<VehiclesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  VehiclesRecord._();
  factory VehiclesRecord([void Function(VehiclesRecordBuilder) updates]) =
      _$VehiclesRecord;

  static VehiclesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createVehiclesRecordData({
  String uuid,
  String alias,
  String licencePlate,
  DocumentReference owner,
  String make,
  String model,
  String year,
  String color,
  String photoUrl,
}) =>
    serializers.toFirestore(
        VehiclesRecord.serializer,
        VehiclesRecord((v) => v
          ..uuid = uuid
          ..alias = alias
          ..licencePlate = licencePlate
          ..owner = owner
          ..make = make
          ..model = model
          ..year = year
          ..color = color
          ..photoUrl = photoUrl));
