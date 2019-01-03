module Accessors
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def attr_accessor_with_history(attr_name)
      # генерируем названия переменных объекта (для значения аттрибута и истории изменения аттрибута)
      instance_variable_name = "@#{attr_name}".to_sym
      history_variable_name = "@#{attr_name}_history".to_sym

      # дефайним  геттер
      define_method attr_name.to_sym do
        instance_variable_get(instance_variable_name)
      end

      # дефайним сеттер
      define_method "#{attr_name}=" do |attr|
        history = instance_variable_get(history_variable_name) || []
        instance_variable_set(history_variable_name, history << attr)
        instance_variable_set(instance_variable_name, attr)
      end

      # и метод, который вернет историю
      define_method "#{attr_name}_history" do
        history = instance_variable_get(history_variable_name) || []
      end
    end

    def strong_attr_accessor(attr_name, type)
      instance_variable_name = "@#{attr_name}".to_sym

      # дефайним геттер
      define_method(attr_name.to_sym) do
        instance_variable_get(instance_variable_name)
      end

      # и сеттер с валидацией
      define_method("#{attr_name}=".to_sym) do |value|
        if value.class != type
          raise TypeError, "attribute Class is #{value.class}, should be #{type}"
        end

        instance_variable_set(instance_variable_name, value)
      end
    end
  end
end

class A
  include Accessors
  attr_accessor_with_history :my_attribute
  attr_accessor_with_history :my_attribute2

  strong_attr_accessor :my_attribute3, Integer
end

a = A.new
p a.my_attribute_history
a.my_attribute = 1

a.my_attribute2 = 2
a.my_attribute2 = 3

p a.my_attribute
p a.my_attribute2

p a.my_attribute_history
p a.my_attribute2_history

p a.my_attribute3 = 4
p a.my_attribute3
# Если раскомментить, валидация провалится и будет эксепшен.
# p a.my_attribute3 = "a"
