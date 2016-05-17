package com.tencent.common.app;

import com.tencent.av.app.VideoAppInterface;
import com.tencent.mobileqq.activity.QQMapActivity.MapRuntime;
import com.tencent.mobileqq.app.BrowserAppInterface;
import com.tencent.mobileqq.app.PeakAppInterface;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.NearbyAppInterface;
import com.tencent.mobileqq.pluginsdk.PluginRuntime;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qqconnect.wtlogin.OpenSDKAppInterface;
import cooperation.buscard.BuscardHelper;
import cooperation.comic.VipComicHelper;
import cooperation.dingdong.DingdongPluginHelper;
import cooperation.groupvideo.GroupVideoHelper;
import cooperation.huangye.HYHelper;
import cooperation.pluginbridge.BridgeHelper;
import cooperation.qlink.QlinkHelper;
import cooperation.qqdataline.DatalineHelper;
import cooperation.qqfav.QfavHelper;
import cooperation.qqhotspot.QQHotSpotAcitivtyHelper;
import cooperation.qqreader.QRBridgeUtil;
import cooperation.qqreader.QReaderHelper;
import cooperation.qqwifi.QQWiFiHelper;
import cooperation.qwallet.plugin.QWalletHelper;
import cooperation.qzone.QZoneHelper;
import cooperation.readinjoy.ReadInJoyHelper;
import cooperation.secmsg.SecMsgHelper;
import cooperation.smartdevice.SmartDevicePluginLoader;
import cooperation.thirdpay.ThirdPayManager;
import cooperation.troop.TroopPluginHelper;
import cooperation.troop_homework.TroopHomeworkHelper;
import cooperation.weiyun.WeiyunHelper;
import mqq.app.AppRuntime;

public class AppInterfaceFactory
{
  public AppInterfaceFactory()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static AppRuntime a(BaseApplicationImpl paramBaseApplicationImpl, String paramString)
  {
    Object localObject2 = null;
    String str = paramBaseApplicationImpl.getPackageName();
    Object localObject1;
    if (str.equals(paramString)) {
      localObject1 = new QQAppInterface(paramBaseApplicationImpl, paramString);
    }
    do
    {
      do
      {
        return localObject1;
        localObject1 = localObject2;
      } while (paramString.equals(str + ":msf"));
      localObject1 = localObject2;
    } while (paramString.equals(str + ":notifypush"));
    if (paramString.equals(str + ":video")) {
      return new VideoAppInterface(paramBaseApplicationImpl, "video");
    }
    if (paramString.equals(str + ":qzone")) {
      return QZoneHelper.a(paramBaseApplicationImpl, "qzone");
    }
    if (paramString.equals(str + ":qzonevideo")) {
      return QZoneHelper.b(paramBaseApplicationImpl, "qzonevideo");
    }
    if (paramString.equals(str + ":photoplus")) {
      return QZoneHelper.a(paramBaseApplicationImpl);
    }
    if (paramString.equals(str + ":web")) {
      return new BrowserAppInterface(paramBaseApplicationImpl, "web");
    }
    if (paramString.equals(str + ":openSdk")) {
      return new OpenSDKAppInterface(paramBaseApplicationImpl, "openSdk");
    }
    if (paramString.equals(str + ":photoedit"))
    {
      paramBaseApplicationImpl = new PluginRuntime();
      ReportController.a(paramBaseApplicationImpl);
      return paramBaseApplicationImpl;
    }
    if (paramString.equals(str + ":zebra")) {
      return new PluginRuntime();
    }
    if (paramString.equals(str + ":demoji"))
    {
      paramBaseApplicationImpl = new PluginRuntime();
      ReportController.a(paramBaseApplicationImpl);
      return paramBaseApplicationImpl;
    }
    if (paramString.equals(str + ":map")) {
      return new QQMapActivity.MapRuntime();
    }
    if (paramString.equals(str + ":weiyun"))
    {
      paramBaseApplicationImpl = WeiyunHelper.a(paramBaseApplicationImpl);
      ReportController.a(paramBaseApplicationImpl);
      return paramBaseApplicationImpl;
    }
    if (paramString.equals(str + ":secmsg"))
    {
      paramBaseApplicationImpl = SecMsgHelper.a(paramBaseApplicationImpl);
      ReportController.a(paramBaseApplicationImpl);
      return paramBaseApplicationImpl;
    }
    if (paramString.equals(str + ":comic")) {
      return VipComicHelper.a(paramBaseApplicationImpl, ":comic");
    }
    if (paramString.equals(str + ":qwallet"))
    {
      paramBaseApplicationImpl = QWalletHelper.a(paramBaseApplicationImpl, "qwallet");
      ReportController.a((PluginRuntime)paramBaseApplicationImpl);
      return paramBaseApplicationImpl;
    }
    if (paramString.equals(str + ":qqfav")) {
      return QfavHelper.a(paramBaseApplicationImpl);
    }
    if (paramString.equals(str + ":qqreader"))
    {
      paramBaseApplicationImpl = QReaderHelper.a(paramBaseApplicationImpl, ":qqreader");
      QRBridgeUtil.initRuntime(paramBaseApplicationImpl);
      return paramBaseApplicationImpl;
    }
    if (paramString.equals(str + ":qlink")) {
      return QlinkHelper.a(paramBaseApplicationImpl, "qlink");
    }
    if (paramString.equals(str + ":cardpay"))
    {
      paramString = new PluginRuntime();
      ReportController.a(paramString);
      paramBaseApplicationImpl = ThirdPayManager.a(paramBaseApplicationImpl, "cardpay");
      if (paramBaseApplicationImpl != null) {
        break label1416;
      }
      paramBaseApplicationImpl = paramString;
    }
    label1416:
    for (;;)
    {
      return paramBaseApplicationImpl;
      if (paramString.equals(str + ":peak")) {
        return new PeakAppInterface(paramBaseApplicationImpl, "peak");
      }
      if (paramString.equals(str + ":qqwifi"))
      {
        paramBaseApplicationImpl = QQWiFiHelper.a(paramBaseApplicationImpl, "qqwifi");
        ReportController.a((PluginRuntime)paramBaseApplicationImpl);
        return paramBaseApplicationImpl;
      }
      if (paramString.equals(str + ":qqwifiditu"))
      {
        paramBaseApplicationImpl = QQWiFiHelper.b(paramBaseApplicationImpl, "qqwifiditu");
        ReportController.a((PluginRuntime)paramBaseApplicationImpl);
        return paramBaseApplicationImpl;
      }
      if (paramString.equals(str + ":dataline")) {
        return DatalineHelper.a(paramBaseApplicationImpl, "dataline");
      }
      if (paramString.equals(str + ":huangye")) {
        return HYHelper.a(paramBaseApplicationImpl, "huangye");
      }
      if (paramString.equals(str + ":smartdevice")) {
        return SmartDevicePluginLoader.a(paramBaseApplicationImpl, "smartdevice");
      }
      if (paramString.equals(str + ":buscard"))
      {
        paramBaseApplicationImpl = BuscardHelper.a(paramBaseApplicationImpl, "buscard");
        ReportController.a((PluginRuntime)paramBaseApplicationImpl);
        return paramBaseApplicationImpl;
      }
      if (paramString.equals(str + ":readinjoy"))
      {
        paramBaseApplicationImpl = ReadInJoyHelper.a(paramBaseApplicationImpl, "readinjoy");
        ReportController.a((PluginRuntime)paramBaseApplicationImpl);
        return paramBaseApplicationImpl;
      }
      if (paramString.equals(str + ":troophomework"))
      {
        paramBaseApplicationImpl = TroopHomeworkHelper.a(paramBaseApplicationImpl, "troophomework");
        ReportController.a((PluginRuntime)paramBaseApplicationImpl);
        return paramBaseApplicationImpl;
      }
      if (paramString.equals(str + ":dingdong")) {
        return DingdongPluginHelper.a(paramBaseApplicationImpl, "dingdong");
      }
      if (paramString.equals(str + ":nearby")) {
        return new NearbyAppInterface(paramBaseApplicationImpl, paramString);
      }
      if (paramString.equals(str + ":qqhotspot"))
      {
        paramBaseApplicationImpl = QQHotSpotAcitivtyHelper.a(paramBaseApplicationImpl, "qqhotspot");
        ReportController.a((PluginRuntime)paramBaseApplicationImpl);
        return paramBaseApplicationImpl;
      }
      if (paramString.equals(str + ":troopmemcard"))
      {
        paramBaseApplicationImpl = TroopPluginHelper.a(paramBaseApplicationImpl, "troop_member_card_plugin.apk");
        ReportController.a((PluginRuntime)paramBaseApplicationImpl);
        return paramBaseApplicationImpl;
      }
      if (paramString.equals(str + ":troopmanage"))
      {
        paramBaseApplicationImpl = TroopPluginHelper.a(paramBaseApplicationImpl, "troop_manage_plugin.apk");
        ReportController.a((PluginRuntime)paramBaseApplicationImpl);
        return paramBaseApplicationImpl;
      }
      if (paramString.equals(str + ":pluginbridge"))
      {
        paramBaseApplicationImpl = BridgeHelper.a(paramBaseApplicationImpl, "pluginbridge");
        ReportController.a((PluginRuntime)paramBaseApplicationImpl);
        return paramBaseApplicationImpl;
      }
      if (paramString.equals(str + ":groupvideo")) {
        return GroupVideoHelper.a(paramBaseApplicationImpl, "groupvideo");
      }
      paramBaseApplicationImpl = new PluginRuntime();
      ReportController.a(paramBaseApplicationImpl);
      return paramBaseApplicationImpl;
    }
  }
}
