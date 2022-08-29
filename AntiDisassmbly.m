static OS_ALWAYS_INLINE void dcq(void);
static OS_ALWAYS_INLINE void dcq(void) {
    int a = 3;
    int b = 4;
    int c = 1;
    if (c > sqrt(a*a+b*b+c*c)) {
        __asm__ volatile(
                         ".long 0x12345678\n"
                         ".long 12345678\n"
                         );
    }
}

static OS_ALWAYS_INLINE void br(void);
static OS_ALWAYS_INLINE void br(void) {
    __asm__ volatile(
                     "mov x8, #0x1\n"
                     "adr x9, #0x14\n"
                     "mul x8, x9, x8\n"
                     "br x8\n"
                     ".long 0x12345678\n"
                     ".long 12345678\n"
                     );
}

static OS_ALWAYS_INLINE void ret(void);
static OS_ALWAYS_INLINE void ret(void) {
    __asm__ volatile(
                     "adr x8, #0x14\n"
                     "mov x30, x8\n"
                     "ret\n"
                     ".long 0x12345678\n"
                     ".long 12345678\n"
                     );
}
