require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
    # usar essa linha para caso de pré-compilação dos assets antes de postar para produção
    Bundler.require *Rails.groups(:assets => %w(teste de desenvolvimento))

    # usar essa linha para caso de compilação suave de assets na produção
    # Bundler.require(:default, :assets, Rails.env)
end

module Inure
    class Application < Rails::Application
        # configurações em config/environments/* tomam precedência acima dos especificados aqui.
        #
        # configurações de aplicativo devem ir para os arquivos em config/initializers
        # -- todos os arquivos .rb desse diretório são automaticamente carregados.

        # diretórios customizados com classes e módulos que você deseja ser auto-carregado.
        # config.autoload_paths += %W(#{config.root}/extras)

        # apenas carregar plugins nomeados aqui, na ordem recebida (padrão é ordem alfabética).
        # :all pode ser utilizado como placeholder para todos os plugins sem nome explícito.
        # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

        # ativar observadores que deverão estar sempre rodando.
        # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

        # determinar Time.zone padrão para zona específica e fazer auto-conversão Active Record para essa zona.
        # rodar "rake -D time" para lista de tasks para encontrar nomes de time zones. padrão é UTC.
        # config.time_zone = 'Central Time (US & Canada)'

        # o locale padrão é :en e todas as traduções de config/locales/*.rb,yml são auto-carregadas.
        # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
        # config.i18n.default_locale = :de

        # configurar o encoding padrão utilizado nas templates para ruby 1.9
        config.encoding = "utf-8"

        # configurar parâmetros sensitivos que irão ser filtrados do arquivo log
        config.filter_parameters += [:password]

        # habilitar a pipeline de asset
        config.assets.enabled = true

        # versão dos seus assets, mudar isso caso queira expirar todos os assets
        config.assets.version = '1.0'
    end
end
