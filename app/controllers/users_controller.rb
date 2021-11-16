class UsersController < ApplicationController
  before_action :set_presenter
  before_action :set_user, only: [:show, :destroy, :edit, :update, :wakeup]

  authorize_resource

  def index
    @users = User.includes(:organization).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_params)

    if @user.save
      redirect_to users_url, flash: { success: 'User saved...' }
    else
      flash[:danger] = 'User not saved...'
      render :new
    end
  end

  def update
    if @user.update(strong_params)
      redirect_to user_url(@user), flash: { success: "User updated (#{@user.first_name} #{@user.last_name})..." }
    else
      flash[:danger] = 'User not updated...'
      render :edit
    end
  end

  def destroy
    @user.discard
    flash.now[:success] = 'User destroyed...'
    
    respond_to do |format|
      format.js { @users = User.includes(:organization).page(params[:page]) }
    end
  end

  def wakeup
    UsersMailer.wakeup(@user).deliver_now
    head :ok
  end

  def import
    importer = Importers::UsersImporter.new(params[:file])
    
    if importer.process
      message = { success: 'Users imported...' }
    else
      message = { danger: 'Users not imported...' }
    end

    redirect_to users_url, flash: message
  end

  def export
    send_file Exporters::UsersExporter.process, filename: "users_export_#{current_timestamp}.xlsx"
  end

  private

  def set_presenter
    @presenter = ::UsersPresenter.new(params)
  end

  def strong_params
    params.require(:user).permit(:first_name, :last_name, :email, :organization_id, addresses_attributes: [:id, :_destroy, :street, :zipcode, :city])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
