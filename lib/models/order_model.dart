import 'dart:convert';
import 'package:flutter/material.dart';

enum OrderType {
  doctor,
  labTest,
  pharmacy,
  nurse,
  store,
  ambulance,
}

enum OrderStatus {
  pending,
  confirmed,
  inProgress,
  completed,
  cancelled,
}

class OrderModel {
  final String id;
  final OrderType type;
  final String title;
  final String description;
  final OrderStatus status;
  final DateTime orderDate;
  final DateTime? completionDate;
  final double amount;
  final String? trackingInfo;
  final Map<String, dynamic>? details;

  OrderModel({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.status,
    required this.orderDate,
    this.completionDate,
    required this.amount,
    this.trackingInfo,
    this.details,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toString().split('.').last,
      'title': title,
      'description': description,
      'status': status.toString().split('.').last,
      'orderDate': orderDate.toIso8601String(),
      'completionDate': completionDate?.toIso8601String(),
      'amount': amount,
      'trackingInfo': trackingInfo,
      'details': details,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      type: OrderType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
        orElse: () => OrderType.doctor,
      ),
      title: json['title'] as String,
      description: json['description'] as String,
      status: OrderStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
        orElse: () => OrderStatus.pending,
      ),
      orderDate: DateTime.parse(json['orderDate'] as String),
      completionDate: json['completionDate'] != null
          ? DateTime.parse(json['completionDate'] as String)
          : null,
      amount: (json['amount'] as num).toDouble(),
      trackingInfo: json['trackingInfo'] as String?,
      details: json['details'] as Map<String, dynamic>?,
    );
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  factory OrderModel.fromJsonString(String jsonString) {
    return OrderModel.fromJson(jsonDecode(jsonString) as Map<String, dynamic>);
  }

  IconData get icon {
    switch (type) {
      case OrderType.doctor:
        return Icons.medical_services;
      case OrderType.labTest:
        return Icons.science;
      case OrderType.pharmacy:
        return Icons.medication;
      case OrderType.nurse:
        return Icons.local_hospital;
      case OrderType.store:
        return Icons.shopping_bag;
      case OrderType.ambulance:
        return Icons.emergency;
    }
  }

  Color get statusColor {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.confirmed:
        return Colors.blue;
      case OrderStatus.inProgress:
        return Colors.purple;
      case OrderStatus.completed:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.red;
    }
  }

  String get statusText {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.confirmed:
        return 'Confirmed';
      case OrderStatus.inProgress:
        return 'In Progress';
      case OrderStatus.completed:
        return 'Completed';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }
}
