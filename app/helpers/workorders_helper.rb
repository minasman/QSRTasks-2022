module WorkordersHelper
  def workorder_badge
    if current_user.position.department == "Operations"
      Workorder.where(store_id: current_user.stores, status: "Open").size
    else
      Workorder.where(organization_id: current_user.organization.id, status: "Open").size
    end
  end

  def workorder_assign_badge
    if current_user.position.department == "Operations"
      Workorder.where(store_id: current_user.stores, status: "Open", assigned: nil).size
    else
      Workorder.where(organization_id: current_user.organization.id, status: "Open", assigned: nil).size
    end
  end
end
