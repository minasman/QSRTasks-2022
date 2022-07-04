module CommentsHelper
  def comment_badge
    if current_user.position.department == "Operations"
      Comment.where(store_id: current_user.stores, status: "Open", comment_type: "Complaint").size
    else
      Comment.where(organization_id: current_user.organization.id, status: "Open", comment_type: "Complaint").size
    end
  end
end
