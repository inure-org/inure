require 'spec_helper'

describe UsersProject do
    describe "associações" do
        it { should belong_to(:project) }
        it { should belong_to(:user) }
    end

    describe "validação" do
        it { should validate_presence_of(:user_id) }
        it { should validate_presence_of(:project_id) }
    end

    describe "delegar métodos" do
        it { should respond_to(:user_name) }
        it { should respond_to(:user_email) }
    end
end

# == informação de schema
#
# nome da tabela: users_projects
#
# id         :integer
# user_id    :integer
# project_id :integer
#
# read       :boolean
# write      :boolean
# admin      :boolean
#
# created_at :datetime
# updated_at :datetime
