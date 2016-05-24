package com.adobe.creativesdk.aviary.internal.utils;

import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.support.v4.app.NotificationCompat.Builder;
import android.support.v4.app.NotificationCompat.InboxStyle;
import android.support.v4.app.NotificationCompat.Style;
import android.text.TextUtils;
import com.adobe.creativesdk.aviary.internal.cds.CdsReceiver;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.utils.SharedPreferencesUtils;
import com.aviary.android.feather.sdk.R.color;
import com.aviary.android.feather.sdk.R.dimen;
import com.aviary.android.feather.sdk.R.drawable;
import com.aviary.android.feather.sdk.R.string;
import java.io.File;
import java.util.Iterator;
import java.util.List;

public final class AviaryNotificationManager
{
  private static final AviaryNotificationManager INSTANCE = new AviaryNotificationManager();
  private final LoggerFactory.Logger logger = LoggerFactory.getLogger("NotificationUtils");
  
  private AviaryNotificationManager() {}
  
  public static NotificationCompat.Builder addLargeIcon(Context paramContext, NotificationCompat.Builder paramBuilder)
  {
    paramContext = getLargeIcon(paramContext);
    if (paramContext != null) {
      paramBuilder.setLargeIcon(paramContext);
    }
    return paramBuilder;
  }
  
  static NotificationCompat.Builder addSmallIcon(Context paramContext, NotificationCompat.Builder paramBuilder)
  {
    return paramBuilder.setSmallIcon(R.drawable.com_adobe_image_notification_item_installed).setColor(paramContext.getResources().getColor(R.color.com_adobe_image_color_light_gray4));
  }
  
  public static NotificationCompat.Builder createNew(Context paramContext)
  {
    NotificationCompat.Builder localBuilder = new NotificationCompat.Builder(paramContext);
    localBuilder.setLocalOnly(true).setPriority(0);
    return addSmallIcon(paramContext, localBuilder);
  }
  
  private Bitmap extractPackIcon(Context paramContext, String paramString)
  {
    Bitmap localBitmap1 = null;
    paramString = new File(paramString);
    if (!paramString.exists()) {}
    Bitmap localBitmap2;
    do
    {
      return null;
      localBitmap2 = BitmapFactory.decodeFile(paramString.getAbsolutePath());
    } while (localBitmap2 == null);
    int i = paramContext.getResources().getDimensionPixelSize(R.dimen.com_adobe_image_notification_large_icon_size);
    paramString = BitmapUtils.resizeBitmap(localBitmap2, i, i);
    if ((paramString != localBitmap2) && (!localBitmap2.isRecycled())) {
      localBitmap2.recycle();
    }
    paramContext = localBitmap1;
    if (paramString != null)
    {
      if (!ApiHelper.AT_LEAST_21) {
        break label127;
      }
      localBitmap1 = BitmapUtils.circleMask(paramString, paramString.getWidth() / 2);
      paramContext = localBitmap1;
      if (localBitmap1 != paramString)
      {
        paramContext = localBitmap1;
        if (!paramString.isRecycled()) {
          paramString.recycle();
        }
      }
    }
    label127:
    for (paramContext = localBitmap1;; paramContext = paramString) {
      return paramContext;
    }
  }
  
  public static AviaryNotificationManager getInstance()
  {
    return INSTANCE;
  }
  
  static Bitmap getLargeIcon(Context paramContext)
  {
    paramContext = paramContext.getResources().getDrawable(R.drawable.com_adobe_image_notification_large_icon);
    if (paramContext != null) {
      return BitmapUtils.extractDrawable(paramContext);
    }
    return null;
  }
  
  static NotificationManager getNotificationManager(Context paramContext)
  {
    return (NotificationManager)paramContext.getSystemService("notification");
  }
  
  static PendingIntent getNotificationSuccessIntent(Context paramContext)
  {
    Intent localIntent = new Intent(paramContext, CdsReceiver.class);
    localIntent.setAction("aviary.android.cds.intent.action.ACTION_NOTIFICATION_DISMISSED");
    return PendingIntent.getBroadcast(paramContext, 0, localIntent, 134217728);
  }
  
  static PendingIntent getNullPendingIntent(Context paramContext)
  {
    return PendingIntent.getService(paramContext, 0, new Intent(), 0);
  }
  
  private static String[] getPrefsInstalledPacks(SharedPreferencesUtils paramSharedPreferencesUtils, String paramString)
  {
    paramSharedPreferencesUtils = paramSharedPreferencesUtils.getString("aviary.notifications.packs_installed_list", "");
    if (!TextUtils.isEmpty(paramSharedPreferencesUtils)) {}
    for (;;)
    {
      try
      {
        paramSharedPreferencesUtils = paramSharedPreferencesUtils.split(",");
        if ((paramSharedPreferencesUtils == null) || (paramSharedPreferencesUtils.length <= 0)) {
          break label75;
        }
        String[] arrayOfString = new String[paramSharedPreferencesUtils.length + 1];
        System.arraycopy(paramSharedPreferencesUtils, 0, arrayOfString, 0, paramSharedPreferencesUtils.length);
        paramSharedPreferencesUtils = arrayOfString;
        paramSharedPreferencesUtils[(paramSharedPreferencesUtils.length - 1)] = paramString;
        return paramSharedPreferencesUtils;
      }
      catch (Throwable paramSharedPreferencesUtils)
      {
        paramSharedPreferencesUtils.printStackTrace();
        paramSharedPreferencesUtils = null;
        continue;
      }
      paramSharedPreferencesUtils = null;
      continue;
      label75:
      paramSharedPreferencesUtils = new String[1];
    }
  }
  
  private void updatePrefsActiveNotification(SharedPreferencesUtils paramSharedPreferencesUtils, String[] paramArrayOfString, int paramInt)
  {
    paramSharedPreferencesUtils.putInt("aviary.notifications.packs_installed_count", paramInt);
    paramSharedPreferencesUtils.putString("aviary.notifications.packs_installed_list", StringUtils.join(paramArrayOfString, ","));
  }
  
  public void cancelPackInstalledNotification(Context paramContext)
  {
    logger.verbose("cancelPackInstalledNotification", new Object[0]);
    getNotificationManager(paramContext).cancel(343844);
  }
  
  public void cancelRestoreOngoingNotification(Context paramContext)
  {
    logger.verbose("cancelRestoreOngoingNotification", new Object[0]);
    getNotificationManager(paramContext).cancel(343845);
  }
  
  public RestoreNotification createRestoreOngoingNotification(Context paramContext)
  {
    return new RestoreNotification(paramContext);
  }
  
  public void notifyPackDownloadFailed(Context paramContext, long paramLong, String paramString1, String paramString2)
  {
    logger.info("notifyPackDownloadFailed: %d", new Object[] { Long.valueOf(paramLong) });
    String str = paramContext.getString(R.string.feather_iap_download_failed);
    if (TextUtils.isEmpty(paramString2)) {}
    for (paramString2 = str;; paramString2 = str + ": " + paramString2)
    {
      Object localObject = new Intent(paramContext, CdsReceiver.class);
      ((Intent)localObject).setAction("aviary.android.cds.intent.action.ACTION_DOWNLOAD_PACKS_CONTENT");
      ((Intent)localObject).putExtra("entryId", paramLong);
      localObject = PendingIntent.getBroadcast(paramContext, 0, (Intent)localObject, 134217728);
      paramString1 = createNew(paramContext).setSmallIcon(17301624).setContentTitle(str).setContentText(paramString2).setSubText(paramString1).setPriority(1).setCategory("err").setDefaults(2).setContentIntent((PendingIntent)localObject);
      getNotificationManager(paramContext).notify((int)paramLong, paramString1.build());
      return;
    }
  }
  
  public void notifyPackInstalled(Context paramContext, String paramString1, String paramString2)
  {
    logger.info("notifyPackInstalled: %s", new Object[] { paramString2 });
    SharedPreferencesUtils localSharedPreferencesUtils = SharedPreferencesUtils.getInstance(paramContext);
    int k = localSharedPreferencesUtils.getInt("aviary.notifications.packs_installed_count", 0);
    Object localObject = null;
    String str1 = paramContext.getString(R.string.feather_iap_pack_installed);
    String str2 = paramContext.getString(R.string.feather_iap_notification_installed_summary);
    String[] arrayOfString = getPrefsInstalledPacks(localSharedPreferencesUtils, paramString2);
    NotificationCompat.Builder localBuilder = createNew(paramContext);
    localBuilder.setAutoCancel(true);
    localBuilder.setContentIntent(getNotificationSuccessIntent(paramContext));
    localBuilder.setDeleteIntent(getNotificationSuccessIntent(paramContext));
    localBuilder.setTicker(paramString2 + " " + str1);
    int i;
    if (k > 0)
    {
      localBuilder.setContentTitle(paramContext.getString(R.string.feather_notification_plugins_installed_count, new Object[] { Integer.valueOf(k + 1) }));
      if (ApiHelper.AT_LEAST_16)
      {
        localBuilder.setContentText(paramContext.getApplicationInfo().loadLabel(paramContext.getPackageManager()));
        localBuilder.setContentInfo(String.valueOf(k + 1));
        paramString2 = localObject;
        if (arrayOfString != null)
        {
          paramString2 = localObject;
          if (arrayOfString.length > 0)
          {
            paramString1 = new NotificationCompat.InboxStyle();
            int j = 0;
            int m = arrayOfString.length;
            i = 0;
            if (i < m)
            {
              paramString1.addLine(arrayOfString[i]);
              j += 1;
              if (j <= 2) {
                break label368;
              }
            }
            if (arrayOfString.length > 3)
            {
              i = arrayOfString.length;
              paramString1.setSummaryText("+" + paramContext.getString(R.string.feather_notification_plus_more, new Object[] { Integer.valueOf(i - 3) }));
            }
            localBuilder.setStyle(paramString1);
            paramString2 = localObject;
          }
        }
        label329:
        if (paramString2 == null) {
          break label455;
        }
        localBuilder.setLargeIcon(paramString2);
      }
    }
    for (;;)
    {
      getNotificationManager(paramContext).notify(343844, localBuilder.build());
      updatePrefsActiveNotification(localSharedPreferencesUtils, arrayOfString, k + 1);
      return;
      label368:
      i += 1;
      break;
      localBuilder.setContentText(StringUtils.join(arrayOfString, ",") + " " + str1);
      paramString2 = localObject;
      break label329;
      localBuilder.setContentTitle(paramString2);
      localBuilder.setContentText(str2);
      paramString2 = localObject;
      if (TextUtils.isEmpty(paramString1)) {
        break label329;
      }
      paramString2 = extractPackIcon(paramContext, paramString1);
      break label329;
      label455:
      if (!ApiHelper.AT_LEAST_16) {
        addLargeIcon(paramContext, localBuilder);
      }
    }
  }
  
  public void notifyRestoreCompleteWithErrors(Context paramContext, List<Exception> paramList)
  {
    Object localObject1 = paramContext.getString(R.string.feather_notification_some_items_cant_be_restored);
    Object localObject2 = paramContext.getString(R.string.feather_please_try_again_later);
    Object localObject3 = paramContext.getString(R.string.feather_notification_n_items_cant_be_restored);
    localObject1 = createNew(paramContext).setContentTitle(String.format((String)localObject3, new Object[] { Integer.valueOf(paramList.size()) })).setContentText((CharSequence)localObject1).setTicker((CharSequence)localObject1).setSubText((CharSequence)localObject2).setAutoCancel(true).setContentIntent(getNullPendingIntent(paramContext)).setDefaults(2).setPriority(1).setSmallIcon(17301624);
    if (!ApiHelper.AT_LEAST_16)
    {
      addLargeIcon(paramContext, (NotificationCompat.Builder)localObject1);
      if (paramList.size() == 1) {
        ((NotificationCompat.Builder)localObject1).setContentText(((Exception)paramList.get(0)).getMessage());
      }
    }
    for (;;)
    {
      getNotificationManager(paramContext).notify(343846, ((NotificationCompat.Builder)localObject1).build());
      paramContext = paramList.iterator();
      while (paramContext.hasNext())
      {
        paramList = (Exception)paramContext.next();
        logger.info("------ exception ------");
        paramList.printStackTrace();
      }
      localObject2 = new NotificationCompat.InboxStyle();
      ((NotificationCompat.InboxStyle)localObject2).addLine(paramContext.getString(R.string.feather_notification_some_items_cant_be_restored));
      localObject3 = paramList.iterator();
      while (((Iterator)localObject3).hasNext()) {
        ((NotificationCompat.InboxStyle)localObject2).addLine(((Exception)((Iterator)localObject3).next()).getMessage());
      }
      ((NotificationCompat.InboxStyle)localObject2).setSummaryText(paramContext.getString(R.string.feather_please_try_again_later));
      ((NotificationCompat.Builder)localObject1).setStyle((NotificationCompat.Style)localObject2);
    }
  }
  
  public static class RestoreNotification
  {
    private NotificationCompat.Builder builder;
    private final Context context;
    
    RestoreNotification(Context paramContext)
    {
      context = paramContext;
      String str = paramContext.getString(R.string.feather_iap_restore_all_in_progress);
      builder = AviaryNotificationManager.createNew(paramContext).setContentTitle(paramContext.getString(R.string.feather_iap_restore_all)).setContentText(str).setTicker(str).setProgress(100, 0, true).setContentIntent(AviaryNotificationManager.getNullPendingIntent(paramContext)).setOngoing(true);
      if (!ApiHelper.AT_LEAST_16) {
        AviaryNotificationManager.addLargeIcon(paramContext, builder);
      }
    }
    
    public void alertNothingToRestore()
    {
      String str1 = context.getString(R.string.feather_notification_restore_all_completed);
      String str2 = context.getString(R.string.feather_notification_no_items_to_restore);
      builder = AviaryNotificationManager.createNew(context).setContentTitle(str1).setContentText(str2).setTicker(str1).setContentIntent(AviaryNotificationManager.getNullPendingIntent(context)).setDefaults(2).setPriority(1).setAutoCancel(true).setOngoing(false);
      if (!ApiHelper.AT_LEAST_16) {
        AviaryNotificationManager.addLargeIcon(context, builder);
      }
      AviaryNotificationManager.getNotificationManager(context).notify(343845, builder.build());
    }
    
    public void cancel()
    {
      AviaryNotificationManager.getNotificationManager(context).cancel(343845);
    }
    
    public void setProgress(int paramInt1, int paramInt2, boolean paramBoolean)
    {
      builder.setProgress(paramInt1, paramInt2, paramBoolean);
      AviaryNotificationManager.getNotificationManager(context).notify(343845, builder.build());
    }
  }
}
