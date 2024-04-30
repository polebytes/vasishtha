.PHONY: clean

AS=as
LD=ld
ASFLAGS=-g
SRC=src
OUT=out
TARGET=vasishtha

SOURCES = $(wildcard $(SRC)/*.s)
OBJECTS = $(patsubst $(SRC)/%.s, $(OUT)/%.o, $(SOURCES))

$(TARGET): $(OUT)/main.o $(OBJECTS)
	$(LD) $^ -o $@

$(OUT):
	mkdir -p $(OUT)

$(OUT)/main.o: $(SRC)/main.s | $(OUT)
	$(AS) $(ASFLAGS) $^ -c -o $@


$(OUT)/%.o: $(SRC)/%.s
	$(AS) $(ASFLAGS) $^ -o $@


clean:
	rm -rf $(TARGET) $(OUT)/*.o

