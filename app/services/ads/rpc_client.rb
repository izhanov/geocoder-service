# frozen_string_literal: true

require_relative "rpc_api"

module AdsService
  class RpcClient
    include RpcApi

    def initialize
      @channel = RabbitMq::Connection.channel
      @queue = @channel.queue("ads", durable: true)
      @reply_queue = @channel.queue("amq.rabbitmq.reply-to")
      @lock = Mutex.new
      @correlation_id = SecureRandom.uuid
      @condition = ConditionVariable.new
    end

    def self.fetch
      Thread.current["ads_service.rpc_client"] ||= new.start
    end

    def start
      @reply_queue.subscribe do |delivery_info, properties, payload|
        if @correlation_id == properties[:correlation_id]
          @lock.synchronize { @condition.signal }
        end
      end

      self
    end

    private

    def publish(payload, opts = {})
      @lock.synchronize do
        @queue.publish(
          payload,
          opts.merge(
            app_id: ENV["APP_NAME"],
            correlation_id: @correlation_id,
            reply_to: @reply_queue.name
          )
        )
        @condition.wait(@lock)
      end
    end
  end
end
