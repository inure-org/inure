# conta de administrador
admin = User.create(
    :email => "admin@local.host",
    :name => "administrador",
    :password => "5ivel!fe",
    :password_confirmation => "5ivel!fe"
)

admin.admin = true

admin.save!
