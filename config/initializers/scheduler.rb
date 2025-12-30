# Daily backup scheduler using Ruby threads
# Runs automatically every day at midnight

# Only run scheduler when Rails server starts (not in rake tasks, console, etc.)
return unless defined?(Rails::Server) || ENV['ENABLE_SCHEDULER'] == 'true'

Thread.new do
  loop do
    now = Time.current
    # Calculate seconds until next midnight
    tomorrow_midnight = (now + 1.day).beginning_of_day
    seconds_until_midnight = tomorrow_midnight - now

    Rails.logger.info "[Scheduler] Next backup scheduled in #{(seconds_until_midnight / 3600).round(1)} hours"

    sleep(seconds_until_midnight)

    # Perform backup
    begin
      Rails.logger.info "[Scheduler] Starting daily backup at #{Time.current}"

      backup_dir = Rails.root.join("db", "backups")
      FileUtils.mkdir_p(backup_dir)

      backup_file = backup_dir.join("daily_backup.json")

      backup_data = {
        exported_at: Time.current.iso8601,
        rails_env: Rails.env,
        version: "1.0",
        customers: Customer.all.map { |c| c.attributes.except("id") }
      }

      File.write(backup_file, JSON.pretty_generate(backup_data))

      Rails.logger.info "[Scheduler] Daily backup completed: #{backup_data[:customers].count} customers saved"
    rescue StandardError => e
      Rails.logger.error "[Scheduler] Daily backup failed: #{e.message}"
    end
  end
end

Rails.logger.info "[Scheduler] Daily backup scheduler initialized - will run at midnight every day"
