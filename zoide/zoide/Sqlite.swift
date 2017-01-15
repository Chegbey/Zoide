//
//  Sqlite.swift
//  zoide
//
//  Created by Marc on 15/01/2017.
//  Copyright © 2017 zoide. All rights reserved.
//

// Lien du github de SQLite https://github.com/stephencelis/SQLite.swift

import Foundation


import SQLite

let db = try Connection("path/to/db.sqlite3")

let tests = Table("tests")
let id = Expression<Int64>("id")
let test = Expression<String>("test")

try db.run(tests.create { t in
    t.column(id, primaryKey: true)
    t.column(test, unique: true)
})


let insert = tests.insert(test <- "Ceci est un test")
let rowid = try db.run(insert)
// INSERT INTO "tests" ("test") VALUES ('Ceci est un test')

for Test in try db.prepare(tests) {
    print("id: \(Test[id]), test: \(Test[test])")
    // id: 1, test: Ceci est un test
}
// SELECT * FROM "tests"

let alice = tests.filter(id == rowid) //exemple rechercher id: 30 , name: alice, test: Ce que alice a écrit

try db.run(alice.update(email <- email.replace("mac.com", with: "me.com")))
// UPDATE "users" SET "email" = replace("email", 'mac.com', 'me.com')
// WHERE ("id" = 1)

try db.run(alice.delete())
// DELETE FROM "users" WHERE ("id" = 1)

db.scalar(users.count) // 0
// SELECT count(*) FROM "users"
