package mqq.app;

import android.content.ComponentName;
import android.content.Intent;
import android.os.Looper;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import mqq.util.MqqConnRateReport;
import mqq.util.MqqConnRateReport.EventType;

public class ServletContainer
{
  private final Map<String, Set<String>> actionMap = new HashMap();
  private AppRuntime app;
  private ExecutorService mService = Executors.newSingleThreadExecutor();
  final ConcurrentHashMap<String, Servlet> managedServlet = new ConcurrentHashMap();
  
  public ServletContainer(AppRuntime paramAppRuntime)
  {
    app = paramAppRuntime;
  }
  
  public void destroy()
  {
    mService.shutdown();
    Iterator localIterator = managedServlet.entrySet().iterator();
    while (localIterator.hasNext()) {
      ((Servlet)((Map.Entry)localIterator.next()).getValue()).onDestroy();
    }
    managedServlet.clear();
  }
  
  public void forward(AppRuntime paramAppRuntime, final Intent paramIntent)
  {
    if (!mService.isShutdown())
    {
      paramAppRuntime = new Runnable()
      {
        public void run()
        {
          try
          {
            Servlet localServlet = getServlet(val$className);
            if (localServlet != null) {
              localServlet.service(paramIntent);
            }
            return;
          }
          catch (Exception localException)
          {
            QLog.e("mqq", 1, "", localException);
          }
        }
      };
      boolean bool = false;
      if ((paramIntent instanceof NewIntent)) {
        bool = runNow;
      }
      if ((bool) || (Thread.currentThread() != Looper.getMainLooper().getThread()))
      {
        paramAppRuntime.run();
        return;
      }
      mService.execute(paramAppRuntime);
      return;
    }
    QLog.e("mqq", 1, "ServletContainer has destoryed," + paramIntent.getComponent().getClassName() + " can not be started.");
  }
  
  Servlet getServlet(String paramString)
  {
    Servlet localServlet = (Servlet)managedServlet.get(paramString);
    Object localObject = localServlet;
    if (localServlet == null) {
      try
      {
        localObject = Class.forName(paramString);
      }
      catch (Throwable localThrowable)
      {
        try
        {
          Class localClass;
          for (;;)
          {
            localServlet = (Servlet)((Class)localObject).newInstance();
            localServlet.init(app, this);
            localServlet.onCreate();
            managedServlet.put(paramString, localServlet);
            localObject = localServlet;
            if (!(localServlet instanceof MSFServlet)) {
              break;
            }
            String[] arrayOfString = ((MSFServlet)localServlet).getPreferSSOCommands();
            localObject = localServlet;
            if (arrayOfString == null) {
              break;
            }
            int j = arrayOfString.length;
            int i = 0;
            for (;;)
            {
              localObject = localServlet;
              if (i >= j) {
                break;
              }
              String str = arrayOfString[i];
              Set localSet = (Set)actionMap.get(str);
              localObject = localSet;
              if (localSet == null)
              {
                localObject = new HashSet();
                actionMap.put(str, localObject);
              }
              ((Set)localObject).add(paramString);
              i += 1;
            }
            localThrowable = localThrowable;
            localClass = app.getClass().getClassLoader().loadClass(paramString);
          }
          return localClass;
        }
        catch (Throwable paramString)
        {
          paramString.printStackTrace();
          return null;
        }
      }
    }
  }
  
  public void notifyMSFServlet(Class<? extends MSFServlet> paramClass, FromServiceMsg paramFromServiceMsg)
  {
    Class<? extends MSFServlet> localClass = null;
    if (paramClass != null)
    {
      paramClass = (MSFServlet)getServlet(paramClass.getName());
      localClass = paramClass;
      if (paramClass != null)
      {
        paramClass.onReceive(paramFromServiceMsg);
        localClass = paramClass;
      }
    }
    paramClass = (Set)actionMap.get(paramFromServiceMsg.getServiceCmd());
    if (paramClass != null)
    {
      paramClass = paramClass.iterator();
      while (paramClass.hasNext())
      {
        MSFServlet localMSFServlet = (MSFServlet)getServlet((String)paramClass.next());
        if ((localMSFServlet != null) && (localMSFServlet != localClass)) {
          localMSFServlet.onReceive(paramFromServiceMsg);
        } else if ((paramFromServiceMsg != null) && (paramFromServiceMsg.getServiceCmd() != null) && (paramFromServiceMsg.getServiceCmd().equals("SharpSvr.s2c"))) {
          MqqConnRateReport.getInstance().doReport(MqqConnRateReport.EventType.eMSFRecvInviteMsg, paramFromServiceMsg.getWupBuffer(), 20);
        }
      }
    }
    if ((paramFromServiceMsg != null) && (paramFromServiceMsg.getServiceCmd() != null) && (paramFromServiceMsg.getServiceCmd().equals("SharpSvr.s2c"))) {
      MqqConnRateReport.getInstance().doReport(MqqConnRateReport.EventType.eMSFRecvInviteMsg, paramFromServiceMsg.getWupBuffer(), 19);
    }
  }
}
