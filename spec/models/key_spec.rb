require 'spec_helper'

describe Key do
    describe "associações" do
        it { should belong_to(:user) }
    end

    describe "validação" do
        it { should validate_presence_of(:title) }
        it { should validate_presence_of(:key) }
    end

    describe "métodos" do
        it { should respond_to :projects }
    end

    it { Factory.create(:key,
                        :user => Factory(:user)).should be_valid }
end

# == informação de schema
#
# nome da tabela: keys
#
# title      :string(255)
# identifier :string(255)
#
# id         :integer
# user_id    :integer
#
# created_at :datetime
# updated_at :datetime
#
# key        :text
