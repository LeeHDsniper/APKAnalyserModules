package com.adobe.creativesdk.aviary.internal.cds;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.util.Calendar;
import java.util.Date;

public final class CdsService
  extends CdsServiceAbstract
{
  public CdsService()
  {
    super("CdsService");
  }
  
  protected void sendDeveloperError(int paramInt)
  {
    logger.log("sendDeveloperError: %d", new Object[] { Integer.valueOf(paramInt) });
    Context localContext = getBaseContext();
    Object localObject2 = null;
    Object localObject1 = null;
    if (paramInt == 403)
    {
      localObject2 = "Invalid API Key and Secret.";
      localObject1 = "Please check to make sure you have correctly entered your API key and secret.";
    }
    if ((TextUtils.isEmpty((CharSequence)localObject2)) || (TextUtils.isEmpty((CharSequence)localObject1)))
    {
      logger.error("Ops. Something went wrong. We received an errorCode: " + paramInt);
      return;
    }
    LoggerFactory.printDeveloperError((String)localObject2 + "\n" + (String)localObject1);
    Intent localIntent = new Intent("aviary.intent.action.ALERT");
    localIntent.putExtra("android.intent.extra.TITLE", (String)localObject2);
    localIntent.putExtra("android.intent.extra.TEXT", (String)localObject1);
    localObject1 = Calendar.getInstance();
    ((Calendar)localObject1).setTime(new Date(2000L + ((Calendar)localObject1).getTimeInMillis()));
    localObject2 = PendingIntent.getBroadcast(localContext, 0, localIntent, 134217728);
    ((AlarmManager)localContext.getSystemService("alarm")).set(0, ((Calendar)localObject1).getTimeInMillis(), (PendingIntent)localObject2);
  }
}
