.PHONY: clean

AS=as
LD=ld
SRC=src
OUT=out
TARGET=vasishtha

SOURCES = $(wildcard $(SRC)/*.s)
OBJECTS = $(patsubst $(SRC)/%.s, $(OUT)/%.o, $(SOURCES))

$(TARGET): $(OUT)/main.o $(OBJECTS)
	$(LD) $(LDFLAGS) $^ -o $@

$(OUT):
	mkdir -p $(OUT)

$(OUT)/main.o: $(SRC)/main.s | $(OUT)
	$(AS) $(LDFLAGS) $^ -c -o $@


$(OUT)/%.o: $(SRC)/%.s
	$(AS) $(LDFLAGS) $^ -o $@


clean:
	rm -rf $(TARGET) $(OUT)/*.o

