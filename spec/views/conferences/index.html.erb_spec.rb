require 'spec_helper'

describe "/conferences/index.html.erb" do
  include ConferencesHelper

  before(:each) do
    assigns[:conferences] = [
      stub_model(Conference,
        :name => "value for name",
        :year => 1
      ),
      stub_model(Conference,
        :name => "value for name",
        :year => 1
      )
    ]
  end

  it "renders a list of conferences" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
