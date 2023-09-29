module Install
	class << self
		def prepare(env)
			puts green " == inicializando para ENV=#{env} ..."
			puts "rvm detectado" if is_rvm?

			bundler
			db(env)

			puts green " == concluído. você pode inicializar o servidor agora"
		end

		def bundler
			command 'gem install bundler'
			command 'bundle install'
		end

		def db(env)
			command "bundle exec rake db:setup RAILS_ENV=#{env}"
			command "bundle exec rake db:seed_fu RAILS_ENV=#{env}"
		end

		def is_rvm?
			`type rvm | head -1` =~ /^rvm is/
		end

		def colorize(text, color_code)
			"\033[#{color_code}#{text}\033[0m"
		end

		def red(text)
			colorize(text, "31m")
		end

		def green(text)
			colorize(text, "32m")
		end

		def command(string)
			`#{string}`

			if $?.to_i > 0
				puts red " == #{string} - ERRO"
				puts red " == erro durante configuração"

				exit
			else
				puts green " == #{string} - OK"
			end
		end
	end
end
