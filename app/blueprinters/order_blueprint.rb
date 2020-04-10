class OrderBlueprint < Blueprinter::Base
  identifier :id

  fields :total_price, :video_quality, :user_library_id
  association :purchaseable, blueprint: -> (purchaseable) { purchaseable.blueprint }, default: {}
end
