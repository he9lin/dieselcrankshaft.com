RailsAdmin.config do |config|
  # config.model Product do
  #   edit do
  #     field :name
  #     field :description do
  #       ckeditor true
  #     end
  #   end
  # end
  config.model Picture do
    parent Product
  end
end