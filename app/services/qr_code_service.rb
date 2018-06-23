require 'rqrcode'

class QRCodeService

  def self.generate(options)
    # customer
  end

  def encrypt(data)
    Base64.strict_encode64(SimpleCipher.encrypt(data.to_param).unpack('H*').first)
  end
end
