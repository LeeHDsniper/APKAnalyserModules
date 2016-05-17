package com.tencent.mobileqq.activity.qwallet;

import android.content.Context;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class ThemeHbConfig
{
  private static String a = "theme_hb_config";
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ThemeHbConfig() {}
  
  public static void a(Context paramContext, ThemeHbConfig.ThemeConfigListener paramThemeConfigListener)
  {
    if ((paramContext == null) || (paramThemeConfigListener == null)) {
      return;
    }
    new ThemeHbConfig.GetThemeConfigTask(paramContext, paramThemeConfigListener).execute(new Void[0]);
  }
  
  public static void b(Context paramContext, ThemeHbConfig.ThemeConfigListener paramThemeConfigListener)
  {
    if ((paramContext == null) || (paramThemeConfigListener == null)) {
      return;
    }
    new ThemeHbConfig.PutThemeConfigTask(paramContext, paramThemeConfigListener).execute(new Void[0]);
  }
  
  private static String c(Context paramContext)
  {
    if (paramContext == null) {
      return "";
    }
    try
    {
      paramContext = paramContext.openFileInput(a);
      byte[] arrayOfByte = new byte['Ѐ'];
      StringBuilder localStringBuilder = new StringBuilder();
      for (;;)
      {
        int i = paramContext.read(arrayOfByte);
        if (i <= 0) {
          break;
        }
        localStringBuilder.append(new String(arrayOfByte, 0, i));
      }
      return "";
    }
    catch (FileNotFoundException paramContext)
    {
      paramContext.printStackTrace();
      return "";
      paramContext = localStringBuilder.toString();
      return paramContext;
    }
    catch (IOException paramContext)
    {
      paramContext.printStackTrace();
    }
  }
  
  private static String d(Context paramContext)
  {
    if (paramContext == null) {
      return "";
    }
    try
    {
      paramContext = paramContext.openFileOutput(a, 2);
      long l = System.currentTimeMillis();
      paramContext.write(("hello" + l).getBytes());
      return "";
    }
    catch (FileNotFoundException paramContext)
    {
      paramContext.printStackTrace();
      return "";
    }
    catch (IOException paramContext)
    {
      paramContext.printStackTrace();
    }
    return "";
  }
}
