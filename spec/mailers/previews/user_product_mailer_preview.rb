# Preview all emails at http://localhost:3000/rails/mailers/user_product_mailer
class UserProductMailerPreview < ActionMailer::Preview
  def product_mail
    # Set up a temporary order for the preview
    product = Product.first

    UserProductMailer.with(product: product).product_mail
  end

end
