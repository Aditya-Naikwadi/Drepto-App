import '../models/order_model.dart';
import 'storage_service.dart';

class OrderService {
  static const String _ordersKey = 'orders_list';

  // Get all orders
  static Future<List<OrderModel>> getAllOrders() async {
    try {
      final orderJsonList = await StorageService.getStringList(_ordersKey);
      return orderJsonList
          .map((json) => OrderModel.fromJsonString(json))
          .toList()
        ..sort((a, b) => b.orderDate.compareTo(a.orderDate));
    } catch (e) {
      return [];
    }
  }

  // Add order
  static Future<bool> addOrder(OrderModel order) async {
    try {
      final orders = await getAllOrders();
      orders.insert(0, order);
      
      final orderJsonList = orders.map((o) => o.toJsonString()).toList();
      await StorageService.saveStringList(_ordersKey, orderJsonList);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Get orders by type
  static Future<List<OrderModel>> getOrdersByType(OrderType type) async {
    final allOrders = await getAllOrders();
    return allOrders.where((order) => order.type == type).toList();
  }

  // Get orders by status
  static Future<List<OrderModel>> getOrdersByStatus(OrderStatus status) async {
    final allOrders = await getAllOrders();
    return allOrders.where((order) => order.status == status).toList();
  }

  // Update order status
  static Future<bool> updateOrderStatus(String orderId, OrderStatus newStatus) async {
    try {
      final orders = await getAllOrders();
      final index = orders.indexWhere((o) => o.id == orderId);
      
      if (index != -1) {
        final updatedOrder = OrderModel(
          id: orders[index].id,
          type: orders[index].type,
          title: orders[index].title,
          description: orders[index].description,
          status: newStatus,
          orderDate: orders[index].orderDate,
          completionDate: newStatus == OrderStatus.completed ? DateTime.now() : null,
          amount: orders[index].amount,
          trackingInfo: orders[index].trackingInfo,
          details: orders[index].details,
        );
        
        orders[index] = updatedOrder;
        final orderJsonList = orders.map((o) => o.toJsonString()).toList();
        await StorageService.saveStringList(_ordersKey, orderJsonList);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // Delete order
  static Future<bool> deleteOrder(String orderId) async {
    try {
      final orders = await getAllOrders();
      orders.removeWhere((o) => o.id == orderId);
      
      final orderJsonList = orders.map((o) => o.toJsonString()).toList();
      await StorageService.saveStringList(_ordersKey, orderJsonList);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Get order by ID
  static Future<OrderModel?> getOrderById(String orderId) async {
    final orders = await getAllOrders();
    try {
      return orders.firstWhere((o) => o.id == orderId);
    } catch (e) {
      return null;
    }
  }
}
