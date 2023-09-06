shared_examples_for :project_side_pane do
    subject { page }

    it { should have_content((@project || project).name) }

    it { should have_content("commits") }
    it { should have_content("time") }
    it { should have_content("árvore") }
end

shared_examples_for :tree_view do
    subject { page }

    it "deve ter a visualização de árvore do projeto" do
        should have_content("app")
        should have_content("history")
        should have_content("Gemfile")
    end
end
