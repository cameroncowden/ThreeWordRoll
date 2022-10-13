#!/bin/bash

# This takes a word list, and generates combinations of 3 words. 
# With a surprisingly small word list, you can get a large number of unique identifiers. 
# Like What3Words, but for anything and everything.

# (number of unique words)^3 => (100)^3 = 1 million
# 22^3 = 10,648

# for 10,648 unique identifiers, you need only 22 words. 
# Which is also within the realm of memorization for a human - especially if they can be arranged in a meaningful way.


# input file with 22 words and trailing newline, and name for output file
wordlist="word_list.txt"
tripletlist="triplets.txt"

# empty the output file it it exists already
echo -n "" > $tripletlist

declare -a words=()

i=0 

while IFS= read -r line
do
  #line by line add each word to array
  words[i]="$line"
  i=$((i + 1))
done < "$wordlist"

# Loop through array 3 times to create all possible combinations
i=0
for a in "${words[@]}"
do
    for b in "${words[@]}"
    do
        for c in "${words[@]}"
        do 
            # Add the unique combo as the next line in the file
            echo $a-$b-$c>>$tripletlist
        done
    done

done