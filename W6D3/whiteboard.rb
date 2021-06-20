# Problem 1:
# Given a file path:
# /users/app_academy_work/curriculumn/ruby/../sql/./../rails
# Reduce this path to the shortest possible path:
# /users/app_academy_work/curriculumn/rails
# What ADT you can use to solve this problem?
# Keep in mind that ../ means traveling up a directory and ./ means searching in the current directory.

def shortest_path(str)

    arr = str.split('/')
    result = []
    arr.each do |folder|
        if folder == '..'
            result.pop
        elsif folder == '.'
            result
        else
            result << folder
        end
    end
    result.join('/')
end
