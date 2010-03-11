require 'spec_helper'

describe ConferencesController do

  def mock_conference(stubs={})
    @mock_conference ||= mock_model(Conference, stubs)
  end

  describe "GET index" do
    it "assigns all conferences as @conferences" do
      Conference.stub(:find).with(:all).and_return([mock_conference])
      get :index
      assigns[:conferences].should == [mock_conference]
    end
  end

  describe "GET show" do
    it "assigns the requested conference as @conference" do
      Conference.stub(:find).with("37").and_return(mock_conference)
      get :show, :id => "37"
      assigns[:conference].should equal(mock_conference)
    end
  end

  describe "GET new" do
    it "assigns a new conference as @conference" do
      Conference.stub(:new).and_return(mock_conference)
      get :new
      assigns[:conference].should equal(mock_conference)
    end
  end

  describe "GET edit" do
    it "assigns the requested conference as @conference" do
      Conference.stub(:find).with("37").and_return(mock_conference)
      get :edit, :id => "37"
      assigns[:conference].should equal(mock_conference)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created conference as @conference" do
        Conference.stub(:new).with({'these' => 'params'}).and_return(mock_conference(:save => true))
        post :create, :conference => {:these => 'params'}
        assigns[:conference].should equal(mock_conference)
      end

      it "redirects to the created conference" do
        Conference.stub(:new).and_return(mock_conference(:save => true))
        post :create, :conference => {}
        response.should redirect_to(conference_url(mock_conference))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved conference as @conference" do
        Conference.stub(:new).with({'these' => 'params'}).and_return(mock_conference(:save => false))
        post :create, :conference => {:these => 'params'}
        assigns[:conference].should equal(mock_conference)
      end

      it "re-renders the 'new' template" do
        Conference.stub(:new).and_return(mock_conference(:save => false))
        post :create, :conference => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested conference" do
        Conference.should_receive(:find).with("37").and_return(mock_conference)
        mock_conference.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :conference => {:these => 'params'}
      end

      it "assigns the requested conference as @conference" do
        Conference.stub(:find).and_return(mock_conference(:update_attributes => true))
        put :update, :id => "1"
        assigns[:conference].should equal(mock_conference)
      end

      it "redirects to the conference" do
        Conference.stub(:find).and_return(mock_conference(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(conference_url(mock_conference))
      end
    end

    describe "with invalid params" do
      it "updates the requested conference" do
        Conference.should_receive(:find).with("37").and_return(mock_conference)
        mock_conference.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :conference => {:these => 'params'}
      end

      it "assigns the conference as @conference" do
        Conference.stub(:find).and_return(mock_conference(:update_attributes => false))
        put :update, :id => "1"
        assigns[:conference].should equal(mock_conference)
      end

      it "re-renders the 'edit' template" do
        Conference.stub(:find).and_return(mock_conference(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested conference" do
      Conference.should_receive(:find).with("37").and_return(mock_conference)
      mock_conference.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the conferences list" do
      Conference.stub(:find).and_return(mock_conference(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(conferences_url)
    end
  end

end
