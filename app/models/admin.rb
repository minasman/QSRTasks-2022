class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :confirmable, :lockable, :timeoutable, :trackable, :masqueradable

  def full_name
    first_name + ' ' + last_name
  end
end
