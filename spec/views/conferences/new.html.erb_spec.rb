require 'spec_helper'

describe "/conferences/new.html.erb" do
  include ConferencesHelper

  before(:each) do
    assigns[:conference] = stub_model(Conference,
      :new_record? => true,
      :name => "value for name",
      :year => 1
    )
  end

  it "renders new conference form" do
    render

    response.should have_tag("form[action=?][method=post]", conferences_path) do
      with_tag("input#conference_name[name=?]", "conference[name]")
      with_tag("input#conference_year[name=?]", "conference[year]")
    end
  end
end
