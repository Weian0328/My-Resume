class ResumesController < ApplicationController
    def index
        @resumes = Resume.all
    end

    def new
        @resume = Resume.new
    end

    def create
        # render html: params
        @resume = Resume.new(resume_params)

        if @resume.save
            # flash[:notice] = "新增成功"
            redirect_to resumes_path, notice: "新增成功"
        else
            render :new
        end
    end

    private
      def resume_params
        params.require(:resume).permit(:title, :content, :status)
      end
end