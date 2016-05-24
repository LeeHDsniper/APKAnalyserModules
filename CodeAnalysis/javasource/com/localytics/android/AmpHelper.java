package com.localytics.android;

import android.content.ContentValues;
import android.database.Cursor;
import android.util.Log;
import java.io.File;
import java.util.Map;

final class AmpHelper
{
  public static void destroyLocalAmp(final LocalyticsProvider paramLocalyticsProvider, Map<String, Object> paramMap, boolean paramBoolean)
  {
    try
    {
      final int i = ((Integer)paramMap.get("campaign_id")).intValue();
      paramLocalyticsProvider.runBatchTransaction(new Runnable()
      {
        public void run()
        {
          Object localObject = new ContentValues();
          if (val$displayed) {}
          for (int i = 1;; i = 0)
          {
            ((ContentValues)localObject).put("displayed", Integer.valueOf(i));
            ((ContentValues)localObject).put("campaign_id", Integer.valueOf(i));
            paramLocalyticsProvider.insert("amp_displayed", (ContentValues)localObject);
            localObject = AmpHelper.getConditionIdFromRuleId(paramLocalyticsProvider, val$ruleId);
            int j = localObject.length;
            i = 0;
            while (i < j)
            {
              long l = localObject[i];
              paramLocalyticsProvider.remove("amp_condition_values", String.format("%s = ?", new Object[] { "condition_id_ref" }), new String[] { Long.toString(l) });
              i += 1;
            }
          }
          paramLocalyticsProvider.remove("amp_conditions", String.format("%s = ?", new Object[] { "rule_id_ref" }), new String[] { Integer.toString(val$ruleId) });
          paramLocalyticsProvider.remove("amp_ruleevent", String.format("%s = ?", new Object[] { "rule_id_ref" }), new String[] { Integer.toString(val$ruleId) });
          paramLocalyticsProvider.remove("amp_rules", String.format("%s = ?", new Object[] { "_id" }), new String[] { Integer.toString(val$ruleId) });
        }
      });
      paramLocalyticsProvider = (String)paramMap.get("base_path");
      if (paramLocalyticsProvider != null)
      {
        paramMap = new File(paramLocalyticsProvider);
        if (paramMap.isDirectory())
        {
          String[] arrayOfString = paramMap.list();
          int j = arrayOfString.length;
          i = 0;
          while (i < j)
          {
            new File(paramMap, arrayOfString[i]).delete();
            i += 1;
          }
        }
        if ((!paramMap.delete()) && (Constants.IS_LOGGABLE)) {
          Log.w("Localytics", String.format("Delete %s failed.", new Object[] { paramLocalyticsProvider }));
        }
        if ((!new File(paramLocalyticsProvider + ".zip").delete()) && (Constants.IS_LOGGABLE)) {
          Log.w("Localytics", String.format("Delete %s failed.", new Object[] { paramLocalyticsProvider + ".zip" }));
        }
      }
      return;
    }
    catch (Exception paramLocalyticsProvider)
    {
      while (!Constants.IS_LOGGABLE) {}
      Log.e("Localytics", "Localytics library threw an uncaught exception", paramLocalyticsProvider);
    }
  }
  
  public static long[] getConditionIdFromRuleId(LocalyticsProvider paramLocalyticsProvider, long paramLong)
  {
    long[] arrayOfLong = null;
    Object localObject = arrayOfLong;
    try
    {
      String str1 = String.format("%s = ?", new Object[] { "rule_id_ref" });
      localObject = arrayOfLong;
      String str2 = Long.toString(paramLong);
      localObject = arrayOfLong;
      paramLocalyticsProvider = paramLocalyticsProvider.query("amp_conditions", new String[] { "_id" }, str1, new String[] { str2 }, null);
      localObject = paramLocalyticsProvider;
      arrayOfLong = new long[paramLocalyticsProvider.getCount()];
      int i = 0;
      for (;;)
      {
        localObject = paramLocalyticsProvider;
        if (!paramLocalyticsProvider.moveToNext()) {
          break;
        }
        localObject = paramLocalyticsProvider;
        arrayOfLong[i] = paramLocalyticsProvider.getInt(paramLocalyticsProvider.getColumnIndexOrThrow("_id"));
        i += 1;
      }
      if (paramLocalyticsProvider != null) {
        paramLocalyticsProvider.close();
      }
      return arrayOfLong;
    }
    finally
    {
      if (localObject != null) {
        ((Cursor)localObject).close();
      }
    }
  }
  
  public static int getRuleIdFromCampaignId(LocalyticsProvider paramLocalyticsProvider, int paramInt)
  {
    int i = 0;
    Object localObject2 = null;
    Object localObject1 = localObject2;
    try
    {
      String str1 = String.format("%s = ?", new Object[] { "campaign_id" });
      localObject1 = localObject2;
      String str2 = Integer.toString(paramInt);
      localObject1 = localObject2;
      paramLocalyticsProvider = paramLocalyticsProvider.query("amp_rules", new String[] { "_id" }, str1, new String[] { str2 }, null);
      paramInt = i;
      localObject1 = paramLocalyticsProvider;
      if (paramLocalyticsProvider.moveToFirst())
      {
        localObject1 = paramLocalyticsProvider;
        paramInt = paramLocalyticsProvider.getInt(paramLocalyticsProvider.getColumnIndexOrThrow("_id"));
      }
      if (paramLocalyticsProvider != null) {
        paramLocalyticsProvider.close();
      }
      return paramInt;
    }
    finally
    {
      if (localObject1 != null) {
        ((Cursor)localObject1).close();
      }
    }
  }
}
