require "rails_helper"
# hit a POST route
# assert POST URLs not stored in session
RSpec.describe ApplicationController, :type => :controller do
  let(:volunteer) { create(:volunteer) }
  # stub an index action in application controller
  controller do
    def index
      render :plain => "hello there"
    end
  end
  before do
    # authorize user
    # sign in as an admin
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(volunteer)
  end
  describe "#index" do
    it "does not store URL path for POST" do
      path = "/index"
      session_key = "volunteer_return_to"
      post :index
      expect(session[session_key]).not_to be path
      expect(session[session_key]).to be nil
    end
  end
end
