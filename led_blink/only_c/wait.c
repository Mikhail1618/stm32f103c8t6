void wait()
{
    volatile unsigned int count = 0x7FFF0;

    while(count--)
        ;

    return;
}
