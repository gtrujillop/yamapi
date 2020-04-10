class EpisodeBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :number

  view :with_plot do
    fields :title, :plot, :number
  end

end
