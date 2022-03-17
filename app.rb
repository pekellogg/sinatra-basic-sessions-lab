require_relative 'config/environment'

class App < Sinatra::Base
    configure do
        enable :sessions  # turns on sessions, now sessions hash is avail to each App/Controller route
        set :session_secret, ",BUQ\"NyBt{6NdX@<" # encryption key creates a unique session_id for each App instance, "session"
        # browser cookie stores session_id
    end

    get '/' do
        erb :'index'
    end

    # To track user's actions during each session,
    # we need to set up the session hash to store the user_id (but in this example, the input from the form) in self during a Controller action
    post '/checkout' do
        # store form input on sessions hash obj by creating new key => form data's text
        session["item"] = params["item"]
        @session = session  # session variable now avail on App instance and for display in views
        erb :'checkout'
    end
end

# To keep track of a current user thru out session,
# 1. enable sessions in server config
# 2. add user_id to session hash during a controller action