RailsAdmin.config do |config|
  config.model Picture do
    list do
      field :name
      field :image do
        formatted_value do
          bindings[:view].tag(:img, { :src => bindings[:object].image.url(:thumb) })
        end
      end
      field :created_at
    end
  end
end