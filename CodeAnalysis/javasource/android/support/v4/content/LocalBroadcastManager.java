package android.support.v4.content;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

public class LocalBroadcastManager
{
  private static LocalBroadcastManager mInstance;
  private static final Object mLock = new Object();
  private final HashMap<String, ArrayList<ReceiverRecord>> mActions = new HashMap();
  private final Context mAppContext;
  private final Handler mHandler;
  private final ArrayList<BroadcastRecord> mPendingBroadcasts = new ArrayList();
  private final HashMap<BroadcastReceiver, ArrayList<IntentFilter>> mReceivers = new HashMap();
  
  private LocalBroadcastManager(Context paramContext)
  {
    mAppContext = paramContext;
    mHandler = new Handler(paramContext.getMainLooper())
    {
      public void handleMessage(Message paramAnonymousMessage)
      {
        switch (what)
        {
        default: 
          super.handleMessage(paramAnonymousMessage);
          return;
        }
        LocalBroadcastManager.this.executePendingBroadcasts();
      }
    };
  }
  
  private void executePendingBroadcasts()
  {
    for (;;)
    {
      int i;
      synchronized (mReceivers)
      {
        i = mPendingBroadcasts.size();
        if (i <= 0) {
          return;
        }
        BroadcastRecord[] arrayOfBroadcastRecord = new BroadcastRecord[i];
        mPendingBroadcasts.toArray(arrayOfBroadcastRecord);
        mPendingBroadcasts.clear();
        i = 0;
        if (i >= arrayOfBroadcastRecord.length) {
          continue;
        }
        ??? = arrayOfBroadcastRecord[i];
        int j = 0;
        if (j < receivers.size())
        {
          receivers.get(j)).receiver.onReceive(mAppContext, intent);
          j += 1;
        }
      }
      i += 1;
    }
  }
  
  public static LocalBroadcastManager getInstance(Context paramContext)
  {
    synchronized (mLock)
    {
      if (mInstance == null) {
        mInstance = new LocalBroadcastManager(paramContext.getApplicationContext());
      }
      paramContext = mInstance;
      return paramContext;
    }
  }
  
  public void registerReceiver(BroadcastReceiver paramBroadcastReceiver, IntentFilter paramIntentFilter)
  {
    synchronized (mReceivers)
    {
      ReceiverRecord localReceiverRecord = new ReceiverRecord(paramIntentFilter, paramBroadcastReceiver);
      Object localObject2 = (ArrayList)mReceivers.get(paramBroadcastReceiver);
      Object localObject1 = localObject2;
      if (localObject2 == null)
      {
        localObject1 = new ArrayList(1);
        mReceivers.put(paramBroadcastReceiver, localObject1);
      }
      ((ArrayList)localObject1).add(paramIntentFilter);
      int i = 0;
      while (i < paramIntentFilter.countActions())
      {
        localObject2 = paramIntentFilter.getAction(i);
        localObject1 = (ArrayList)mActions.get(localObject2);
        paramBroadcastReceiver = (BroadcastReceiver)localObject1;
        if (localObject1 == null)
        {
          paramBroadcastReceiver = new ArrayList(1);
          mActions.put(localObject2, paramBroadcastReceiver);
        }
        paramBroadcastReceiver.add(localReceiverRecord);
        i += 1;
      }
      return;
    }
  }
  
  public boolean sendBroadcast(Intent paramIntent)
  {
    int i;
    label161:
    int j;
    Object localObject2;
    int k;
    synchronized (mReceivers)
    {
      String str1 = paramIntent.getAction();
      String str2 = paramIntent.resolveTypeIfNeeded(mAppContext.getContentResolver());
      Uri localUri = paramIntent.getData();
      String str3 = paramIntent.getScheme();
      Set localSet = paramIntent.getCategories();
      if ((paramIntent.getFlags() & 0x8) == 0) {
        break label521;
      }
      i = 1;
      if (i != 0) {
        Log.v("LocalBroadcastManager", "Resolving type " + str2 + " scheme " + str3 + " of intent " + paramIntent);
      }
      ArrayList localArrayList = (ArrayList)mActions.get(paramIntent.getAction());
      if (localArrayList == null) {
        break label497;
      }
      if (i == 0) {
        break label502;
      }
      Log.v("LocalBroadcastManager", "Action list: " + localArrayList);
      break label502;
      if (j >= localArrayList.size()) {
        break label554;
      }
      ReceiverRecord localReceiverRecord = (ReceiverRecord)localArrayList.get(j);
      if (i != 0) {
        Log.v("LocalBroadcastManager", "Matching against filter " + filter);
      }
      if (broadcasting)
      {
        localObject1 = localObject2;
        if (i != 0)
        {
          Log.v("LocalBroadcastManager", "  Filter's target already added");
          localObject1 = localObject2;
        }
      }
      else
      {
        k = filter.match(str1, str2, str3, localUri, localSet, "LocalBroadcastManager");
        if (k >= 0)
        {
          if (i != 0) {
            Log.v("LocalBroadcastManager", "  Filter matched!  match=0x" + Integer.toHexString(k));
          }
          localObject1 = localObject2;
          if (localObject2 == null) {
            localObject1 = new ArrayList();
          }
          ((ArrayList)localObject1).add(localReceiverRecord);
          broadcasting = true;
        }
      }
    }
    Object localObject1 = localObject2;
    if (i != 0) {
      switch (k)
      {
      default: 
        localObject1 = "unknown reason";
        label392:
        Log.v("LocalBroadcastManager", "  Filter did not match: " + (String)localObject1);
        localObject1 = localObject2;
        break;
      }
    }
    for (;;)
    {
      if (i < ((ArrayList)localObject2).size())
      {
        getbroadcasting = false;
        i += 1;
      }
      else
      {
        mPendingBroadcasts.add(new BroadcastRecord(paramIntent, (ArrayList)localObject2));
        if (!mHandler.hasMessages(1)) {
          mHandler.sendEmptyMessage(1);
        }
        return true;
        label497:
        label502:
        label521:
        label554:
        do
        {
          return false;
          localObject2 = null;
          j = 0;
          break label161;
          j += 1;
          localObject2 = localObject1;
          break label161;
          i = 0;
          break;
          localObject1 = "action";
          break label392;
          localObject1 = "category";
          break label392;
          localObject1 = "data";
          break label392;
          localObject1 = "type";
          break label392;
        } while (localObject2 == null);
        i = 0;
      }
    }
  }
  
  public void unregisterReceiver(BroadcastReceiver paramBroadcastReceiver)
  {
    for (;;)
    {
      int k;
      int m;
      synchronized (mReceivers)
      {
        ArrayList localArrayList1 = (ArrayList)mReceivers.remove(paramBroadcastReceiver);
        if (localArrayList1 == null)
        {
          return;
          if (j < localArrayList1.size())
          {
            IntentFilter localIntentFilter = (IntentFilter)localArrayList1.get(j);
            k = 0;
            if (k >= localIntentFilter.countActions()) {
              break label190;
            }
            String str = localIntentFilter.getAction(k);
            ArrayList localArrayList2 = (ArrayList)mActions.get(str);
            if (localArrayList2 == null) {
              break label181;
            }
            i = 0;
            if (i < localArrayList2.size())
            {
              m = i;
              if (getreceiver != paramBroadcastReceiver) {
                break label173;
              }
              localArrayList2.remove(i);
              m = i - 1;
              break label173;
            }
            if (localArrayList2.size() > 0) {
              break label181;
            }
            mActions.remove(str);
            break label181;
          }
          return;
        }
      }
      int j = 0;
      continue;
      label173:
      int i = m + 1;
      continue;
      label181:
      k += 1;
      continue;
      label190:
      j += 1;
    }
  }
  
  private static class BroadcastRecord
  {
    final Intent intent;
    final ArrayList<LocalBroadcastManager.ReceiverRecord> receivers;
    
    BroadcastRecord(Intent paramIntent, ArrayList<LocalBroadcastManager.ReceiverRecord> paramArrayList)
    {
      intent = paramIntent;
      receivers = paramArrayList;
    }
  }
  
  private static class ReceiverRecord
  {
    boolean broadcasting;
    final IntentFilter filter;
    final BroadcastReceiver receiver;
    
    ReceiverRecord(IntentFilter paramIntentFilter, BroadcastReceiver paramBroadcastReceiver)
    {
      filter = paramIntentFilter;
      receiver = paramBroadcastReceiver;
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder(128);
      localStringBuilder.append("Receiver{");
      localStringBuilder.append(receiver);
      localStringBuilder.append(" filter=");
      localStringBuilder.append(filter);
      localStringBuilder.append("}");
      return localStringBuilder.toString();
    }
  }
}
