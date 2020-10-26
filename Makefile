SRC=src
BIN=bin
OBJ=obj

SOURCE_FILES = \
	cd_sdl.c		\
	chase.c			\
	cl_demo.c		\
	cl_input.c		\
	cl_main.c		\
	cl_parse.c		\
	cl_tent.c		\
	cmd.c			\
	common.c		\
	console.c		\
	crc.c			\
	cvar.c			\
	d_edge.c		\
	d_fill.c		\
	d_init.c		\
	d_modech.c		\
	d_part.c		\
	d_polyse.c		\
	d_scan.c		\
	d_sky.c			\
	d_sprite.c		\
	d_surf.c		\
	d_vars.c		\
	d_zpoint.c		\
	draw.c			\
	host.c			\
	host_cmd.c		\
	keys.c			\
	mathlib.c		\
	menu.c			\
	model.c			\
	net_bsd.c		\
	net_dgrm.c		\
	net_loop.c		\
	net_main.c		\
	net_udp.c		\
	net_vcr.c		\
	net_wso.c		\
	nonintel.c		\
	pr_cmds.c		\
	pr_edict.c		\
	pr_exec.c		\
	r_aclip.c		\
	r_alias.c		\
	r_bsp.c			\
	r_draw.c		\
	r_edge.c		\
	r_efrag.c		\
	r_light.c		\
	r_main.c		\
	r_misc.c		\
	r_part.c		\
	r_sky.c			\
	r_sprite.c		\
	r_surf.c		\
	r_vars.c		\
	sbar.c			\
	screen.c		\
	snd_dma.c		\
	snd_mem.c		\
	snd_mix.c		\
	snd_sdl.c		\
	sv_main.c		\
	sv_move.c		\
	sv_phys.c		\
	sv_user.c		\
	sys_sdl.c		\
	vid_sdl.c		\
	view.c			\
	wad.c			\
	world.c			\
	zone.c			\

# tool macros
CC := mipsel-linux-gcc
INCLUDES := -I/opt/gcw0-toolchain/usr/mipsel-gcw0-linux-uclibc/sysroot/usr/include/SDL
CCFLAG := -ffast-math -funroll-loops -fomit-frame-pointer -fexpensive-optimizations -Wall -Wextra -O2 -DSDL -D__linux__ -D_GNU_SOURCE=1 -D_REENTRANT $(INCLUDES)
DBGFLAG := -g
CCOBJFLAG := $(CCFLAG) -c
LDFLAGS := -lm -lSDL -lpthread

# path macros
BIN_PATH := bin
OBJ_PATH := obj
SRC_PATH := src
DBG_PATH := debug

# compile macros
TARGET_NAME := rgqx
TARGET := $(BIN_PATH)/$(TARGET_NAME)
TARGET_DEBUG := $(DBG_PATH)/$(TARGET_NAME)
MAIN_SRC := # FILL: src file contains `main()`

# src files & obj files
SRC := $(addprefix $(SRC_PATH)/, $(SOURCE_FILES))
OBJ := $(addprefix $(OBJ_PATH)/, $(addsuffix .o, $(notdir $(basename $(SRC)))))
OBJ_DEBUG := $(addprefix $(DBG_PATH)/, $(addsuffix .o, $(notdir $(basename $(SRC)))))

LINKCMD := $(CC) -o $(TARGET) $(OBJ) $(LDFLAGS)

# clean files list
DISTCLEAN_LIST := $(OBJ) \
                  $(OBJ_DEBUG)
CLEAN_LIST := $(TARGET) \
			  $(TARGET_DEBUG) \
			  $(DISTCLEAN_LIST)

# default rule
default: all

# non-phony targets
$(TARGET): $(OBJ)
	$(LINKCMD)

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c*
	$(CC) $(CCOBJFLAG) -o $@ $<

$(DBG_PATH)/%.o: $(SRC_PATH)/%.c*
	$(CC) $(CCOBJFLAG) $(DBGFLAG) -o $@ $<

$(TARGET_DEBUG): $(OBJ_DEBUG)
	$(LINKCMD) $(DBGFLG)

# phony rules
.PHONY: all
all: $(TARGET)

.PHONY: debug
debug: $(TARGET_DEBUG)

.PHONY: clean
clean:
	@echo CLEAN $(CLEAN_LIST)
	@rm -f $(CLEAN_LIST)

.PHONY: distclean
distclean:
	@echo CLEAN $(DISTCLEAN_LIST)
	@rm -f $(DISTCLEAN_LIST)