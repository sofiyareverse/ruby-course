module Validation
  def self.included(base)
    base.extend(ClassValidation)
  end

  module ClassValidation
    def validate(attr_name, valid)
      set_validated_attribute(attr_name, valid)
    end

    private

    def set_validated_attribute(attr_name, valid)
      define_method("#{attr_name}=".to_sym) do |value|
        case valid
        when :presence
          raise "attribute is nil, should exist" if value.nil? || value == ''
        when :format
          raise "attribute should be right format" if value !~ /[A-Z]{0,3}/i
        when :type
          raise "attribute should be right type" if value != String
        end
      end
    end
  end
end

class A
  include Validation

  validate :name, :presence
  validate :number, :format
  validate :station, :type
end

a = A.new
a.name = nil # падает на первой
a.number = nil
a.station = nil
