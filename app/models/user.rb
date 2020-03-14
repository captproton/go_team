class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, :invitable

  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services

  # custom to app
  has_many :team_users
  has_many :teams, through: :team_users
end
