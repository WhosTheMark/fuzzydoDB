I18n.locale = :es

Developer.create!(member_id: "campos",
                  name: "Marcos Campos",
                  email: "10-10108@usb.ve",
                  photo: "default.png")

Developer.create!(member_id: "delgado",
                  name: "John Delgado",
                  email: "10-10196@usb.ve",
                  photo: "default.png")

Member.create!(member_id: "carrasquel",
               name: "Soraya Carrasquel",
               email: "scarrasquel@usb.ve",
               photo: "default.png",
               articles: [Article.new(authors: "Carrasquel, Soraya; Rodriguez, Rosseline; Tineo, L.",
                  description: "\"La mujer computista: Presencia e influencia en su división dentro de la USB\". Novática. 2015. Indexada en el Latindex Catálogo. Artículo Invitado. . Vol. 231, pp. 53 - 62."),
                  Article.new(authors: "Rodriguez, Rosseline; Tineo, L; Carrasquel, Soraya.",
                  description: "\"Consultas con agrupamiento basado en similitud \". Ingeniare, Revista Chilena de Ingeniería. 2014. Indexada en el Scopus, Latindex Catálogo, Scielo. . Vol. 22, pp. 517 - 527.")])



