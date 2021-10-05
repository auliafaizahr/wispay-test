class UserProductMailer < ApplicationMailer
  def product_mail
    @product = params[:product]
    @user = User.find_by(params[:user_id])
    mail(to: @user.email, subject: "Product Detail")
  end
end
