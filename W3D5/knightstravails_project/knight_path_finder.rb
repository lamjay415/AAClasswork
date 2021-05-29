require_relative "../polytreenode_project/lib/00_tree_node.rb"
require "byebug"

class KnightPathFinder

    attr_reader :root_node, :old_moves, :start_pos

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @old_moves = []
        @considered_positions = [pos]
        @start_pos = pos
        build_move_tree
    end

    def build_move_tree

        while !@considered_positions.empty?

            pos = @considered_positions.shift

            @old_moves << pos unless @old_moves.include?(pos)
            # pos = [0,0]
            # considered_pos = []

            new_nodes = new_move_positions(pos)

            # new nodes = [new positions]
            # considered_pos = [new positions]

            if pos == @root_node.value
                node = @root_node
            else 
                node = PolyTreeNode.new(pos)
            end
            # node out of el [0, 0] / start pos

            # node.parent = @considered_positions.first

            new_nodes.each do |child| # going through each new pos
                child_node = PolyTreeNode.new(child)
                # create new child node from each new pos
                child_node.parent = node
                # set parent of each child to start pos [0, 0]
                node.add_child(child_node)
                # add these new children to the parent's children arr

            end
        end

    end

    def self.valid_moves(pos)
        i , j = pos[0], pos[1]
        valid_moves = []
        valid_moves << [i+2,j+1]
        valid_moves << [i+2,j-1]
        valid_moves << [i-2,j-1]
        valid_moves << [i-2,j+1]
        valid_moves << [i+1,j+2]
        valid_moves << [i-1,j+2]
        valid_moves << [i+1,j-2]
        valid_moves << [i-1,j-2]
        valid_moves
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        new_moves = valid_moves.select do |move|
            move[0] >= 0 && move[0] < 8 && move[1] >= 0 && move[1] < 8
        end
        new_positions = []
        new_moves.each do |move|
            if !@old_moves.include?(move)
                new_positions << move
                @considered_positions << move
            end
        end
        new_positions
    end
    
    def find_path(end_pos)

        @root_node.bfs(end_pos)

    end
    
end

kpf = KnightPathFinder.new([3, 3])

puts kpf.root_node.children

p kpf.old_moves.length

