OUTPUT_ARCH(arm)

MEMORY
{
	RAMRX (rx) : ORIGIN = 0x00280000, LENGTH = 0x00004000
	RAMRW (rw!i) : ORIGIN = 0x08000000, LENGTH = 0x00100000
}

SECTIONS
{
	.text : ALIGN(0x100) {
		build/crt0.o(.init)
		*(.text)
		*(.rodata)
		_got_start = .;
		*(.got)
		*(.got.plt)
		*(.data.rel.ro.local)
		_got_end = .;
	}

	.bss : {
		_bss_start = .;
		*(.bss);
	}
	_bss_end = .;
}

