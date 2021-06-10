require_relative 'questions_database.rb'

class QuestionFollow
  attr_accessor :id, :question_id, :user_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def self.followers_for_question_id(question_id)
    user = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_follows
      ON
        users.id = question_follows.user_id
      JOIN
        questions
      ON
        questions.id = question_follows.question_id
      WHERE
        questions.id = ?
    SQL

    user.map { |el| QuestionFollow.new(el) }
  end


#  def self.followed_questions_for_user_id(user_id)
#Returns an array of Question objects.
# end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end


end

