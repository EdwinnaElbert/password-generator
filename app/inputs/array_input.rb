class ArrayInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options = nil)
    input_html_options[:type] ||= input_type
    existing_values = Array(object.public_send(attribute_name)).map do |array_el|
      form(array_el)
    end
    if existing_values.length < 4
      (3 - existing_values.length).times do
        existing_values.push form(nil)
      end
    existing_values.join.html_safe
    end
  end

  def form(value)
    @builder.text_field(nil, input_html_options.merge( class: 'form-control single-word',
     value: value, name: "#{object_name}[#{attribute_name}][]"))
  end

  def input_type
    :text
  end
end
