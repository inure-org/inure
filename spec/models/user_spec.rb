require 'spec_helper'

describe User do
	describe "associações" do
		it { should have_many(:projects) }
		it { should have_many(:users_projects) }
		it { should have_many(:issues) }
		it { should have_many(:assigned_issues) }
	end

	describe "responder à" do
		it { should respond_to(:is_admin?) }
		it { should respond_to(:identifier) }
		it { should respond_to(:name) }
	end

	it "deve retornar um identificador válido" do
		user = User.new(:email => "test@mail.com")
		user.identifier.should == "test_mail.com"
	end
end

# informação de schema
#
# nome da tabela: usuários
#
# id                     :integer
# sign_in_count          :integer
#
# email                  :string(255)
# encrypted_password     :string(128)
# reset_password_token   :string(255)
# current_sign_in_ip     :string(255)
# last_sign_in_ip        :string(255)
# name                   :string(255)
#
# reset_password_sent_at :datetime
# remember_created_at    :datetime
# current_sign_in_at     :datetime
# last_sign_in_at        :datetime
# created_at             :datetime
# updated_at             :datetime
#
# admin                  :boolean
