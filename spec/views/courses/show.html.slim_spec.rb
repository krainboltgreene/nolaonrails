require 'spec_helper'

describe "courses/show" do
  before(:each) do
    @course = assign(:course, stub_model(Course))
  end

  it "renders attributes in <p>" do
    render
  end
end
