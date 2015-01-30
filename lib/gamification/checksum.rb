module Gamification
  module Checksum
    # Generate a checksum from the given values.
    #
    # values - An Array of values.
    #
    # Returns a String.
    def self.generate values
      Digest::MD5.hexdigest "#{secret_key}#{values.join}"
    end

    # Verify a given checksum against the given values.
    #
    # checksum - A String describing a checksum.
    # values   - An Array of values.
    #
    # Returns a boolean.
    def self.verify checksum, values
      checksum == generate(values)
    end

    private

    def self.secret_key
      Rails.application.secrets[:secret_key_base]
    end
  end
end
