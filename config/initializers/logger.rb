logger = Ougai::Logger.new(
  Application.root.concat("/", ENV["LOGGER_PATH"]),
  level: "info"
)

logger.before_log = lambda do |data|
  data[:service] = { name: ENV["APP_NAME"] }
  data[:request_id] ||= Thread.current[:request_id]
end

Application.logger = logger
