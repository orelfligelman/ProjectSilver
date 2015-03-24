module ModelStripMacros
  def set_model_field_to_nil(model, field)
    FactoryGirl.build("#{model}", :field nil)
  end
end