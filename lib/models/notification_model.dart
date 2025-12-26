import 'dart:convert';
import 'package:flutter/material.dart';

enum NotificationType {
  appointment,
  labResult,
  prescription,
  general,
  promotion,
  reminder,
}

class NotificationModel {
  final String id;
  final String title;
  final String message;
  final NotificationType type;
  final DateTime timestamp;
  final bool isRead;
  final Map<String, dynamic>? data;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.timestamp,
    this.isRead = false,
    this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'type': type.toString().split('.').last,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
      'data': data,
    };
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: NotificationType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
        orElse: () => NotificationType.general,
      ),
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool? ?? false,
      data: json['data'] as Map<String, dynamic>?,
    );
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  factory NotificationModel.fromJsonString(String jsonString) {
    return NotificationModel.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
  }

  NotificationModel copyWith({
    String? id,
    String? title,
    String? message,
    NotificationType? type,
    DateTime? timestamp,
    bool? isRead,
    Map<String, dynamic>? data,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      data: data ?? this.data,
    );
  }

  IconData get icon {
    switch (type) {
      case NotificationType.appointment:
        return Icons.calendar_today;
      case NotificationType.labResult:
        return Icons.science;
      case NotificationType.prescription:
        return Icons.medication;
      case NotificationType.reminder:
        return Icons.alarm;
      case NotificationType.promotion:
        return Icons.local_offer;
      default:
        return Icons.notifications;
    }
  }

  Color get color {
    switch (type) {
      case NotificationType.appointment:
        return Colors.blue;
      case NotificationType.labResult:
        return Colors.purple;
      case NotificationType.prescription:
        return Colors.green;
      case NotificationType.reminder:
        return Colors.orange;
      case NotificationType.promotion:
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }
}
