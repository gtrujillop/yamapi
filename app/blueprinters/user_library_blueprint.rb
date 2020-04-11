class UserLibraryBlueprint < Blueprinter::Base
  identifier :id

  association :user, blueprint: UserBlueprint

  view :with_orders do
    association :orders, blueprint: OrderBlueprint
  end
end
