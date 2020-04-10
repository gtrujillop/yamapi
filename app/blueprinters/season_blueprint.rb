class SeasonBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :number, :unit_price

  view :with_episodes do
    association :episodes, blueprint: EpisodeBlueprint
  end

  view :with_plot do
    fields :title, :plot, :number, :unit_price
    association :seasons, blueprint: SeasonBlueprint
  end
end
