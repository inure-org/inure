require 'spec_helper'

describe Project do
    describe "associações" do
        it { should have_many(:users) }
        it { should have_many(:users_projects) }
    end

    describe "validação" do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:path) }
    end

    describe "responder à" do
        it { should respond_to(:readers) }
        it { should respond_to(:writers) }
        it { should respond_to(:gitosis_writers) }
        it { should respond_to(:admins) }
        it { should respond_to(:add_access) }
        it { should respond_to(:reset_access) }
        it { should respond_to(:update_gitosis_project) }
        it { should respond_to(:destroy_gitosis_project) }
        it { should respond_to(:public?) }
        it { should respond_to(:private?) }
        it { should respond_to(:url_to_repo) }
        it { should respond_to(:path_to_repo) }
        it { should respond_to(:valid_repo?) }
        it { should respond_to(:repo_exists?) }
        it { should respond_to(:repo) }
        it { should respond_to(:tags) }
        it { should respond_to(:commit) }
    end

    it "deve retornar url válido para repositório" do
        project = Project.new(:path => "somewhere")

        project.url_to_repo.should == "git@localhost:somewhere.git"
    end

    it "deve retornar path para repositório" do
        project = Project.new(:path => "somewhere")

        project.path_to_repo.should == "/tmp/somewhere"
    end

    describe :valid_repo? do
        it "deve ser um repositório válido" do
            project = Factory :project

            project.valid_repo?.should be_true
        end

        it "deve ser um repositório inválido" do
            project = Project.new(:name => "ok_name", :path => "/INVALID_PATH/", :code => "NEOK")

            project.valid_repo?.should be_false
        end
    end

    describe "métodos git" do
        let(:project) { Factory :project }

        describe :repo do
            it "deve retornar um repositório válido" do
                project.repo.should be_kind_of(Grit::Repo)
            end

            it "deve retornar nil" do
                lambda { Project.new(:path => "invalid").repo }.should raise_error(Grit::NoSuchPathError)
            end

            it "deve retornar nil" do
                lambda { Project.new.repo }.should raise_error(TypeError)
            end
        end

        describe :commit do
            it "deve retornar primeira head do commit caso tenham parâmetros ausentes" do
                project.commit.id.should == project.repo.commits.first.id
            end

            it "deve retornar um commit válido" do
                project.commit(ValidCommit::ID).should be_valid_commit
            end

            it "deve retornar nil" do
                project.commit("+123_4532530XYZ").should be_nil
            end
        end

        describe :tree do
            before do
                @commit = project.commit(ValidCommit::ID)
            end

            it "deve retornar um erro com argumentos" do
                lambda { project.tree }.should raise_error
            end

            it "deve retornar root da tree do commit" do
                tree = project.tree(@commit)

                tree.contents.size.should == ValidCommit::FILES_COUNT
                tree.contents.map(&:name).should == ValidCommit::FILES
            end

            it "dee retornar root da tree do commit com path correto" do
                tree = project.tree(@commit, ValidCommit::C_FILE_PATH)

                tree.contents.map(&:name).should == ValidCommit::C_FILES
            end

            it "deve retornar root da tree do commit com path incorreto" do
                project.tree(@commit, "invalid_path").should be_nil
            end
        end
    end
end

# == informação de schema
#
# nome da tabela: projetos
#
# id           :integer
# description  :text
# private_flag :boolean
#
# name         :string(255)
# path         :string(255)
# code         :string(255)
#
# created_at   :datetime
# updated_at   :datetime
