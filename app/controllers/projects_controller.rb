class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def new
        
    end

    def destroy
        @project_item = Project.find(params[:id])
        @project_item.destroy
        redirect_to projects_path
    end

    def create
        @project = Project.new(project_params)
        @project.save
        redirect_to projects_path
    end

    def show
        @project_item = Project.find(params[:id])
    end

    private
        def project_params
            params.require(:project).permit(:title, :description, :start_date, :end_date)
        end

end
