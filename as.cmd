asz80 -l -o -s volcano volcano.asm
aslink -i volcano.rel
hex2bin volcano.ihx

REM * TRS-80 .CMD file format
bin2cmd -o7000 -x946B volcano
copy volcano.cmd volcano.png
REM bin2cmd -o7123 -x958E volcano
REM bin2cmd -o8000 -xA46B volcano
@goto exit

REM * Microbee CP/M .COM file format
copy donut.bin donut.com
REM * Microbee .BEE file format
copy donut.bin donut.bee
REM * Microbee TAP(e) format
bin2tap donut.bin donut.tap --loadaddr:0x900 --startaddr:0x900

REM * work
if exist \markm copy donut.tap \markm\emu\microbee\ubee512\tapes
REM * home
if exist \Emulation copy donut.tap \Emulation\Computers\Microbee\ubee512\tapes

:exit
