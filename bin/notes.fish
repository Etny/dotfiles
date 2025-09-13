#!/bin/env fish

set -l course $argv[1]
if test -z $course 
    and not read -l course --prompt-str="Enter course: "
    return 1
end

set -l path ~/notes/$(string lower $course)
mkdir -p $path
if not test -d $path
    echo "$path exists, but is not a directory."
    return 1
end

set -l filename $(string lower $(date +"%b-%d")).md
set -l datestamp $(date +"%a %b. %d %Y")
set -l full_path $path/$filename
if not test -e $full_path
    echo -e "# $(string upper $course)  \n\n## $datestamp  \n\n" >> $full_path
end

cd $path
nvim + $filename


