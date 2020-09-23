class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    def index 
        # @users = User.all
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def new 
        @user = User.new
    end
    
    def edit 
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "แก้ไขข้อมูลของคุณเรียบร้อยเเล้ว"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "คุณลงทะเบียนสำเร็จเเล้ว ยินดีต้อนรับ #{@user.username} เข้าสู่ Dark[CMD]"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end