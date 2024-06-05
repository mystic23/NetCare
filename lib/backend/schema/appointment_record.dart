import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AppointmentRecord extends FirestoreRecord {
  AppointmentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "day" field.
  DateTime? _day;
  DateTime? get day => _day;
  bool hasDay() => _day != null;

  // "hour" field.
  DateTime? _hour;
  DateTime? get hour => _hour;
  bool hasHour() => _hour != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "specialist" field.
  DocumentReference? _specialist;
  DocumentReference? get specialist => _specialist;
  bool hasSpecialist() => _specialist != null;

  void _initializeFields() {
    _day = snapshotData['day'] as DateTime?;
    _hour = snapshotData['hour'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _specialist = snapshotData['specialist'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointment');

  static Stream<AppointmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentRecord.fromSnapshot(s));

  static Future<AppointmentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentRecord.fromSnapshot(s));

  static AppointmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentRecordData({
  DateTime? day,
  DateTime? hour,
  DocumentReference? user,
  DocumentReference? specialist,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day': day,
      'hour': hour,
      'user': user,
      'specialist': specialist,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentRecordDocumentEquality implements Equality<AppointmentRecord> {
  const AppointmentRecordDocumentEquality();

  @override
  bool equals(AppointmentRecord? e1, AppointmentRecord? e2) {
    return e1?.day == e2?.day &&
        e1?.hour == e2?.hour &&
        e1?.user == e2?.user &&
        e1?.specialist == e2?.specialist;
  }

  @override
  int hash(AppointmentRecord? e) =>
      const ListEquality().hash([e?.day, e?.hour, e?.user, e?.specialist]);

  @override
  bool isValidKey(Object? o) => o is AppointmentRecord;
}
