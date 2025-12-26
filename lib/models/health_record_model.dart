import 'dart:convert';
import 'package:flutter/material.dart';

enum HealthRecordType {
  prescription,
  labReport,
  medicalCertificate,
  xray,
  scan,
  vaccination,
  other,
}

class HealthRecordModel {
  final String id;
  final String title;
  final HealthRecordType type;
  final DateTime date;
  final String? doctorName;
  final String? hospital;
  final String? description;
  final String? fileUrl;
  final String? fileName;
  final List<String>? tags;

  HealthRecordModel({
    required this.id,
    required this.title,
    required this.type,
    required this.date,
    this.doctorName,
    this.hospital,
    this.description,
    this.fileUrl,
    this.fileName,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type.toString().split('.').last,
      'date': date.toIso8601String(),
      'doctorName': doctorName,
      'hospital': hospital,
      'description': description,
      'fileUrl': fileUrl,
      'fileName': fileName,
      'tags': tags,
    };
  }

  factory HealthRecordModel.fromJson(Map<String, dynamic> json) {
    return HealthRecordModel(
      id: json['id'] as String,
      title: json['title'] as String,
      type: HealthRecordType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
        orElse: () => HealthRecordType.other,
      ),
      date: DateTime.parse(json['date'] as String),
      doctorName: json['doctorName'] as String?,
      hospital: json['hospital'] as String?,
      description: json['description'] as String?,
      fileUrl: json['fileUrl'] as String?,
      fileName: json['fileName'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.cast<String>(),
    );
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  factory HealthRecordModel.fromJsonString(String jsonString) {
    return HealthRecordModel.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
  }

  IconData get icon {
    switch (type) {
      case HealthRecordType.prescription:
        return Icons.description;
      case HealthRecordType.labReport:
        return Icons.science;
      case HealthRecordType.medicalCertificate:
        return Icons.verified;
      case HealthRecordType.xray:
        return Icons.image;
      case HealthRecordType.scan:
        return Icons.scanner;
      case HealthRecordType.vaccination:
        return Icons.vaccines;
      default:
        return Icons.folder;
    }
  }

  Color get color {
    switch (type) {
      case HealthRecordType.prescription:
        return Colors.green;
      case HealthRecordType.labReport:
        return Colors.purple;
      case HealthRecordType.medicalCertificate:
        return Colors.blue;
      case HealthRecordType.xray:
        return Colors.orange;
      case HealthRecordType.scan:
        return Colors.teal;
      case HealthRecordType.vaccination:
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }

  String get typeText {
    switch (type) {
      case HealthRecordType.prescription:
        return 'Prescription';
      case HealthRecordType.labReport:
        return 'Lab Report';
      case HealthRecordType.medicalCertificate:
        return 'Medical Certificate';
      case HealthRecordType.xray:
        return 'X-Ray';
      case HealthRecordType.scan:
        return 'Scan';
      case HealthRecordType.vaccination:
        return 'Vaccination';
      default:
        return 'Other';
    }
  }
}
