class NotesController < ActionController::Base

  #get '/new' do
    #erb :new
  #end

  def new
  end

  def create
    x = Note.new(:title => params[:title], :body => params[:body])
    x.save()
    redirect_to '/'
  end

end
