Hikuter::Application.routes.draw do
  devise_for :users

#  devise_for :users, :skip => [:registrations]
#
#  devise_for :users, :controllers => {
#    :registrations => "registrations"
#  }

  authenticated :user do
    devise_scope :user do
      root to: "registrations#show", :as => "profile"
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: "registrations#new", :as => "unauthenticated"
    end
  end
end
