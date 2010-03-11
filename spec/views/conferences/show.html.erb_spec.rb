require 'spec_helper'

describe "/conferences/show.html.erb" do
  include ConferencesHelper
  before(:each) do
    assigns[:conference] = @conference = stub_model(Conference,
      :name => "value for name",
      :year => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
  end
end
