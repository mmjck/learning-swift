//
//  UserService.swift
//  Tinder
//
//  Created by Jackson Matheus on 10/03/23.
//

import Foundation


class UserService {
    static let shared = UserService()
    
    let users: [User] = [
        User(id: 101, name: "Maria Silva", age: 19, match: true, phrase: "O último a dar match chama", imageUrl: "pessoa-1"),
        User(id: 102, name: "Debora Lima", age: 25, match: false, phrase: "Deu like sem querer?", imageUrl: "pessoa-2"),
        User(id: 103, name: "Sandra Souza", age: 24, match: false, phrase: "Acho q a gente combina", imageUrl: "pessoa-3"),
        User(id: 104, name: "Anna Beatriz", age: 22, match: true, phrase: "Não bebo não fumo e não curto balada", imageUrl:  "pessoa-4"),
        User(id: 105, name: "Laura Oliveira", age: 26, match: true, phrase: "Quer saber mais sobre mim?", imageUrl:  "pessoa-5"),
        User(id: 106, name: "Silva Paz", age: 19, match: false, phrase: "Se não for conversar nem dá like", imageUrl:  "pessoa-6"),
        User(id: 107, name: "Debora Lima", age: 25, match: false, phrase: "Em busca de novas amizades", imageUrl:  "pessoa-7"),
        User(id: 108, name: "Sandra Souza", age: 24, match: true, phrase: "sem camisa não me impressionam", imageUrl: "pessoa-8"),
        User(id: 109, name: "Tah Beatriz", age: 22, match: true, phrase: "Oi pelo visto a gente combina", imageUrl:  "pessoa-9"),
        User(id: 110, name: "Laura Oliveira", age: 26, match: true, phrase: "Procurando um bom papo", imageUrl: "pessoa-10"),
        User(id: 111, name: "Sabrina Santos", age: 21, match: true, phrase: "Quem se descreve se limita", imageUrl:  "pessoa-11"),
        User(id: 112, name: "Amelia Margaret", age: 30, match: true, phrase: "Não quero nada casual", imageUrl:  "pessoa-12"),
        User(id: 113, name: "Laura Komako", age: 26, match: true, phrase: "Bom humor é fundamental", imageUrl: "pessoa-13"),
        User(id: 114, name: "Rosa Oliveira", age: 25, match: true, phrase: "Não sei me descrever", imageUrl: "pessoa-14"),
        User(id: 115, name: "Nadia Joana", age: 20, match: true, phrase: "Quer saber mais? é só dar like", imageUrl:  "pessoa-15"),
        User(id: 116, name: "Mary Dandara", age: 20, match: true, phrase: "Tenho um relacionamento aberto", imageUrl:  "pessoa-16"),
        User(id: 117, name: "Anita Eleanor", age: 23, match: true, phrase: "Bonita demais pra ser verdade", imageUrl:  "pessoa-17"),
        User(id: 118, name: "Helen Aung San", age: 24, match: true, phrase: "Espero q vc seja mente aberta", imageUrl:  "pessoa-18"),
        User(id: 119, name: "Laura Nelle", age: 18, match: true, phrase: "Estou aqui para fazer novas amizades", imageUrl:  "pessoa-19"),
        User(id: 120, name: "Maria Virginia", age: 18, match: true, phrase: "Adoro balada", imageUrl: "pessoa-20")
      
    ]
    
    func searchUser(completion:@escaping([User]?, Error?) -> ())  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            completion(self.users, nil)

        }
        
    }
    
}
