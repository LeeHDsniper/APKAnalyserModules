package it.sephiroth.android.library.ab;

import android.content.Context;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

class ABSettingsFactory
{
  private static boolean canUseFileSystem(Context paramContext)
  {
    paramContext = paramContext.getFilesDir();
    return (paramContext != null) && (paramContext.canRead()) && (paramContext.canWrite());
  }
  
  public static ABSettingsManager create(Context paramContext)
  {
    if (canUseFileSystem(paramContext)) {
      try
      {
        ABFilePreference localABFilePreference = new ABFilePreference(paramContext);
        return localABFilePreference;
      }
      catch (IOException localIOException)
      {
        localIOException.printStackTrace();
      }
    }
    return new ABSharedPreference(paramContext);
  }
  
  static abstract class ABSettingsManager
  {
    ABSettingsManager() {}
    
    protected final UUID generateNew()
    {
      return UUID.randomUUID();
    }
    
    public abstract String getUUID();
  }
}
