require 'simplecov'
SimpleCov.start 'rails'

# esse arquivo é copiado para spec/ quando você roda 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/dsl'
require 'factories'
require 'monkeypatch'

# requer suporte de arquivos ruby com matchers e macros customizados
# em spec/support/ e seus sub-diretórios
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
	# == framework de mock
	#
	# se você prefere utilizar mocha, flexmock ou rp, não comentar essa linha apropriada
	#
	# config.mock_with :mocha
	# config.mock_with :flexmock
	# config.mock_with :rr
	config.mock_with :rspec

	config.include LoginMacros

	# remover essa linha caso activerecord e suas fixtures não estejam sendo utilizadas
	config.fixture_path = "#{::Rails.root}/spec/fixtures"

	# caso não esteja utilizando activerecord, remover essa seguinte linha
	config.use_transactional_fixtures = false

	config.before :each, :type => :integration do
		DeviseSessionMock.disable
	end

	config.before do
		if example.metadata[:js]
			DatabaseCleaner.strategy = :truncation
		else
			DatabaseCleaner.strategy = :transaction
		end

		DatabaseCleaner.start
	end

	config.after do
		DatabaseCleaner.clean
	end
end
