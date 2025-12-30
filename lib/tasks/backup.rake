namespace :backup do
  desc "Export database backup to JSON file (overwrites existing)"
  task export: :environment do
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

    puts "Backup exported to: #{backup_file}"
    puts "Total customers: #{backup_data[:customers].count}"
    puts "Exported at: #{backup_data[:exported_at]}"
  end

  desc "Import database from JSON backup file"
  task import: :environment do
    backup_file = Rails.root.join("db", "backups", "daily_backup.json")

    unless File.exist?(backup_file)
      puts "Backup file not found: #{backup_file}"
      exit 1
    end

    backup_data = JSON.parse(File.read(backup_file))
    customers_data = backup_data["customers"] || []

    imported = 0
    skipped = 0

    customers_data.each do |customer_data|
      if Customer.exists?(customer_no: customer_data["customer_no"])
        skipped += 1
        next
      end

      customer = Customer.new(customer_data.except("id"))
      if customer.save(validate: false)
        imported += 1
      else
        skipped += 1
      end
    end

    puts "Import complete!"
    puts "Imported: #{imported}"
    puts "Skipped: #{skipped}"
  end
end

