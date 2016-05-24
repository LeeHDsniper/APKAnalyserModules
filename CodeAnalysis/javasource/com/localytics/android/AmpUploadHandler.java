package com.localytics.android;

import android.content.ContentValues;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.concurrent.Callable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class AmpUploadHandler
  extends UploadHandler
{
  private static final String[] PROJECTION_AMP_RULE_RECORD = { "_id", "version" };
  private static final String SELECTION_UPDATE_AMP_RULE = String.format("%s = ?", new Object[] { "_id" });
  private PowerManager.WakeLock mWakeLock;
  
  public AmpUploadHandler(Context paramContext, Handler paramHandler, String paramString1, String paramString2, Looper paramLooper)
  {
    super(paramContext, paramHandler, paramString1, paramString2, paramLooper);
  }
  
  private void bindRuleToEvents(long paramLong, List<String> paramList)
  {
    mProvider.remove("amp_ruleevent", String.format("%s = ?", new Object[] { "rule_id_ref" }), new String[] { Long.toString(paramLong) });
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      String str = (String)paramList.next();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("event_name", str);
      localContentValues.put("rule_id_ref", Long.valueOf(paramLong));
      mProvider.insert("amp_ruleevent", localContentValues);
    }
  }
  
  private void enterWakeLock()
  {
    if (mContext.getPackageManager().checkPermission("android.permission.WAKE_LOCK", mContext.getPackageName()) == 0)
    {
      mWakeLock = ((PowerManager)mContext.getSystemService("power")).newWakeLock(1, "UPLOAD_WAKE_LOCK");
      mWakeLock.acquire();
      if (!mWakeLock.isHeld()) {
        if (!Constants.IS_LOGGABLE) {}
      }
    }
    while (!Constants.IS_LOGGABLE)
    {
      Log.w("Localytics", "Localytics library failed to get wake lock");
      do
      {
        return;
      } while (!Constants.IS_LOGGABLE);
      Log.v("Localytics", "Wake lock acquired.");
      return;
    }
    Log.v("Localytics", "android.permission.WAKE_LOCK is missing from the Manifest file.");
  }
  
  private void exitWakeLock()
  {
    if (mContext.getPackageManager().checkPermission("android.permission.WAKE_LOCK", mContext.getPackageName()) == 0)
    {
      if ((!mWakeLock.isHeld()) && (Constants.IS_LOGGABLE)) {
        Log.w("Localytics", "Wake lock will be released but not held when should be.");
      }
      mWakeLock.release();
      if (mWakeLock.isHeld()) {
        if (!Constants.IS_LOGGABLE) {}
      }
    }
    while (!Constants.IS_LOGGABLE)
    {
      Log.w("Localytics", "Wake lock was not released when it should have been.");
      do
      {
        return;
      } while (!Constants.IS_LOGGABLE);
      Log.v("Localytics", "Wake lock released.");
      return;
    }
    Log.v("Localytics", "android.permission.WAKE_LOCK is missing from the Manifest file.");
  }
  
  private ContentValues parseAmpMessage(Map<String, Object> paramMap)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("campaign_id", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(paramMap, "campaign_id")));
    localContentValues.put("expiration", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(paramMap, "expiration")));
    localContentValues.put("display_seconds", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(paramMap, "display_seconds")));
    localContentValues.put("display_session", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(paramMap, "display_session")));
    localContentValues.put("version", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(paramMap, "version")));
    localContentValues.put("phone_location", JsonHelper.getSafeStringFromMap(paramMap, "phone_location"));
    Map localMap = JsonHelper.getSafeMapFromMap(paramMap, "phone_size");
    localContentValues.put("phone_size_width", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(localMap, "width")));
    localContentValues.put("phone_size_height", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(localMap, "height")));
    localMap = JsonHelper.getSafeMapFromMap(paramMap, "tablet_size");
    localContentValues.put("tablet_location", JsonHelper.getSafeStringFromMap(paramMap, "tablet_location"));
    localContentValues.put("tablet_size_width", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(localMap, "width")));
    localContentValues.put("tablet_size_height", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(localMap, "height")));
    localContentValues.put("time_to_display", Integer.valueOf(1));
    localContentValues.put("internet_required", Integer.valueOf(JsonHelper.getSafeIntegerFromMap(paramMap, "internet_required")));
    localContentValues.put("ab_test", JsonHelper.getSafeStringFromMap(paramMap, "ab_test"));
    localContentValues.put("rule_name", JsonHelper.getSafeStringFromMap(paramMap, "rule_name"));
    localContentValues.put("location", JsonHelper.getSafeStringFromMap(paramMap, "location"));
    localContentValues.put("devices", JsonHelper.getSafeStringFromMap(paramMap, "devices"));
    return localContentValues;
  }
  
  private void removeDeactivatedAMPMessages(List<Map<String, Object>> paramList)
  {
    ArrayList localArrayList = new ArrayList();
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      localArrayList.add(Integer.valueOf(JsonHelper.getSafeIntegerFromMap((Map)paramList.next(), "campaign_id")));
    }
    Vector localVector = new Vector();
    paramList = null;
    for (;;)
    {
      int i;
      try
      {
        Cursor localCursor = mProvider.query("amp_rules", null, null, null, null);
        i = 0;
        paramList = localCursor;
        if (i < localCursor.getCount())
        {
          paramList = localCursor;
          localCursor.moveToPosition(i);
          paramList = localCursor;
          if (localArrayList.contains(Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("campaign_id"))))) {
            break label717;
          }
          paramList = localCursor;
          HashMap localHashMap = new HashMap();
          paramList = localCursor;
          localHashMap.put("_id", Integer.valueOf(localCursor.getColumnIndexOrThrow("_id")));
          paramList = localCursor;
          localHashMap.put("campaign_id", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("campaign_id"))));
          paramList = localCursor;
          localHashMap.put("expiration", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("expiration"))));
          paramList = localCursor;
          localHashMap.put("display_seconds", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("display_seconds"))));
          paramList = localCursor;
          localHashMap.put("display_session", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("display_session"))));
          paramList = localCursor;
          localHashMap.put("version", localCursor.getString(localCursor.getColumnIndexOrThrow("version")));
          paramList = localCursor;
          localHashMap.put("phone_location", localCursor.getString(localCursor.getColumnIndexOrThrow("phone_location")));
          paramList = localCursor;
          localHashMap.put("phone_size_width", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("phone_size_width"))));
          paramList = localCursor;
          localHashMap.put("phone_size_height", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("phone_size_height"))));
          paramList = localCursor;
          localHashMap.put("tablet_location", localCursor.getString(localCursor.getColumnIndexOrThrow("tablet_location")));
          paramList = localCursor;
          localHashMap.put("tablet_size_width", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("tablet_size_width"))));
          paramList = localCursor;
          localHashMap.put("tablet_size_height", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("tablet_size_height"))));
          paramList = localCursor;
          localHashMap.put("time_to_display", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("time_to_display"))));
          paramList = localCursor;
          localHashMap.put("internet_required", Integer.valueOf(localCursor.getInt(localCursor.getColumnIndexOrThrow("internet_required"))));
          paramList = localCursor;
          localHashMap.put("ab_test", localCursor.getString(localCursor.getColumnIndexOrThrow("ab_test")));
          paramList = localCursor;
          localHashMap.put("rule_name", localCursor.getString(localCursor.getColumnIndexOrThrow("rule_name")));
          paramList = localCursor;
          localHashMap.put("location", localCursor.getString(localCursor.getColumnIndexOrThrow("location")));
          paramList = localCursor;
          localHashMap.put("devices", localCursor.getString(localCursor.getColumnIndexOrThrow("devices")));
          paramList = localCursor;
          localVector.add(localHashMap);
        }
      }
      finally
      {
        if (paramList != null) {
          paramList.close();
        }
      }
      if (localObject != null) {
        localObject.close();
      }
      paramList = localVector.iterator();
      while (paramList.hasNext())
      {
        Map localMap = (Map)paramList.next();
        AmpHelper.destroyLocalAmp(mProvider, localMap, false);
      }
      return;
      label717:
      i += 1;
    }
  }
  
  private int saveAMPMessage(final Map<String, Object> paramMap)
  {
    int i;
    if (!validateAMPMessage(paramMap)) {
      i = 0;
    }
    Object localObject1;
    int j;
    label235:
    do
    {
      do
      {
        do
        {
          do
          {
            return i;
            final int m = JsonHelper.getSafeIntegerFromMap(paramMap, "campaign_id");
            int k = 0;
            i = 0;
            Object localObject2 = null;
            Cursor localCursor2 = null;
            Cursor localCursor1 = localCursor2;
            localObject1 = localObject2;
            try
            {
              LocalyticsProvider localLocalyticsProvider = mProvider;
              localCursor1 = localCursor2;
              localObject1 = localObject2;
              String str1 = String.format("%s = ?", new Object[] { "campaign_id" });
              localCursor1 = localCursor2;
              localObject1 = localObject2;
              String str2 = Integer.toString(m);
              localCursor1 = localCursor2;
              localObject1 = localObject2;
              localCursor2 = localLocalyticsProvider.query("amp_displayed", new String[] { "displayed" }, str1, new String[] { str2 }, null);
              localCursor1 = localCursor2;
              localObject1 = localCursor2;
              if (localCursor2.moveToFirst())
              {
                localCursor1 = localCursor2;
                localObject1 = localCursor2;
                i = localCursor2.getInt(localCursor2.getColumnIndex("displayed"));
              }
              j = i;
              if (localCursor2 != null)
              {
                localCursor2.close();
                j = i;
              }
            }
            catch (Exception localException)
            {
              for (;;)
              {
                localObject1 = localCursor1;
                localException.printStackTrace();
                j = k;
                if (localCursor1 != null)
                {
                  localCursor1.close();
                  j = k;
                }
              }
            }
            finally
            {
              if (localObject1 == null) {
                break label235;
              }
              ((Cursor)localObject1).close();
            }
            if (j != 0) {
              return 0;
            }
            j = ((Integer)mProvider.runBatchTransaction(new Callable()
            {
              public Object call()
                throws Exception
              {
                int j = 0;
                int i = 0;
                Object localObject1 = null;
                try
                {
                  Cursor localCursor = mProvider.query("amp_rules", AmpUploadHandler.PROJECTION_AMP_RULE_RECORD, String.format("%s = ?", new Object[] { "campaign_id" }), new String[] { Integer.toString(m) }, null);
                  localObject1 = localCursor;
                  if (localCursor.moveToFirst())
                  {
                    localObject1 = localCursor;
                    j = localCursor.getInt(localCursor.getColumnIndexOrThrow("_id"));
                    localObject1 = localCursor;
                    i = localCursor.getInt(localCursor.getColumnIndexOrThrow("version"));
                  }
                  if (localCursor != null) {
                    localCursor.close();
                  }
                  if (j <= 0) {
                    break label318;
                  }
                  if (Constants.IS_LOGGABLE) {
                    Log.w("Localytics", String.format("Existing AMP rule already exists for this campaign\n\t campaignID = %d\n\t ruleID = %d", new Object[] { Integer.valueOf(m), Integer.valueOf(j) }));
                  }
                  if (i >= JsonHelper.getSafeIntegerFromMap(paramMap, "version"))
                  {
                    if (Constants.IS_LOGGABLE) {
                      Log.w("Localytics", String.format("No update needed. Campaign version has not been updated\n\t version: %d", new Object[] { Integer.valueOf(i) }));
                    }
                    return Integer.valueOf(0);
                  }
                }
                finally
                {
                  if (localObject1 != null) {
                    ((Cursor)localObject1).close();
                  }
                }
                localObject1 = AmpUploadHandler.this.parseAmpMessage(paramMap);
                for (i = mProvider.update("amp_rules", (ContentValues)localObject1, AmpUploadHandler.SELECTION_UPDATE_AMP_RULE, new String[] { Integer.toString(j) });; i = (int)mProvider.insert("amp_rules", (ContentValues)localObject1))
                {
                  if (i > 0)
                  {
                    AmpUploadHandler.this.saveAmpConditions(i, JsonHelper.getSafeListFromMap(paramMap, "conditions"));
                    localObject1 = JsonHelper.toList((JSONArray)JsonHelper.toJSON(paramMap.get("display_events")));
                    AmpUploadHandler.this.bindRuleToEvents(i, (List)localObject1);
                  }
                  return Integer.valueOf(i);
                  label318:
                  if (Constants.IS_LOGGABLE) {
                    Log.w("Localytics", "AMP campaign not found. Creating a new one.");
                  }
                  localObject1 = AmpUploadHandler.this.parseAmpMessage(paramMap);
                }
              }
            })).intValue();
            i = j;
          } while (j <= 0);
          i = j;
        } while (AmpConstants.isTestModeEnabled());
        paramMap = AmpDownloader.getRemoteFileURL(paramMap);
        localObject1 = AmpDownloader.getLocalFileURL(mContext, mApiKey, j, paramMap.endsWith(".zip"));
        i = j;
      } while (TextUtils.isEmpty(paramMap));
      i = j;
    } while (TextUtils.isEmpty((CharSequence)localObject1));
    AmpDownloader.downloadFile(paramMap, (String)localObject1, true);
    return j;
  }
  
  private void saveAmpConditions(long paramLong, List<Object> paramList)
  {
    if (paramList == null) {
      return;
    }
    Object localObject = AmpHelper.getConditionIdFromRuleId(mProvider, paramLong);
    int j = localObject.length;
    int i = 0;
    long l;
    while (i < j)
    {
      l = localObject[i];
      mProvider.remove("amp_condition_values", String.format("%s = ?", new Object[] { "condition_id_ref" }), new String[] { Long.toString(l) });
      i += 1;
    }
    mProvider.remove("amp_conditions", String.format("%s = ?", new Object[] { "rule_id_ref" }), new String[] { Long.toString(paramLong) });
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      localObject = (List)paramList.next();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("attribute_name", (String)((List)localObject).get(0));
      localContentValues.put("operator", (String)((List)localObject).get(1));
      localContentValues.put("rule_id_ref", Long.valueOf(paramLong));
      l = mProvider.insert("amp_conditions", localContentValues);
      i = 2;
      while (i < ((List)localObject).size())
      {
        localContentValues = new ContentValues();
        localContentValues.put("value", JsonHelper.getSafeStringFromValue(((List)localObject).get(i)));
        localContentValues.put("condition_id_ref", Long.valueOf(l));
        mProvider.insert("amp_condition_values", localContentValues);
        i += 1;
      }
    }
  }
  
  private boolean validateAMPMessage(Map<String, Object> paramMap)
  {
    int i = JsonHelper.getSafeIntegerFromMap(paramMap, "campaign_id");
    String str = JsonHelper.getSafeStringFromMap(paramMap, "rule_name");
    List localList = JsonHelper.getSafeListFromMap(paramMap, "display_events");
    int j = JsonHelper.getSafeIntegerFromMap(paramMap, "expiration");
    paramMap = JsonHelper.getSafeStringFromMap(paramMap, "location");
    long l = System.currentTimeMillis() / 1000L;
    return (i != 0) && (!TextUtils.isEmpty(str)) && (localList != null) && (!TextUtils.isEmpty(paramMap)) && (j > l);
  }
  
  public void handleMessage(Message paramMessage)
  {
    try
    {
      enterWakeLock();
      super.handleMessage(paramMessage);
      return;
    }
    finally
    {
      exitWakeLock();
    }
  }
  
  protected void onUploadResponded(String paramString)
  {
    if (Constants.IS_LOGGABLE) {
      Log.w("Localytics", String.format("get session upload response: \n%s", new Object[] { paramString }));
    }
    try
    {
      paramString = JsonHelper.toList((JSONArray)JsonHelper.toJSON(JsonHelper.toMap(new JSONObject(paramString)).get("amp")));
      removeDeactivatedAMPMessages(paramString);
      paramString = paramString.iterator();
      while (paramString.hasNext()) {
        saveAMPMessage((Map)paramString.next());
      }
      return;
    }
    catch (JSONException paramString)
    {
      if (Constants.IS_LOGGABLE) {
        Log.w("Localytics", "JSONException", paramString);
      }
    }
  }
}
