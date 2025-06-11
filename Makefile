EXEC = helloworld
SRC_DIR = src
OBJ_DIR = build/obj
LIB_DIR = lib
INC_DIR = include

CC = gcc
CFLAGS = -std=c99 -O3 -I$(INC_DIR)
LDFLAGS = -nostdlib -static

SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC))

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) $(LDFLAGS) \
		$(LIB_DIR)/crt1.o \
		$(LIB_DIR)/crti.o \
		$^ \
		$(LIB_DIR)/libc.a \
		$(LIB_DIR)/crtn.o \
		-o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(EXEC)

