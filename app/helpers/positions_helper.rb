module PositionsHelper
  def position_list
    if (current_user.position.department == 'Administration') || (current_user.position.name.in? ["Training Manager", "Training Assistant", "HR Admin", "HR Manager"])
      Position.all.order(:name)
    else
      Position.all.where.not(name: ['Operations Manager', 'Supervisor']).where(department: current_user.position.department).order('name')
    end
  end
end
