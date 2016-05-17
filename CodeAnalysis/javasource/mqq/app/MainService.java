package mqq.app;

import PushNotifyPack.RequestPushForceOffline;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.widget.Toast;
import com.qq.taf.jce.HexUtil;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.mobileqq.msf.sdk.MsfMessagePair;
import com.tencent.mobileqq.msf.sdk.MsfMsgUtil;
import com.tencent.mobileqq.msf.sdk.MsfRespHandleUtil;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.msf.sdk.MsfServiceSdk;
import com.tencent.mobileqq.msf.sdk.RdmReq;
import com.tencent.mobileqq.msf.sdk.VerifyCodeInfo;
import com.tencent.mobileqq.msf.sdk.handler.IAuthHandler;
import com.tencent.mobileqq.msf.sdk.handler.IErrorHandler;
import com.tencent.mobileqq.msf.sdk.handler.IMsfHandler;
import com.tencent.mobileqq.msf.sdk.handler.IMsfMsgHandler;
import com.tencent.mobileqq.msf.sdk.handler.INotifyHandler;
import com.tencent.mobileqq.msf.sdk.handler.IPushHandler;
import com.tencent.mobileqq.msf.sdk.handler.IRegisterUinHandler;
import com.tencent.mobileqq.msf.sdk.handler.IServerInfoHandler;
import com.tencent.mobileqq.msf.sdk.handler.IServerMsgPushHandler;
import com.tencent.msf.service.protocol.push.RequestMSFForceOffline;
import com.tencent.msf.service.protocol.security.CustomSigContent;
import com.tencent.msf.service.protocol.security.RespondCustomSig;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.SimpleAccount;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import mqq.manager.ProxyIpManager;
import mqq.manager.TicketManager;
import mqq.manager.VerifyCodeManager;
import mqq.manager.VerifyDevLockManager;
import mqq.util.AbstractUnifiedMonitor;
import mqq.util.MqqConnRateReport;
import mqq.util.MqqConnRateReport.EventType;

public class MainService
{
  public static final String MSFPROCESSNAMETAG = ":MSF";
  public static final String QQPROCESSNAME = "com.tencent.mobileqq";
  private static final String TAG = MainService.class.getSimpleName();
  public static boolean isDebugVersion = false;
  public static final String msfServiceName = "com.tencent.mobileqq.msf.service.MsfService";
  public static long sPwdPacketTime = 0L;
  public static final String uinNotMatchTag = "uinNotMatch";
  private static AbstractUnifiedMonitor um = null;
  private final Runnable MSFReceiver = new Runnable()
  {
    private void handleResp(MsfMessagePair paramAnonymousMsfMessagePair)
    {
      fromServiceMsg.setAppSeq(toServiceMsg.getAppSeq());
      msfRespHandleUtil.handleRespMsg(toServiceMsg, fromServiceMsg);
    }
    
    public void run()
    {
      for (;;)
      {
        Object localObject1 = null;
        VerifyDevLockManager localVerifyDevLockManager = null;
        for (;;)
        {
          Object localObject2;
          Object localObject3;
          MsfMessagePair localMsfMessagePair;
          try
          {
            localObject2 = mApplicaiton.waitAppRuntime(null);
            if (localObject2 != null)
            {
              localObject1 = (VerifyCodeManager)((AppRuntime)localObject2).getManager(6);
              localVerifyDevLockManager = (VerifyDevLockManager)((AppRuntime)localObject2).getManager(7);
            }
            localObject3 = null;
            localMsfMessagePair = msfSub.getServiceRespMsg();
            localObject2 = localObject3;
            if (localMsfMessagePair != null)
            {
              if (toServiceMsg != null) {
                break label250;
              }
              localObject1 = fromServiceMsg;
              localObject2 = localObject1;
              if (localObject1 != null)
              {
                if ((localObject1 != null) && (((FromServiceMsg)localObject1).getServiceCmd() != null) && (((FromServiceMsg)localObject1).getServiceCmd().equals("SharpSvr.s2c"))) {
                  MqqConnRateReport.getInstance().doReport(MqqConnRateReport.EventType.eVideoMSFReceiverProcess, ((FromServiceMsg)localObject1).getWupBuffer(), 0);
                }
                localObject2 = localObject1;
                if (!msfRespHandleUtil.handlePushMsg((FromServiceMsg)localObject1))
                {
                  localObject2 = localObject1;
                  if (QLog.isColorLevel())
                  {
                    QLog.w("mqq", 2, "[MSF Receive] No handler for " + ((FromServiceMsg)localObject1).getServiceCmd());
                    localObject2 = localObject1;
                  }
                }
              }
            }
            if ((localObject2 != null) || (localMsfMessagePair != null)) {
              break label332;
            }
            msfSub.queueWait();
          }
          catch (Exception localException)
          {
            if (QLog.isColorLevel()) {
              QLog.e("mqq", 2, "[MSF Receive]" + localException.toString());
            }
            localException.printStackTrace();
          }
          break;
          label250:
          if ((localException != null) && (localVerifyDevLockManager != null))
          {
            localObject2 = localObject3;
            if (localException.checkVerifyCodeResp(toServiceMsg, fromServiceMsg))
            {
              localObject2 = localObject3;
              if (localVerifyDevLockManager.checkVerifyDevLockSmsResp(toServiceMsg, fromServiceMsg))
              {
                handleResp(localMsfMessagePair);
                localObject2 = localObject3;
              }
            }
          }
          else
          {
            handleResp(localMsfMessagePair);
            localObject2 = localObject3;
          }
        }
        label332:
        if (MainService.sPwdPacketTime != 0L)
        {
          long l = System.currentTimeMillis() - MainService.sPwdPacketTime;
          if ((l < 40000L) && (l > 0L) && (msfSub.getQueueSize() > 0))
          {
            if (QLog.isColorLevel()) {
              QLog.d("mqq", 2, "[MSF Receive] UI_BUSY");
            }
            Thread.sleep(120L);
          }
        }
      }
    }
  };
  private IAuthHandler authHandler = new IAuthHandler()
  {
    public void onDelLoginedAccountResp(int paramAnonymousInt1, int paramAnonymousInt2, String paramAnonymousString, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onGetKeyResp(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onGetSidResp(int paramAnonymousInt1, int paramAnonymousInt2, String paramAnonymousString1, String paramAnonymousString2, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      attributes.put("sid", paramAnonymousString2);
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onGetUinSignResp(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg, byte[] paramAnonymousArrayOfByte)
    {
      attributes.put(paramAnonymousFromServiceMsg.getServiceCmd(), paramAnonymousArrayOfByte);
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onReceVerifyCode(VerifyCodeInfo paramAnonymousVerifyCodeInfo, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      paramAnonymousFromServiceMsg.addAttribute("VerifyCodeInfo", paramAnonymousVerifyCodeInfo);
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onRecvChangeTokenResp(int paramAnonymousInt1, int paramAnonymousInt2, String paramAnonymousString, RespondCustomSig paramAnonymousRespondCustomSig, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      if (paramAnonymousRespondCustomSig != null)
      {
        paramAnonymousString = SigList.iterator();
        while (paramAnonymousString.hasNext())
        {
          paramAnonymousRespondCustomSig = (CustomSigContent)paramAnonymousString.next();
          if (ulSigType == 14L)
          {
            if (sResult == 0)
            {
              paramAnonymousRespondCustomSig = HexUtil.bytes2HexStr(SigContent);
              attributes.put("vkey", paramAnonymousRespondCustomSig);
            }
          }
          else if (ulSigType == 8L)
          {
            if (sResult == 0)
            {
              paramAnonymousRespondCustomSig = HexUtil.bytes2HexStr(SigContent);
              attributes.put("STwxWeb", paramAnonymousRespondCustomSig);
            }
          }
          else if (ulSigType == 13L)
          {
            if (sResult == 0)
            {
              paramAnonymousRespondCustomSig = paramAnonymousFromServiceMsg.getAttribute(paramAnonymousFromServiceMsg.getServiceCmd());
              if ((paramAnonymousRespondCustomSig != null) && ((paramAnonymousRespondCustomSig instanceof ArrayList)))
              {
                paramAnonymousRespondCustomSig = (ArrayList)paramAnonymousRespondCustomSig;
                attributes.put("arrD3", paramAnonymousRespondCustomSig);
              }
            }
          }
          else if (ulSigType == 19L)
          {
            if ((sResult == 0) && (SigContent != null))
            {
              paramAnonymousRespondCustomSig = new String(SigContent);
              attributes.put("skey", paramAnonymousRespondCustomSig);
            }
            else
            {
              try
              {
                paramAnonymousRespondCustomSig = new String(SigContent, "utf-8");
                attributes.put("skeyError", paramAnonymousRespondCustomSig);
              }
              catch (UnsupportedEncodingException paramAnonymousRespondCustomSig)
              {
                paramAnonymousRespondCustomSig.printStackTrace();
              }
            }
          }
          else if ((ulSigType == 21L) && (sResult == 0))
          {
            paramAnonymousRespondCustomSig = SigContent;
            attributes.put("superkey", paramAnonymousRespondCustomSig);
          }
        }
      }
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onRecvChangeUinLoginResp(int paramAnonymousInt1, int paramAnonymousInt2, String paramAnonymousString, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
      paramAnonymousString = (String)paramAnonymousToServiceMsg.getAttribute("from_where");
      paramAnonymousInt1 = 1;
      if (("subaccount".equals(paramAnonymousString)) || ("ssoAccountAction".equals(paramAnonymousString))) {
        paramAnonymousInt1 = 0;
      }
      if ((paramAnonymousFromServiceMsg.isSuccess()) && (paramAnonymousInt1 != 0))
      {
        paramAnonymousString = SimpleAccount.parseSimpleAccount((String)paramAnonymousFromServiceMsg.getAttribute("resp_simpleAccount"));
        mApplicaiton.createNewRuntime(paramAnonymousString, true, true, 4, null);
      }
    }
    
    public void onRecvChangeUinResp(int paramAnonymousInt1, int paramAnonymousInt2, String paramAnonymousString, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onRecvLoginResp(int paramAnonymousInt1, int paramAnonymousInt2, String paramAnonymousString, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
      paramAnonymousString = (String)paramAnonymousToServiceMsg.getAttribute("from_where");
      paramAnonymousInt1 = 1;
      if (("subaccount".equals(paramAnonymousString)) || ("ssoAccountAction".equals(paramAnonymousString))) {
        paramAnonymousInt1 = 0;
      }
      if ((paramAnonymousFromServiceMsg.isSuccess()) && (paramAnonymousInt1 != 0))
      {
        paramAnonymousString = SimpleAccount.parseSimpleAccount((String)paramAnonymousFromServiceMsg.getAttribute("resp_simpleAccount"));
        mApplicaiton.createNewRuntime(paramAnonymousString, true, true, 3, null);
      }
    }
    
    public void onRefreSidResp(int paramAnonymousInt1, int paramAnonymousInt2, String paramAnonymousString, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      attributes.put("sid", paramAnonymousString);
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
  };
  private IErrorHandler errorHandler = new IErrorHandler()
  {
    private static final String SEC_TAG = "sec_sig_tag";
    
    private void onKicked(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg, boolean paramAnonymousBoolean1, boolean paramAnonymousBoolean2)
    {
      boolean bool = false;
      if (paramAnonymousBoolean1)
      {
        if (QLog.isColorLevel()) {
          QLog.d("sec_sig_tag", 2, "kicked.....onKicked:isTokenExpired start");
        }
        MsfSdkUtils.updateSimpleAccount(paramAnonymousFromServiceMsg.getUin(), false);
        mApplicaiton.setSortAccountList(MsfSdkUtils.getLoginedAccountList());
        paramAnonymousToServiceMsg = (RequestMSFForceOffline)Packet.decodePacket(paramAnonymousFromServiceMsg.getWupBuffer(), "RequestMSFForceOffline", new RequestMSFForceOffline());
        if (bSigKick == 1)
        {
          if (QLog.isColorLevel()) {
            QLog.d("sec_sig_tag", 2, "kicked.....onKicked:result.bSigKick == 1");
          }
          popupNotificationEx("mqq.intent.action.ACCOUNT_KICKED", paramAnonymousFromServiceMsg.getUin(), strTitle, strInfo, Constants.LogoutReason.secKicked, vecSigKickData);
          if (QLog.isColorLevel()) {
            QLog.d("sec_sig_tag", 2, "kicked.....onKicked:isTokenExpired end");
          }
        }
      }
      for (;;)
      {
        return;
        if (QLog.isColorLevel()) {
          QLog.d("sec_sig_tag", 2, "kicked.....onKicked:result.bSigKick != 1");
        }
        popupNotification("mqq.intent.action.ACCOUNT_KICKED", paramAnonymousFromServiceMsg.getUin(), strTitle, strInfo, Constants.LogoutReason.kicked, paramAnonymousBoolean2);
        break;
        if (QLog.isColorLevel()) {
          QLog.d("sec_sig_tag", 2, "kicked.....onKicked: not isTokenExpired start");
        }
        mApplicaiton.setAutoLogin(false);
        paramAnonymousToServiceMsg = (RequestPushForceOffline)Packet.decodePacket(paramAnonymousFromServiceMsg.getWupBuffer(), "req_PushForceOffline", new RequestPushForceOffline());
        if (paramAnonymousToServiceMsg != null)
        {
          if (QLog.isColorLevel()) {
            QLog.d("sec_sig_tag", 2, "kicked.....onKicked: not isTokenExpired start req != null");
          }
          paramAnonymousFromServiceMsg = paramAnonymousFromServiceMsg.getUin();
          String str1 = strTitle;
          String str2 = strTips;
          Constants.LogoutReason localLogoutReason = Constants.LogoutReason.forceLogout;
          paramAnonymousBoolean1 = bool;
          if (bSameDevice == 1) {
            paramAnonymousBoolean1 = true;
          }
          popupNotification("mqq.intent.action.ACCOUNT_KICKED", paramAnonymousFromServiceMsg, str1, str2, localLogoutReason, paramAnonymousBoolean1);
        }
        while (QLog.isColorLevel())
        {
          QLog.d("sec_sig_tag", 2, "kicked.....onKicked: not isTokenExpired end");
          return;
          popupNotification("mqq.intent.action.ACCOUNT_KICKED", paramAnonymousFromServiceMsg.getUin(), null, null, Constants.LogoutReason.forceLogout, false);
        }
      }
    }
    
    private void popupNotification(final String paramAnonymousString1, final String paramAnonymousString2, final String paramAnonymousString3, final String paramAnonymousString4, final Constants.LogoutReason paramAnonymousLogoutReason, final boolean paramAnonymousBoolean)
    {
      final AppRuntime localAppRuntime = mApplicaiton.waitAppRuntime(null);
      if ((localAppRuntime != null) && (QLog.isColorLevel())) {
        QLog.d("mqq", 2, "kicked....kickPC...... in popupNotification isSameDevice = " + paramAnonymousBoolean + "; runnbackGroud = " + isBackground_Stop + ";action = " + paramAnonymousString1 + "; mApplicaiton.getProcessName() = " + mApplicaiton.getProcessName());
      }
      localAppRuntime.runOnUiThread(new Runnable()
      {
        public void run()
        {
          boolean bool;
          Intent localIntent;
          if ((paramAnonymousString2 != null) && (paramAnonymousString2.equals(localAppRuntime.getAccount())))
          {
            bool = true;
            if (paramAnonymousLogoutReason != Constants.LogoutReason.expired) {
              break label387;
            }
            if (!localAppRuntime.isLogin()) {
              bool = false;
            }
            if ((paramAnonymousLogoutReason != Constants.LogoutReason.tips) && (localAppRuntime.isLogin()))
            {
              if (QLog.isColorLevel()) {
                QLog.d("mqq", 2, "kickPC in popupNotification  do logout");
              }
              localAppRuntime.logout(paramAnonymousLogoutReason, true);
            }
            if ((bool) && (mApplicaiton != null) && (mApplicaiton.getProcessName().equalsIgnoreCase(mApplicaiton.getPackageName())))
            {
              localIntent = new Intent(paramAnonymousString1);
              localIntent.putExtra("title", paramAnonymousString3);
              localIntent.putExtra("msg", paramAnonymousString4);
              localIntent.putExtra("reason", paramAnonymousLogoutReason);
              localIntent.putExtra("isSameDevice", paramAnonymousBoolean);
              localIntent.addFlags(268435456);
              if ((!localAppRuntimeisClearTaskBySystem) && ((!paramAnonymousBoolean) || (paramAnonymousString1 == null) || (!paramAnonymousString1.equalsIgnoreCase("mqq.intent.action.ACCOUNT_KICKED")) || (!localAppRuntimeisBackground_Stop))) {
                break label392;
              }
              if (QLog.isColorLevel()) {
                QLog.d("mqq", 2, "kicked samedevice and set kickIntent ");
              }
              localAppRuntime.setKickIntent(localIntent);
            }
          }
          for (;;)
          {
            localIntent = new Intent(paramAnonymousString1);
            localIntent.putExtra("reason", paramAnonymousLogoutReason);
            localIntent.putExtra("title", paramAnonymousString3);
            localIntent.putExtra("msg", paramAnonymousString4);
            localIntent.putExtra("reason", paramAnonymousLogoutReason);
            localIntent.putExtra("isSameDevice", paramAnonymousBoolean);
            mApplicaiton.sendBroadcast(localIntent);
            if (QLog.isColorLevel()) {
              QLog.d("mqq", 2, "kicked....kickPC...... in popupNotification end isNeedNotify = " + bool);
            }
            return;
            label387:
            bool = true;
            break;
            try
            {
              label392:
              mApplicaiton.startActivity(localIntent);
              if (QLog.isColorLevel()) {
                QLog.d("mqq", 2, "kicked start notification......");
              }
            }
            catch (ActivityNotFoundException localActivityNotFoundException)
            {
              localAppRuntime.runOnUiThread(new Runnable()
              {
                public void run()
                {
                  Toast.makeText(mApplicaiton, "[mqq]" + val$reason + "\n" + val$title + "\n" + val$msg, 0).show();
                }
              });
            }
          }
        }
      });
    }
    
    private void popupNotificationEx(final String paramAnonymousString1, final String paramAnonymousString2, final String paramAnonymousString3, final String paramAnonymousString4, final Constants.LogoutReason paramAnonymousLogoutReason, final byte[] paramAnonymousArrayOfByte)
    {
      final AppRuntime localAppRuntime = mApplicaiton.waitAppRuntime(null);
      if (QLog.isColorLevel()) {
        QLog.d("sec_sig_tag", 2, "popupNotificationEx");
      }
      localAppRuntime.runOnUiThread(new Runnable()
      {
        public void run()
        {
          Intent localIntent;
          if (paramAnonymousString2.equals(localAppRuntime.getAccount()))
          {
            if (QLog.isColorLevel()) {
              QLog.d("mqq", 2, "kicked....kickPC...... in popupNotification start");
            }
            if ((paramAnonymousLogoutReason != Constants.LogoutReason.tips) && (localAppRuntime.isLogin()))
            {
              if (QLog.isColorLevel()) {
                QLog.d("mqq", 2, "kickPC in popupNotification  do logout");
              }
              localAppRuntime.logout(paramAnonymousLogoutReason, true);
            }
            localIntent = new Intent(paramAnonymousString1);
            localIntent.putExtra("title", paramAnonymousString3);
            localIntent.putExtra("msg", paramAnonymousString4);
            localIntent.putExtra("reason", paramAnonymousLogoutReason);
            localIntent.putExtra("data", paramAnonymousArrayOfByte);
            localIntent.addFlags(268435456);
          }
          try
          {
            mApplicaiton.startActivity(localIntent);
            localIntent = new Intent(paramAnonymousString1);
            localIntent.putExtra("reason", paramAnonymousLogoutReason);
            mApplicaiton.sendBroadcast(localIntent);
            return;
          }
          catch (ActivityNotFoundException localActivityNotFoundException)
          {
            for (;;)
            {
              localAppRuntime.runOnUiThread(new Runnable()
              {
                public void run()
                {
                  Toast.makeText(mApplicaiton, "[mqq]" + val$reason + "\n" + val$title + "\n" + val$msg, 0).show();
                }
              });
            }
          }
        }
      });
    }
    
    public void onGrayError(final ToServiceMsg paramAnonymousToServiceMsg, final FromServiceMsg paramAnonymousFromServiceMsg, final boolean paramAnonymousBoolean)
    {
      if (QLog.isColorLevel()) {
        QLog.d("mqq", 2, "kicked.....onGrayError start");
      }
      if ((MsfCommand.wt_GetStViaSMSVerifyLogin.equals(paramAnonymousFromServiceMsg.getMsfCommand())) || (MsfCommand.wt_loginAuth.equals(paramAnonymousFromServiceMsg.getMsfCommand())))
      {
        if (QLog.isColorLevel()) {
          QLog.d("mqq", 2, "onGrayError:" + paramAnonymousFromServiceMsg);
        }
        MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
      }
      MsfSdkUtils.updateSimpleAccount(paramAnonymousFromServiceMsg.getUin(), false);
      mApplicaiton.setSortAccountList(MsfSdkUtils.getLoginedAccountList());
      paramAnonymousToServiceMsg = (String)paramAnonymousFromServiceMsg.getAttribute(paramAnonymousFromServiceMsg.getServiceCmd(), "false");
      new Handler(Looper.getMainLooper()).postDelayed(new Runnable()
      {
        public void run()
        {
          MainService.3.this.popupNotification("mqq.intent.action.GRAY", paramAnonymousFromServiceMsg.getUin(), paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg.getBusinessFailMsg(), Constants.LogoutReason.gray, paramAnonymousBoolean);
        }
      }, 500L);
      if (QLog.isColorLevel()) {
        QLog.d("mqq", 2, "kicked.....onGrayError end");
      }
    }
    
    public void onInvalidSign(boolean paramAnonymousBoolean)
    {
      AppRuntime localAppRuntime = mApplicaiton.waitAppRuntime(null);
      if (localAppRuntime != null) {
        localAppRuntime.runOnUiThread(new Runnable()
        {
          public void run()
          {
            Toast.makeText(mApplicaiton, "Appid is invalid!", 0).show();
          }
        });
      }
    }
    
    public void onKicked(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg, boolean paramAnonymousBoolean)
    {
      if (QLog.isColorLevel()) {
        QLog.d("mqq", 2, "kicked.....onKicked start");
      }
      onKicked(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg, false, paramAnonymousBoolean);
      if (QLog.isColorLevel()) {
        QLog.d("mqq", 2, "kicked.....onKicked end");
      }
    }
    
    public void onKickedAndClearToken(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg, boolean paramAnonymousBoolean)
    {
      if (QLog.isColorLevel()) {
        QLog.d("mqq", 2, "kicked ... onKickedAndClearToken start");
      }
      onKicked(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg, true, paramAnonymousBoolean);
      if (QLog.isColorLevel()) {
        QLog.d("mqq", 2, "kicked ... onKickedAndClearToken end");
      }
    }
    
    public void onRecvServerTip(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg, boolean paramAnonymousBoolean)
    {
      String str = paramAnonymousFromServiceMsg.getBusinessFailMsg();
      String[] arrayOfString = str.split("\\n");
      paramAnonymousToServiceMsg = str;
      int i = str.indexOf("\n");
      if (i != -1) {
        paramAnonymousToServiceMsg = str.substring(i + 1);
      }
      popupNotification("mqq.intent.action.ACCOUNT_TIPS", paramAnonymousFromServiceMsg.getUin(), arrayOfString[0], paramAnonymousToServiceMsg, Constants.LogoutReason.tips, paramAnonymousBoolean);
    }
    
    public void onServerSuspended(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg, boolean paramAnonymousBoolean)
    {
      if (QLog.isColorLevel()) {
        QLog.d("mqq", 2, "kicked.....onServerSuspended start");
      }
      if (paramAnonymousToServiceMsg == null) {
        popupNotification("mqq.intent.action.SUSPEND", paramAnonymousFromServiceMsg.getUin(), null, paramAnonymousFromServiceMsg.getBusinessFailMsg(), Constants.LogoutReason.suspend, paramAnonymousBoolean);
      }
      if (QLog.isColorLevel()) {
        QLog.d("mqq", 2, "kicked.....onServerSuspended end");
      }
    }
    
    public void onUserTokenExpired(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg, boolean paramAnonymousBoolean)
    {
      if (QLog.isColorLevel()) {
        QLog.d("mqq", 2, "kicked...onUserTokenExpired start");
      }
      MsfSdkUtils.updateSimpleAccount(paramAnonymousFromServiceMsg.getUin(), false);
      mApplicaiton.setSortAccountList(MsfSdkUtils.getLoginedAccountList());
      popupNotification("mqq.intent.action.ACCOUNT_EXPIRED", paramAnonymousFromServiceMsg.getUin(), null, paramAnonymousFromServiceMsg.getBusinessFailMsg(), Constants.LogoutReason.expired, paramAnonymousBoolean);
      if (QLog.isColorLevel()) {
        QLog.d("mqq", 2, "kicked....onUserTokenExpired end ");
      }
    }
  };
  private MobileQQ mApplicaiton;
  private final Map<String, Set<Class<? extends MSFServlet>>> mRegistServlets = new ConcurrentHashMap();
  private final Map<Integer, Class<? extends MSFServlet>> mRequestServlets = new ConcurrentHashMap();
  private IMsfMsgHandler msfMsgHandler = new IMsfMsgHandler()
  {
    public void onRecvResp(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
  };
  private Thread msfRecvThread;
  private final MsfRespHandleUtil msfRespHandleUtil;
  public final MsfServiceSdk msfSub;
  INotifyHandler notifyHandler = new INotifyHandler()
  {
    public void onRecvNotify(long paramAnonymousLong, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(null, paramAnonymousFromServiceMsg);
    }
    
    public void onRegisterNotifyResp(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg) {}
    
    public void onUnRegisterNotifyResp(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg) {}
  };
  private IPushHandler pushHandler = new IPushHandler()
  {
    public void onOverloadPushNotify(final String paramAnonymousString)
    {
      QLog.d("mqq", 1, "overload push notify, msg: " + paramAnonymousString);
      if (mApplicaiton != null)
      {
        AppRuntime localAppRuntime = mApplicaiton.waitAppRuntime(null);
        if (localAppRuntime != null) {
          localAppRuntime.runOnUiThread(new Runnable()
          {
            public void run()
            {
              try
              {
                Intent localIntent = new Intent("mqq.intent.action.OVERLOAD_PUSH");
                localIntent.putExtra("msg", paramAnonymousString);
                localIntent.addFlags(268435456);
                mApplicaiton.startActivity(localIntent);
                return;
              }
              catch (Exception localException)
              {
                localException.printStackTrace();
                QLog.d("mqq", 1, "overload push notify fail, except: " + localException.getMessage());
              }
            }
          });
        }
      }
      else
      {
        return;
      }
      QLog.d("mqq", 1, "overload push notify fail, app is null");
    }
    
    public void onProxyIpChanged(String paramAnonymousString)
    {
      QLog.d("mqq", 1, "proxy ip changed, uin: " + MsfSdkUtils.getShortUin(paramAnonymousString));
      if (mApplicaiton != null)
      {
        AppRuntime localAppRuntime = mApplicaiton.waitAppRuntime(null);
        if (localAppRuntime != null) {
          ((ProxyIpManager)localAppRuntime.getManager(3)).reloadCache(paramAnonymousString, false);
        }
      }
    }
    
    public void onRecvCmdPush(FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(null, paramAnonymousFromServiceMsg);
    }
    
    public void onRegisterCmdPushResp(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onRegisterPushResp(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onResetCmdPushResp(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg) {}
    
    public void onTicketChanged()
    {
      QLog.d("mqq", 1, "ticket changed");
      if (mApplicaiton != null)
      {
        AppRuntime localAppRuntime = mApplicaiton.waitAppRuntime(null);
        if (localAppRuntime != null) {
          ((TicketManager)localAppRuntime.getManager(2)).reloadCache(mApplicaiton);
        }
      }
    }
    
    public void onUnRegisterPushResp(ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
  };
  private IRegisterUinHandler registerUinHandler = new IRegisterUinHandler()
  {
    public void onRegQueryAccountResp(int paramAnonymousInt, byte[] paramAnonymousArrayOfByte, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onRegisterCommitMobileResp(int paramAnonymousInt, byte[] paramAnonymousArrayOfByte1, byte[] paramAnonymousArrayOfByte2, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onRegisterCommitPassResp(int paramAnonymousInt, String paramAnonymousString, byte[] paramAnonymousArrayOfByte, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onRegisterCommitSmsCodeResp(int paramAnonymousInt, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onRegisterQuerySmsStatResp(int paramAnonymousInt1, byte[] paramAnonymousArrayOfByte, int paramAnonymousInt2, int paramAnonymousInt3, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
    
    public void onRegisterSendResendSmsreqResp(int paramAnonymousInt1, byte[] paramAnonymousArrayOfByte, int paramAnonymousInt2, int paramAnonymousInt3, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
  };
  private int reportThreshold = -1;
  private IServerInfoHandler serverInfoHandler = new IServerInfoHandler()
  {
    public void onReportResp(int paramAnonymousInt1, int paramAnonymousInt2, String paramAnonymousString, ToServiceMsg paramAnonymousToServiceMsg, FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(paramAnonymousToServiceMsg, paramAnonymousFromServiceMsg);
    }
  };
  private IServerMsgPushHandler serverMsgPushHandler = new IServerMsgPushHandler()
  {
    public void onConnClose(FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(null, paramAnonymousFromServiceMsg);
    }
    
    public void onConnOpened(FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(null, paramAnonymousFromServiceMsg);
    }
    
    public void onOpenConnAllFailed(FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(null, paramAnonymousFromServiceMsg);
    }
    
    public void onReceFirstResp(FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(null, paramAnonymousFromServiceMsg);
    }
    
    public void onRecvServerConfigPush(FromServiceMsg paramAnonymousFromServiceMsg)
    {
      MainService.this.receiveMessageFromMSF(null, paramAnonymousFromServiceMsg);
    }
  };
  private int umNotReported = 0;
  
  MainService(MobileQQ paramMobileQQ, int paramInt, String paramString, boolean paramBoolean)
  {
    mApplicaiton = paramMobileQQ;
    msfSub = MsfServiceSdk.get();
    msfSub.init(paramMobileQQ, paramInt, paramString, "com.tencent.mobileqq.msf.service.MsfService", errorHandler, MobileQQ.processName);
    msfRespHandleUtil = new MsfRespHandleUtil(new IMsfHandler[] { msfMsgHandler, pushHandler, notifyHandler, authHandler, registerUinHandler, serverMsgPushHandler, serverInfoHandler });
    if (paramBoolean) {
      start();
    }
  }
  
  private void receiveMessageFromMSF(ToServiceMsg paramToServiceMsg, final FromServiceMsg paramFromServiceMsg)
  {
    AppRuntime localAppRuntime = null;
    String str2 = null;
    Object localObject3 = null;
    Object localObject2;
    final long l;
    String str1;
    Object localObject1;
    if (paramToServiceMsg != null)
    {
      localObject2 = (Class)mRequestServlets.remove(Integer.valueOf(paramToServiceMsg.getAppSeq()));
      l = extraData.getLong("sendTime");
      l = System.currentTimeMillis() - l;
      if (paramFromServiceMsg.isSuccess())
      {
        if (QLog.isColorLevel()) {
          QLog.d("mqq", 2, "[MSF Receive]" + paramFromServiceMsg.getServiceCmd() + " appSeq:" + paramToServiceMsg.getAppSeq() + ",cost=" + l + "ms.");
        }
        recordKeyTimestamp(paramToServiceMsg, paramFromServiceMsg);
        str1 = (String)paramToServiceMsg.getAttribute("from_where");
        localObject1 = (String)paramToServiceMsg.getAttribute("mainaccount");
        label154:
        localAppRuntime = mApplicaiton.waitAppRuntime(null);
        int i = 0;
        if ("0".equals(paramFromServiceMsg.getUin()))
        {
          paramFromServiceMsg.setUin(localAppRuntime.getAccount());
          i = 1;
        }
        str2 = paramFromServiceMsg.getUin();
        if ((str1 != null) && (str1.length() > 0)) {
          paramFromServiceMsg.addAttribute("from_where", str1);
        }
        if ((localObject1 != null) && (((String)localObject1).length() > 0)) {
          paramFromServiceMsg.addAttribute("mainaccount", localObject1);
        }
        if ((i != 0) || (str2.equals(localAppRuntime.getAccount())) || ("login.auth".equals(paramFromServiceMsg.getServiceCmd())) || ("wtlogin.login".equals(paramFromServiceMsg.getServiceCmd())) || (MsfCommand.wt_GetStViaSMSVerifyLogin.equals(paramFromServiceMsg.getMsfCommand())) || (MsfCommand.wt_loginAuth.equals(paramFromServiceMsg.getMsfCommand())) || (MsfCommand.wt_name2uin.equals(paramFromServiceMsg.getMsfCommand())) || ("login.chguin".equals(paramFromServiceMsg.getServiceCmd())) || ((str1 != null) && (str1.equals("subaccount"))) || ((paramToServiceMsg != null) && (paramToServiceMsg.getAttributes().containsKey("uinNotMatch"))))
        {
          if ((reportThreshold == -1) && (um != null))
          {
            if (!um.whetherReportDuringThisStartup(7)) {
              break label917;
            }
            reportThreshold = um.getThreshold(7);
            um.setMonitoredThread(7, Thread.currentThread(), null);
          }
          label419:
          if ((um != null) && (um.whetherStackEnabled(7))) {
            um.reportStackIfTimeout(7);
          }
          l = SystemClock.uptimeMillis();
          localAppRuntime.getServletContainer().notifyMSFServlet((Class)localObject2, paramFromServiceMsg);
          l = SystemClock.uptimeMillis() - l;
          if (reportThreshold > 0)
          {
            if (l <= reportThreshold) {
              break label926;
            }
            if (um.whetherReportThisTime(7)) {
              um.addEvent(7, paramFromServiceMsg.getServiceCmd(), (int)l, umNotReported, null);
            }
          }
        }
      }
    }
    for (umNotReported = 0;; umNotReported += 1)
    {
      if (QLog.isColorLevel()) {
        QLog.d("mqq", 2, "[MSF End][notifyMSFServlet]" + paramFromServiceMsg.getServiceCmd() + ",ssoseq=" + paramFromServiceMsg.getRequestSsoSeq() + ",cost=" + l + "ms.");
      }
      if ((isDebugVersion) && (l >= 2000L))
      {
        paramToServiceMsg = new HashMap();
        paramToServiceMsg.put("cmd", paramFromServiceMsg.getServiceCmd());
        localObject1 = new RdmReq();
        eventName = "longTimeCallback";
        elapse = l;
        size = 0L;
        isSucceed = true;
        isRealTime = false;
        params = paramToServiceMsg;
        paramToServiceMsg = MsfMsgUtil.getRdmReportMsg(msfSub.getMsfServiceName(), (RdmReq)localObject1);
        paramToServiceMsg.setNeedCallback(false);
        extraData.putLong("sendTime", System.currentTimeMillis());
        msfSub.sendMsg(paramToServiceMsg);
      }
      if ((isDebugVersion) && (l >= 5000L) && (localAppRuntime != null)) {
        localAppRuntime.runOnUiThread(new Runnable()
        {
          public void run()
          {
            Toast.makeText(mApplicaiton, "Caution! running too long. cmd=" + paramFromServiceMsg.getServiceCmd() + " time=" + l + "ms.", 1).show();
          }
        });
      }
      return;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.w("mqq", 2, "[MSF Receive]" + paramFromServiceMsg.getServiceCmd() + " appSeq:" + paramToServiceMsg.getAppSeq() + ",code=" + paramFromServiceMsg.getResultCode() + ",cost=" + l + "ms.");
      break;
      if (!mApplicaiton.getProcessName().endsWith(":video"))
      {
        localObject2 = localAppRuntime;
        str1 = str2;
        localObject1 = localObject3;
        if (!QLog.isColorLevel()) {
          break label154;
        }
      }
      QLog.d("mqq", 1, "[MSF Push]" + paramFromServiceMsg.getServiceCmd() + ",ssoseq=" + paramFromServiceMsg.getRequestSsoSeq());
      localObject2 = localAppRuntime;
      str1 = str2;
      localObject1 = localObject3;
      break label154;
      label917:
      reportThreshold = -2;
      break label419;
      label926:
      if (um.whetherStackEnabled(7)) {
        um.notifyNotTimeout(7);
      }
    }
  }
  
  private void recordKeyTimestamp(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    if ((paramToServiceMsg == null) || (paramFromServiceMsg == null)) {
      return;
    }
    long l1 = extraData.getLong("sendTime", 0L);
    long l2 = ((Long)paramToServiceMsg.getAttribute("__timestamp_app2msf", Long.valueOf(0L))).longValue();
    long l3 = ((Long)paramToServiceMsg.getAttribute("__timestamp_msf2net", Long.valueOf(0L))).longValue();
    long l4 = ((Long)paramFromServiceMsg.getAttribute("__timestamp_net2msf", Long.valueOf(0L))).longValue();
    long l5 = ((Long)paramFromServiceMsg.getAttribute("__timestamp_msf2app", Long.valueOf(0L))).longValue();
    long l6 = System.currentTimeMillis();
    extraData.putLong("timestamp_app2msf_atAppSite", l1);
    extraData.putLong("timestamp_app2msf_atMsfSite", l2);
    extraData.putLong("timestamp_msf2net_atMsfSite", l3);
    extraData.putLong("timestamp_net2msf_atMsfSite", l4);
    extraData.putLong("timestamp_msf2app_atMsfSite", l5);
    extraData.putLong("timestamp_msf2app_atAppSite", l6);
  }
  
  public static void setUnifiedMonitorInstance(AbstractUnifiedMonitor paramAbstractUnifiedMonitor)
  {
    um = paramAbstractUnifiedMonitor;
  }
  
  public void clearServlets()
  {
    mRequestServlets.clear();
  }
  
  public void onRecvVerifyManagerCallback(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    paramFromServiceMsg.setAppSeq(paramToServiceMsg.getAppSeq());
    msfRespHandleUtil.handleRespMsg(paramToServiceMsg, paramFromServiceMsg);
  }
  
  public void registCommands(String paramString, Class<? extends MSFServlet> paramClass)
  {
    Set localSet = (Set)mRegistServlets.get(paramString);
    Object localObject = localSet;
    if (localSet == null)
    {
      localObject = new HashSet();
      mRegistServlets.put(paramString, localObject);
    }
    ((Set)localObject).add(paramClass);
  }
  
  void sendMessageToMSF(ToServiceMsg paramToServiceMsg, MSFServlet paramMSFServlet)
  {
    if (paramToServiceMsg.getServiceName() == null) {
      paramToServiceMsg.setServiceName(msfSub.getMsfServiceName());
    }
    mRequestServlets.put(Integer.valueOf(paramToServiceMsg.getAppSeq()), paramMSFServlet.getClass());
    extraData.putLong("sendTime", System.currentTimeMillis());
    msfSub.sendMsg(paramToServiceMsg);
    if (QLog.isColorLevel()) {
      QLog.d("mqq", 2, "[MSF Send]" + paramToServiceMsg.getServiceCmd() + " appSeq:" + paramToServiceMsg.getAppSeq() + " from " + paramMSFServlet.getClass().getSimpleName());
    }
  }
  
  public void start()
  {
    if (msfRecvThread == null)
    {
      msfRecvThread = new Thread(MSFReceiver, "MSF-Receiver");
      if ((mApplicaiton == null) || (mApplicaiton.getProcessName() == null) || (!mApplicaiton.getProcessName().endsWith(":video"))) {
        break label75;
      }
      msfRecvThread.setPriority(10);
    }
    for (;;)
    {
      msfRecvThread.start();
      return;
      label75:
      msfRecvThread.setPriority(5);
    }
  }
}
