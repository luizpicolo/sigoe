Rails.env.on(:any) do
  options = {
    :enabled => true,
    :remove_multi_spaces => true,
    :remove_comments => true,
    :remove_intertag_spaces => false,
    :remove_quotes => true,
    :compress_css => false,
    :compress_javascript => false,
    :simple_doctype => false,
    :remove_script_attributes => true,
    :remove_style_attributes => true,
    :remove_link_attributes => true,
    :remove_form_attributes => false,
    :remove_input_attributes => true,
    :remove_javascript_protocol => true,
    :remove_http_protocol => false,
    :remove_https_protocol => false,
    :preserve_line_breaks => false,
    :simple_boolean_attributes => true
  }

  config.middleware.use HtmlCompressor::Rack, options
end
