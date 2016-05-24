package com.google.android.gms.internal;

import com.google.android.gms.tagmanager.zzbg;
import org.json.JSONException;

public final class zzqm
{
  public static zzql zzaTG = new zzql()
  {
    public Object zzt(byte[] paramAnonymousArrayOfByte)
      throws zzqp.zzg
    {
      if (paramAnonymousArrayOfByte == null) {
        throw new zzqp.zzg("Cannot parse a null byte[]");
      }
      if (paramAnonymousArrayOfByte.length == 0) {
        throw new zzqp.zzg("Cannot parse a 0 length byte[]");
      }
      try
      {
        paramAnonymousArrayOfByte = zzqj.zzeN(new String(paramAnonymousArrayOfByte));
        if (paramAnonymousArrayOfByte != null) {
          zzbg.v("The container was successfully parsed from the resource");
        }
        return paramAnonymousArrayOfByte;
      }
      catch (JSONException paramAnonymousArrayOfByte)
      {
        throw new zzqp.zzg("The resource data is corrupted. The container cannot be extracted from the binary data");
      }
      catch (zzqp.zzg paramAnonymousArrayOfByte)
      {
        throw new zzqp.zzg("The resource data is invalid. The container cannot be extracted from the binary data");
      }
    }
  };
}
