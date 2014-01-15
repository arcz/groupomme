class AutocompleteInput < SimpleForm::Inputs::Base
  def input
    out = ''
    out << @builder.text_field(attribute_name)
    out << template.text_field(object_name, "#{attribute_name}_autocomplete")
    out.html_safe
    end
  end
end