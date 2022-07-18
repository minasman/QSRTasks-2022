module NewHiresHelper
  def pending_hires
    if current_user.position.department == "Operations"
      NewHire.where(attended: false, background_na: false, store_id: current_user.stores).size
    elsif current_user.position.department == "Maintenance"
      NewHire.where(attended: false, background_na: false, position_id: Position.where(department: "Maintenance")).size
    else
      NewHire.where(attended: false, background_na: false).size
    end
  end

  def pending_background_check
    NewHire.where(attended: false, background_ok: false).where(background_na: false).or(NewHire.where(background_received: false)).size
  end
end
