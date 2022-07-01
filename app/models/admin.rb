class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :confirmable, :lockable, :timeoutable, :trackable, :masqueradable
end
