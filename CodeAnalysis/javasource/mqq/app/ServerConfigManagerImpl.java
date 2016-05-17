package mqq.app;

import com.qq.jce.wup.UniPacket;
import com.tencent.mobileqq.msf.sdk.MsfServiceSdk;
import java.util.ArrayList;
import mqq.manager.ServerConfigManager;
import mqq.manager.ServerConfigManager.ConfigType;
import mqq.observer.ServerConfigObserver;
import protocol.KQQConfig.GetResourceReqInfoV2;
import protocol.KQQConfig.GetResourceReqV2;
import protocol.KQQConfig.ReqUserInfo;

class ServerConfigManagerImpl
  implements ServerConfigManager
{
  private AppRuntime app;
  
  public ServerConfigManagerImpl(AppRuntime paramAppRuntime)
  {
    app = paramAppRuntime;
  }
  
  public void getPluginConfig(int paramInt, ReqUserInfo paramReqUserInfo, ArrayList<GetResourceReqInfoV2> paramArrayList, ServerConfigObserver paramServerConfigObserver)
  {
    UniPacket localUniPacket = new UniPacket(true);
    localUniPacket.setEncodeName("utf-8");
    localUniPacket.setRequestId(0);
    localUniPacket.setServantName("KQQ.ConfigService.ConfigServantObj");
    localUniPacket.setFuncName("ClientReq");
    localUniPacket.put("iCmdType", Integer.valueOf(64));
    localUniPacket.put("ReqUserInfo", paramReqUserInfo);
    paramReqUserInfo = new GetResourceReqV2();
    iPluginType = paramInt;
    vecResReqInfo = paramArrayList;
    localUniPacket.put("GetResourceReqV2", paramReqUserInfo);
    paramReqUserInfo = localUniPacket.encode();
    paramArrayList = new NewIntent(app.getApplication(), BuiltInServlet.class);
    paramArrayList.putExtra("action", 1018);
    paramArrayList.putExtra("buffer", paramReqUserInfo);
    paramArrayList.putExtra("iPluginType", paramInt);
    paramArrayList.setObserver(paramServerConfigObserver);
    app.startServlet(paramArrayList);
  }
  
  public void getRichMediaServerList(int paramInt)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), BuiltInServlet.class);
    localNewIntent.putExtra("action", 1011);
    localNewIntent.putExtra("timestamp", paramInt);
    app.startServlet(localNewIntent);
  }
  
  public String getServerConfig(String paramString, ServerConfigManager.ConfigType paramConfigType)
  {
    switch (1.$SwitchMap$mqq$manager$ServerConfigManager$ConfigType[paramConfigType.ordinal()])
    {
    default: 
      return null;
    case 1: 
      return app.getService().msfSub.syncGetServerAppConfig();
    case 2: 
      return app.getService().msfSub.syncGetServerCommonConfig();
    }
    return app.getService().msfSub.syncGetServerUserConfig(paramString);
  }
  
  public void onDestroy() {}
  
  public void report(byte paramByte, String paramString1, String paramString2)
  {
    NewIntent localNewIntent = new NewIntent(app.getApplication(), BuiltInServlet.class);
    localNewIntent.putExtra("action", 1012);
    localNewIntent.putExtra("type", paramByte);
    localNewIntent.putExtra("tag", paramString1);
    localNewIntent.putExtra("content", paramString2);
    withouLogin = true;
    app.startServlet(localNewIntent);
  }
}
