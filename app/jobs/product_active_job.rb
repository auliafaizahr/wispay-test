class ProductActiveJob < ApplicationJob
  queue_as :default

  def perform(product)
    Product.find(product.id).update(is_active: true)
    UserProductMailer.with(product: product).product_mail.deliver_later
  end
end
