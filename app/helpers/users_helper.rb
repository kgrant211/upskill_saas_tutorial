module UsersHelper
   def job_title_icon
      if @user.profile.job_title == "Developer"
          "<i class='far fa-code'></i>".html_safe
      elsif @user.profile.job_title == "Entrepreneur"
          "<i class='far fa-lightbulb'></i>".html_safe
      elsif @user.profile.job_title == "Investor"
          "<i class='far fa-dollar'</i>".html_safe
      end
   end
end