admin = User.create(
    :email => "admin@local.host",
    :name => "administrador",
    :password => "5iveL!fe",
    :password_confirmation => "5iveL!fe"
)

admin.admin = true

admin.save!
