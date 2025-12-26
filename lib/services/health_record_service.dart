import '../models/health_record_model.dart';
import 'storage_service.dart';

class HealthRecordService {
  static const String _recordsKey = 'health_records_list';

  // Get all health records
  static Future<List<HealthRecordModel>> getAllRecords() async {
    try {
      final recordJsonList = await StorageService.getStringList(_recordsKey);
      return recordJsonList
          .map((json) => HealthRecordModel.fromJsonString(json))
          .toList()
        ..sort((a, b) => b.date.compareTo(a.date));
    } catch (e) {
      return [];
    }
  }

  // Add health record
  static Future<bool> addRecord(HealthRecordModel record) async {
    try {
      final records = await getAllRecords();
      records.insert(0, record);
      
      final recordJsonList = records.map((r) => r.toJsonString()).toList();
      await StorageService.saveStringList(_recordsKey, recordJsonList);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Get records by type
  static Future<List<HealthRecordModel>> getRecordsByType(HealthRecordType type) async {
    final allRecords = await getAllRecords();
    return allRecords.where((record) => record.type == type).toList();
  }

  // Search records
  static Future<List<HealthRecordModel>> searchRecords(String query) async {
    final allRecords = await getAllRecords();
    final lowerQuery = query.toLowerCase();
    
    return allRecords.where((record) {
      return record.title.toLowerCase().contains(lowerQuery) ||
             (record.description?.toLowerCase().contains(lowerQuery) ?? false) ||
             (record.doctorName?.toLowerCase().contains(lowerQuery) ?? false) ||
             (record.hospital?.toLowerCase().contains(lowerQuery) ?? false) ||
             (record.tags?.any((tag) => tag.toLowerCase().contains(lowerQuery)) ?? false);
    }).toList();
  }

  // Delete record
  static Future<bool> deleteRecord(String recordId) async {
    try {
      final records = await getAllRecords();
      records.removeWhere((r) => r.id == recordId);
      
      final recordJsonList = records.map((r) => r.toJsonString()).toList();
      await StorageService.saveStringList(_recordsKey, recordJsonList);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Get record by ID
  static Future<HealthRecordModel?> getRecordById(String recordId) async {
    final records = await getAllRecords();
    try {
      return records.firstWhere((r) => r.id == recordId);
    } catch (e) {
      return null;
    }
  }

  // Get records by date range
  static Future<List<HealthRecordModel>> getRecordsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final allRecords = await getAllRecords();
    return allRecords.where((record) {
      return record.date.isAfter(startDate) && record.date.isBefore(endDate);
    }).toList();
  }
}
