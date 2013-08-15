class UsersController < ApplicationController
    
    layout :resolve_layout



    def index
    end

    private

    def resolve_layout
      case action_name
      when "new", "create"
        "some_layout"
      when "index"
        puts("In here")
        puts(session[:user].nil?)
        if session[:user].nil?
          "application"
        else
          "product"
        end
      else
        "application"
      end
    end

    

end
