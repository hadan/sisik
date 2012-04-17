
module Sisik
  # Encode a string. Base64 encoded and url safe.
  # For passing ciphertext in url param , you must use this to encode the ciphertext generated from encrypt.  
  def self.encode_for_url(data)
    encoded = Base64.strict_encode64(data)
    escaped = CGI::escape(encoded)
    return escaped
  end

  # Decode an encoded string. 
  # Use this to decode from encode_For_param method
  def self.decode_from_url(data)
    unescaped = CGI::unescape(data)
    decoded = Base64.strict_decode64(unescaped)
    return decoded
  end
  
  def self.random_string(size=16)
    a = ('A'..'Z').to_a+('a'..'z').to_a+(0..9).to_a 
    res = (1..size).collect {
      a[rand(a.size)]
    }.join
    return res
  end
  
end