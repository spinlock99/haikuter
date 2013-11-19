require 'spec_helper'

describe HaikusController do
  let(:user) { FactoryGirl.create(:user) }
  let(:haiku) { FactoryGirl.attributes_for(:haiku, user: user) }

  describe ".create" do
    render_views

    before { sign_in user }

    it "returns http success" do
      post :create, {user_id: user.id, haiku: haiku}
      response.should render_template :show
    end
  end
end
