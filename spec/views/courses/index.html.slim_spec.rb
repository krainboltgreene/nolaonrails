require 'spec_helper'

describe "courses/index" do
  before(:each) do
    assign(:courses, [
      stub_model(Course),
      stub_model(Course)
    ])
  end

  it "renders a list of courses" do
    render
  end
end
