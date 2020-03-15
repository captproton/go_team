class Teams::TeamUsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_team
    def create
       team_user        = @team.team_users.new(team_user_params) 
       team_user.team   = @team
       # TODO: add default roles/default roles here    
       team_user.role   ||= "member"

       if team_user.save
           # TODO send email for new project if user already exists
           redirect_to @team, notice: "Success"
       else
           redirect_to @team, alert:  "Failure"
       end
    end

    private

    def set_team
        @team = current_user.teams.find(params[:team_id])
    end

    def team_user_params
        params.require(:team_user).permit(:email)
    end
end