package mqq.app;

import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import com.tencent.mobileqq.msf.sdk.MsfServiceSdk;
import com.tencent.mobileqq.msf.sdk.VerifyCodeInfo;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;
import mqq.manager.VerifyCodeManager;
import mqq.observer.HttpVerifyHandler;
import mqq.observer.ServerNotifyObserver;

public class VerifyCodeManagerImpl
  implements VerifyCodeManager
{
  public static final int MANAGER_HTTPVERIFYCODE_CHANGE = 2;
  public static final int MANAGER_VERIFYCODE_CLOSE = 1;
  public static final int MANAGER_VERIFYCODE_RECEIVE = 0;
  private final AppRuntime app;
  ConcurrentHashMap<String, HttpVerifyCodeWrapper> httpVerifyCodeWrapperMap = new ConcurrentHashMap();
  private final Handler mHandler = new Handler(Looper.getMainLooper())
  {
    public void handleMessage(Message paramAnonymousMessage)
    {
      switch (what)
      {
      default: 
        return;
      case 0: 
        paramAnonymousMessage = (Object[])obj;
        ((ServerNotifyObserver)paramAnonymousMessage[0]).onReceiveVerifyCode((String)paramAnonymousMessage[1], ((Integer)paramAnonymousMessage[2]).intValue(), (String)paramAnonymousMessage[3], (byte[])paramAnonymousMessage[4]);
        return;
      }
      ((ServerNotifyObserver)((Object[])(Object[])obj)[0]).onVerifyClose();
    }
  };
  ConcurrentHashMap<Integer, VerifyCodeWrapper> verifyCodeWrapperMap = new ConcurrentHashMap();
  
  public VerifyCodeManagerImpl(AppRuntime paramAppRuntime)
  {
    app = paramAppRuntime;
  }
  
  private FromServiceMsg createVerifyCodeCancelResp(ToServiceMsg paramToServiceMsg)
  {
    FromServiceMsg localFromServiceMsg = new FromServiceMsg(paramToServiceMsg.getAppId(), paramToServiceMsg.getAppSeq(), paramToServiceMsg.getUin(), paramToServiceMsg.getServiceCmd());
    localFromServiceMsg.setMsfCommand(paramToServiceMsg.getMsfCommand());
    localFromServiceMsg.setBusinessFail(2006, "");
    return localFromServiceMsg;
  }
  
  private void notifyApp(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    app.getService().onRecvVerifyManagerCallback(paramToServiceMsg, paramFromServiceMsg);
  }
  
  private void notifyHttpVerifyCodeActivity(String paramString1, String paramString2, byte[] paramArrayOfByte)
  {
    Object localObject = (HttpVerifyCodeWrapper)httpVerifyCodeWrapperMap.get(paramString1);
    if ((localObject != null) && (serverNotifyObserver != null))
    {
      Message localMessage = mHandler.obtainMessage();
      obj = new Object[] { serverNotifyObserver, paramString1, Integer.valueOf(0), paramString2, paramArrayOfByte };
      what = 0;
      localMessage.sendToTarget();
      return;
    }
    localObject = new Intent();
    ((Intent)localObject).setFlags(268435456);
    ((Intent)localObject).setAction("android.intent.action.VIEW");
    ((Intent)localObject).putExtra("key", paramString1);
    ((Intent)localObject).putExtra("note", paramString2);
    ((Intent)localObject).putExtra("image", paramArrayOfByte);
    ((Intent)localObject).setData(Uri.parse("mqqverifycode://puzzle_verify_code/VERIFYCODE?"));
    app.getApplication().startActivity((Intent)localObject);
  }
  
  private void notifyVerifyCodeActivity(ToServiceMsg paramToServiceMsg, String paramString1, byte[] paramArrayOfByte, String paramString2)
  {
    int i = paramToServiceMsg.getRequestSsoSeq();
    String str = String.valueOf(paramToServiceMsg.getAttribute("process"));
    paramToServiceMsg = (VerifyCodeWrapper)verifyCodeWrapperMap.get(Integer.valueOf(i));
    if (serverNotifyObserver != null)
    {
      localObject = mHandler.obtainMessage();
      obj = new Object[] { serverNotifyObserver, "", Integer.valueOf(i), paramString1, paramArrayOfByte, paramString2 };
      what = 0;
      ((Message)localObject).sendToTarget();
      return;
    }
    Intent localIntent = new Intent();
    localIntent.setFlags(268435456);
    paramToServiceMsg = "android.intent.action.VIEW";
    Object localObject = null;
    if (!TextUtils.isEmpty(paramString2))
    {
      paramString1 = "PUZZLEVERIFYCODE";
      localIntent.putExtra("seq", i);
      localIntent.putExtra("url", paramString2);
      localIntent.putExtra("business", 2097152L);
      localIntent.putExtra("hide_operation_bar", true);
      localIntent.putExtra("hide_more_button", true);
      localIntent.putExtra("isSubaccount", true);
      localIntent.putExtra("isShowAd", false);
      paramString2 = paramToServiceMsg;
      localIntent.setAction(paramString2);
      if (!TextUtils.isEmpty(paramString1))
      {
        paramToServiceMsg = new StringBuilder();
        paramToServiceMsg.append("mqqverifycode://puzzle_verify_code/");
        paramToServiceMsg.append(paramString1);
        paramToServiceMsg.append("?");
        localIntent.setData(Uri.parse(paramToServiceMsg.toString()));
      }
      app.getApplication().startActivity(localIntent);
      return;
    }
    if ("com.tencent.mobileqq:openSdk".equals(str)) {
      paramString2 = "mqq.opensdk.intent.action.VERIFYCODE";
    }
    for (paramToServiceMsg = (ToServiceMsg)localObject;; paramToServiceMsg = (ToServiceMsg)localObject)
    {
      localIntent.putExtra("seq", i);
      localIntent.putExtra("note", paramString1);
      localIntent.putExtra("image", paramArrayOfByte);
      paramString1 = paramToServiceMsg;
      break;
      localObject = "VERIFYCODE";
      paramString2 = paramToServiceMsg;
    }
  }
  
  private void notifyVerifyCodeActivityClose(ServerNotifyObserver paramServerNotifyObserver, String paramString)
  {
    Message localMessage = mHandler.obtainMessage();
    obj = new Object[] { paramServerNotifyObserver, paramString };
    what = 1;
    localMessage.sendToTarget();
  }
  
  public void cancelVerifyCode(ServerNotifyObserver paramServerNotifyObserver)
  {
    if (paramServerNotifyObserver.getSeq() == 0)
    {
      localObject = (HttpVerifyCodeWrapper)httpVerifyCodeWrapperMap.remove(paramServerNotifyObserver.getKey());
      if ((localObject != null) && (localObject != null))
      {
        HashMap localHashMap = attr;
        httpVerifyHandler.cancelVerifyCode(paramServerNotifyObserver.getKey(), localHashMap);
      }
    }
    do
    {
      return;
      paramServerNotifyObserver = (VerifyCodeWrapper)verifyCodeWrapperMap.remove(Integer.valueOf(paramServerNotifyObserver.getSeq()));
    } while (paramServerNotifyObserver == null);
    Object localObject = createVerifyCodeCancelResp(srcTo);
    notifyApp(srcTo, (FromServiceMsg)localObject);
  }
  
  public boolean checkVerifyCodeResp(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    boolean bool2 = true;
    boolean bool1;
    if (paramFromServiceMsg.getBusinessFailCode() == 2002)
    {
      if (!verifyCodeWrapperMap.containsKey(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq())))
      {
        verifyCodeWrapperMap.putIfAbsent(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()), new VerifyCodeWrapper(paramToServiceMsg.getRequestSsoSeq()));
        verifyCodeWrapperMap.get(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()))).srcTo = paramToServiceMsg;
      }
      paramFromServiceMsg = VerifyCodeInfo.getVerifyCodeInfo(paramFromServiceMsg);
      verifyCodeWrapperMap.get(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()))).verifyCodeInfo = paramFromServiceMsg;
      notifyVerifyCodeActivity(paramToServiceMsg, verifyNote, verifyimage, verifyurl);
      bool1 = false;
    }
    VerifyCodeWrapper localVerifyCodeWrapper;
    do
    {
      do
      {
        return bool1;
        if (paramFromServiceMsg.getBusinessFailCode() == 2003) {
          break;
        }
        bool1 = bool2;
      } while (!verifyCodeWrapperMap.containsKey(Integer.valueOf(paramFromServiceMsg.getRequestSsoSeq())));
      localVerifyCodeWrapper = (VerifyCodeWrapper)verifyCodeWrapperMap.remove(Integer.valueOf(paramFromServiceMsg.getRequestSsoSeq()));
      paramToServiceMsg = "";
      if (!paramFromServiceMsg.isSuccess()) {
        paramToServiceMsg = paramFromServiceMsg.getBusinessFailMsg();
      }
      if (serverNotifyObserver != null) {
        notifyVerifyCodeActivityClose(serverNotifyObserver, paramToServiceMsg);
      }
      bool1 = bool2;
    } while (paramFromServiceMsg.getBusinessFailCode() == 2016);
    paramFromServiceMsg.setMsfCommand(srcTo.getMsfCommand());
    notifyApp(srcTo, paramFromServiceMsg);
    return false;
  }
  
  public void onDestroy() {}
  
  public void onHttpVerifyCodeFail(String paramString1, String paramString2)
  {
    paramString1 = (HttpVerifyCodeWrapper)httpVerifyCodeWrapperMap.remove(paramString1);
    if (paramString1 != null) {
      notifyVerifyCodeActivityClose(serverNotifyObserver, paramString2);
    }
  }
  
  public void onHttpVerifyCodeSucc(String paramString)
  {
    paramString = (HttpVerifyCodeWrapper)httpVerifyCodeWrapperMap.remove(paramString);
    if (paramString != null) {
      notifyVerifyCodeActivityClose(serverNotifyObserver, "");
    }
  }
  
  public void onRecvHttpVerifyCode(HttpVerifyHandler paramHttpVerifyHandler, byte[] paramArrayOfByte, String paramString, HashMap paramHashMap)
  {
    String str = (String)paramHashMap.get("key");
    if (!httpVerifyCodeWrapperMap.containsKey(str)) {
      httpVerifyCodeWrapperMap.putIfAbsent(str, new HttpVerifyCodeWrapper(str));
    }
    HttpVerifyCodeWrapper localHttpVerifyCodeWrapper = (HttpVerifyCodeWrapper)httpVerifyCodeWrapperMap.get(str);
    if (localHttpVerifyCodeWrapper != null)
    {
      httpVerifyHandler = paramHttpVerifyHandler;
      attr = paramHashMap;
      notifyHttpVerifyCodeActivity(str, paramString, paramArrayOfByte);
    }
  }
  
  public void refreVerifyCode(ServerNotifyObserver paramServerNotifyObserver)
  {
    Object localObject;
    if (paramServerNotifyObserver.getSeq() == 0)
    {
      localObject = (HttpVerifyCodeWrapper)httpVerifyCodeWrapperMap.get(paramServerNotifyObserver.getKey());
      if (localObject != null)
      {
        serverNotifyObserver = paramServerNotifyObserver;
        HashMap localHashMap = attr;
        httpVerifyHandler.refreVerifyCode(paramServerNotifyObserver.getKey(), localHashMap);
      }
    }
    do
    {
      return;
      int i = paramServerNotifyObserver.getSeq();
      localObject = (VerifyCodeWrapper)verifyCodeWrapperMap.get(Integer.valueOf(i));
      if (localObject != null)
      {
        serverNotifyObserver = paramServerNotifyObserver;
        paramServerNotifyObserver = app.getService().msfSub.getRefreVerifyCodeMsg(verifyCodeInfo);
        paramServerNotifyObserver.setAppSeq(verifyCodeInfo.appSeq);
        app.getService().msfSub.sendMsg(paramServerNotifyObserver);
        return;
      }
    } while (!QLog.isColorLevel());
    QLog.d("VerifyCodeManager", 2, "wrapper is null");
  }
  
  public void submitPuzzleVerifyCodeTicket(int paramInt, String paramString)
  {
    Object localObject2 = (VerifyCodeWrapper)verifyCodeWrapperMap.get(Integer.valueOf(paramInt));
    if (localObject2 != null)
    {
      Object localObject1 = srcTo;
      paramString = app.getService().msfSub.getSubmitPuzzleVerifyCodeTicketMsg(paramString, verifyCodeInfo);
      paramString.setAppSeq(verifyCodeInfo.appSeq);
      if (((ToServiceMsg)localObject1).getAttribute("from_where") != null)
      {
        localObject2 = (String)((ToServiceMsg)localObject1).getAttribute("from_where");
        localObject1 = (String)((ToServiceMsg)localObject1).getAttribute("mainaccount");
        paramString.addAttribute("from_where", localObject2);
        paramString.addAttribute("mainaccount", localObject1);
      }
      app.getService().msfSub.sendMsg(paramString);
    }
  }
  
  public void submitVerifyCode(ServerNotifyObserver paramServerNotifyObserver, String paramString)
  {
    Object localObject;
    if (paramServerNotifyObserver.getSeq() == 0)
    {
      localObject = (HttpVerifyCodeWrapper)httpVerifyCodeWrapperMap.get(paramServerNotifyObserver.getKey());
      if (localObject != null)
      {
        HashMap localHashMap = attr;
        serverNotifyObserver = paramServerNotifyObserver;
        httpVerifyHandler.submitVerifyCode(paramServerNotifyObserver.getKey(), localHashMap, paramString);
      }
    }
    do
    {
      return;
      localObject = (VerifyCodeWrapper)verifyCodeWrapperMap.get(Integer.valueOf(paramServerNotifyObserver.getSeq()));
    } while (localObject == null);
    serverNotifyObserver = paramServerNotifyObserver;
    paramServerNotifyObserver = srcTo;
    paramString = app.getService().msfSub.getSubmitVerifyCodeMsg(paramString, verifyCodeInfo);
    paramString.setAppSeq(verifyCodeInfo.appSeq);
    if (paramServerNotifyObserver.getAttribute("from_where") != null)
    {
      localObject = (String)paramServerNotifyObserver.getAttribute("from_where");
      paramServerNotifyObserver = (String)paramServerNotifyObserver.getAttribute("mainaccount");
      paramString.addAttribute("from_where", localObject);
      paramString.addAttribute("mainaccount", paramServerNotifyObserver);
    }
    app.getService().msfSub.sendMsg(paramString);
  }
  
  class HttpVerifyCodeWrapper
  {
    HashMap attr;
    HttpVerifyHandler httpVerifyHandler;
    String key;
    ServerNotifyObserver serverNotifyObserver;
    
    public HttpVerifyCodeWrapper(String paramString)
    {
      key = paramString;
    }
  }
  
  class VerifyCodeWrapper
  {
    HashMap attr;
    int seq;
    ServerNotifyObserver serverNotifyObserver;
    ToServiceMsg srcTo;
    VerifyCodeInfo verifyCodeInfo;
    
    public VerifyCodeWrapper(int paramInt)
    {
      seq = paramInt;
    }
  }
}
