class Teams::TeamUsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_team
    before_action :current_team_owner
    def create
       team_ballot        = @team.team_ballot_initiatives.new(team_ballot_initiatives_params) 
       team_ballot.team   = @team
       # TODO: add default roles/default roles here    

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

    def get_current_team_owner
        current_team_owner = @team.team_users.where(role: "owner").first
    end

    def authorize_creation_of_ballot
        # only team_users with role of owner can add ballot
        current_owner = get_current_team_owner
        if current_owner.to_s.length > 0 # length of zero means no current_owner
            if current_user.id == current_user.id
                return true
            else
                return false
            end
        else
           redirect_to @team, alert:  "Failure: no team owner"
        end
        
    end
    def team_user_params
        params.require(:team_user).permit(:email)
    end
end