package android.support.v4.text;

import java.util.Locale;

public class TextUtilsCompat
{
  private static String ARAB_SCRIPT_SUBTAG = "Arab";
  private static String HEBR_SCRIPT_SUBTAG = "Hebr";
  public static final Locale ROOT = new Locale("", "");
  
  private static int getLayoutDirectionFromFirstChar(Locale paramLocale)
  {
    switch (Character.getDirectionality(paramLocale.getDisplayName(paramLocale).charAt(0)))
    {
    default: 
      return 0;
    }
    return 1;
  }
  
  public static int getLayoutDirectionFromLocale(Locale paramLocale)
  {
    if ((paramLocale != null) && (!paramLocale.equals(ROOT)))
    {
      String str = ICUCompat.getScript(ICUCompat.addLikelySubtags(paramLocale.toString()));
      if (str == null) {
        return getLayoutDirectionFromFirstChar(paramLocale);
      }
      if ((str.equalsIgnoreCase(ARAB_SCRIPT_SUBTAG)) || (str.equalsIgnoreCase(HEBR_SCRIPT_SUBTAG))) {
        return 1;
      }
    }
    return 0;
  }
}
