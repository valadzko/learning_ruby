module Accessors

  def attr_accessor_with_history(*names)
    names.each do |name|
      puts "Name :#{name}"
      var_name = "@#{name}".to_sym
      define_method(name.to_sym) {instance_variable_get(var_name)}
      define_method("#{name}=".to_sym) do |value|
       instance_variable_set(var_name, value)
       history = instance_variable_get("@#{name}_history".to_sym)
       history = [] unless history
       history << value
       instance_variable_set("@#{name}_history".to_sym, history)
      end
      define_method("#{name}_history".to_sym) {instance_variable_get("@#{name}_history".to_sym)}
    end
  end

  def strong_attr_acessor(name, class_name)
    define_method(name.to_sym) {instance_variable_get("@#{name}".to_sym)}
    define_method("#{name}=".to_sym) do |value|
      raise "ClassNameDoesNotMatch" unless value.class == class_name
      instance_variable_set("@#{name}".to_sym,value)
    end
  end

end
