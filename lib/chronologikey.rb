require "chronologikey/version"

require 'openssl'
require 'base64'

module Chronologikey

  def self.generate_secret
    Digest::SHA256.hexdigest(SecureRandom.uuid)
  end

  def self.generate secret, now=Time.now
    crypt(:encrypt, secret, now.to_i.to_s)
  end

  def self.validate secret, key, threshold=120
    time = crypt(:decrypt, secret, key)
    distance = Time.now - Time.at(time.to_i)
    distance.abs < threshold
  rescue OpenSSL::Cipher::CipherError, TypeError
    false
  end

  def self.crypt(method, secret, value)
    cipher = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
    cipher.send(method)
    cipher.pkcs5_keyivgen(secret)
    cipher.update(value) + cipher.final
  end

end

