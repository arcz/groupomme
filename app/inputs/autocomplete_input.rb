class AutocompleteInput < SimpleForm::Inputs::Base
  def input
    out = ''
    out << @builder.hidden_field(attribute_name)
    out << template.text_field(object_name, "#{attribute_name}_autocomplete", class: 'autocomplete-id form-control')
    out.html_safe
  end
end