# encoding: utf-8
#
# esse arquivo é auto-gerado do estado atual do banco de dados.
# em vez de editar esse arquivo, use as migrações de active record para
# adicionar suas modificações incrementalmente na database, e assim, re-generar essa definição de schema.
#
# note que essa definição de schema.rb é a fonte do schema do banco de dados.
# caso seja necessário criar o banco de dados do aplicativo ou outro sistema, utilizar db:schema:load.
#
# é fortemente recomendado checar esse arquivo no sistema de controle de versões.

ActiveRecord::Schema.define(:version => 20111005193700) do
    create_table "erros", :force => true do |t|
        t.string   "título"
        
        t.text     "conteúdo"
        
        t.integer  "assignee_id"
        t.integer  "author_id"
        t.integer  "project_id"

        t.datetime "created_at"
        t.datetime "updated_at"

        t.boolean  "fechado", :default => false, :null => false
    end

    create_table "keys", :force => true do |t|
        t.integer  "user_id", :null => false

        t.datetime "created_at"
        t.datetime "updated_at"

        t.text     "key"
        
        t.string   "título"
        t.string   "identificador"
    end

    create_table "notas", :force => true do |t|
        t.string   "nota"
        t.string   "noteable_id"
        t.string   "noteable_type"

        t.integer  "author_id"
        t.integer  "project_id"

        t.datetime "created_at"
        t.datetime "updated_at"

        t.string   "attachment"
    end
    
    create_table "projetos", :force => true do |t|
        t.string   "nome"
        t.string   "path"

        t.text     "descrição"

        t.datetime "created_at"
        t.datetime "updated_at"

        t.boolean  "private_flag", :default => true, :null => false
        t.string   "código"
    end

    create_table "usuários", :force => true do |t|
        t.string   "email", :default => "", :null => false
        t.string   "nome"

        t.string   "encrypted_password", :limit => 128, :default => "", :null => false
        t.string   "reset_password_token"
        t.string   "current_sign_in_ip"
        t.string   "last_sign_in_ip"

        t.datetime "reset_password_sent_at"
        t.datetime "remember_created_at"
        t.datetime "current_sign_in_at"
        t.datetime "last_sign_in_at"
        t.datetime "created_at"
        t.datetime "updated_at"

        t.boolean  "admin", :default => false, :null => false
        t.boolean  "allowed_create_repo", :default => true, :null => false

        t.integer  "sign_in_count", :default => 0
    end

    add_index "usuários", ["email"], :name => "index_users_on_email", :unique => true
    add_index "usuários", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

    create_table "users_projects", :force => true do |t|
        t.integer  "user_id", :null => false
        t.integer  "project_id", :null => false

        t.boolean  "ler", :default => false
        t.boolean  "escrever", :default => false
        t.boolean  "admin", :default => false

        t.datetime "created_at"
        t.datetime "updated_at"
    end
end
