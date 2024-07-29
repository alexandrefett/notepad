/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampJson implements JsonConverter<DateTime, Map<String, dynamic>> {
  const TimestampJson();

  @override
  DateTime fromJson(Map<String, dynamic> timestamp) {
    return Timestamp(timestamp['_seconds'] as int, timestamp['_nanoseconds'] as int).toDate();
  }

  @override
  Map<String, dynamic> toJson(DateTime date) => {};
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

class TimestampOrNullConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampOrNullConverter();

  @override
  DateTime? fromJson(Timestamp? timestamp) {
    return timestamp?.toDate();
  }

  @override
  Timestamp? toJson(DateTime? date) => date == null ? null : Timestamp.fromDate(date);
}


 */
