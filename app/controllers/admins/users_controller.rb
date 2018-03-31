class Admins::UsersController < Admins::ApplicationController
  layout "admin"

  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/users
  # GET /admin/users.json
  def index
    @admin_users = User.order('id desc').paginate(:page => params[:page], :per_page => params[:per_page])
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      params.require(:admin_user).permit(:uid, :email, :name, :english_name, :avatar, :state, :type, :bio)
    end
end
