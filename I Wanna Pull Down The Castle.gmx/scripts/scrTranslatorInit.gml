/// scrTranslatorInit()
global._translator_dir = global.translatorDefaultDir;
global._translator_cur_locale = os_get_language();
if global._translator_cur_locale == ''
{
    global._translator_cur_locale = global.translatorDefaultLocale;
}
