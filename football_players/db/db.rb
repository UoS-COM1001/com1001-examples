require "logger"
require "sequel"

# What mode are we in? (development or testing)
mode = ENV.fetch("APP_ENV", "development")

# Instantiate a logger for the database
logger_file_path = "#{__dir__}/_#{mode}.log"
logger = Logger.new(logger_file_path)

# Initialise the database
db_file_path = "#{__dir__}/#{mode}.sqlite3"
if File.exist?(db_file_path)
  logger.info("Database file found and loaded ('#{db_file_path}')")
  DB = Sequel.sqlite(db_file_path, logger: logger)
else
  logger.warn("Database file not found (looking for '#{db_file_path}')")
end
