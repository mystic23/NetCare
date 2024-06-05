import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AvailabilityRecord extends FirestoreRecord {
  AvailabilityRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "day" field.
  DateTime? _day;
  DateTime? get day => _day;
  bool hasDay() => _day != null;

  // "list_hour" field.
  List<DateTime>? _listHour;
  List<DateTime> get listHour => _listHour ?? const [];
  bool hasListHour() => _listHour != null;

  // "specialist" field.
  DocumentReference? _specialist;
  DocumentReference? get specialist => _specialist;
  bool hasSpecialist() => _specialist != null;

  void _initializeFields() {
    _day = snapshotData['day'] as DateTime?;
    _listHour = getDataList(snapshotData['list_hour']);
    _specialist = snapshotData['specialist'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('availability');

  static Stream<AvailabilityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvailabilityRecord.fromSnapshot(s));

  static Future<AvailabilityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvailabilityRecord.fromSnapshot(s));

  static AvailabilityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvailabilityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvailabilityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvailabilityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvailabilityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvailabilityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvailabilityRecordData({
  DateTime? day,
  DocumentReference? specialist,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day': day,
      'specialist': specialist,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvailabilityRecordDocumentEquality
    implements Equality<AvailabilityRecord> {
  const AvailabilityRecordDocumentEquality();

  @override
  bool equals(AvailabilityRecord? e1, AvailabilityRecord? e2) {
    const listEquality = ListEquality();
    return e1?.day == e2?.day &&
        listEquality.equals(e1?.listHour, e2?.listHour) &&
        e1?.specialist == e2?.specialist;
  }

  @override
  int hash(AvailabilityRecord? e) =>
      const ListEquality().hash([e?.day, e?.listHour, e?.specialist]);

  @override
  bool isValidKey(Object? o) => o is AvailabilityRecord;
}
