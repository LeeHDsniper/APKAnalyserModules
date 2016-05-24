package it.sephiroth.android.library.disklrumulticache;

import android.content.Context;
import android.os.Build.VERSION;
import android.os.Environment;
import java.io.File;

public class DiskUtils
{
  public static File getExternalCacheDir(Context paramContext)
  {
    if (hasExternalCacheDir())
    {
      File localFile = paramContext.getExternalCacheDir();
      if (localFile != null) {
        return localFile;
      }
    }
    return paramContext.getCacheDir();
  }
  
  public static boolean hasExternalCacheDir()
  {
    return Build.VERSION.SDK_INT >= 8;
  }
  
  public static boolean isExternalStorageRemovable()
  {
    if (Build.VERSION.SDK_INT >= 9) {
      return Environment.isExternalStorageRemovable();
    }
    return true;
  }
}
