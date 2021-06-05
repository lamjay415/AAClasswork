#O(n) = n!
#Space O(n^2)
def first_anagram?(str1,str2)

    perm = str1.split("").permutation.to_a
    
    perm.include?(str2.split(""))

end

#O(n) = n^2
#Space O(n)
def second_anagram?(str1,str2)

    arr = str2.split("")
    count = 0 
    str1.each_char do |char|

        index = arr.find_index(char)
        if index 
            arr.delete_at(index)
            count += 1
        end
    end

    return arr.length == 0 && count == str1.length

end

#O(n) = nlogn
#Space O(1)
def third_anagram?(str1,str2)

    sorted_str1 = str1.split("").sort
    sorted_str2 = str2.split("").sort

    sorted_str1 == sorted_str2

end

#O(n) = n
#Space O(1)
def fourth_anagram?(str1,str2)

    hash1 = Hash.new(0)

    str1.each_char do |c| 
        hash1[c] += 1
    end

    str2.each_char do |c| 
        hash1[c] -= 1
    end

    hash1.values.all?{ |v| v == 0}

end

p fourth_anagram?("abc","bca")
p fourth_anagram?("abc","ca")