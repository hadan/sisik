module Sisik

  class AES
    # Initialize AES encryption
    # Example:
    #   >> c = Sisik::AES.new("mypass", "1234567890abcdef")
    # Arguments:
    #   password: pass password (String)
    #   iv: pass the initialization vector, min 16 chars (String)
    #   size: default is 256, better leave it this way (Integer)      
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

    # Encrypt a string
    # Example:
    #   >> c = Sisik::AES.new("mypass", "1234567890abcdef")
    #   >> res = c.encrypt("secret text")
    # Arguments:
    #   plaintext: string that will be encrypted (String)
    # Return value:
    #   A string of ciphertext      
    def encrypt(plaintext)
      @cipher.encrypt
      @cipher.key = @key
      @cipher.iv = @iv
      e = @cipher.update(plaintext)
      e << @cipher.final
      return e
    end
    
    # Decrypt a string
    # Example:
    #   >> c = Sisik::AES.new("mypass", "1234567890abcdef")
    #   >> enc = c.encrypt("secret text")
    #   >> dec = c.decrypt(enc) 
    # Arguments:
    #   ciphertext: string that will be decrypted (String)
    # Return value:
    #   A string of decrypted text
    def decrypt(ciphertext)
      @cipher.decrypt
      @cipher.key = @key
      @cipher.iv = @iv
      d = @cipher.update(ciphertext)
      d << @cipher.final
      return d
    end

  end
  
  #def to_hex
  #     line = generate_random.split.each { |b| sprintf(", 0x%02X",b) }.join
  # end  
end
