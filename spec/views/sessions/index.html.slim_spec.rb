require 'spec_helper'

describe "sessions/index" do
  before(:each) do
    assign(:sessions, [
      stub_model(Session),
      stub_model(Session)
    ])
  end

  it "renders a list of sessions" do
    render
  end
end
