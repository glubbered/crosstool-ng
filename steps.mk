# Makefile for each steps
# Copyright 2006 Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

CT_STEPS := libc_check_config       \
            kernel_check_config     \
            kernel_headers          \
            binutils                \
            cc_core_pass_1          \
            libc_headers            \
            libc_start_files        \
            cc_core_pass_2          \
            libfloat                \
            libc                    \
            cc                      \
            libc_finish             \
            tools                   \
            debug                   \

$(CT_STEPS):
	@$(CT_NG) RESTART=$@ STOP=$@ build

$(patsubst %,-%,$(CT_STEPS)):
	@$(CT_NG) STOP=$(patsubst -%,%,$@) build

$(patsubst %,%-,$(CT_STEPS)):
	@$(CT_NG) RESTART=$(patsubst %-,%,$@) build

help-build::
	@echo  '  liststeps      - List all build steps'

liststeps:
	@echo  'Available build steps, in order:'
	@for step in $(CT_STEPS); do    \
	     echo "  - $${step}";       \
	 done