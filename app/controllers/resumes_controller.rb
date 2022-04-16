class ResumesController < ApplicationController
    before_action :find_resume, only: [:show] 
    before_action :find_my_resume, only: [:edit, :update, :destroy]
    before_action :authenticate_user, expect: [:index, :show]

    def index
        @resumes = Resume.published
    end

    def new
        @resume = Resume.new
    end

    def create
        # render html: params
        # @resume = Resume.new(resume_params)
        # @resume.user_id = current_user.id
        @resume = current_user.resumes.new(resume_params)
        if @resume.save
            # flash[:notice] = "新增成功"
            redirect_to resumes_path, notice: "新增成功"
        else
            render :new
        end
    end

    def update
        if @resume.update(resume_params)
            redirect_to resumes_path, notice: "更新成功"
        else
            render :edit
        end
    end

    def show
    end

    def edit
    end

    def my
        @resumes = current_user.resumes
    end

    def destroy
        @resume.destroy
        redirect_to resumes_path, notice: "已刪除"
    end

    private
      def resume_params
        params.require(:resume).permit(:title, :content, :status)
      end

      def find_resume
        if user_signed_in?
            @resume = current_user.resumes.find(params[:id])
        else
            @resume = Resume.published.find(params[:id])
        end
      end

      def find_my_resume
        # @resume = Resume.find_by!(id: params[:id],user_id: current_user_id)
        @resume = current_user.resumes.find(params[:id])
      end
end