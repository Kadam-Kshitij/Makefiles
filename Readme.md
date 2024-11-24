<pre>
### Basic syntax</br>
target : dependancies</br>
	commands</br>
</br>
### Compiler Flags</br>
-Werror = Treats all warnings as errors</br>
-Wall = Enable common warnings</br>
-Wextra = Enable additional warnings not included in Wall</br>
-g = Add debug info</br>
-c = Compile source files into object files without linking</br>
-m32, -m64 = Generate code for 32 bit / 64 bit platform</br>
-D<MACRO>=<value> , -D<MACRO> = Use to define macros and conditionally compile code</br>
-fPIC: Generate position-independent code, for shared library. So that code can be loaded at any point.</br>
-j<number> This is used to parallel build multiple targets</br>
</br>
$@ - target</br>
$< - first dependancy</br>
$^ - all dependancy</br>
$? - all dependancy that are newer than target</br>
</br>
### Includes and library</br>
-I<path> - Consider the path for finding include files</br>
-L<path> - Consider the path for finding libraries for linking</br>
-l<lib_name> - Link library</br>
</br>
### Phony</br>
If there is a file named clean. And we run make clean, it will consider clean as a</br>
filename and will not execute the clean target, considering the file to be uptodate.</br>
To make it run the clean target, we need to declare clean as .PHONY</br>
.PHONY : clean install obj/add.o</br>
Targets added in phony are executed compulsary even if up to date</br>
</br>
### Variables</br>
Declaring and using a variable</br>
VAR = value</br>
$(VAR)</br>
</br>
### Library </br>
-static - Force linker to use static library instead of shared</br>
</br>
SRC = $(wildcard src/*.c)   # Collect all file in src with .c ending</br>
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o) 			# replace names</br>
</br>
### Shell</br>
$(shell <cmd>)   # Run shell command</br>
</br>
### Example</br>
g++ -Wall -Wextra -Werror -o Main main.cpp -I<path> -L<path> -l<lib_name></br>
</br>
### For shared library</br>
g++ -o <lib_name> <files> -shared</br>
</br>
### For static library</br>
ar rcs <lib_name> <files> </br>
r: Insert object files into the archive, replacing older files if necessary.</br>
c: Create the archive if it doesn't already exist.</br>
s: Index the archive (create a symbol table) for faster linking.</br>
</br>
### Other Makefiles</br>
To run another makefile from one makefile</br>
$(MAKE) -C <directory> <target></br>
</br>
To include another makefile</br>
include other-makefile.mk</br>
</pre>
