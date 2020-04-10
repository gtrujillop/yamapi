class OrderBlueprint < Blueprinter::Base
  identifier :id

  fields :total_price, :quality, :user_library_id
  association :purchaseable, blueprint: -> (purchaseable) { purchaseable.blueprint }, default: {}
end
