class AppsController < ApplicationController
  before_action :authenticate_member!

  def index
    @member = current_member.email
  end

  def new
    @app = current_member.apps.build
  end

  def show
  end

  def create
    @app = current_member.apps.build (app_params)
    if @app.save
      redirect_to @app, notice: "Success creating your App!"
    else
      render 'new'
    end
  end

  def edit
    if current_member == @app.member   #checks if current member is owner of the pin
      @app = App.find(params[:id])
    else
      flash[:danger] = "Wrong member! You are not allowed to do this!"
      redirect_to @app
    end
  end

  def update
    if @app.update(app_params)
      redirect_to @app, notice: "Update successful!"
    else
      render 'edit'
    end
  end

  def destroy
    if current_member == @app.member
      @app.destroy
      redirect_to root_path
    else
      flash[:danger] = "Wrong member! You are not allowed to do this!"
      redirect_to @app
    end
  end


  private

  def app_params
    params.require(:app).permit(:title, :description, :image)
  end

  def find_app
    @app = App.find(params[:id])
  end

end
