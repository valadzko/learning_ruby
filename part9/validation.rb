module Validation

  def self.included(base)
    base.extend(ClassMethods)
    base.include(InstanceMethods)
  end

  module InstanceMethods
    def validate!
      to_validate = []
      self.methods.each {|m| to_validate << m if m.to_s.start_with?("validation_field_")}
      to_validate.each {|validation| self.send(validation)}
      true
    end

    def valid?
      self.validate!
    rescue
      false
    end

  end

  module ClassMethods
    def validate (field, *args)

      case args[0].to_sym
      when :type
        define_method("validation_field_#{field}".to_sym) do
          raise "TypeDoesNotMatch" unless "@#{field}".is_a?("#{args[1]})
        end
      when :format
        define_method("validation_field_#{field}".to_sym) do
          raise "FailedFormatField" unless "@#{field.class}" =~ "#{args[1]}"
        end
      when :presence
        define_method("validation_field_#{field}".to_sym) do
          raise "FailedValidatePresenceField" if "@#{field}".nil? || "@#{field}".empty?
        end
      end # case-when
    end # validate
  end # ClassMethods

end
