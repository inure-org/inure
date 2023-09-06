Inure::Application.configure do
    # configurações específicas aqui tomarão precedência em config/application.rb

    # no ambiente de desenvolvimento, o código do aplicativo será recarregado
    # em cada request. isso desacelera o tempo de response porém é perfeito
    # para desenvolvimento para não precisar ficar reiniciando o servidor web ao fazer mudanças no código
    config.cache_classes = false

    # registrar mensagens de erro quando métodos são acidentalmente chamados em nil
    config.whiny_nils = true

    # mostrar reports completos dos erros e desabilitar caching
    config.consider_all_requests_local       = true
    config.action_controller.perform_caching = false

    # não se importar se o mailer não consegue enviar
    config.action_mailer.raise_delivery_errors = false

    # printar notícias deprecadas para o logger do rails
    config.active_support.deprecation = :log

    # usar apenas suporte best-standards construídos em navegadores
    config.action_dispatch.best_standards_support = :builtin

    # não comprimir os assets
    config.assets.compress = false

    # expandir as linhas que carregam os assets
    config.assets.debug = true

    config.action_mailer.default_url_options = { :host => 'localhost:3000' }
end
