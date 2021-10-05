require "rails_helper"

RSpec.describe ProductActiveJob, :type => :job do
  describe "perform" do
    let(:user) { FactoryBot.create(:user) }
    product =  Product.new(name: "abcd", user_id: User.first.id, category: "vehicle", price: "2000", is_active: false)
    product.save

    it "perform later" do
      ActiveJob::Base.queue_adapter = :test
      expect {
        ProductActiveJob.perform_later(product)
      }.to have_enqueued_job
    end

    it 'is_active change to true' do

    end
  end
end
