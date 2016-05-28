package it.sephiroth.android.library.disklrumulticache;

import android.content.Context;
import android.os.Environment;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import java.io.File;

public class DiskLruMultiCache
{
  public static File getCacheDir(Context paramContext, String paramString)
  {
    Log.i("DiskLruMultiCache", "getCacheDir: " + paramString);
    String str = Environment.getExternalStorageState();
    if (("checking".equals(str)) || ("mounted".equals(str)) || (!DiskUtils.isExternalStorageRemovable())) {}
    for (paramContext = DiskUtils.getExternalCacheDir(paramContext);; paramContext = paramContext.getCacheDir())
    {
      Log.i("DiskLruMultiCache", "cacheDir:" + paramContext.getAbsolutePath());
      return new File(paramContext, paramString);
    }
  }
  
  public static class Metadata
    implements Parcelable
  {
    public Metadata() {}
    
    public int describeContents()
    {
      return 0;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt) {}
  }
}
