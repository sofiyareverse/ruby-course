module Main
  def self.included(base)
    base.extend InstanceCounter
    base.send :include, InstanceCounter
  end
end

module InstanceCounter
  class << self
    attr_reader :instances
  end

  def instances
    register_instance
  end

  protected

  def register_instance
    self.class.instances ||= 0
    self.class.instances += 1
  end
end
