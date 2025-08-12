FILE=shades_of_summer

xsm:
	xasm $(FILE).xsm -o $(FILE).xex -D ZPZ=0
	xasm $(FILE).xsm -o $(FILE).zpz.xex -D ZPZ=1

run:	xsm
	atari800 -nojoystick $(FILE).xex

runa:	xsm
	wine "c:\altirra\altirra.exe" $(FILE).xex

clean:
	rm -f *.xex *.zip

rel:	clean xsm
	7z -mx9 a $(FILE).zip $(FILE).xex $(FILE).zpz.xex readme.txt
