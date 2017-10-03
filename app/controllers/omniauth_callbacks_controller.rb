class OmniauthCallbacksController  < Devise::OmniauthCallbacksController
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    # if @user.persisted?
    # p "*" * 100
    if @user
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      if @user.criteria_one == nil
        sign_in @user, event: :authentication
        p "Inside the mothafuckin thingie"
        render "users/criteria_form"
      else
        sign_in_and_redirect @user, event: :authentication
      end
    end
    # else
    #   session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
    #   # redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    #   render "devise/registrations/criteria_form"
    # end

  end
end
