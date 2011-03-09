#include "../tools/pe.h"

gint
main()
{
    gchar *foo;

    foo = "111111111222333333333";
    g_print("%s\n", g_strndup(foo, 8));
    g_print("%s\n", g_strndup(g_utf8_strreverse(foo, -1), 8));

    return 0;
}
