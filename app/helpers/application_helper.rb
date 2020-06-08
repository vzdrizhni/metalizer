module ApplicationHelper
  def admin?(user)
    link_to 'Add category', new_category_path if !user.nil? && user.admin?
  end
end
