class TeamUser < ApplicationRecord
  belongs_to :team
  belongs_to :user

  attribute :email, :string

  before_validation :set_user_id, if: :email?

  def set_user_id
    self.user =   User.invite!(email: email)
  end

  def owner?
    self.role == "owner"
  end

  def member?
    self.role == "member"
  end

  def guest?
    self.role == "guest"
  end

end
