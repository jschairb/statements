# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_invoicer_session',
  :secret      => 'dafb5f7fca0664ae1ce5f6ec6c635dc1169a70057f9eca3a2659e462f9a4a90b67f9ab9a7527fff5a52b631b0b6efa9f2d3feff2a22728bd9845e2446bcbb603'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
