require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    result = DBConnection.execute(<<-SQL)
      SELECT 
        *
      FROM
        #{self.table_name}
    SQL
    @columns = result.first.keys.map!{ |el| el.to_sym}
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) do 
        self.attributes[col]
      end

      define_method("#{col}=") do |value|
        self.attributes[col] = value
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name || self.name.tableize
  end

  def self.all
    # ...
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM 
        #{self.table_name}
    SQL
    parse_all(results)
  end

  def self.parse_all(results)
    # ...
    obj_arr = []
    results.each do |row|
      obj_arr << self.new(row)
    end
    obj_arr
  end

  def self.find(id)
    # ...
    results = DBConnection.execute(<<-SQL, id)
      SELECT *
       FROM #{self.table_name}
       WHERE id = ?
    SQL

    if !results.empty?
      self.new(results.first)
    else
      return nil
    end
  end

  def initialize(params = {})
    # ...
    params.each do |k,v|
      raise "unknown attribute '#{k}'" if !self.class.columns.include?(k.to_sym)
      self.send("#{k.to_sym}=",v)
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    @attributes.values
  end

  def insert
    # ...
    col_names = attribute_values.join(",")
    question_marks = ["?"] * 
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
