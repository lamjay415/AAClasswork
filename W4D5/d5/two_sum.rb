#n!
#n^2
def bad_two_sum?(arr, target_sum)

    perm = arr.permutation(2).to_a

    sum = perm.map{|el| el.sum}

    sum.include?(target_sum)

end

#nlogn
#n 
def okay_two_sum?(arr, target_sum)

    sorted = arr.sort
    
    sorted.each do |num|
        result = target_sum - num 
        return true if num != result && bsearch(arr,result) 
    end

    false 
end

def bsearch(arr,num)

    return nil if arr.empty?
    mid = arr.length/2
    return mid if arr[mid] == num

    if num < mid 
        bsearch(arr[0...mid],num)
    else
        result = bsearch(arr[mid+1..-1],num)
        if result.nil?
            nil
        else
            mid + result + 1
        end
    end

end

#n
#n
def two_sum?(arr,num)

    hash = Hash.new()

    arr.each do |c|

        if hash[num-c] 
            return true
        else
            hash[c] = 1 
        end
    end

    return false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
p bsearch(arr,5)