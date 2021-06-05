def my_min_slow(arr)
    arr.each do |ele1|
        smallest_num = true
        arr.each do |ele2|
            smallest_num = false if ele1 > ele2
        end
        return ele1 if smallest_num
    end
end

def my_min_fast(arr)
    smallest_num = arr[0]
    arr.each do |ele|
        smallest_num = ele if ele < smallest_num
    end
    smallest_num
end

def largest_contiguous_subsum_slow(list)
    contiguous_subarrays = []
    list.each_with_index do |ele1, i|
        list.each_with_index do |ele2, j|
            contiguous_subarrays << list[i..j] if j >= i
        end
    end
    sum_arr = contiguous_subarrays.map { |subarr| subarr.sum }
    sum_arr.max
end

def largest_contiguous_subsum_fast(list)
    curr_sum = list[0]
    max_sum = list[0]
    (1...list.length).each do |ele|
        if curr_sum + list[ele] < list[ele]
            curr_sum = list[ele]
        else
            curr_sum+=list[ele]
        end
        max_sum = curr_sum if curr_sum > max_sum

    end
    #max_sum == 0 ? list.max : max_sum
    max_sum
end

p largest_contiguous_subsum_fast([5, 3, -7])
p largest_contiguous_subsum_fast([2, 3, -6, 7, -6, 7])
p largest_contiguous_subsum_fast([-5, -1, -3])