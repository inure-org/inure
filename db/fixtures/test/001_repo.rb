# clonar repositório
`cp spec/seed_project.tar.gz /tmp/`
Dir.chdir("/tmp")

`tar -xf seed_project.tar.gz`

3.times do |i|
    `cp -r /tmp/legit/ /tmp/legit_#{i}/`

    puts "repositório de seed não-enpacotada - /tmp/legit_#{i}"
end
