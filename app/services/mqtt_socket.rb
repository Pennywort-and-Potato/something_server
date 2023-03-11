require 'bunny'
class MqttSocket
  class << self

    def publish_all_connection(user_id)
      publish_direct_notification(user_id)
    end

    def publish_direct_notification(user_id)
      queue = channel.queue("notification.#{user_id}", durable: true, routing_key: user_id.to_s)
      queue.bind(notification_exchange)
    end

    def notification_exchange
      @exchange ||= channel.direct("notification", durable: true)
    end

    def channel
      @channel ||= connection.create_channel()
    end

    def connection
      @connection ||= Bunny.new(
        hostname: Rails.application.credentials.config[:RBMQ],
        user: Rails.application.credentials.config[:RBU],
        password: Rails.application.credentials.config[:RBP]
      ).tap(&:start)
    end

  end
end