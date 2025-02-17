import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_colors.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: "Promotion",
      message: "Special Promotion on all products in the Nike 30% off.",
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      type: NotificationType.promotion,
    ),
    NotificationItem(
      title: "Promotion",
      message: "Special Promotion on all products in the Adidas 30% off.",
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      type: NotificationType.promotion,
    ),
    NotificationItem(
      title: "Ordered",
      message: "You have completed order bag from our app, see you next time.",
      timestamp: DateTime.now().subtract(const Duration(days: 4)),
      type: NotificationType.order,
    ),
    NotificationItem(
      title: "Promotion",
      message:
          "Special Promotion on all products 30% off, enjoy the promotion from us.",
      timestamp: DateTime.now().subtract(const Duration(days: 4)),
      type: NotificationType.promotion,
    ),
    NotificationItem(
      title: "Ordered",
      message: "You have completed order bag from our app, see you next time.",
      timestamp: DateTime.now().subtract(const Duration(days: 30)),
      type: NotificationType.order,
    ),
    NotificationItem(
      title: "Promotion",
      message:
          "Special Promotion on all products 30% off, enjoy the promotion from us.",
      timestamp: DateTime.now().subtract(const Duration(days: 30)),
      type: NotificationType.promotion,
    ),
  ];

  String _getRelativeTime(DateTime timestamp) {
    final Duration difference = DateTime.now().difference(timestamp);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('dd MMM yyyy').format(timestamp);
    }
  }

  List<Widget> _buildNotificationList() {
    Map<String, List<NotificationItem>> groupedNotifications = {};

    for (var notification in notifications) {
      String dateKey = notification.timestamp.day == DateTime.now().day
          ? 'Today'
          : DateFormat('dd MMM yyyy').format(notification.timestamp);
      if (!groupedNotifications.containsKey(dateKey)) {
        groupedNotifications[dateKey] = [];
      }
      groupedNotifications[dateKey]!.add(notification);
    }

    List<Widget> notificationWidgets = [];

    groupedNotifications.forEach((date, notifications) {
      notificationWidgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Text(
            date,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );

      for (var notification in notifications) {
        notificationWidgets.add(
          ListTile(
            leading: Image.asset(
              notification.type == NotificationType.promotion
                  ? 'assets/icons/gift.png'
                  : 'assets/icons/bag.png',
              width: 25,
              height: 25,
            ),
            title: Text(notification.message),
            subtitle: Text(
              notification.title,
              style: const TextStyle(color: Colors.brown),
            ),
            trailing: Text(
              _getRelativeTime(notification.timestamp),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () {
              ///Notification Details
            },
          ),
        );
      }
    });

    return notificationWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Notifications',
          style: TextStyle(color: AppColors.icon),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.icon),
      ),
      body: Container(
        color: AppColors.bgColor,
        child: ListView(
          children: _buildNotificationList(),
        ),
      ),
    );
  }
}

enum NotificationType { promotion, order }

class NotificationItem {
  final String title;
  final String message;
  final DateTime timestamp;
  final NotificationType type;
  NotificationItem({
    required this.title,
    required this.message,
    required this.timestamp,
    required this.type,
  });
}
