if defined? Rails
  logger = Logger.new($stdout)
  logger.info("commit_short_sha: #{ENV['COMMIT_SHORT_SHA']}")
  logger.info("pipeline_created_at: #{ENV['PIPELINE_CREATED_AT']}")
end
