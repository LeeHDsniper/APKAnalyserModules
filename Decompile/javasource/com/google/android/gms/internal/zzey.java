package com.google.android.gms.internal;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.DownloadManager;
import android.app.DownloadManager.Request;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.net.Uri;
import android.os.Environment;
import android.text.TextUtils;
import android.webkit.URLUtil;
import com.google.android.gms.R.string;
import com.google.android.gms.ads.internal.zzp;
import java.util.Map;

@zzgk
public class zzey
  extends zzfb
{
  private final Context mContext;
  private final Map<String, String> zzvs;
  
  public zzey(zzip paramZzip, Map<String, String> paramMap)
  {
    super(paramZzip, "storePicture");
    zzvs = paramMap;
    mContext = paramZzip.zzgN();
  }
  
  public void execute()
  {
    if (mContext == null)
    {
      zzah("Activity context is not available");
      return;
    }
    if (!zzp.zzbx().zzM(mContext).zzcX())
    {
      zzah("Feature is not supported by the device.");
      return;
    }
    final String str1 = (String)zzvs.get("iurl");
    if (TextUtils.isEmpty(str1))
    {
      zzah("Image url cannot be empty.");
      return;
    }
    if (!URLUtil.isValidUrl(str1))
    {
      zzah("Invalid image url: " + str1);
      return;
    }
    final String str2 = zzag(str1);
    if (!zzp.zzbx().zzay(str2))
    {
      zzah("Image type not recognized: " + str2);
      return;
    }
    AlertDialog.Builder localBuilder = zzp.zzbx().zzL(mContext);
    localBuilder.setTitle(zzp.zzbA().zzc(R.string.store_picture_title, "Save image"));
    localBuilder.setMessage(zzp.zzbA().zzc(R.string.store_picture_message, "Allow Ad to store image in Picture gallery?"));
    localBuilder.setPositiveButton(zzp.zzbA().zzc(R.string.accept, "Accept"), new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        paramAnonymousDialogInterface = (DownloadManager)zzey.zza(zzey.this).getSystemService("download");
        try
        {
          paramAnonymousDialogInterface.enqueue(zzg(str1, str2));
          return;
        }
        catch (IllegalStateException paramAnonymousDialogInterface)
        {
          zzah("Could not store picture.");
        }
      }
    });
    localBuilder.setNegativeButton(zzp.zzbA().zzc(R.string.decline, "Decline"), new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        zzah("User canceled the download.");
      }
    });
    localBuilder.create().show();
  }
  
  String zzag(String paramString)
  {
    return Uri.parse(paramString).getLastPathSegment();
  }
  
  DownloadManager.Request zzg(String paramString1, String paramString2)
  {
    paramString1 = new DownloadManager.Request(Uri.parse(paramString1));
    paramString1.setDestinationInExternalPublicDir(Environment.DIRECTORY_PICTURES, paramString2);
    zzp.zzbz().zza(paramString1);
    return paramString1;
  }
}
