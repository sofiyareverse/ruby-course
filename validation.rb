module Validator
  SEATFORMAT = /^[0-9]*$/
  DEFAULT_NUMBER_FORMAT = /^[a-zA-Z0-9]*$/i

  def self.included(base)
    unless base.const_defined?(:TRAIN_NUMBER_FORMAT)
      base.const_set :TRAIN_NUMBER_FORMAT, Validator::DEFAULT_NUMBER_FORMAT
    end
  end

  protected

  def name_exist_error(obj)
    raise NameExistError.new, "Name can't be nil" if obj.nil?
  end

  def name_size_error(obj)
    raise NameSizeError.new, 'Name should be at least 5 symbols' if obj.length < 5
  end

  def name_format_error(obj)
    raise NameFormatError.new, 'Name has invalid format' if obj !~ self.class.const_get(:TRAIN_NUMBER_FORMAT)
  end

  def name_valid?(obj)
    name_exist_error(obj)
    name_size_error(obj)
    name_format_error(obj)
    true
  end
end

class NameExistError < StandardError; end

class NameSizeError < StandardError; end

class NameFormatError < StandardError; end
