# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_awise_session',
  :secret      => '96bf519af5a29e32eb5f6c1a372d50cc67829077bcc606ea2bcd277bbd7b03777b2dbde05ac6a5a0e704a135dd424054fb2eaaef8e907626d13c4725d4bae4b6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
