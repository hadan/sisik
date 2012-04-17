require 'spec_helper'
require 'sisik'

describe Sisik::AES do

  it 'should be the same decrypt result and plaintext' do
    cipher = Sisik::AES.new("geblek cuih", "mukelojauh123456")
    data = "AAADJ3agP1O0BALb8mhB22YSNpxGZAw0nlT7p1ES9MWt14wRFpAUqkwQp5esFWlhLZCWzZBl0wKoZBfSNhuSN0f35olqJJJxvXT0128iGzQZDZD"
    ciphertext = cipher.encrypt(data)
    decrypted = cipher.decrypt(ciphertext)
    data.should eq(decrypted)
  end

  it 'should be the same decrypt result and plaintext using url encoding' do
    cipher = Sisik::AES.new("passwordku", "mukelojauh123456")
    data = "AAADJ3agP1O0BALb8mhB22YSNpxGZAw0nlT7p1ES9MWt14wRFpAUqkwQp5esFWlhLZCWzZBl0wKoZBfSNhuSN0f35olqJJJxvXT0128iGzQZDZD"
    ciphertext = cipher.encrypt(data)
    encoded = Sisik.encode_for_url(ciphertext)
    decoded = Sisik.decode_from_url(encoded)
    decrypted = cipher.decrypt(decoded)
    data.should eq(decrypted)
  end
  
  it 'should use random iv' do
    cipher_not_random = Sisik::AES.new("passwordku", "mukelojauh123456")
    cipher = Sisik::AES.new("passwordku", iv = :random)
    data = "AAADJ3agP1O0BALb8mhB22YSNpxGZAw0nlT7p1ES9MWt14wRFpAUqkwQp5esFWlhLZCWzZBl0wKoZBfSNhuSN0f35olqJJJxvXT0128iGzQZDZD"
    ciphertext = cipher.encrypt(data)
    ciphertext2 = cipher_not_random.encrypt(data)
    # encoded = Sisik.encode_for_url(ciphertext)
    # decoded = Sisik.decode_from_url(encoded)
    # decrypted = cipher.decrypt(decoded)
    # data.should eq(decrypted)
    ciphertext.should_not eq (ciphertext2)
    
  end
  
  
  it 'use 192 bit, should be the same decrypt result and plaintext using url encoding ' do
    cipher = Sisik::AES.new("passwordku", "1234567890abcdef", 192)
    data = "AAADJ3agP1O0BALb8mhB22YSNpxGZAw0nlT7p1ES9MWt14wRFpAUqkwQp5esFWlhLZCWzZBl0wKoZBfSNhuSN0f35olqJJJxvXT0128iGzQZDZD"
    ciphertext = cipher.encrypt(data)
    encoded = Sisik.encode_for_url(ciphertext)
    decoded = Sisik.decode_from_url(encoded)
    decrypted = cipher.decrypt(decoded)
    data.should eq(decrypted)
  end


end
