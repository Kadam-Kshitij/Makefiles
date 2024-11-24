CC = g++
CFLAGS = --std=c++11 -Wall -Wextra -Werror -DLOGGING

INCLUDE_DIR = inc
OBJECT_DIR = obj
SOURCE_DIR = src

SRCS = $(wildcard $(SOURCE_DIR)/*.cpp)
OBJS = $(SRCS:$(SOURCE_DIR)/%.cpp=$(OBJECT_DIR)/%.o)

$(shell mkdir obj)
$(info $(SRCS))
$(info $(OBJS))

TARGET = Calulator

$(OBJECT_DIR)/%.o : $(SOURCE_DIR)/%.cpp
	$(CC) $(CFLAGS) -c -o $@ $< -I $(INCLUDE_DIR)

main.o : $(OBJS)
	$(CC) $(CFLAGS) -c -o $@ main.cpp $^ -I $(INCLUDE_DIR)


all : main.o
	$(CC) $(CFLAGS) -o $(TARGET) $^ $(OBJS)

clean :
	rm -rf obj main.o
	rm -rf $(TARGET)

.PHONY : clean
