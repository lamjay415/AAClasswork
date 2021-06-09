PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (

    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL

);


CREATE TABLE questions(

    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);



CREATE TABLE question_follows(

    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);



CREATE TABLE replies(

    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    parent_reply_id INTEGER,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)

);



CREATE TABLE question_likes(

    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)

);

INSERT INTO 
    users (fname,lname)
VALUES 
    ('Mara', 'Finkel'), 
    ('Jay','Lam'),
    ('Jelly','Bean');

INSERT INTO
    questions(title,body,author_id)
VALUES
    ('Why don''t we have a lecture day?','I AM CONFUSED, WHY NO ONE HELP???',
    (SELECT id FROM users WHERE fname = 'Mara')),
    ('What are we doing tomorrow?', 'I am no clue, the schedule doesn''t say anything', 
    (SELECT id FROM users WHERE fname = 'Jay')),
    ('When will we stop having questions???','I DONT WANT TO BE CONFUSED ANYMORE!!',
    (SELECT id FROM users WHERE fname = 'Mara'));

INSERT INTO 
    question_follows(question_id,user_id)
VALUES
    (1,2),(2,2),(1,2),(2,1);


INSERT INTO
    replies(question_id,body,parent_reply_id,author_id)
VALUES
    (1,"TAs didn't have coffee",null , 3),
    (2,"As little as we possibly can",null , 1),
    (1,"why didn't they go starbucks",1,2),
    (2,"going to taco bell",null ,3),
    (1,"it was closed because of covid", 3, 3);

INSERT INTO
    question_likes(user_id,question_id)
VALUES
    (1,2),(2,1),(3,1),(3,2);
