module Validation

  def self.included(base)
    base.extend(ClassMethods)
    base.include(InstanceMethods)
  end

  module InstanceMethods

    def validate!
      validations = class_variable_get("@@validations".to_sym)
      validations.each do |v|
        params = {}
        params[:field] = instance_variable_get("@#{v[:field]}".to_sym)
        params[:option] = v[:option] if v[:option]
        self.send("validate_#{v[:type]}", params)
      end
      true
    end

    def valid?
      self.validate!
    rescue
      false
    end

    def validate_type(params)
      raise "TypeDoesNotMatch" unless params[:field].is_a?(params[:option])
    end

    def validate_format(params)
      raise "FailedFormatField" unless params[:field].class =~ params[:option]
    end

    def validate_presence(params)
      raise "FailedValidatePresenceField" if params[:field].nil? || params[:field].empty?
    end

  end

  module ClassMethods

    def validate(field, *args)
      validations = class_variable_get("@@validations".to_sym)
      validations ||= []
      new_validation = {field: field, type: args[0]}
      new_validation[:option] = args[1] unless args[1].nil?
      validations << new_validation
      class_variable_set("@@validations".to_sym, validations)
    end

  end

end
