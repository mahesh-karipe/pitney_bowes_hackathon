require 'openssl'
class SimpleCipher
  class << self
    def method_missing(method_name, *args, &block)
      if respond_to_missing?(method_name)
        cipher.send(method_name, *args, &block)
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      cipher && cipher.respond_to?(method_name)
    end

    def cipher
      @@cipher ||= new('AES-256-CBC', options)
    end

    def options
      { key: [Settings.secrets.vault_encryption_key].pack('H*') }
    end
  end

  def initialize(algo, options={})
    @cipher = OpenSSL::Cipher.new(algo)
    @key = options[:key]
  end

  def encrypt(data)
    cipher.encrypt
    cipher.key = key
    (cipher.update(data) + cipher.final)
  end

  def decrypt(encrypted_data)
    cipher.decrypt
    cipher.key = key
    cipher.update(encrypted_data) + cipher.final
  end

  private

  attr_reader :cipher, :key
end
