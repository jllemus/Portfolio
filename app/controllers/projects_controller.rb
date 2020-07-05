class ProjectsController < ApplicationController
    skip_before_action :ensure_login, only: [:index, :show]

    def index
        if logged_in?
            unless current_user.username == 'admin'
                @projects = current_user.projects.all
            else
                @projects = Project.all
            end
        else
            @default_user = User.find_by(admin: true)
            @projects = @default_user.projects.all
        end
    end
    
    def destroy
        @project = project_find
        @project.destroy
        redirect_to projects_path
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        @project.user = current_user
        if @project.save 
            redirect_to projects_path
            flash[:notice] = "Project was created successfully."
        else
            render 'new'
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = project_find
        if @project.update(project_params)
            redirect_to projects_path
          else
            render 'edit'
          end
    end

    def show
        @project_item = project_find
    end

    private

        def project_params
            params.require(:project).permit(:title, :description, :start_time, :end_time)
        end

        def project_find
            Project.find(params[:id])
        end

end
