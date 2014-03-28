# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
if Rails.env.production?
	OrphanCommit::Application.config.secret_key_base = ENV['SECRET_TOKEN']
else
	OrphanCommit::Application.config.secret_key_base = 'c894e545fffa876bbd3995535b35836f3a6a924ace6360c5bb553b3d206d74747f04425bac2a193fc8b7b784e659b060f77ae71837285b26d387d35f026ed20b'
end