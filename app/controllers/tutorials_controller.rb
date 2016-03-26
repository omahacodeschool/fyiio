class TutorialsController < ApplicationController
  
  def create
    @new_tutorial = Tutorial.new
    render "create"
  end

  def create_confirmation
    @user = User.find_by_id(current_user)
    @new_tutorial = Tutorial.new(:title => params[:tutorial][:title], :description => params[:tutorial][:description], :video => params[:tutorial][:video], :public => params[:tutorial][:public], :draft => params[:tutorial][:draft], :category => params[:tutorial][:category], :user_id => @user.id)
    @new_tutorial.save
    redirect_to "/tutorials/#{@new_tutorial.id}/chapters/create"
  end

  def edit
    @edit_tutorial = Tutorial.find_by_id(params[:tutorial_id])
  end

  def update_confirmation
    @update_tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @update_tutorial.title = params[:tutorial][:title] 
    @update_tutorial.description = params[:tutorial][:description]
    @update_tutorial.video = params[:tutorial][:video]
    @update_tutorial.public = params[:tutorial][:public]
    @update_tutorial.draft = params[:tutorial][:draft]
    @update_tutorial.category = params[:tutorial][:category]
    @update_tutorial.save
    redirect_to "/"
  end

  def view
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapters = Chapter.where({tutorial_id: @tutorial.id}).order('id')
    render "view"
  end

  def delete
    @tutorials = Tutorial.find_by_id(params[:tutorial_id]).destroy
    flash[:success] = "Tutorial successfully deleted!"
    redirect_to "/"
  end


end