require 'spec_helper'

describe Issue do
    describe "associações" do
        it { should belong_to(:project) }
        it { should belong_to(:author) }
        it { should belong_to(:assignee) }
    end

    describe "validação" do
        it { should validate_presence_of(:title) }
        it { should validate_presence_of(:author_id) }
        it { should validate_presence_of(:project_id) }
        it { should validate_presence_of(:assignee_id) }
    end

    describe "scope" do
        it { Issue.should respond_to :closed }
        it { Issue.should respond_to :opened }
    end

    it { Factory.create(:issue,
                        :author => Factory(:user),
                        :assignee => Factory(:user),
                        :project => Factory.create(:project)).should be_valid }
end

# == informação de schema
#
# nome da tabela: issues
#
# title       :string(255)
#
# id          :integer
# assignee_id :integer
# author_id   :integer
# project_id  :integer
#
# created_at  :datetime
# updated_at  :datetime
#
# closed      :boolean
#
# content     :text
