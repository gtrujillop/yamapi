class MovieBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :plot, :unit_price

  view :with_seasons do
    fields :title, :plot, :unit_price
    association :seasons, blueprint: SeasonBlueprint
  end
end
