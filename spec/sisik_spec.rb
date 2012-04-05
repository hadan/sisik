

describe Sisik::AES do

  it 'should be the same decrypt result and plaintext' do
    cipher = Sisik::AES.new("geblek cuih")
    data = "AAADJ3agP1O0BALb8mhB22YSNpxGZAw0nlT7p1ES9MWt14wRFpAUqkwQp5esFWlhLZCWzZBl0wKoZBfSNhuSN0f35olqJJJxvXT0128iGzQZDZD"
    ciphertext = cipher.encrypt(data)
    decrypted = cipher.decrypt(ciphertext)
    data.should eq(decrypted)
  end

  it 'should be the same decrypt result and plaintext using url encoding' do
    cipher = Sisik::AES.new("passwordku")
    data = "AAADJ3agP1O0BALb8mhB22YSNpxGZAw0nlT7p1ES9MWt14wRFpAUqkwQp5esFWlhLZCWzZBl0wKoZBfSNhuSN0f35olqJJJxvXT0128iGzQZDZD"
    ciphertext = cipher.encrypt(data)
    encoded = Sisik.encode_for_param(ciphertext)
    decoded = Sisik.decode_from_param(encoded)
    decrypted = cipher.decrypt(decoded)
    data.should eq(decrypted)
  end
  
  it 'use 192 bit, should be the same decrypt result and plaintext using url encoding ' do
    cipher = Sisik::AES.new("passwordku", "1234567890abcdef", 192)
    data = "AAADJ3agP1O0BALb8mhB22YSNpxGZAw0nlT7p1ES9MWt14wRFpAUqkwQp5esFWlhLZCWzZBl0wKoZBfSNhuSN0f35olqJJJxvXT0128iGzQZDZD"
    ciphertext = cipher.encrypt(data)
    encoded = Sisik.encode_for_param(ciphertext)
    decoded = Sisik.decode_from_param(encoded)
    decrypted = cipher.decrypt(decoded)
    data.should eq(decrypted)
  end


end
