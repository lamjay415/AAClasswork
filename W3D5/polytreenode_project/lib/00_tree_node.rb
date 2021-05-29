


class PolyTreeNode

  attr_accessor :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)

    if new_parent.nil?
        @parent = nil
    else
        old_parent = @parent
        old_parent.children.delete(self) unless old_parent.nil?
        @parent = new_parent
        new_parent.children << self unless new_parent.children.include?(self)
    end

  end

  def add_child(child)
    if !self.children.include?(child)
        child.parent = self
    end
  end

  def remove_child(child)
    if !self.children.include?(child)
        raise "Error"
    else
        child.parent = nil
    end
  end

  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end

    return nil
  end

  def bfs(target_value)
    queue = [self]

    while !queue.empty?
      el = queue.shift
      if el.value == target_value
        return el
      else
        el.children.each do |child|
          queue << child
        end
      end
    end

    return nil
  end

end
