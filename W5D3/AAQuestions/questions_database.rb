require 'singleton'
require 'SQLite3'

class QuestionDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :id, :fname; :lname

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    user = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
      SQL

      User.new(user.first)
  end

  def self.find_by_name(fname,lname)
    user = QuestionDBConnection.instance.execute(<<-SQL, fname, lname)
    SELECT
      *
    FROM
      users
    WHERE
      fname = ? AND lname = ?
    SQL

    User.new(user.first)
  end

  def authored_questions
    questions = Question.find_by_author_id(self.id)
  end

  def authored_replies
    replies = Reply.find_by_user_id(self.id)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end
end

class Question
  attr_accessor :id, :title, :body, :author_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    question = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
      SQL

      Question.new(question.first)
  end

  def self.find_by_author_id(id)
    question = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
      SQL

      question.map {|q| Question.new(q) }
  end

  def author
    author = QuestionDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        fname, lname
      FROM
        users
      WHERE
        id = ?
      SQL
    author = author.first
    author.values.join(" ")
  end

  def replies
    reply = Reply.find_by_question_id(id)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end
end

class Reply
  attr_accessor :id, :question_id, :body, :parent_reply_id, :author_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_id(id)
    reply = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
      SQL

      Reply.new(reply.first)
  end

  def self.find_by_user_id(id)
    reply = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
      SQL

    reply.map {|el| Reply.new(el)}
  end

  def self.find_by_question_id(id)
    reply = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
      SQL

      reply.map {|el| Reply.new(el)}
  end

  def author
    author = QuestionDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        fname, lname
      FROM
        users
      WHERE
        id = ?
      SQL
    author = author.first
    author.values.join(" ")
  end

  def question
    question = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        title, body
      FROM
        questions
      WHERE
        id = ?
      SQL
    question = question.first
    question.values.join("-")
  end

  def parent_reply
    reply = QuestionDBConnection.instance.execute(<<-SQL, parent_reply_id)
    SELECT
      *
    FROM
      replies
    WHERE
      id = ?
    SQL

    Reply.new(reply.first)
  end

  def child_replies
    reply = QuestionDBConnection.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      replies
    WHERE
      parent_reply_id = ?
    SQL
    reply.map {|el| Reply.new(el) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @body = options['body']
    @parent_reply_id = options['parent_reply_id']
    @author_id = options['author_id']
  end
end