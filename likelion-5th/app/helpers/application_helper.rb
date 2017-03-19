module ApplicationHelper
    def icon(shape)
      "<span class='glyphicon glyphicon-#{shape}'></span>".html_safe
    end
    
    def user_roles(user)
      user.roles.map(&:name).join(',').titleize
    end
end
