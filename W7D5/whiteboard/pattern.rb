# Problem 1:
# Given a pattern and a string str, determine if str follows the same pattern.
# Example 1
# Input: pattern = "abba", str = "dog cat cat dog"
# Output: true
# Example 2
# Input: pattern = "abba", str = "dog cat cat fish"
# Output: false
# Example 3
# Input: pattern = "aaaa", str = "dog cat cat dog"
# Output: false
# Example 4
# Input: pattern = "abba", str = "dog dog dog dog"
# Output: false
# You may assume pattern contains only lowercase letters, and 
# str contains lowercase letters that may be separated by a single space. Can you solve it in O(N) time and O(1) space?


def pattern(pat, str)
    pat = pat.split("")
    arr = str.split(" ")
    hash = Hash.new()
    hash2 = Hash.new()
    i = 0
    #pattern4 = "abba"
    #str4 = "dog dog dog dog"
    while( i < pat.length)
        if hash[pat[i]] || hash2[arr[i]]
            return false if hash[pat[i]] != hash2[arr[i]] # hash[b] != hash2[dog] =>  dog != b// b != b
        else  
            hash[pat[i]] = arr[i] #a => dog, b => dog, 
            hash2[arr[i]] = pat[i] #dog => a, dog = b,
            return false if hash[pat[i]] != hash2[arr[i]]
        end
        i += 1
    end
    return true
end

pattern1 = "abba"
str1 = "dog cat cat dog"
pattern2 = "abba"
str2 = "dog cat cat fish"
pattern3 = "aaaa"
str3 = "dog cat cat dog"
pattern4 = "abba"
str4 = "dog dog dog dog"

puts pattern(pattern1,str1)
puts pattern(pattern2,str2)
puts pattern(pattern3,str3)
puts pattern(pattern4,str4)