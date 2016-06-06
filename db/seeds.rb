I18n.locale = :en

Developer.create!(member_id: "campos",
                  name: "Marcos Campos",
                  email: "10-10108@usb.ve")

Developer.create!(member_id: "delgado",
                  name: "John Delgado",
                  email: "10-10196@usb.ve")

Member.create!(member_id: "rodriguez",
               name: "Rosseline Rodríguez",
               email: "crodig@usb.ve",
               photo: "rosseline.png")

Member.create!(member_id: "tineo",
               name: "Leonid Tineo",
               email: "leonid@usb.ve")

Member.create!(member_id: "carrasquel",
               name: "Soraya Carrasquel",
               email: "scarrasquel@usb.ve",
               articles: [Article.new(authors: "Carrasquel, Soraya; Rodriguez, Rosseline; Tineo, L.",
                  description: "\"La mujer computista: Presencia e influencia en su división dentro de la USB\". Novática. 2015. Indexada en el Latindex Catálogo. Artículo Invitado. . Vol. 231, pp. 53 - 62."),
                  Article.new(authors: "Rodriguez, Rosseline; Tineo, L; Carrasquel, Soraya.",
                  description: "\"Consultas con agrupamiento basado en similitud \". Ingeniare, Revista Chilena de Ingeniería. 2014. Indexada en el Scopus, Latindex Catálogo, Scielo. . Vol. 22, pp. 517 - 527.")])

Member.create!(member_id: "coronado",
               name: "David Coronado",
               email: "dcoronado@usb.ve")

Member.create!(member_id: "cadenas",
               name: "José Cadenas",
               email: "jtcadenas@usb.ve")

Member.create!(member_id: "ramirez",
               name: "Josué Ramírez",
               email: "ramirezjosue@usb.ve")

Member.create!(member_id: "monascal",
               name: "Ricardo Monascal",
               email: "rmonascal@usb.ve")

Member.create!(member_id: "rocha",
               name: "Darwin Rocha",
               email: "darwinrocha@usb.ve",
               photo: "darwin.png")

User.create!(name: "Marcos Campos",
             username: "whosthemark",
             email: "whosthemark@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             role: :member)

User.create!(name: "John Delgado",
             username: "pexison",
             email: "pexison@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             role: :member)

User.create!(name: "Soraya Carrasquel",
             username: "scarrasquel",
             email: "scarrasquel@usb.ve",
             password: "123123",
             password_confirmation: "123123",
             role: :member)

User.create!(name: "David Coronado",
             username: "dcoronado",
             email: "dcoronado@usb.ve",
             password: "123123",
             password_confirmation: "123123",
             role: :member)

User.create!(name: "Rosseline Rodríguez",
             username: "rrodriguez",
             email: "rrodriguez@usb.ve",
             password: "123123",
             password_confirmation: "123123",
             role: :member)

User.create!(name: "Admin",
             username: "Admin",
             email: "admin@fuzzydo.db",
             password: "123123",
             password_confirmation: "123123",
             role: :admin)

User.create!(name: "Super Miembro",
             username: "Super",
             email: "super@fuzzydo.db",
             password: "123123",
             password_confirmation: "123123",
             role: :super_member)

