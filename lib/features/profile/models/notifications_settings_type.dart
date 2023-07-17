import 'package:agoradesk/core/theme/theme.dart';
import 'package:flutter/material.dart';

enum NotificationsSettingsType { newTrade, newPayment, tradeFinalized, chatMessage }

extension NotificationsSettingsTypeExt on NotificationsSettingsType {
  String title(BuildContext context) {
    switch (this) {
      case NotificationsSettingsType.newTrade:
        return context.intl.settings250Sbnotifications250Sbtelegram250Sbtrade8722Sbrequests8722Sblong
            .replaceAll(' Telegram', '');
      case NotificationsSettingsType.newPayment:
        return context.intl.settings250Sbnotifications250Sbtelegram250Sbpayments8722Sbtip.replaceAll(' Telegram', '');
      case NotificationsSettingsType.tradeFinalized:
        return context.intl.settings250Sbnotifications250Sbtelegram250Sbescrow8722Sblong.replaceAll(' Telegram', '');
      case NotificationsSettingsType.chatMessage:
        return context.intl.settings250Sbnotifications250Sbtelegram250Sbmessages8722Sblong.replaceAll(' Telegram', '');
    }
  }

  String key() {
    return toString().split('.').last;
  }
}
