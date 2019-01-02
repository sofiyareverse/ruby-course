module Validation
  def self.included(base)
    base.extend(ClassValidation)
    base.send :include, InstanceValidation
  end
    
  module ClassValidation
    def validate(attribute, validation, option = true)
      if validating_hash[attribute]
        validating_hash[attribute][validation] = {
          option: option,
          error: errors(validation, attribute)
        }
      else
        validating_hash[attribute] = {
          validation => {
            option: option,
            error: errors(validation, attribute)
          }
        }
      end
    end

    def validating_hash
      @validating_hash ||= {}
    end

    private

    def errors(type, attr)
      case type
      when :presence
        "#{attr} can`t be nil or ''"
      when :format
        "#{attr} has invalid format"
      when :type
        "#{attr} has invalid type"
      end
    end

    def validations
      [:presence, :format, :type]
    end
  end
  
  module InstanceValidation
    def validate!
      self.class.validating_hash.each do |attr, value|
        value.each do |key, value|
          self.send("#{key}", value[:error], attr, value[:option])
        end
      end
      true
    end

    def valid?
      validate!
    rescue
      false
    end

    protected

    def presence(error, attr, option = true)
      raise error if [nil, ''].include?(self.public_send(attr))
    end

    def format(error, attr, option)
      raise error if self.public_send(attr) !~ option
    end

    def type(error, attr, option)
      raise error unless self.public_send(attr).is_a? option
    end
  end
end

class A
  include Validation

  attr_accessor :name, :age, :position

  validate :name, :presence
  validate :age, :type, Integer
  validate :position, :format, /[A-Z]{0,3}/i

  def initialize(name, age, position)
    @name = name
    @age = age
    @position = position
  end  
end

a = A.new("nil", 12, nil)
puts a.valid? # false
