
def my_uniq(arr)
    arr.uniq
end


class Array
    def two_sum

        result = []

        self.each_with_index do |num,idx|
            (idx+1..self.length-1).each do |i|
                if self[idx] + self[i] == 0
                    result << [idx,i]
                end
            end
        end
        result
    end
end