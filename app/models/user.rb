class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :confirmable, :lockable, :timeoutable, :trackable, :masqueradable
  belongs_to :organization
  belongs_to :position
end
