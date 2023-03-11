require 'bunny'

module Notification
  def send_notification(user_id, type)
    notification_count = UserNotification.where({user_id: user_id, is_read: false}).count

    MqttSocket.notification_exchange.publish({
      data: {
        type: type,
        notification: notification_count
      }
    }.to_json)

  end
end