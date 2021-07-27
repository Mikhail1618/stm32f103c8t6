
extern int led_init();
extern int led_flash();
extern int wait();

int main()
{
    led_init();

    while(1)
    {
        led_flash();
        wait();
    }

    return 0;
}
