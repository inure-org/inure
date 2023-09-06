# certificar de reiniciar o servidor quando esse arquivo for modificado

Inure::Application.config.session_store :cookie_store, key: '_inure_session'

# usar o banco de dados para sessões em vez de cookies como padrão
# que não deveria ser utilizado para armazenar informações altamente confidenciais
# (criar a tabela de sessão com "rails generate session_migration")
#
# Inure::Application.config.session_store :active_record_store
