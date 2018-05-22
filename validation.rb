module Validator

  protected

  def validating_format
    if self.class.name == 'Train'
      /^[а-яa-z0-9]{3}-*[а-яa-z0-9]{2}$/i
    else
      /^[a-zA-Z0-9]*$/i
    end
  end

  def validate!(obj)
    raise ValidationError.new($!), "Name can't be nil" if obj.nil?
    raise ValidationError.new($!), 'Name should be at least 5 symbols' if obj.length < 5
    raise ValidationError.new($!), 'Name has invalid format' if obj !~ validating_format
    true
  end
end

class ValidationError < StandardError
   attr_reader :reason
   def initialize(reason)
      @reason = reason
   end
end
