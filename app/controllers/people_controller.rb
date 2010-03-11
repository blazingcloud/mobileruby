class PeopleController < ApplicationController
  CURRENT_CONFERENCE = 2
  
  # GET /people
  # GET /people.xml
  def index
    @conf = Conference.find(CURRENT_CONFERENCE)
    @people = @conf.attendees

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
      format.json  { render :json => @people.to_json }
    end
  end

  def all
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
      format.json  { render :json => @people.to_json }
    end
  end

  # GET /people/1
  # GET /people/1.xml
  def show
    @conf = Conference.find(CURRENT_CONFERENCE)    
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/new
  # GET /people/new.xml
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # add to current conference
  # GET /people/1/add
  def add
    @conf = Conference.find(CURRENT_CONFERENCE)
    @person = Person.find(params[:id])
    @conf.attendees << @person
    @conf.save!
    redirect_to(@person)
  end

  # POST /people
  # POST /people.xml
  def create
    @conf = Conference.find(CURRENT_CONFERENCE)
    @person = @conf.build(params[:person])

    respond_to do |format|
      if @person.save
        flash[:notice] = "#{@conf.name} attendee was successfully created."
        format.html { redirect_to(@person) }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        flash[:notice] = 'Person was successfully updated.'
        format.html { redirect_to(@person) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.xml
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(people_url) }
      format.xml  { head :ok }
    end
  end
end
