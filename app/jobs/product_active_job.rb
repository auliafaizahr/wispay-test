class ProductActiveJob < ApplicationJob
  queue_as :default

  def perform(product)
    Product.find(product.id).update(is_active: true)
  end
end
