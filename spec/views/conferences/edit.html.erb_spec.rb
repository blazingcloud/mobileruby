require 'spec_helper'

describe "/conferences/edit.html.erb" do
  include ConferencesHelper

  before(:each) do
    assigns[:conference] = @conference = stub_model(Conference,
      :new_record? => false,
      :name => "value for name",
      :year => 1
    )
  end

  it "renders the edit conference form" do
    render

    response.should have_tag("form[action=#{conference_path(@conference)}][method=post]") do
      with_tag('input#conference_name[name=?]', "conference[name]")
      with_tag('input#conference_year[name=?]', "conference[year]")
    end
  end
end
