### Basic syntax<\br>
target : dependancies<\br>
	commands

Compiler Flags
-Werror = Treats all warnings as errors
-Wall = Enable common warnings
-Wextra = Enable additional warnings not included in Wall
-g = Add debug info
-c = Compile source files into object files without linking
-m32, -m64 = Generate code for 32 bit / 64 bit platform
-D<MACRO>=<value> , -D<MACRO> = Use to define macros and conditionally compile code
-fPIC: Generate position-independent code, for shared library. So that code can be loaded at any point.

$@ - target
$< - first dependancy
$^ - all dependancy
$? - all dependancy that are newer than target

-I<path> - Consider the path for finding include files
-L<path> - Consider the path for finding libraries for linking
-l<lib_name> - Link library

If there is a file named clean. And we run make clean, it will consider clean as a
filename and will not execute the clean target, considering the file to be uptodate.
To make it run the clean target, we need to declare clean as .PHONY
.PHONY : clean install obj/add.o
Targets added in phony are executed compulsary even if up to date

Declaring and using a variable
VAR = value
$(VAR)

-static - Force linker to use static library instead of shared

SRC = $(wildcard src/*.c)   # Collect all file in src with .c ending
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o) 			# replace names

$(shell <cmd>)   # Run shell command

-j<number> This is used to parallel build multiple targets

Example
g++ -Wall -Wextra -Werror -c -o main.o main.cpp -I<path> -L<path> -l<lib_name>

For shared library
g++ -o <lib_name> <files> -shared

For static library
ar rcs <lib_name> <files> 
r: Insert object files into the archive, replacing older files if necessary.
c: Create the archive if it doesn't already exist.
s: Index the archive (create a symbol table) for faster linking.

To run another makefile from one makefile
$(MAKE) -C <directory> <target>

To include another makefile
include other-makefile.mk
