class BackupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @backup_file = Rails.root.join("db", "backups", "daily_backup.json")
    @backup_exists = File.exist?(@backup_file)
    @backup_time = @backup_exists ? File.mtime(@backup_file) : nil
  end

  def export
    timestamp = Time.current.strftime("%Y%m%d_%H%M%S")
    filename = "tailor_backup_#{timestamp}.json"

    backup_data = generate_backup_json

    send_data backup_data.to_json,
              filename: filename,
              type: "application/json",
              disposition: "attachment"
  end

  def import
    if params[:backup_file].blank?
      redirect_to backup_path, alert: "કૃપા કરીને બેકઅપ ફાઇલ પસંદ કરો"
      return
    end

    begin
      file_content = params[:backup_file].read
      backup_data = JSON.parse(file_content)

      import_results = import_backup_data(backup_data)

      redirect_to backup_path, notice: "આયાત સફળ: #{import_results[:imported]} રેકોર્ડ આયાત થયા, #{import_results[:skipped]} છોડ્યા"
    rescue JSON::ParserError
      redirect_to backup_path, alert: "અમાન્ય JSON ફાઇલ"
    rescue StandardError => e
      redirect_to backup_path, alert: "આયાત નિષ્ફળ: #{e.message}"
    end
  end

  def download_daily
    backup_file = Rails.root.join("db", "backups", "daily_backup.json")

    unless File.exist?(backup_file)
      redirect_to backup_path, alert: "દૈનિક બેકઅપ ફાઇલ મળી નથી"
      return
    end

    send_file backup_file,
              filename: "daily_backup.json",
              type: "application/json",
              disposition: "attachment"
  end

  private

  def generate_backup_json
    {
      exported_at: Time.current.iso8601,
      rails_env: Rails.env,
      version: "1.0",
      customers: Customer.all.map do |customer|
        customer.attributes.except("id")
      end
    }
  end

  def import_backup_data(data)
    imported = 0
    skipped = 0

    customers_data = data["customers"] || []

    customers_data.each do |customer_data|
      # Skip if customer_no already exists
      if Customer.exists?(customer_no: customer_data["customer_no"])
        skipped += 1
        next
      end

      # Remove id if present and create new record
      customer_attrs = customer_data.except("id")
      customer = Customer.new(customer_attrs)

      # Skip validation for delivery_date if it's in the past (imported data)
      if customer.save(validate: false)
        imported += 1
      else
        skipped += 1
      end
    end

    { imported: imported, skipped: skipped }
  end
end
