require 'spec_helper'

describe "sessions/show" do
  before(:each) do
    @session = assign(:session, stub_model(Session))
  end

  it "renders attributes in <p>" do
    render
  end
end
