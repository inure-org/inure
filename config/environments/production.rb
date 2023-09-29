Inure::Application.configure do
	# configurações específicas aqui tomarão precedência desses em config/application.rb

	# código aqui não é recarregado entre os requests
	config.cache_classes = true

	# habilitação de reports de erros completos são desativados e armazenados
	config.consider_all_requests_local       = false
	config.action_controller.perform_caching = true

	# desativando o servidor de assets do rails (apache ou nginx já farão isso)
	config.serve_static_assets = false

	# comprimir javascript e css
	config.assets.compress = true

	# não cair para pipeline de asset caso pré-complicação seja ausente
	config.assets.compile = true

	# gerar digestões para urls de assets
	config.assets.digest = true

	# padrão é rails.root.join("public/assets")
	# config.assets.manifest = YOUR_PATH

	# especifica o header do servidor que está sendo utilizado para mandar arquivos
	# config.action_dispatch.x_sendfile_header = "X-Sendfile" # para o apache
  	# config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # para o nginx

	# força o acesso total ao app pelo ssl, usa strict-transport-security e cookies seguros
	# config.force_ssl = true

	# ver tudo no log (padrão é :info)
	# config.log_level = :debug

	# utiliza um logger diferente para setups distribuídos
	# config.logger = SyslogLogger.new

	# utiliza um armazenamento diferente na produção
	# config.cache_store = :mem_cache_store

	# habilita o serviço de imagens, estilizações e javascripts de um servidor de assets
	# config.action_controller.asset_host = "https://assets.example.com"

	# pré-compila assets adicionais (application.js, application.css e todos os arquivos não js/css já adicionados)
	# config.assets.precompile += %w( search.js )

	# desabilita erros de delivery, endereços de email ruins serão ignorados
	# config.action_mailer.raise_delivery_errors = false

	# habilita modo threaded
	# config.threadsafe!

	# habilita fallbacks de locale para o i18n
	# faz lookups para call fallback locale para o i18n.default_locale quando uma tradução não for encontrada
	config.i18n.fallbacks = true

	# envia notícias de deprecation para ouvintes registrados
	config.active_support.deprecation = :notify

	config.action_mailer.delivery_method = :sendmail
	# padrão é:
	# # config.action_mailer.sendmail_settings = {}
	# #     :location => '/usr/sbin/sendmail',
	# #     :arguments => '-i -t'
	# # }
	config.action_mailer.perform_deliveries = true
	config.action_mailer.raise_delivery_errors = true
end
