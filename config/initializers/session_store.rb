# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mobile_ruby_session',
  :secret      => '3d6aa7c6c528c4e332c0565a1c51a19720a8608251b21867207297fcf02b3dd1d9390f0dc9fe7040e79d8613411c484e4357f828061f09e32efda4acb0eca9f0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
