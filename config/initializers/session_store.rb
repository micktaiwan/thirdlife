# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_thirdlife_session',
  :secret      => '51c040c0c32f8514ff97448787d899a5913eb800e734646b682abb517e32d118e8d705e0c7e952c08905d37bf661aeedfed40c2f83528f1141dfff6fc71ff989'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
