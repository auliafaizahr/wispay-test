require "rails_helper"

RSpec.describe UserProductMailer, type: :mailer do
  describe "product mail" do
    let(:user) { FactoryBot.create(:user) }
    let(:product) { FactoryBot.create(:product) }
    let(:mail) { UserProductMailer.product_mail }

    it 'renders the subject' do
      binding.pry
      message_delivery = instance_double(ActionMailer::MessageDelivery)
      expect(mail).to receive(:product).with(product).and_return(message_delivery)
      allow(message_delivery).to receive(:deliver_later)
    end
  end
end
