require "catarse_redecoin/engine"
require "catarse_redecoin/configuration"

module CatarseRedecoin
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
