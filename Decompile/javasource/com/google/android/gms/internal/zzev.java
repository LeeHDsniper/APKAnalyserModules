package com.google.android.gms.internal;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.provider.CalendarContract.Events;
import android.text.TextUtils;
import com.google.android.gms.R.string;
import com.google.android.gms.ads.internal.zzp;
import java.util.Map;

@zzgk
public class zzev
  extends zzfb
{
  private final Context mContext;
  private final Map<String, String> zzvs;
  private String zzzi;
  private long zzzj;
  private long zzzk;
  private String zzzl;
  private String zzzm;
  
  public zzev(zzip paramZzip, Map<String, String> paramMap)
  {
    super(paramZzip, "createCalendarEvent");
    zzvs = paramMap;
    mContext = paramZzip.zzgN();
    zzdV();
  }
  
  private String zzae(String paramString)
  {
    if (TextUtils.isEmpty((CharSequence)zzvs.get(paramString))) {
      return "";
    }
    return (String)zzvs.get(paramString);
  }
  
  private long zzaf(String paramString)
  {
    paramString = (String)zzvs.get(paramString);
    if (paramString == null) {
      return -1L;
    }
    try
    {
      long l = Long.parseLong(paramString);
      return l;
    }
    catch (NumberFormatException paramString) {}
    return -1L;
  }
  
  private void zzdV()
  {
    zzzi = zzae("description");
    zzzl = zzae("summary");
    zzzj = zzaf("start_ticks");
    zzzk = zzaf("end_ticks");
    zzzm = zzae("location");
  }
  
  Intent createIntent()
  {
    Intent localIntent = new Intent("android.intent.action.EDIT").setData(CalendarContract.Events.CONTENT_URI);
    localIntent.putExtra("title", zzzi);
    localIntent.putExtra("eventLocation", zzzm);
    localIntent.putExtra("description", zzzl);
    if (zzzj > -1L) {
      localIntent.putExtra("beginTime", zzzj);
    }
    if (zzzk > -1L) {
      localIntent.putExtra("endTime", zzzk);
    }
    localIntent.setFlags(268435456);
    return localIntent;
  }
  
  public void execute()
  {
    if (mContext == null)
    {
      zzah("Activity context is not available.");
      return;
    }
    if (!zzp.zzbx().zzM(mContext).zzda())
    {
      zzah("This feature is not available on the device.");
      return;
    }
    AlertDialog.Builder localBuilder = zzp.zzbx().zzL(mContext);
    localBuilder.setTitle(zzp.zzbA().zzc(R.string.create_calendar_title, "Create calendar event"));
    localBuilder.setMessage(zzp.zzbA().zzc(R.string.create_calendar_message, "Allow Ad to create a calendar event?"));
    localBuilder.setPositiveButton(zzp.zzbA().zzc(R.string.accept, "Accept"), new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        paramAnonymousDialogInterface = createIntent();
        zzev.zza(zzev.this).startActivity(paramAnonymousDialogInterface);
      }
    });
    localBuilder.setNegativeButton(zzp.zzbA().zzc(R.string.decline, "Decline"), new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        zzah("Operation denied by user.");
      }
    });
    localBuilder.create().show();
  }
}
