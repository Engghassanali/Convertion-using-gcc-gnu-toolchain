@REM //Conversion of C to hex file
@REM rmdir -r build
@REM mkdir build
@REM riscv64-unknown-elf-as -c -o build/startup.o src/startup.s -march=rv32i -mabi=ilp32
@REM riscv64-unknown-elf-gcc -c -o build/main.o src/main.c -march=rv32i -mabi=ilp32
@REM riscv64-unknown-elf-gcc -o build/main.elf build/main.o build/startup.o -T linker.ld -nostdlib -march=rv32i -mabi=ilp32
@REM riscv64-unknown-elf-objcopy -O binary --only-section=.data* --only-section=.text* build/main.elf build/main.bin
@REM python3 maketxt.py build/main.bin > build/main.txt
@REM riscv64-unknown-elf-objdump -S -s build/main.elf > build/main.dump

@REM //Conversion of Assembly to hex file

::riscv64-unknown-elf-as -c -o build/startup.o src/startup.s -march=rv32i -mabi=ilp32
rmdir -r build
mkdir build
riscv64-unknown-elf-as -c -o build/gcd.o src/gcd.s -march=rv32i -mabi=ilp32
riscv64-unknown-elf-gcc -o build/gcd.elf build/gcd.o -T linker.ld -nostdlib -march=rv32i -mabi=ilp32
riscv64-unknown-elf-objcopy -O binary --only-section=.data* --only-section=.text* build/gcd.elf build/gcd.bin
python3 maketxt.py build/gcd.bin > build/gcd.txt
riscv64-unknown-elf-objdump -S -s build/gcd.elf > build/gcd.dump