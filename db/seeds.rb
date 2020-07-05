# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Project.destroy_all

projects =[
    {
        title: 'Sistema de selección electrónica por fases independientes de módulos de carga para la plataforma UniGRID.', 
        description: 'Implementation of a web system that allows remote control on a
        resistor bank located in a lab at Universidad del Norte in Barranquilla. The web platform was developed in Python 
        programming language among JavaScript, PHP, and MySQl',
        start_date: '2018-07-11',
        end_date: '2018-09-25'
    }, 
    {
        title: 'Sistema de telemetría usando una Syrus 3G bluetooth para aplicativo de rastreo geo-referenciado.', 
        description: 'Implementation of a web application designed to control the geoposition 
        of a big amount of vehicles. The platform was designed in JavaScript programming language, PHP, SQL, and Java.',
        start_date: '2018-01-26',
        end_date: '2018-06-25'
    }
]
user = User.create! username: 'admin', password: 'admin123', admin: true
projects.each do |project_item|
    Project.create! title: project_item[:title], 
        description: project_item[:description], 
        start_date: project_item[:start_date], 
        end_date: project_item[:end_date], 
        user_id: user.id
end

