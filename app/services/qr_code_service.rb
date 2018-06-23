require 'rqrcode'
require 'pry'
class QRCodeService

  def self.generate(options)
    token = encrypt(options)
    @qr = RQRCode::QRCode.new(
      Rails.application.routes.url_helpers.conversion_url(token),
      :size => 13,
      :level => :h
    )
  end

  def self.encrypt(data)
    Base64.strict_encode64(SimpleCipher.encrypt(data.to_json).unpack('H*').first)
  end
end
