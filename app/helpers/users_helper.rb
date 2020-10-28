module UsersHelper
   def job_title_icon
      if @user.profile.job_title == "Developer"
          "<i class='fas fa-code fa-fw'></i>".html_safe
      elsif @user.profile.job_title == "Entrepreneur"
          "<i class='far fa-lightbulb fa-fw'></i>".html_safe
      elsif @user.profile.job_title == "Investor"
          "<i class='fas fa-dollar-sign fa-fw'</i>".html_safe
      end
   end
end