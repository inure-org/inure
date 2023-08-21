# esbarrando projeto <-> gitosis path
# criar projeto utilizando factory apenas

class Project
    def update_gitosis_project
        true
    end

    def update_gitosis
        true
    end

    def path_to_repo
        "/tmp/" + path
    end
end

class Key
    def update_gitosis
        true
    end

    def gitosis_delete_key
        true
    end
end

class UsersProject
    def update_gitosis_project
        true
    end
end
