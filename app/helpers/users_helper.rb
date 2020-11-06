module UsersHelper
   def job_title_icon
      if @user.profile.services_offered == "Developer"
          "<i class='fas fa-code fa-fw'></i>".html_safe
      elsif @user.profile.services_offered == "Entrepreneur"
          "<i class='far fa-lightbulb fa-fw'></i>".html_safe
      elsif @user.profile.services_offered == "Investor"
          "<i class='fas fa-dollar-sign fa-fw'</i>".html_safe
      end
   end
end