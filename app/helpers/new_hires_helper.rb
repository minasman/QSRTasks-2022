module NewHiresHelper
  def pending_hires
    if current_user.position.department == "Operations"
      NewHire.where(attended: false, store_id: current_user.stores).size
    elsif current_user.position.department == "Maintenance"
      NewHire.where(attended: false, position_id: Position.where(department: "Maintenance")).size
    else
      NewHire.where(attended: false).size
    end
  end

  def pending_background_check
    NewHire.where(attended: false, background_received: [false, nil]).size
  end
end
