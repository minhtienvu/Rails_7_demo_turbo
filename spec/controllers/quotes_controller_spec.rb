require 'rails_helper'

RSpec.describe QuotesController do
  let!(:company) { create(:company) }
  let!(:quote) { create(:quote, company_id: company.id) }
  let(:user) { create(:user, company_id: company.id) }

  before :each do
    sign_in user
  end

  context 'Get #index' do
    render_views

    before do
      get :index
    end

    it 'return 200 status code' do
      expect(response.status).to eq 200
    end
  end
end