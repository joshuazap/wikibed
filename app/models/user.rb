class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis
  has_many :collaborators
  has_many :wikis, through: :collaborators

  attr_accessor :role

  enum role: [:standard, :premium, :admin]

  def collaborators
    Collaborator.where(user_id: id)
  end
end
