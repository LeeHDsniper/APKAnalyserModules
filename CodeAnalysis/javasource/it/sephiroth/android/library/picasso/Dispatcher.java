package it.sephiroth.android.library.picasso;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;

class Dispatcher
{
  boolean airplaneMode;
  final List<BitmapHunter> batch;
  final Cache cache;
  final Context context;
  final DispatcherThread dispatcherThread = new DispatcherThread();
  final Downloader downloader;
  final Map<Object, Action> failedActions;
  final Handler handler;
  final Map<String, BitmapHunter> hunterMap;
  final Handler mainThreadHandler;
  final Map<Object, Action> pausedActions;
  final Set<Object> pausedTags;
  final NetworkBroadcastReceiver receiver;
  final boolean scansNetworkChanges;
  final ExecutorService service;
  final Stats stats;
  boolean useBatch;
  
  Dispatcher(Context paramContext, ExecutorService paramExecutorService, Handler paramHandler, Downloader paramDownloader, Cache paramCache, Stats paramStats)
  {
    dispatcherThread.start();
    Utils.flushStackLocalLeaks(dispatcherThread.getLooper());
    context = paramContext;
    service = paramExecutorService;
    hunterMap = new LinkedHashMap();
    failedActions = new WeakHashMap();
    pausedActions = new WeakHashMap();
    pausedTags = new HashSet();
    handler = new DispatcherHandler(dispatcherThread.getLooper(), this);
    downloader = paramDownloader;
    mainThreadHandler = paramHandler;
    cache = paramCache;
    stats = paramStats;
    batch = new ArrayList(4);
    airplaneMode = Utils.isAirplaneModeOn(context);
    scansNetworkChanges = Utils.hasPermission(paramContext, "android.permission.ACCESS_NETWORK_STATE");
    receiver = new NetworkBroadcastReceiver(this);
    receiver.register();
  }
  
  private void batch(BitmapHunter paramBitmapHunter)
  {
    if (paramBitmapHunter.isCancelled()) {}
    do
    {
      return;
      if (!useBatch) {
        break;
      }
      batch.add(paramBitmapHunter);
    } while (handler.hasMessages(7));
    handler.sendEmptyMessageDelayed(7, 200L);
    return;
    mainThreadHandler.sendMessage(mainThreadHandler.obtainMessage(14, paramBitmapHunter));
  }
  
  private void flushFailedActions()
  {
    if (!failedActions.isEmpty())
    {
      Iterator localIterator = failedActions.values().iterator();
      while (localIterator.hasNext())
      {
        Action localAction = (Action)localIterator.next();
        localIterator.remove();
        if (getPicassologgingEnabled) {
          Utils.log("Dispatcher", "replaying", localAction.getRequest().logId());
        }
        performSubmit(localAction, false);
      }
    }
  }
  
  private void logBatch(List<BitmapHunter> paramList)
  {
    if ((paramList == null) || (paramList.isEmpty())) {}
    while (!get0getPicassologgingEnabled) {
      return;
    }
    StringBuilder localStringBuilder = new StringBuilder();
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      BitmapHunter localBitmapHunter = (BitmapHunter)paramList.next();
      if (localStringBuilder.length() > 0) {
        localStringBuilder.append(", ");
      }
      localStringBuilder.append(Utils.getLogIdsForHunter(localBitmapHunter));
    }
    Utils.log("Dispatcher", "delivered", localStringBuilder.toString());
  }
  
  private void markForReplay(Action paramAction)
  {
    Object localObject = paramAction.getTarget();
    if (localObject != null)
    {
      willReplay = true;
      failedActions.put(localObject, paramAction);
    }
  }
  
  private void markForReplay(BitmapHunter paramBitmapHunter)
  {
    Action localAction = paramBitmapHunter.getAction();
    if (localAction != null) {
      markForReplay(localAction);
    }
    paramBitmapHunter = paramBitmapHunter.getActions();
    if (paramBitmapHunter != null)
    {
      int i = 0;
      int j = paramBitmapHunter.size();
      while (i < j)
      {
        markForReplay((Action)paramBitmapHunter.get(i));
        i += 1;
      }
    }
  }
  
  void dispatchAirplaneModeChange(boolean paramBoolean)
  {
    Handler localHandler1 = handler;
    Handler localHandler2 = handler;
    if (paramBoolean) {}
    for (int i = 1;; i = 0)
    {
      localHandler1.sendMessage(localHandler2.obtainMessage(10, i, 0));
      return;
    }
  }
  
  void dispatchCancel(Action paramAction)
  {
    handler.sendMessage(handler.obtainMessage(2, paramAction));
  }
  
  void dispatchComplete(BitmapHunter paramBitmapHunter)
  {
    handler.sendMessage(handler.obtainMessage(4, paramBitmapHunter));
  }
  
  void dispatchFailed(BitmapHunter paramBitmapHunter)
  {
    handler.sendMessage(handler.obtainMessage(6, paramBitmapHunter));
  }
  
  void dispatchNetworkStateChange(NetworkInfo paramNetworkInfo)
  {
    handler.sendMessage(handler.obtainMessage(9, paramNetworkInfo));
  }
  
  void dispatchRetry(BitmapHunter paramBitmapHunter)
  {
    handler.sendMessageDelayed(handler.obtainMessage(5, paramBitmapHunter), 500L);
  }
  
  void dispatchSubmit(Action paramAction, long paramLong)
  {
    if (paramLong > 0L)
    {
      handler.sendMessageDelayed(handler.obtainMessage(1, paramAction), paramLong);
      return;
    }
    handler.sendMessage(handler.obtainMessage(1, paramAction));
  }
  
  void performAirplaneModeChange(boolean paramBoolean)
  {
    airplaneMode = paramBoolean;
  }
  
  void performBatchComplete()
  {
    ArrayList localArrayList = new ArrayList(batch);
    batch.clear();
    mainThreadHandler.sendMessage(mainThreadHandler.obtainMessage(8, localArrayList));
    logBatch(localArrayList);
  }
  
  void performCancel(Action paramAction)
  {
    String str = paramAction.getKey();
    BitmapHunter localBitmapHunter = (BitmapHunter)hunterMap.get(str);
    if (localBitmapHunter != null)
    {
      localBitmapHunter.detach(paramAction);
      if (localBitmapHunter.cancel())
      {
        hunterMap.remove(str);
        if (getPicassologgingEnabled) {
          Utils.log("Dispatcher", "canceled", paramAction.getRequest().logId());
        }
      }
    }
    if (pausedTags.contains(paramAction.getTag()))
    {
      pausedActions.remove(paramAction.getTarget());
      if (getPicassologgingEnabled) {
        Utils.log("Dispatcher", "canceled", paramAction.getRequest().logId(), "because paused request got canceled");
      }
    }
    paramAction = (Action)failedActions.remove(paramAction.getTarget());
    if ((paramAction != null) && (getPicassologgingEnabled)) {
      Utils.log("Dispatcher", "canceled", paramAction.getRequest().logId(), "from replaying");
    }
  }
  
  void performComplete(BitmapHunter paramBitmapHunter)
  {
    if (MemoryPolicy.shouldWriteToMemoryCache(paramBitmapHunter.getMemoryPolicy())) {
      cache.set(paramBitmapHunter.getKey(), paramBitmapHunter.getResult());
    }
    if ((paramBitmapHunter.getResult() != null) && (diskCache != null)) {
      diskCache.set(paramBitmapHunter.getKey(), paramBitmapHunter.getResult());
    }
    hunterMap.remove(paramBitmapHunter.getKey());
    batch(paramBitmapHunter);
    if (getPicassologgingEnabled) {
      Utils.log("Dispatcher", "batched", Utils.getLogIdsForHunter(paramBitmapHunter), "for completion");
    }
  }
  
  void performError(BitmapHunter paramBitmapHunter, boolean paramBoolean)
  {
    String str2;
    StringBuilder localStringBuilder;
    if (getPicassologgingEnabled)
    {
      str2 = Utils.getLogIdsForHunter(paramBitmapHunter);
      localStringBuilder = new StringBuilder().append("for error");
      if (!paramBoolean) {
        break label78;
      }
    }
    label78:
    for (String str1 = " (will replay)";; str1 = "")
    {
      Utils.log("Dispatcher", "batched", str2, str1);
      hunterMap.remove(paramBitmapHunter.getKey());
      batch(paramBitmapHunter);
      return;
    }
  }
  
  void performNetworkStateChange(NetworkInfo paramNetworkInfo)
  {
    if ((service instanceof PicassoExecutorService)) {
      ((PicassoExecutorService)service).adjustThreadCount(paramNetworkInfo);
    }
    if ((paramNetworkInfo != null) && (paramNetworkInfo.isConnected())) {
      flushFailedActions();
    }
  }
  
  void performPauseTag(Object paramObject)
  {
    if (!pausedTags.add(paramObject)) {}
    for (;;)
    {
      return;
      Iterator localIterator = hunterMap.values().iterator();
      while (localIterator.hasNext())
      {
        BitmapHunter localBitmapHunter = (BitmapHunter)localIterator.next();
        boolean bool = getPicassologgingEnabled;
        Action localAction = localBitmapHunter.getAction();
        List localList = localBitmapHunter.getActions();
        int i;
        if ((localList != null) && (!localList.isEmpty()))
        {
          i = 1;
          label92:
          if ((localAction == null) && (i == 0)) {
            break label241;
          }
          if ((localAction != null) && (localAction.getTag().equals(paramObject)))
          {
            localBitmapHunter.detach(localAction);
            pausedActions.put(localAction.getTarget(), localAction);
            if (bool) {
              Utils.log("Dispatcher", "paused", request.logId(), "because tag '" + paramObject + "' was paused");
            }
          }
          if (i == 0) {
            break label316;
          }
          i = localList.size() - 1;
          label202:
          if (i < 0) {
            break label316;
          }
          localAction = (Action)localList.get(i);
          if (localAction.getTag().equals(paramObject)) {
            break label243;
          }
        }
        for (;;)
        {
          i -= 1;
          break label202;
          i = 0;
          break label92;
          label241:
          break;
          label243:
          localBitmapHunter.detach(localAction);
          pausedActions.put(localAction.getTarget(), localAction);
          if (bool) {
            Utils.log("Dispatcher", "paused", request.logId(), "because tag '" + paramObject + "' was paused");
          }
        }
        label316:
        if (localBitmapHunter.cancel())
        {
          localIterator.remove();
          if (bool) {
            Utils.log("Dispatcher", "canceled", Utils.getLogIdsForHunter(localBitmapHunter), "all actions paused");
          }
        }
      }
    }
  }
  
  void performResumeTag(Object paramObject)
  {
    if (!pausedTags.remove(paramObject)) {}
    Object localObject1;
    do
    {
      return;
      localObject1 = null;
      Iterator localIterator = pausedActions.values().iterator();
      while (localIterator.hasNext())
      {
        Action localAction = (Action)localIterator.next();
        if (localAction.getTag().equals(paramObject))
        {
          Object localObject2 = localObject1;
          if (localObject1 == null) {
            localObject2 = new ArrayList();
          }
          ((List)localObject2).add(localAction);
          localIterator.remove();
          localObject1 = localObject2;
        }
      }
    } while (localObject1 == null);
    mainThreadHandler.sendMessage(mainThreadHandler.obtainMessage(13, localObject1));
  }
  
  void performRetry(BitmapHunter paramBitmapHunter)
  {
    if (paramBitmapHunter.isCancelled()) {}
    label70:
    boolean bool2;
    label126:
    label131:
    do
    {
      return;
      if (service.isShutdown())
      {
        performError(paramBitmapHunter, false);
        return;
      }
      NetworkInfo localNetworkInfo = null;
      if (scansNetworkChanges) {
        localNetworkInfo = ((ConnectivityManager)Utils.getService(context, "connectivity")).getActiveNetworkInfo();
      }
      int i;
      if ((localNetworkInfo != null) && (localNetworkInfo.isConnected()))
      {
        i = 1;
        bool1 = paramBitmapHunter.shouldRetry(airplaneMode, localNetworkInfo);
        bool2 = paramBitmapHunter.supportsReplay();
        if (bool1) {
          break label131;
        }
        if ((!scansNetworkChanges) || (!bool2)) {
          break label126;
        }
      }
      for (boolean bool1 = true;; bool1 = false)
      {
        performError(paramBitmapHunter, bool1);
        if (!bool1) {
          break;
        }
        markForReplay(paramBitmapHunter);
        return;
        i = 0;
        break label70;
      }
      if ((!scansNetworkChanges) || (i != 0))
      {
        if (getPicassologgingEnabled) {
          Utils.log("Dispatcher", "retrying", Utils.getLogIdsForHunter(paramBitmapHunter));
        }
        if ((paramBitmapHunter.getException() instanceof NetworkRequestHandler.ContentLengthException)) {
          networkPolicy |= NO_CACHEindex;
        }
        future = service.submit(paramBitmapHunter);
        return;
      }
      performError(paramBitmapHunter, bool2);
    } while (!bool2);
    markForReplay(paramBitmapHunter);
  }
  
  void performSubmit(Action paramAction)
  {
    performSubmit(paramAction, true);
  }
  
  void performSubmit(Action paramAction, boolean paramBoolean)
  {
    if (pausedTags.contains(paramAction.getTag()))
    {
      pausedActions.put(paramAction.getTarget(), paramAction);
      if (getPicassologgingEnabled) {
        Utils.log("Dispatcher", "paused", request.logId(), "because tag '" + paramAction.getTag() + "' is paused");
      }
    }
    do
    {
      do
      {
        return;
        localBitmapHunter = (BitmapHunter)hunterMap.get(paramAction.getKey());
        if (localBitmapHunter != null)
        {
          localBitmapHunter.attach(paramAction);
          return;
        }
        if (!service.isShutdown()) {
          break;
        }
      } while (!getPicassologgingEnabled);
      Utils.log("Dispatcher", "ignored", request.logId(), "because shut down");
      return;
      BitmapHunter localBitmapHunter = BitmapHunter.forRequest(paramAction.getPicasso(), this, request.cache, request.diskCache, stats, paramAction);
      future = service.submit(localBitmapHunter);
      hunterMap.put(paramAction.getKey(), localBitmapHunter);
      if (paramBoolean) {
        failedActions.remove(paramAction.getTarget());
      }
    } while (!getPicassologgingEnabled);
    Utils.log("Dispatcher", "enqueued", request.logId());
  }
  
  private static class DispatcherHandler
    extends Handler
  {
    private final Dispatcher dispatcher;
    
    public DispatcherHandler(Looper paramLooper, Dispatcher paramDispatcher)
    {
      super();
      dispatcher = paramDispatcher;
    }
    
    public void handleMessage(final Message paramMessage)
    {
      boolean bool = true;
      switch (what)
      {
      case 3: 
      case 8: 
      default: 
        Picasso.HANDLER.post(new Runnable()
        {
          public void run()
          {
            throw new AssertionError("Unknown handler message received: " + paramMessagewhat);
          }
        });
        return;
      case 1: 
        paramMessage = (Action)obj;
        dispatcher.performSubmit(paramMessage);
        return;
      case 2: 
        paramMessage = (Action)obj;
        dispatcher.performCancel(paramMessage);
        return;
      case 11: 
        paramMessage = obj;
        dispatcher.performPauseTag(paramMessage);
        return;
      case 12: 
        paramMessage = obj;
        dispatcher.performResumeTag(paramMessage);
        return;
      case 4: 
        paramMessage = (BitmapHunter)obj;
        dispatcher.performComplete(paramMessage);
        return;
      case 5: 
        paramMessage = (BitmapHunter)obj;
        dispatcher.performRetry(paramMessage);
        return;
      case 6: 
        paramMessage = (BitmapHunter)obj;
        dispatcher.performError(paramMessage, false);
        return;
      case 7: 
        dispatcher.performBatchComplete();
        return;
      case 9: 
        paramMessage = (NetworkInfo)obj;
        dispatcher.performNetworkStateChange(paramMessage);
        return;
      }
      Dispatcher localDispatcher = dispatcher;
      if (arg1 == 1) {}
      for (;;)
      {
        localDispatcher.performAirplaneModeChange(bool);
        return;
        bool = false;
      }
    }
  }
  
  static class DispatcherThread
    extends HandlerThread
  {
    DispatcherThread()
    {
      super(10);
    }
  }
  
  static class NetworkBroadcastReceiver
    extends BroadcastReceiver
  {
    private final Dispatcher dispatcher;
    
    NetworkBroadcastReceiver(Dispatcher paramDispatcher)
    {
      dispatcher = paramDispatcher;
    }
    
    public void onReceive(Context paramContext, Intent paramIntent)
    {
      if (paramIntent == null) {}
      String str;
      do
      {
        do
        {
          return;
          str = paramIntent.getAction();
          if (!"android.intent.action.AIRPLANE_MODE".equals(str)) {
            break;
          }
        } while (!paramIntent.hasExtra("state"));
        dispatcher.dispatchAirplaneModeChange(paramIntent.getBooleanExtra("state", false));
        return;
      } while (!"android.net.conn.CONNECTIVITY_CHANGE".equals(str));
      paramContext = (ConnectivityManager)Utils.getService(paramContext, "connectivity");
      dispatcher.dispatchNetworkStateChange(paramContext.getActiveNetworkInfo());
    }
    
    void register()
    {
      IntentFilter localIntentFilter = new IntentFilter();
      localIntentFilter.addAction("android.intent.action.AIRPLANE_MODE");
      if (dispatcher.scansNetworkChanges) {
        localIntentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
      }
      dispatcher.context.registerReceiver(this, localIntentFilter);
    }
  }
}
