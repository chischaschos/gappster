# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails_app_2.3.8_session',
  :secret      => 'dbc1dfd4f43917fdba6e1b2261a6b4314a8654d2fa78dd2e96dd0e227828b19827df54ed91a3862e6ae92cabc66e25cc9441f880d10bbf5e70b258b532a3426f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
