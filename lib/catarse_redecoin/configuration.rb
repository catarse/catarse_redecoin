module CatarseRedecoin
  class Configuration
    attr_accessor :token, :secret_token

    def initialize
      self.token = nil
      self.secret_token = nil
    end
  end
end
