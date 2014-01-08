class GroupDecorator < Draper::Decorator
  delegate_all
  
  def join_button
    if model.users.include?(h.current_user)
      h.link_to '- Leave Group', h.group_join_path(object), method: :delete
    else
      h.link_to '+ Join Group', h.group_join_path(object), method: :post
    end
  end
end