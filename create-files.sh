#!/bin/bash

# Script to set up directories and files for Advent of Code 2023 in C

# Loop through 25 days of Advent of Code
for DAY in {1..25}
do
    # Format day for directory name (e.g., Day01, Day02, ...)
    DIR_NAME=$(printf "Day%02d" $DAY)

    # Create directory
    mkdir -p $DIR_NAME

    # Navigate to the directory
    cd $DIR_NAME

    # Create main.c file
    cat > main.c <<- "EOF"
#include <stdio.h>

int main() {
    printf("Solution for Day $DAY\n");
    return 0;
}
EOF

    # Replace $DAY with actual day number in main.c
    sed -i "s/\$DAY/$DAY/g" main.c

    # Create input.txt file
    touch input.txt

    # Create Makefile
    cat > Makefile <<- "EOF"
CC=gcc
CFLAGS=-Wall -Wextra -std=c11 -O2
TARGET=solution

all: $(TARGET)

$(TARGET): main.c
	$(CC) $(CFLAGS) main.c -o $(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: all clean
EOF

    # Navigate back to the root directory
    cd ..
done

echo "Advent of Code 2023 setup complete!"
