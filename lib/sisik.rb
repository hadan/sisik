require "sisik/version"
require 'openssl'
require 'cgi'
require 'base64'

module Sisik
  class AES

    def initialize(password, iv="mukelojauh123456", size=256)
      @password = password

      if iv.length != 16
        raise 'iv must 16 characters long'
      end

      @iv = iv
      @key = Digest::SHA256.digest(@password)
      #@key = Digest::SHA256.hexdigest(@password)
      @cipher = OpenSSL::Cipher::Cipher.new("aes-#{size}-cbc")
    end

    def encrypt(plaintext)
      @cipher.encrypt
      @cipher.key = @key
      @cipher.iv = @iv
      e = @cipher.update(plaintext)
      e << @cipher.final
      return e
    end

    def decrypt(ciphertext)
      @cipher.decrypt
      @cipher.key = @key
      @cipher.iv = @iv
      d = @cipher.update(ciphertext)
      d << @cipher.final
      return d
    end

  end
  
  def self.random_string(size=16)
    a = ('A'..'Z').to_a+('a'..'z').to_a+(0..9).to_a 
    res = (1..size).collect {
      a[rand(a.size)]
    }.join
    return res
  end
  
  def self.encode_for_param(data)
    encoded = Base64.strict_encode64(data)
    escaped = CGI::escape(encoded)
    return escaped
  end
  
  def self.decode_from_param(data)
    unescaped = CGI::unescape(data)
    decoded = Base64.strict_decode64(unescaped)
    return decoded
  end
  
  #def to_hex
  #     line = generate_random.split.each { |b| sprintf(", 0x%02X",b) }.join
  # end  
end

