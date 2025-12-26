import '../models/notification_model.dart';
import 'storage_service.dart';

class NotificationService {
  static const String _notificationsKey = 'notifications_list';
  static const String _unreadCountKey = 'unread_notifications_count';

  // Get all notifications
  static Future<List<NotificationModel>> getAllNotifications() async {
    try {
      final notificationJsonList = await StorageService.getStringList(_notificationsKey);
      return notificationJsonList
          .map((json) => NotificationModel.fromJsonString(json))
          .toList()
        ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    } catch (e) {
      return [];
    }
  }

  // Add notification
  static Future<bool> addNotification(NotificationModel notification) async {
    try {
      final notifications = await getAllNotifications();
      notifications.insert(0, notification);
      
      final notificationJsonList = notifications.map((n) => n.toJsonString()).toList();
      await StorageService.saveStringList(_notificationsKey, notificationJsonList);
      
      // Update unread count
      await _updateUnreadCount();
      
      return true;
    } catch (e) {
      return false;
    }
  }

  // Mark notification as read
  static Future<bool> markAsRead(String notificationId) async {
    try {
      final notifications = await getAllNotifications();
      final index = notifications.indexWhere((n) => n.id == notificationId);
      
      if (index != -1) {
        notifications[index] = notifications[index].copyWith(isRead: true);
        final notificationJsonList = notifications.map((n) => n.toJsonString()).toList();
        await StorageService.saveStringList(_notificationsKey, notificationJsonList);
        await _updateUnreadCount();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // Mark all as read
  static Future<bool> markAllAsRead() async {
    try {
      final notifications = await getAllNotifications();
      final updatedNotifications = notifications
          .map((n) => n.copyWith(isRead: true))
          .toList();
      
      final notificationJsonList = updatedNotifications.map((n) => n.toJsonString()).toList();
      await StorageService.saveStringList(_notificationsKey, notificationJsonList);
      await _updateUnreadCount();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Get unread count
  static Future<int> getUnreadCount() async {
    final notifications = await getAllNotifications();
    return notifications.where((n) => !n.isRead).length;
  }

  // Update unread count in storage
  static Future<void> _updateUnreadCount() async {
    final count = await getUnreadCount();
    await StorageService.saveString(_unreadCountKey, count.toString());
  }

  // Delete notification
  static Future<bool> deleteNotification(String notificationId) async {
    try {
      final notifications = await getAllNotifications();
      notifications.removeWhere((n) => n.id == notificationId);
      
      final notificationJsonList = notifications.map((n) => n.toJsonString()).toList();
      await StorageService.saveStringList(_notificationsKey, notificationJsonList);
      await _updateUnreadCount();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Clear all notifications
  static Future<bool> clearAll() async {
    try {
      await StorageService.saveStringList(_notificationsKey, []);
      await StorageService.saveString(_unreadCountKey, '0');
      return true;
    } catch (e) {
      return false;
    }
  }
}
