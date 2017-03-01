CarrierWave.configure do |config|
  config.asset_host = ENV['UPLOAD_HOST']
  config.sftp_host = ENV['SFTP_HOST']
  config.sftp_user = ENV['SFTP_USER']
  config.sftp_folder = ENV['SFTP_FOLDER']
  config.sftp_url = ENV['UPLOAD_HOST']
  config.sftp_options = {
    password: ENV['SFTP_PASSWORD'],
    port: 22
  }
end
