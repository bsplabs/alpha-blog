class SessionsController < ApplicationController
    def new 
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "เข้าสู่ระบบสำเร็จ"
            redirect_to user
        else
            flash.now[:alert] = "มีบางอย่างผิดพลาดระหว่างขั้นตอนเข้าสู่ระบบ"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "ออกจากระบบเเล้ว"
        redirect_to root_path
    end
end