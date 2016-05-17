package com.tencent.mobileqq.app;

import QQService.TagInfo;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.ActivityManager.RunningTaskInfo;
import android.app.KeyguardManager;
import android.app.NotificationManager;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.os.SystemClock;
import android.os.Vibrator;
import android.preference.PreferenceManager;
import android.provider.Settings.System;
import android.speech.tts.TextToSpeech;
import android.support.v4.util.MQLruCache;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Pair;
import android.view.accessibility.AccessibilityManager;
import com.dataline.activities.LiteActivity;
import com.etrump.mixlayout.FontManager;
import com.tencent.arrange.op.ArrangeHandler;
import com.tencent.av.app.AvAddFriendService;
import com.tencent.av.app.PstnSessionInfo;
import com.tencent.av.gaudio.AVNotifyCenter;
import com.tencent.av.service.QQServiceForAV;
import com.tencent.av.utils.VideoC2CHandler;
import com.tencent.bitapp.BitAppManager;
import com.tencent.bitapp.BitAppMsg;
import com.tencent.bitapp.BitAppMsgFactory;
import com.tencent.biz.TroopRedpoint.TroopRedTouchHandler;
import com.tencent.biz.TroopRedpoint.TroopRedTouchManager;
import com.tencent.biz.addContactTroopView.AddContactTroopManage;
import com.tencent.biz.anonymous.AnonymousChatHelper;
import com.tencent.biz.anonymous.AnonymousChatHelper.AnonymousExtInfo;
import com.tencent.biz.bmqq.app.BmqqBusinessHandler;
import com.tencent.biz.pubaccount.PublicAccountManager;
import com.tencent.biz.pubaccount.ecshopassit.EcShopAssistantManager;
import com.tencent.biz.pubaccount.ecshopassit.EcShopHandler;
import com.tencent.biz.pubaccount.subscript.SubscriptHandler;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarAssistantManager;
import com.tencent.biz.pubaccount.util.PAReportManager;
import com.tencent.biz.pubaccount.util.PublicAccountConfigUtil;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.common.app.AppInterface;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.device.devicemgr.SmartDeviceProxyMgr;
import com.tencent.device.file.DeviceFileHandler;
import com.tencent.device.msg.data.DeviceMsgHandle;
import com.tencent.device.utils.SmartDeviceUtil;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.Conversation;
import com.tencent.mobileqq.activity.DialogActivity;
import com.tencent.mobileqq.activity.MainFragment;
import com.tencent.mobileqq.activity.NotifyPushSettingActivity;
import com.tencent.mobileqq.activity.QQBroadcastActivity;
import com.tencent.mobileqq.activity.SoundAndVibrateActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.SubAccountMessageActivity;
import com.tencent.mobileqq.activity.UserguideActivity;
import com.tencent.mobileqq.activity.VisitorsActivity;
import com.tencent.mobileqq.activity.activateFriend.ActivateFriendActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.FileTransferManager;
import com.tencent.mobileqq.activity.aio.MediaPlayerManager;
import com.tencent.mobileqq.activity.aio.XMLMessageUtils;
import com.tencent.mobileqq.activity.bless.BlessManager;
import com.tencent.mobileqq.activity.contact.newfriend.NewFriendActivity;
import com.tencent.mobileqq.activity.contact.troop.TroopActivity;
import com.tencent.mobileqq.activity.qqcard.QQCardManager;
import com.tencent.mobileqq.activity.qwallet.PasswdRedBagManager;
import com.tencent.mobileqq.activity.qwallet.PublicQuickPayManager;
import com.tencent.mobileqq.activity.qwallet.QWalletCommonManager;
import com.tencent.mobileqq.activity.qwallet.QWalletPushManager;
import com.tencent.mobileqq.activity.recent.RecentCallHandler;
import com.tencent.mobileqq.activity.recent.RecentUtil;
import com.tencent.mobileqq.activity.specialcare.QvipSpecialSoundManager;
import com.tencent.mobileqq.activity.weather.WeatherManager;
import com.tencent.mobileqq.app.activateFriends.ActivateFriendsManager;
import com.tencent.mobileqq.app.asyncdb.CacheManager;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.automator.StepFactory;
import com.tencent.mobileqq.app.fms.FullMessageSearchManager;
import com.tencent.mobileqq.app.lbs.LbsInfoMgr;
import com.tencent.mobileqq.app.message.ConversationFacade;
import com.tencent.mobileqq.app.message.MsgProxy;
import com.tencent.mobileqq.app.message.MsgProxyContainer;
import com.tencent.mobileqq.app.message.MsgProxyUtils;
import com.tencent.mobileqq.app.message.MultiMsgProxy;
import com.tencent.mobileqq.app.message.QQMessageFacade;
import com.tencent.mobileqq.app.message.QQMessageFacade.Message;
import com.tencent.mobileqq.app.message.SystemMessageProcessor;
import com.tencent.mobileqq.app.proxy.DataLineMsgProxy;
import com.tencent.mobileqq.app.proxy.FTSDBManager;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.app.readinjoy.ReadInJoyHandler;
import com.tencent.mobileqq.app.readinjoy.ReadInJoyManager;
import com.tencent.mobileqq.app.soso.SosoInterface;
import com.tencent.mobileqq.app.upgrade.UpgradeController;
import com.tencent.mobileqq.app.utils.DingdongPluginBizHandler;
import com.tencent.mobileqq.app.utils.HeavyTaskExecutor;
import com.tencent.mobileqq.app.utils.MessageRoamHandler;
import com.tencent.mobileqq.ark.ArkAppCenter;
import com.tencent.mobileqq.bubble.BubbleDiyHandler;
import com.tencent.mobileqq.bubble.BubbleManager;
import com.tencent.mobileqq.business.sougou.WordMatchManager;
import com.tencent.mobileqq.businessCard.BusinessCardManager;
import com.tencent.mobileqq.compatible.TempServlet;
import com.tencent.mobileqq.config.AboutConfig;
import com.tencent.mobileqq.config.Config;
import com.tencent.mobileqq.config.ResourcePluginListener;
import com.tencent.mobileqq.config.operation.QQOperateManager;
import com.tencent.mobileqq.config.struct.NearbyBannerManager;
import com.tencent.mobileqq.contactsync.ContactSyncManager;
import com.tencent.mobileqq.data.AppShareID;
import com.tencent.mobileqq.data.Card;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.MessageForApproval;
import com.tencent.mobileqq.data.MessageForGrayTips;
import com.tencent.mobileqq.data.MessageForPubAccount;
import com.tencent.mobileqq.data.MessageForQQWalletMsg;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.data.PAMessage;
import com.tencent.mobileqq.data.PAMessage.Item;
import com.tencent.mobileqq.data.QCallRecent;
import com.tencent.mobileqq.data.QQEntityManagerFactory;
import com.tencent.mobileqq.data.Setting;
import com.tencent.mobileqq.data.SigInfo;
import com.tencent.mobileqq.data.TagArrayByType;
import com.tencent.mobileqq.dating.DatingProxyManager;
import com.tencent.mobileqq.dating.MsgBoxListActivity;
import com.tencent.mobileqq.earlydownload.EarlyDownloadManager;
import com.tencent.mobileqq.emosm.EmosmUtils;
import com.tencent.mobileqq.emosm.favroaming.FavroamingManager;
import com.tencent.mobileqq.emosm.vipcomic.VipComicMqqHandler;
import com.tencent.mobileqq.emosm.vipcomic.VipComicMqqManager;
import com.tencent.mobileqq.emoticon.EmojiManager;
import com.tencent.mobileqq.equipmentlock.EquipLockWebImpl;
import com.tencent.mobileqq.filemanager.app.FileManagerEngine;
import com.tencent.mobileqq.filemanager.app.FileTransferHandler;
import com.tencent.mobileqq.filemanager.core.FileManagerDataCenter;
import com.tencent.mobileqq.filemanager.core.FileManagerNotifyCenter;
import com.tencent.mobileqq.filemanager.core.FileManagerRSCenter;
import com.tencent.mobileqq.filemanager.core.OnlineFileSessionCenter;
import com.tencent.mobileqq.filemanager.core.UniformDownloadMgr;
import com.tencent.mobileqq.filemanager.data.FileManagerProxy;
import com.tencent.mobileqq.filemanager.util.PrivacyInfoUtil;
import com.tencent.mobileqq.filemanager.util.UniformDownloadBPTransProxy;
import com.tencent.mobileqq.highway.HwEngine;
import com.tencent.mobileqq.highway.openup.SessionInfo;
import com.tencent.mobileqq.hitrate.PreloadProcHitMgr;
import com.tencent.mobileqq.hotchat.HotChatPKActivityManager;
import com.tencent.mobileqq.hotpatch.HotPatchManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.jumplightalk.CallRedDotLightalkLis;
import com.tencent.mobileqq.loginwelcome.LoginWelcomeHandler;
import com.tencent.mobileqq.loginwelcome.LoginWelcomeManager;
import com.tencent.mobileqq.magicface.drawable.PngFrameManager;
import com.tencent.mobileqq.managers.DiscussionMemberManager;
import com.tencent.mobileqq.managers.LoadingStateManager;
import com.tencent.mobileqq.managers.PullActiveManager;
import com.tencent.mobileqq.managers.QQLSRecentManager;
import com.tencent.mobileqq.managers.ShieldMsgManger;
import com.tencent.mobileqq.managers.TroopAssistantManager;
import com.tencent.mobileqq.memoryleak.LeakInspector;
import com.tencent.mobileqq.model.ChatBackgroundManager;
import com.tencent.mobileqq.model.QZoneManager;
import com.tencent.mobileqq.model.TroopInfoManager;
import com.tencent.mobileqq.msf.sdk.AppNetConnInfo;
import com.tencent.mobileqq.msf.sdk.SettingCloneUtil;
import com.tencent.mobileqq.mybusiness.MyBusinessManager;
import com.tencent.mobileqq.nearby.NearbyCardManager;
import com.tencent.mobileqq.nearby.NearbyProxy;
import com.tencent.mobileqq.nearby.NearbyRelevantHandler;
import com.tencent.mobileqq.nearby.business.NearbyCardHandler;
import com.tencent.mobileqq.od.ODProxy;
import com.tencent.mobileqq.openapi.OpenApiManager;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.phonecontact.ContactBindServlet;
import com.tencent.mobileqq.pic.PicPreDownloader;
import com.tencent.mobileqq.pic.PicStatisticsManager;
import com.tencent.mobileqq.pic.PresendPicMgr;
import com.tencent.mobileqq.pluginsdk.PluginManageHandler;
import com.tencent.mobileqq.pluginsdk.PluginManageHandler.IPluginManagerProvider;
import com.tencent.mobileqq.pluginsdk.RemotePluginManager.Stub;
import com.tencent.mobileqq.portal.PortalManager;
import com.tencent.mobileqq.profile.upload.task.VipImageUploadManager;
import com.tencent.mobileqq.ptt.PttConfigController;
import com.tencent.mobileqq.ptt.preop.PTTPreDownloader;
import com.tencent.mobileqq.ptt.preop.PttPreSendManager;
import com.tencent.mobileqq.qcall.LightalkShieldHandler;
import com.tencent.mobileqq.qcall.LightalkShieldManager;
import com.tencent.mobileqq.qcall.LightalkSwitchHanlder;
import com.tencent.mobileqq.qcall.LightalkSwitchManager;
import com.tencent.mobileqq.qcall.PstnHandler;
import com.tencent.mobileqq.qcall.PstnManager;
import com.tencent.mobileqq.qcall.QCallCardHandler;
import com.tencent.mobileqq.qcall.QCallCardManager;
import com.tencent.mobileqq.qcall.QCallFacade;
import com.tencent.mobileqq.qzonealbumreddot.QzoneAlbumRedTouchManager;
import com.tencent.mobileqq.qzonestatus.QzoneContactsFeedManager;
import com.tencent.mobileqq.redtouch.NumRedMsgManager;
import com.tencent.mobileqq.redtouch.NumRedPointManager;
import com.tencent.mobileqq.redtouch.RedTouchManager;
import com.tencent.mobileqq.richstatus.StatusManager;
import com.tencent.mobileqq.secspy.SecSpyFileManager;
import com.tencent.mobileqq.sensewhere.SenseWhereHandler;
import com.tencent.mobileqq.sensewhere.SenseWhereManager;
import com.tencent.mobileqq.service.MobileQQService;
import com.tencent.mobileqq.service.gamecenter.AppLaucherHelper;
import com.tencent.mobileqq.service.message.MessageCache;
import com.tencent.mobileqq.servlet.CliNotifyPush;
import com.tencent.mobileqq.servlet.GameCenterManagerImp;
import com.tencent.mobileqq.servlet.PushServlet;
import com.tencent.mobileqq.servlet.QZoneManagerImp;
import com.tencent.mobileqq.servlet.VideoConfigServlet;
import com.tencent.mobileqq.shortvideo.ShortVideoPreDownloader;
import com.tencent.mobileqq.startup.step.StartService;
import com.tencent.mobileqq.statistics.DAUStatistic;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.statistics.ReportControllerImpl;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.statistics.StatisticHitRateCollector;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.structmsg.StructMsgFactory;
import com.tencent.mobileqq.stt.SttManager;
import com.tencent.mobileqq.subaccount.SubAccountControll;
import com.tencent.mobileqq.subaccount.SubAccountProtocManager;
import com.tencent.mobileqq.subaccount.datamanager.SubAccountManager;
import com.tencent.mobileqq.systemmsg.FriendSystemMsgController;
import com.tencent.mobileqq.systemmsg.GroupSystemMsgController;
import com.tencent.mobileqq.systemmsg.SystemMsgController;
import com.tencent.mobileqq.text.QQText;
import com.tencent.mobileqq.theme.ThemeSwitchManager;
import com.tencent.mobileqq.theme.ThemeUtil;
import com.tencent.mobileqq.theme.ThemeUtil.ThemeInfo;
import com.tencent.mobileqq.transfile.FMTSrvAddrProvider;
import com.tencent.mobileqq.transfile.INetEngine;
import com.tencent.mobileqq.transfile.NetEngineFactory;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.mobileqq.troop.data.TroopCreateLogic;
import com.tencent.mobileqq.troop.org.data.TroopOrgDataManager;
import com.tencent.mobileqq.troop.org.pb.TroopOrgProtocolManager;
import com.tencent.mobileqq.troop.utils.TroopAioADManager;
import com.tencent.mobileqq.troop.utils.TroopAppMgr;
import com.tencent.mobileqq.troop.utils.TroopBindPublicAccountMgr;
import com.tencent.mobileqq.troop.utils.TroopFileUploadingManager;
import com.tencent.mobileqq.troop.utils.TroopGagMgr;
import com.tencent.mobileqq.troop.utils.TroopGiftManager;
import com.tencent.mobileqq.troop.utils.TroopTipsMsgMgr;
import com.tencent.mobileqq.troop.utils.TroopTopicMgr;
import com.tencent.mobileqq.troop.utils.TroopUtils;
import com.tencent.mobileqq.util.BitmapManager;
import com.tencent.mobileqq.util.BitmapManager.BitmapDecodeResult;
import com.tencent.mobileqq.util.FaceDecodeTask;
import com.tencent.mobileqq.util.IPCFaceHelper;
import com.tencent.mobileqq.util.NoDisturbUtil;
import com.tencent.mobileqq.util.ProfileCardUtil;
import com.tencent.mobileqq.util.SkinUtils;
import com.tencent.mobileqq.util.SystemUtil;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.ActionMsgUtil;
import com.tencent.mobileqq.utils.AppShareIDUtil;
import com.tencent.mobileqq.utils.AudioUtil;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.HexUtil;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.utils.PlistHandler;
import com.tencent.mobileqq.utils.QQUtils;
import com.tencent.mobileqq.utils.RoamSettingController;
import com.tencent.mobileqq.utils.SharedPreUtils;
import com.tencent.mobileqq.utils.StringUtil;
import com.tencent.mobileqq.vas.AvatarPendantManager;
import com.tencent.mobileqq.vas.ColorRingManager;
import com.tencent.mobileqq.vas.IndividuationManager;
import com.tencent.mobileqq.vas.VasExtensionHandler;
import com.tencent.mobileqq.vashealth.StepServiceAsync;
import com.tencent.mobileqq.vaswebviewplugin.ThemeUiPlugin;
import com.tencent.mobileqq.vip.DownloaderFactory;
import com.tencent.mobileqq.vipav.VipFunCallManager;
import com.tencent.mobileqq.vipav.VipSetFunCallHandler;
import com.tencent.mobileqq.vipgift.VipGiftManager;
import com.tencent.mobileqq.webprocess.WebAccelerateHelper;
import com.tencent.mobileqq.webprocess.WebProcessManager;
import com.tencent.mqq.shared_file_accessor.SharedPreferencesProxyManager;
import com.tencent.msfmqpsdkbridge.MSFNetTransportProvider;
import com.tencent.open.adapter.OpenAppClient;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.MD5;
import com.tencent.qphone.base.util.QLog;
import com.tencent.securemodule.impl.SecureModuleService;
import com.tencent.securemodule.service.CloudScanListener;
import com.tencent.securemodule.service.ISecureModuleService;
import com.tencent.securemodule.service.ProductInfo;
import com.tencent.util.BadgeUtils;
import com.tencent.util.MsgAutoMonitorUtil;
import com.weiyun.sdk.context.SdkContext;
import cooperation.comic.QQComicPreloadManager;
import cooperation.dingdong.DingdongPluginManager;
import cooperation.huangye.HuangyeHandler;
import cooperation.plugin.IPluginManager;
import cooperation.plugin.PluginManagerV2;
import cooperation.qlink.QQProxyForQlink;
import cooperation.qlink.QlinkReliableReport;
import cooperation.qlink.QlinkServiceManager;
import cooperation.qqfav.QfavHelper;
import cooperation.qqhotspot.hotspotnode.QQHotSpotListHandler;
import cooperation.qqhotspot.hotspotnode.ShowNodeTaskManager;
import cooperation.qqhotspot.ipc.QQHotSpotRemoteManager;
import cooperation.qqreader.QRProcessManager;
import cooperation.qwallet.plugin.QWalletHelper;
import cooperation.troop.TroopPluginManager;
import cooperation.weiyun.WeiyunHelper;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import mqq.app.AccountManagerImpl;
import mqq.app.AppRuntime.Status;
import mqq.app.Constants.PropertiesKey;
import mqq.app.MobileQQ;
import mqq.app.NewIntent;
import mqq.app.ProxyIpManagerImpl;
import mqq.app.TicketManagerImpl;
import mqq.app.WtloginManagerImpl;
import mqq.manager.Manager;
import mqq.manager.PushManager;
import mqq.manager.ServerConfigManager;
import mqq.manager.ServerConfigManager.ConfigType;
import mqq.manager.TicketManager;
import mqq.os.MqqHandler;
import ncz;
import nda;
import ndb;
import ndc;
import ndd;
import nde;
import ndf;
import ndg;
import ndh;
import ndi;
import ndj;
import ndk;
import ndm;
import ndn;
import ndo;
import ndp;
import ndq;
import ndr;
import nds;
import ndt;
import ndu;
import ndv;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;

public class QQAppInterface
  extends AppInterface
  implements PluginManageHandler.IPluginManagerProvider
{
  public static final int A = 34;
  public static final int B = 35;
  public static final int C = 36;
  public static final int D = 37;
  public static final int E = 38;
  public static final int F = 39;
  public static final int G = 40;
  public static final int H = 41;
  public static final int I = 42;
  public static final int J = 43;
  public static final int K = 44;
  public static final int L = 45;
  public static final int M = 46;
  public static final int N = 47;
  public static final int O = 48;
  public static final int P = 49;
  public static final int Q = 50;
  public static final int R = 51;
  public static final int S = 52;
  public static final int T = 53;
  public static final int U = 54;
  public static final int V = 55;
  public static final int W = 56;
  public static final int X = 57;
  public static final int Y = 58;
  public static final int Z = 59;
  public static final byte a = 1;
  public static final int a = 7;
  static final long jdField_a_of_type_Long = 2000L;
  private static final Bitmap.Config jdField_a_of_type_AndroidGraphicsBitmap$Config;
  private static TextToSpeech jdField_a_of_type_AndroidSpeechTtsTextToSpeech;
  public static final String a;
  private static final int[] jdField_a_of_type_ArrayOfInt;
  public static final long[] a;
  public static final int aA = 86;
  public static final int aB = 87;
  public static final int aC = 88;
  public static final int aD = 89;
  public static final int aE = 90;
  public static final int aF = 91;
  public static final int aG = 92;
  public static final int aH = 93;
  public static final int aI = 94;
  public static final int aJ = 95;
  public static final int aK = 96;
  public static final int aL = 97;
  public static final int aM = 98;
  public static final int aN = 99;
  public static final int aO = 100;
  public static final int aP = 101;
  public static final int aQ = 102;
  public static final int aR = 103;
  public static final int aS = 104;
  public static final int aT = 105;
  public static final int aU = 106;
  public static final int aV = 107;
  public static final int aW = 108;
  public static final int aX = 111;
  public static final int aY = 112;
  public static final int aZ = 113;
  public static final int aa = 60;
  public static final int ab = 61;
  public static final int ac = 62;
  public static final int ad = 63;
  public static final int ae = 64;
  public static final int af = 65;
  public static final int ag = 66;
  public static final int ah = 67;
  public static final int ai = 68;
  public static final int aj = 69;
  public static final int ak = 70;
  public static final int al = 71;
  public static final int am = 72;
  public static final int an = 73;
  public static final int ao = 74;
  public static final int ap = 75;
  public static final int aq = 76;
  public static final int ar = 77;
  public static final int as = 78;
  public static final int at = 79;
  public static final int au = 80;
  public static final int av = 81;
  public static final int aw = 82;
  public static final int ax = 83;
  public static final int ay = 84;
  public static final int az = 85;
  public static final byte b = 2;
  public static final int b = 9;
  public static final String b = "com.tencent.mobileqq.intent.logout";
  private static final long[] jdField_b_of_type_ArrayOfLong;
  public static final int bA = 140;
  public static final int bB = 141;
  public static final int bC = 142;
  public static final int bD = 143;
  public static final int bE = 144;
  public static final int bF = 145;
  public static final int bH = 0;
  public static final int bI = 1;
  public static final int bK = 1;
  public static final int bL = 2;
  public static final int bM = 3;
  public static final int bN = 0;
  public static final int bO = 1;
  public static final int bP = 2;
  public static final int bQ = 3;
  public static final int bR = 4;
  public static final int bS = 5;
  public static final int bT = 6;
  public static final int bU = 7;
  public static final int bV = 8;
  public static final int bW = 9;
  public static final int bX = 10;
  public static final int bY = 11;
  public static final int bZ = 12;
  public static final int ba = 114;
  public static final int bb = 115;
  public static final int bc = 116;
  public static final int bd = 117;
  public static final int be = 118;
  public static final int bf = 119;
  public static final int bg = 120;
  public static final int bh = 121;
  public static final int bi = 122;
  public static final int bj = 123;
  public static final int bk = 124;
  public static final int bl = 125;
  public static final int bm = 126;
  public static final int bn = 127;
  public static final int bo = 128;
  public static final int bp = 129;
  public static final int bq = 130;
  public static final int br = 131;
  public static final int bs = 132;
  public static final int bt = 133;
  public static final int bu = 134;
  public static final int bv = 135;
  public static final int bw = 136;
  public static final int bx = 137;
  public static final int by = 138;
  public static final int bz = 139;
  public static final byte c = 3;
  public static final int c = 10;
  private static final long jdField_c_of_type_Long = 86400000L;
  public static final String c = "Q.qqhead.qaif";
  public static boolean c = false;
  public static final int cA = 40;
  public static final int cB = 41;
  public static final int cC = 42;
  public static final int cD = 43;
  public static final int cE = 44;
  public static final int cF = 45;
  public static final int cG = 46;
  public static final int cH = 47;
  public static final int cI = 48;
  public static final int cJ = 49;
  public static final int cK = 50;
  public static final int cL = 51;
  public static final int cM = 52;
  public static final int cN = 54;
  public static final int cO = 55;
  public static final int cP = 56;
  public static final int cQ = 57;
  public static final int cR = 58;
  public static final int cS = 59;
  public static final int cT = 60;
  public static final int cU = 61;
  public static final int cV = 62;
  public static final int cW = 63;
  public static final int cX = 64;
  public static final int cY = 65;
  public static final int cZ = 66;
  public static final int ca = 13;
  public static final int cb = 14;
  public static final int cc = 15;
  public static final int cd = 16;
  public static final int ce = 17;
  public static final int cf = 18;
  public static final int cg = 19;
  public static final int ch = 20;
  public static final int ci = 21;
  public static final int cj = 22;
  public static final int ck = 23;
  public static final int cl = 24;
  public static final int cm = 25;
  public static final int cn = 26;
  public static final int co = 27;
  public static final int cp = 28;
  public static final int cq = 29;
  public static final int cr = 30;
  public static final int cs = 31;
  public static final int ct = 32;
  public static final int cu = 33;
  public static final int cv = 34;
  public static final int cw = 35;
  public static final int cx = 36;
  public static final int cy = 37;
  public static final int cz = 39;
  public static final byte d = 3;
  public static final int d = 11;
  private static final int dB = -56;
  private static final int dC = -55;
  private static final int dD = 146;
  private static final int dE = 3;
  private static final int dH = 85;
  private static final int dI = 0;
  public static final int da = 67;
  public static final int db = 68;
  public static final int dc = 69;
  public static final int dd = 70;
  public static final int de = 71;
  public static final int df = 72;
  public static final int dg = 73;
  public static final int dh = 74;
  public static final int di = 75;
  public static final int dj = 76;
  public static final int dk = 77;
  public static final int dl = 78;
  public static final int dm = 79;
  public static final int dn = 80;
  public static final int jdField_do = 81;
  public static final int dp = 82;
  public static final int dq = 83;
  public static final int dr = 84;
  public static final int ds = 3;
  public static int dv = 0;
  public static int dw = 0;
  public static final int dx = 3;
  public static final int dy = 2;
  public static final int dz = 1;
  public static final byte e = 1;
  public static final int e = 12;
  static final String jdField_e_of_type_JavaLangString = "clean_unread_feed_type";
  private static final byte jdField_f_of_type_Byte = 3;
  public static final int f = 13;
  public static final String f = "com.tencent.msg.newmessage";
  public static final int g = 14;
  private static final long jdField_g_of_type_Long = 7200000L;
  public static final String g = "round";
  public static final int h = 15;
  public static final String h = "B1_QQ_Neighbor_android";
  public static final int i = 16;
  public static final String i = "NzVK_qGE";
  public static final int j = 17;
  static final String j = "security_scan";
  public static final int k = 18;
  private static final String k = "Q.qqhead.broadcast";
  public static final int l = 19;
  private static final String jdField_l_of_type_JavaLangString = "com.tencent.qzone.cleanunreadcount";
  public static final int m = 20;
  private static final String jdField_m_of_type_JavaLangString = "com.tencent.qqhead.getheadreq";
  public static final int n = 21;
  private static final String n = "com.tencent.qqhead.getheadresp";
  public static final int o = 22;
  private static final String o = "com.tencent.mobileqq:video";
  public static final int p = 23;
  private static final String p = "notification";
  public static final int q = 24;
  public static final int r = 25;
  public static final int s = 26;
  public static final int t = 27;
  public static final int u = 28;
  public static final int v = 29;
  public static final int w = 30;
  public static final int x = 31;
  public static final int y = 32;
  public static final int z = 33;
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver = new ndk(this);
  public Intent a;
  SharedPreferences jdField_a_of_type_AndroidContentSharedPreferences = null;
  public Handler a;
  private MQLruCache jdField_a_of_type_AndroidSupportV4UtilMQLruCache = BaseApplicationImpl.jdField_a_of_type_AndroidSupportV4UtilMQLruCache;
  private AvAddFriendService jdField_a_of_type_ComTencentAvAppAvAddFriendService;
  private AVNotifyCenter jdField_a_of_type_ComTencentAvGaudioAVNotifyCenter;
  private QvipSpecialSoundManager jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager = null;
  private CallTabUnreadListener jdField_a_of_type_ComTencentMobileqqAppCallTabUnreadListener = null;
  private CheckPttListener jdField_a_of_type_ComTencentMobileqqAppCheckPttListener;
  private FriendListObserver jdField_a_of_type_ComTencentMobileqqAppFriendListObserver = new ndq(this);
  private HotChatManager jdField_a_of_type_ComTencentMobileqqAppHotChatManager = null;
  public LebaHelper a;
  private MessageHandler jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
  private MsgTabUnreadListener jdField_a_of_type_ComTencentMobileqqAppMsgTabUnreadListener = null;
  private QQGAudioMsgHandler jdField_a_of_type_ComTencentMobileqqAppQQGAudioMsgHandler;
  private CacheManager jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheManager;
  public Automator a;
  volatile ConversationFacade jdField_a_of_type_ComTencentMobileqqAppMessageConversationFacade;
  public volatile QQMessageFacade a;
  private FTSDBManager jdField_a_of_type_ComTencentMobileqqAppProxyFTSDBManager;
  private ProxyManager jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager;
  public AboutConfig a;
  private Config jdField_a_of_type_ComTencentMobileqqConfigConfig;
  private QQEntityManagerFactory jdField_a_of_type_ComTencentMobileqqDataQQEntityManagerFactory;
  private SigInfo jdField_a_of_type_ComTencentMobileqqDataSigInfo;
  private FileManagerEngine jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileManagerEngine;
  private FileTransferHandler jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferHandler;
  private FileManagerDataCenter jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerDataCenter;
  private FileManagerNotifyCenter jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerNotifyCenter;
  private FileManagerRSCenter jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerRSCenter;
  private OnlineFileSessionCenter jdField_a_of_type_ComTencentMobileqqFilemanagerCoreOnlineFileSessionCenter;
  private PrivacyInfoUtil jdField_a_of_type_ComTencentMobileqqFilemanagerUtilPrivacyInfoUtil;
  private CallRedDotLightalkLis jdField_a_of_type_ComTencentMobileqqJumplightalkCallRedDotLightalkLis = null;
  private EntityManager jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager;
  private PicPreDownloader jdField_a_of_type_ComTencentMobileqqPicPicPreDownloader;
  volatile QCallFacade jdField_a_of_type_ComTencentMobileqqQcallQCallFacade;
  public MobileQQService a;
  private MessageCache jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache;
  private ShortVideoPreDownloader jdField_a_of_type_ComTencentMobileqqShortvideoShortVideoPreDownloader;
  private ReportController jdField_a_of_type_ComTencentMobileqqStatisticsReportController;
  private NetEngineFactory jdField_a_of_type_ComTencentMobileqqTransfileNetEngineFactory;
  private TransFileController jdField_a_of_type_ComTencentMobileqqTransfileTransFileController;
  private CloudScanListener jdField_a_of_type_ComTencentSecuremoduleServiceCloudScanListener;
  private ISecureModuleService jdField_a_of_type_ComTencentSecuremoduleServiceISecureModuleService;
  private QQProxyForQlink jdField_a_of_type_CooperationQlinkQQProxyForQlink;
  private QlinkServiceManager jdField_a_of_type_CooperationQlinkQlinkServiceManager;
  private Object jdField_a_of_type_JavaLangObject = new Object();
  public ArrayList a;
  private HashMap jdField_a_of_type_JavaUtilHashMap;
  private Hashtable jdField_a_of_type_JavaUtilHashtable = new Hashtable();
  List jdField_a_of_type_JavaUtilList = new Vector();
  public Set a;
  ndu jdField_a_of_type_Ndu = null;
  public boolean a;
  private volatile byte[] jdField_a_of_type_ArrayOfByte = new byte[2];
  private BusinessHandler[] jdField_a_of_type_ArrayOfComTencentMobileqqAppBusinessHandler = new BusinessHandler[85];
  private Manager[] jdField_a_of_type_ArrayOfMqqManagerManager = new Manager[''];
  public long b;
  private BroadcastReceiver jdField_b_of_type_AndroidContentBroadcastReceiver = new ndp(this);
  private Intent jdField_b_of_type_AndroidContentIntent = null;
  private Handler jdField_b_of_type_AndroidOsHandler = new ndn(this, ThreadManager.b());
  private Object jdField_b_of_type_JavaLangObject = new Object();
  private ArrayList jdField_b_of_type_JavaUtilArrayList = new ArrayList();
  private HashMap jdField_b_of_type_JavaUtilHashMap = new HashMap();
  private Hashtable jdField_b_of_type_JavaUtilHashtable = new Hashtable();
  List jdField_b_of_type_JavaUtilList = new Vector();
  private ConcurrentHashMap jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap(4);
  boolean jdField_b_of_type_Boolean = false;
  public int bG;
  public int bJ = 0;
  private BroadcastReceiver jdField_c_of_type_AndroidContentBroadcastReceiver = new ndi(this);
  private ArrayList jdField_c_of_type_JavaUtilArrayList = new ArrayList();
  List jdField_c_of_type_JavaUtilList = new Vector();
  private ConcurrentHashMap jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap(4);
  private volatile long[] jdField_c_of_type_ArrayOfLong = new long[2];
  private long jdField_d_of_type_Long = 31L;
  private List jdField_d_of_type_JavaUtilList = new ArrayList();
  public boolean d;
  public int dA = -1;
  private final int dF = 990;
  private final int dG = 991;
  public int dt;
  public int du;
  private long jdField_e_of_type_Long = -1L;
  public boolean e;
  private long jdField_f_of_type_Long = 0L;
  public boolean f;
  boolean jdField_g_of_type_Boolean;
  public boolean h = true;
  public volatile boolean i = false;
  public boolean j = false;
  public boolean k = true;
  private boolean jdField_l_of_type_Boolean;
  private volatile boolean jdField_m_of_type_Boolean;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    if (!"Success".equals(BaseApplicationImpl.sInjectResult))
    {
      String str = "sInjectResult:" + BaseApplicationImpl.sInjectResult;
      try
      {
        throw new IllegalAccessError("QQAppInterface escapes!");
      }
      catch (Throwable localThrowable)
      {
        BaseApplicationImpl.jdField_a_of_type_JavaLangString = str + "\n" + QLog.getStackTraceString(localThrowable);
        QLog.e("DexLoad", 1, "QQAppInterface escapes!");
      }
    }
    for (;;)
    {
      jdField_a_of_type_JavaLangString = QQAppInterface.class.getSimpleName();
      jdField_a_of_type_AndroidGraphicsBitmap$Config = Bitmap.Config.ARGB_8888;
      jdField_b_of_type_ArrayOfLong = new long[] { 100L, 200L, 200L, 100L };
      jdField_a_of_type_ArrayOfLong = new long[] { 100L, 400L, 100L, 400L, 100L, 400L };
      jdField_c_of_type_Boolean = false;
      jdField_a_of_type_ArrayOfInt = new int[] { 17, 18, 19, 28, 27, 25, 26, 41, 47 };
      dv = 300000;
      dw = 30000;
      return;
      BaseApplicationImpl.jdField_a_of_type_JavaLangString = "";
    }
  }
  
  public QQAppInterface(BaseApplicationImpl paramBaseApplicationImpl, String paramString)
  {
    super(paramBaseApplicationImpl, paramString);
    l = false;
    jdField_a_of_type_AndroidContentIntent = null;
    jdField_d_of_type_Boolean = true;
    m = false;
    jdField_e_of_type_Boolean = false;
    jdField_f_of_type_Boolean = false;
    jdField_a_of_type_JavaUtilSet = new HashSet();
    jdField_b_of_type_Long = 0L;
    jdField_a_of_type_AndroidOsHandler = new ndg(this, Looper.getMainLooper());
  }
  
  private void K()
  {
    if (BaseApplicationImpl.jdField_a_of_type_AndroidSupportV4UtilMQLruCache != null)
    {
      int i1 = BaseApplicationImpl.jdField_a_of_type_AndroidSupportV4UtilMQLruCache.size() * 3 / 4;
      BaseApplicationImpl.jdField_a_of_type_AndroidSupportV4UtilMQLruCache.trimToSize(i1);
    }
  }
  
  private void L()
  {
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("mqq.intent.action.ACCOUNT_CHANGED");
    localIntentFilter.addAction("mqq.intent.action.ACCOUNT_KICKED");
    localIntentFilter.addAction("mqq.intent.action.ACCOUNT_EXPIRED");
    localIntentFilter.addAction("mqq.intent.action.FORCE_LOGOUT");
    localIntentFilter.addAction("mqq.intent.action.LOGOUT");
    localIntentFilter.addAction("mqq.intent.action.EXIT_" + BaseApplicationImpl.a().getPackageName());
    jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.registerReceiver(jdField_b_of_type_AndroidContentBroadcastReceiver, localIntentFilter);
  }
  
  private void M()
  {
    if (i) {
      return;
    }
    i = true;
    com.tencent.mobileqq.utils.fts.SQLiteFTSUtils.jdField_a_of_type_Boolean = false;
    if (GuardManager.a != null) {
      GuardManager.a.a(false);
    }
    synchronized (jdField_a_of_type_JavaUtilList)
    {
      jdField_a_of_type_JavaUtilList.clear();
      synchronized (jdField_b_of_type_JavaUtilList)
      {
        jdField_b_of_type_JavaUtilList.clear();
        synchronized (jdField_c_of_type_JavaUtilList)
        {
          jdField_c_of_type_JavaUtilList.clear();
          jdField_a_of_type_ComTencentMobileqqServiceMobileQQService.c();
          jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.g();
          HeavyTaskExecutor.a(new nds(this));
        }
      }
    }
    synchronized (jdField_a_of_type_ArrayOfComTencentMobileqqAppBusinessHandler)
    {
      BusinessHandler[] arrayOfBusinessHandler = jdField_a_of_type_ArrayOfComTencentMobileqqAppBusinessHandler;
      int i2 = arrayOfBusinessHandler.length;
      int i1 = 0;
      while (i1 < i2)
      {
        BusinessHandler localBusinessHandler = arrayOfBusinessHandler[i1];
        if (localBusinessHandler != null) {
          localBusinessHandler.g();
        }
        i1 += 1;
        continue;
        localObject2 = finally;
        throw localObject2;
        localObject3 = finally;
        throw localObject3;
        localObject4 = finally;
        throw localObject4;
      }
      if (jdField_a_of_type_ComTencentSecuremoduleServiceCloudScanListener != null) {
        a().unregisterCloudScanListener(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getBaseContext(), jdField_a_of_type_ComTencentSecuremoduleServiceCloudScanListener);
      }
      VideoBroadcastReceiver.a();
      if (jdField_a_of_type_AndroidSupportV4UtilMQLruCache != null) {
        jdField_a_of_type_AndroidSupportV4UtilMQLruCache.evictAll();
      }
      FaceDecodeTask.b();
      jdField_b_of_type_AndroidOsHandler.removeCallbacksAndMessages(null);
      if (jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileManagerEngine != null) {
        jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileManagerEngine.f();
      }
      WeiyunHelper.a();
      ThemeSwitchManager.c();
      SosoInterface.a();
      EquipLockWebImpl.a().a();
      PluginManageHandler.getInstance().setPluginManagerProvider(null, false);
      SessionInfo.clearOldSession();
      StepServiceAsync.c();
      PublicAccountUtil.b();
      return;
    }
  }
  
  private void N()
  {
    Object localObject = (SubAccountManager)getManager(60);
    if (localObject != null) {}
    for (localObject = ((SubAccountManager)localObject).a();; localObject = null)
    {
      if ((localObject == null) || (((ArrayList)localObject).size() == 0)) {
        return;
      }
      SubAccountControll.a(this, (byte)0, (ArrayList)localObject);
      return;
    }
  }
  
  private void O()
  {
    if (jdField_a_of_type_ComTencentMobileqqConfigAboutConfig == null)
    {
      jdField_a_of_type_ComTencentMobileqqConfigAboutConfig = new AboutConfig(this);
      jdField_a_of_type_ComTencentMobileqqConfigAboutConfig.a();
    }
  }
  
  private void P()
  {
    boolean bool = true;
    if (dA != -1) {}
    do
    {
      return;
      localObject2 = SettingCloneUtil.readValue(getApplication(), a(), null, "qqsetting_calltab_show_key", "0111100");
      if ((localObject2 != null) && (((String)localObject2).length() <= "0111100".length())) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.e(jdField_a_of_type_JavaLangString, 2, "isCallTabShow fullVal is null");
    return;
    Object localObject1 = localObject2;
    if (((String)localObject2).length() < "0111100".length()) {
      localObject1 = (String)localObject2 + "0111100".substring(((String)localObject2).length());
    }
    Object localObject2 = ((String)localObject1).toCharArray();
    localObject1 = new StringBuilder((String)localObject1);
    char c1 = localObject2[5];
    char c3 = localObject2[6];
    char c4;
    if (c1 != c3)
    {
      ((StringBuilder)localObject1).setCharAt(6, c1);
      c3 = '\001';
      c4 = c1;
    }
    for (;;)
    {
      if (c4 == '0')
      {
        dA = 0;
        if (QLog.isColorLevel()) {
          QLog.i(jdField_a_of_type_JavaLangString, 2, "uin:" + a() + ",isCallTabShow mIsCallTabShow=" + dA);
        }
        if (dA == 0) {
          bool = false;
        }
        k = bool;
        MainFragment.a(k);
        if (c3 == 0) {
          break;
        }
        ThreadManager.a(new ndm(this, (StringBuilder)localObject1), 8, null, false);
        return;
      }
      if (localObject2[0] == '1')
      {
        c5 = localObject2[3];
        c1 = localObject2[4];
        if (c1 == '0')
        {
          c4 = '\000';
          label299:
          dA = c4;
          if (c5 == c1) {
            break label417;
          }
          ((StringBuilder)localObject1).setCharAt(3, c1);
          c3 = '\001';
        }
      }
      label417:
      for (;;)
      {
        break;
        c4 = '\001';
        break label299;
        c1 = localObject2[1];
        c5 = localObject2[2];
        char c2 = localObject2[3];
        char c6 = localObject2[4];
        if (c1 == '0') {
          c4 = '\000';
        }
        for (;;)
        {
          dA = c4;
          if (c2 != c6)
          {
            ((StringBuilder)localObject1).setCharAt(4, c2);
            c3 = '\001';
          }
          if (c1 == c5) {
            break;
          }
          ((StringBuilder)localObject1).setCharAt(2, c1);
          c3 = '\001';
          break;
          if (c2 == '0') {
            c4 = '\000';
          } else {
            c4 = '\001';
          }
        }
      }
      char c5 = '\000';
      c4 = c3;
      c3 = c5;
    }
  }
  
  private Intent a(Context paramContext, QQMessageFacade.Message paramMessage, int paramInt)
  {
    paramMessage = frienduin;
    int i1 = paramInt;
    if (paramInt == 1026) {
      i1 = 1;
    }
    Object localObject2;
    if (String.valueOf(AppConstants.aq).equals(paramMessage))
    {
      localObject2 = paramContext.getString(2131371502);
      localObject1 = new Intent(paramContext, MsgBoxListActivity.class);
      ((Intent)localObject1).putExtra("uin", paramMessage);
      ((Intent)localObject1).putExtra("uintype", 1001);
      paramContext = (Context)localObject2;
      paramMessage = (QQMessageFacade.Message)localObject1;
    }
    for (;;)
    {
      paramMessage.putExtra("uinname", paramContext);
      return paramMessage;
      if (String.valueOf(AppConstants.au).equals(paramMessage))
      {
        localObject1 = paramContext.getString(2131368846);
        paramMessage = new Intent(paramContext, NewFriendActivity.class);
        paramMessage.putExtra("_key_mode", 3);
        paramContext = (Context)localObject1;
      }
      else if (String.valueOf(AppConstants.av).equals(paramMessage))
      {
        localObject1 = paramContext.getString(2131368846);
        paramMessage = new Intent(paramContext, TroopActivity.class);
        paramMessage.putExtra("_key_mode", 0);
        paramMessage.putExtra("key_tab_mode", 2);
        paramContext = (Context)localObject1;
      }
      else if (String.valueOf(AppConstants.ar).equals(paramMessage))
      {
        paramMessage = new Intent(paramContext, QQBroadcastActivity.class);
        paramContext = paramContext.getString(2131368844);
      }
      else if (String.valueOf(AppConstants.an).equals(paramMessage))
      {
        localObject1 = paramContext.getString(2131368846);
        paramMessage = new Intent(paramContext, VisitorsActivity.class);
        paramMessage.putExtra("votersOnly", true);
        paramMessage.putExtra("toUin", Long.valueOf(a()));
        paramContext = (Context)localObject1;
      }
      else if (String.valueOf(AppConstants.ai).equals(paramMessage))
      {
        paramMessage = new Intent(paramContext, LiteActivity.class);
        paramMessage.putExtra("targetUin", AppConstants.ai);
        paramContext = paramContext.getString(2131362096);
      }
      else if (String.valueOf(AppConstants.aj).equals(paramMessage))
      {
        paramMessage = new Intent(paramContext, LiteActivity.class);
        paramMessage.putExtra("targetUin", AppConstants.aj);
        paramContext = paramContext.getString(2131362097);
      }
      else
      {
        if (!String.valueOf(9973L).equals(paramMessage)) {
          break;
        }
        paramMessage = new Intent(paramContext, ActivateFriendActivity.class);
        paramContext = paramContext.getString(2131371024);
        paramMessage.setFlags(67108864);
        paramMessage.putExtra("af_key_from", 4);
      }
    }
    Object localObject1 = new Intent(paramContext, SplashActivity.class);
    String str;
    if (i1 == 7000)
    {
      str = paramContext.getString(2131370129);
      ((Intent)localObject1).setClass(paramContext, SubAccountMessageActivity.class);
      ((Intent)localObject1).putExtra("subAccount", paramMessage);
      paramContext = (SubAccountManager)getManager(60);
      if (paramContext == null) {
        break label865;
      }
    }
    label865:
    for (paramContext = paramContext.c(paramMessage);; paramContext = paramMessage)
    {
      ((Intent)localObject1).putExtra("subAccountLatestNick", paramContext);
      ((Intent)localObject1).putExtra("finishAIO", true);
      localObject2 = localObject1;
      paramContext = str;
      localObject1 = paramMessage;
      paramMessage = (QQMessageFacade.Message)localObject2;
      for (;;)
      {
        paramMessage.putExtra("uin", (String)localObject1);
        paramMessage.putExtra("uintype", i1);
        paramMessage = AIOUtils.a(paramMessage, new int[] { 2 });
        paramMessage.setAction("com.tencent.mobileqq.action.MAINACTIVITY");
        break;
        if (i1 == 1009)
        {
          paramContext = paramContext.getString(2131368017);
          localObject2 = paramMessage;
          paramMessage = (QQMessageFacade.Message)localObject1;
          localObject1 = localObject2;
        }
        else if (String.valueOf(1787740092L).equals(paramMessage))
        {
          paramContext = paramContext.getString(2131370107);
          localObject2 = paramMessage;
          paramMessage = (QQMessageFacade.Message)localObject1;
          localObject1 = localObject2;
        }
        else if (i1 == 1024)
        {
          ((Intent)localObject1).setClass(paramContext, SplashActivity.class);
          ((Intent)localObject1).putExtra("chat_subType", 1);
          paramContext = ContactUtils.b(this, paramMessage, i1);
          localObject2 = paramMessage;
          paramMessage = (QQMessageFacade.Message)localObject1;
          localObject1 = localObject2;
        }
        else if (i1 == 1010)
        {
          localObject1 = paramContext.getString(2131371430);
          paramMessage = new Intent(paramContext, MsgBoxListActivity.class);
          localObject2 = AppConstants.aG;
          paramContext = (Context)localObject1;
          localObject1 = localObject2;
        }
        else if (i1 == 1001)
        {
          localObject1 = paramContext.getString(2131371502);
          paramMessage = new Intent(paramContext, MsgBoxListActivity.class);
          localObject2 = AppConstants.aq;
          paramContext = (Context)localObject1;
          localObject1 = localObject2;
        }
        else
        {
          if (i1 == 9501)
          {
            paramContext = ((SmartDeviceProxyMgr)a(51)).a(Long.parseLong(paramMessage));
            if (paramContext != null) {}
            for (paramContext = SmartDeviceUtil.a(paramContext);; paramContext = paramMessage)
            {
              localObject2 = paramMessage;
              paramMessage = (QQMessageFacade.Message)localObject1;
              localObject1 = localObject2;
              break;
            }
          }
          paramContext = ContactUtils.b(this, paramMessage, i1);
          localObject2 = paramMessage;
          paramMessage = (QQMessageFacade.Message)localObject1;
          localObject1 = localObject2;
        }
      }
    }
  }
  
  private Intent a(Context paramContext, String paramString, int paramInt)
  {
    if (String.valueOf(AppConstants.aq).equals(paramString))
    {
      localObject = paramContext.getString(2131368009);
      paramContext = new Intent(paramContext, MsgBoxListActivity.class);
      paramContext.putExtra("uin", paramString);
      paramContext.putExtra("uintype", 1001);
    }
    for (;;)
    {
      paramContext.putExtra("uinname", (String)localObject);
      return paramContext;
      if (String.valueOf(AppConstants.au).equals(paramString))
      {
        localObject = paramContext.getString(2131368846);
        paramContext = new Intent(paramContext, NewFriendActivity.class);
        paramContext.putExtra("_key_mode", 3);
      }
      else if (String.valueOf(AppConstants.av).equals(paramString))
      {
        localObject = paramContext.getString(2131368846);
        paramContext = new Intent(paramContext, TroopActivity.class);
        paramContext.putExtra("_key_mode", 0);
        paramContext.putExtra("key_tab_mode", 2);
      }
      else if (String.valueOf(AppConstants.ar).equals(paramString))
      {
        paramString = new Intent(paramContext, QQBroadcastActivity.class);
        localObject = paramContext.getString(2131368844);
        paramContext = paramString;
      }
      else if (String.valueOf(AppConstants.an).equals(paramString))
      {
        localObject = paramContext.getString(2131368846);
        paramContext = new Intent(paramContext, VisitorsActivity.class);
        paramContext.putExtra("votersOnly", true);
        paramContext.putExtra("toUin", Long.valueOf(a()));
      }
      else if (String.valueOf(AppConstants.ai).equals(paramString))
      {
        paramString = new Intent(paramContext, LiteActivity.class);
        paramString.putExtra("targetUin", AppConstants.ai);
        localObject = paramContext.getString(2131362096);
        paramContext = paramString;
      }
      else
      {
        if (!String.valueOf(AppConstants.aj).equals(paramString)) {
          break;
        }
        paramString = new Intent(paramContext, LiteActivity.class);
        paramString.putExtra("targetUin", AppConstants.aj);
        localObject = paramContext.getString(2131362097);
        paramContext = paramString;
      }
    }
    Object localObject = new Intent(a(), SplashActivity.class);
    ((Intent)localObject).putExtra("tab_index", MainFragment.a);
    ((Intent)localObject).putExtra("conversation_index", 1);
    ((Intent)localObject).setFlags(335544320);
    String str;
    if (paramInt == 7000)
    {
      str = paramContext.getString(2131370129);
      ((Intent)localObject).setClass(paramContext, SubAccountMessageActivity.class);
      ((Intent)localObject).putExtra("subAccount", paramString);
      paramContext = (SubAccountManager)getManager(60);
      if (paramContext == null) {
        break label708;
      }
    }
    label708:
    for (paramContext = paramContext.c(paramString);; paramContext = paramString)
    {
      ((Intent)localObject).putExtra("subAccountLatestNick", paramContext);
      ((Intent)localObject).putExtra("finishAIO", true);
      paramContext = (Context)localObject;
      localObject = str;
      for (;;)
      {
        paramContext.putExtra("uin", paramString);
        paramContext.putExtra("uintype", paramInt);
        break;
        if (paramInt == 1009)
        {
          str = paramContext.getString(2131368017);
          paramContext = (Context)localObject;
          localObject = str;
        }
        else if (String.valueOf(1787740092L).equals(paramString))
        {
          str = paramContext.getString(2131370107);
          paramContext = (Context)localObject;
          localObject = str;
        }
        else if (paramInt == 1024)
        {
          ((Intent)localObject).setClass(paramContext, SplashActivity.class);
          paramContext = AIOUtils.a((Intent)localObject, null);
          paramContext.putExtra("chat_subType", 1);
          localObject = ContactUtils.b(this, paramString, paramInt);
        }
        else if (paramInt == 1010)
        {
          localObject = paramContext.getString(2131371430);
          paramContext = new Intent(paramContext, MsgBoxListActivity.class);
          paramString = AppConstants.aG;
        }
        else if (paramInt == 1001)
        {
          localObject = paramContext.getString(2131371502);
          paramContext = new Intent(paramContext, MsgBoxListActivity.class);
          paramString = AppConstants.aq;
        }
        else
        {
          str = ContactUtils.b(this, paramString, paramInt);
          paramContext = (Context)localObject;
          localObject = str;
        }
      }
    }
  }
  
  private SharedPreferences a()
  {
    if (jdField_a_of_type_AndroidContentSharedPreferences == null) {
      jdField_a_of_type_AndroidContentSharedPreferences = PreferenceManager.getDefaultSharedPreferences(a());
    }
    return jdField_a_of_type_AndroidContentSharedPreferences;
  }
  
  private Drawable a(String paramString, boolean paramBoolean, byte paramByte)
  {
    Object localObject = a(1, paramString, paramByte, true, 0);
    if ((localObject != null) && (paramBoolean)) {
      localObject = ImageUtil.a((Bitmap)localObject);
    }
    for (;;)
    {
      paramString = null;
      if (localObject != null) {
        paramString = new BitmapDrawable((Bitmap)localObject);
      }
      localObject = paramString;
      if (paramString == null) {
        localObject = ImageUtil.b();
      }
      return localObject;
    }
  }
  
  private SQLiteOpenHelper a()
  {
    if (!a().equals("0")) {
      return a().build(a());
    }
    return null;
  }
  
  private SQLiteOpenHelper a(String paramString)
  {
    return a(paramString).build(paramString);
  }
  
  private String a(QQMessageFacade.Message paramMessage)
  {
    switch (bizType)
    {
    case 3: 
    case 4: 
    case 5: 
    case 7: 
    case 9: 
    default: 
      return "";
    case 8: 
      if (msgtype == 63511)
      {
        if (MessageForQQWalletMsg.isRedPacketMsg(a().b(frienduin, 1, uniseq))) {
          return a().getString(2131371660);
        }
        return a().getString(2131367136);
      }
      return a().getString(2131367136);
    case 11: 
      return a().getString(2131364482);
    case 6: 
      return a().getString(2131364483);
    case 2: 
      return a().getString(2131365028);
    case 10: 
      return a().getString(2131364495);
    }
    return a().getString(2131364496);
  }
  
  private String a(QQMessageFacade.Message paramMessage, boolean paramBoolean)
  {
    Object localObject2;
    if ((istroop == 1000) || (istroop == 1020))
    {
      localObject1 = ContactUtils.d(this, frienduin, senderuin);
      if (!TextUtils.isEmpty((CharSequence)localObject1))
      {
        localObject2 = localObject1;
        if (!((String)localObject1).equals(frienduin)) {}
      }
      else
      {
        localObject2 = ((FriendsManager)getManager(50)).c(frienduin);
        if (localObject2 != null) {
          if (TextUtils.isEmpty(remark)) {
            break label262;
          }
        }
      }
    }
    label262:
    for (Object localObject1 = remark;; localObject1 = name)
    {
      localObject2 = localObject1;
      if (paramBoolean) {
        if (!TextUtils.isEmpty((CharSequence)localObject1))
        {
          localObject2 = localObject1;
          if (!((String)localObject1).equals(frienduin)) {}
        }
        else
        {
          localObject2 = localObject1;
          if (!jdField_a_of_type_JavaUtilSet.contains(frienduin))
          {
            jdField_a_of_type_JavaUtilSet.add(frienduin);
            localObject2 = (FriendListHandler)a(1);
            a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
            if (QLog.isColorLevel()) {
              QLog.d(jdField_a_of_type_JavaLangString + "_friendListObserver", 2, "addObserver");
            }
            ((FriendListHandler)localObject2).b(frienduin);
            localObject2 = localObject1;
          }
        }
      }
      if (localObject2 != null)
      {
        localObject1 = localObject2;
        if (!"".equals(localObject2)) {}
      }
      else
      {
        localObject1 = frienduin;
      }
      return localObject1;
      localObject1 = ContactUtils.c(this, senderuin, frienduin);
      break;
    }
  }
  
  public static String a(String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder(256);
    if (SystemUtil.a()) {
      localStringBuilder.append(AppConstants.bz);
    }
    for (;;)
    {
      String str = MD5.toMD5(paramString);
      str = MD5.toMD5(str + paramString);
      localStringBuilder.append(MD5.toMD5(str + paramString));
      localStringBuilder.append(".png");
      return localStringBuilder.toString();
      localStringBuilder.append(SystemUtil.b + "head/_hd/");
    }
  }
  
  private String a(String paramString1, String paramString2, int paramInt, boolean paramBoolean)
  {
    Object localObject;
    if ((paramInt == 1000) || (paramInt == 1020))
    {
      paramString2 = ContactUtils.d(this, paramString1, paramString2);
      if (!TextUtils.isEmpty(paramString2))
      {
        localObject = paramString2;
        if (!paramString2.equals(paramString1)) {}
      }
      else
      {
        localObject = ((FriendsManager)getManager(50)).c(paramString1);
        if (localObject != null) {
          if (TextUtils.isEmpty(remark)) {
            break label219;
          }
        }
      }
    }
    label219:
    for (paramString2 = remark;; paramString2 = name)
    {
      localObject = paramString2;
      if (paramBoolean) {
        if (!TextUtils.isEmpty(paramString2))
        {
          localObject = paramString2;
          if (!paramString2.equals(paramString1)) {}
        }
        else
        {
          localObject = paramString2;
          if (!jdField_a_of_type_JavaUtilSet.contains(paramString1))
          {
            jdField_a_of_type_JavaUtilSet.add(paramString1);
            localObject = (FriendListHandler)a(1);
            a(jdField_a_of_type_ComTencentMobileqqAppFriendListObserver);
            if (QLog.isColorLevel()) {
              QLog.d(jdField_a_of_type_JavaLangString + "_friendListObserver", 2, "addObserver");
            }
            ((FriendListHandler)localObject).b(paramString1);
            localObject = paramString2;
          }
        }
      }
      if ((localObject != null) && (!"".equals(localObject))) {
        break label228;
      }
      return paramString1;
      paramString2 = ContactUtils.c(this, paramString2, paramString1);
      break;
    }
    label228:
    return localObject;
  }
  
  private void a(Context paramContext, Intent paramIntent)
  {
    if ((paramIntent == null) || (paramIntent.getExtras() == null)) {}
    label165:
    label203:
    label209:
    do
    {
      return;
      int i3 = paramIntent.getExtras().getInt("faceType", 1);
      Object localObject2 = paramIntent.getExtras().getStringArrayList("uinList");
      paramContext = new ArrayList();
      ??? = new ArrayList();
      paramIntent = new ArrayList();
      if (QLog.isColorLevel()) {
        QQUtils.a("Q.qqhead.broadcast", 2, "headQQHeadBroadcast, receive uinList: ", (ArrayList)localObject2);
      }
      int i1;
      String str;
      if ((localObject2 != null) && (((ArrayList)localObject2).size() > 0))
      {
        i1 = 0;
        if (i1 < ((ArrayList)localObject2).size())
        {
          str = (String)((ArrayList)localObject2).get(i1);
          int i2;
          if ((str != null) && (str.length() > 0))
          {
            Object localObject3 = new File(a(i3, str, 0));
            if ((!((File)localObject3).exists()) || (!((File)localObject3).isFile())) {
              break label203;
            }
            i2 = 1;
            if (i2 == 0) {
              break label209;
            }
            localObject3 = a(i3, str, 0);
            paramContext.add(str);
            ((ArrayList)???).add(localObject3);
          }
          for (;;)
          {
            i1 += 1;
            break;
            i2 = 0;
            break label165;
            paramIntent.add(str);
          }
        }
      }
      if (paramContext.size() > 0)
      {
        localObject2 = new Intent("com.tencent.qqhead.getheadresp");
        ((Intent)localObject2).putExtra("faceType", i3);
        ((Intent)localObject2).putStringArrayListExtra("uinList", paramContext);
        ((Intent)localObject2).putStringArrayListExtra("headPathList", (ArrayList)???);
        a().sendBroadcast((Intent)localObject2, "com.tencent.qqhead.permission.getheadresp");
      }
      if (paramIntent.size() > 0)
      {
        long l1 = System.currentTimeMillis();
        localObject2 = (FriendListHandler)a(1);
        i1 = 0;
        while (i1 < paramIntent.size())
        {
          str = (String)paramIntent.get(i1);
          if (i3 == 1) {
            ((FriendListHandler)localObject2).a(str, (byte)0, (byte)2);
          }
          synchronized (jdField_a_of_type_JavaUtilHashtable)
          {
            do
            {
              jdField_a_of_type_JavaUtilHashtable.put(str, Long.valueOf(l1));
              i1 += 1;
              break;
            } while (i3 != 4);
            ((FriendListHandler)localObject2).d(str);
          }
        }
      }
    } while (!QLog.isColorLevel());
    QQUtils.a("Q.qqhead.broadcast", 2, "headQQHeadBroadcast, response uinList: ", paramContext);
    QQUtils.a("Q.qqhead.broadcast", 2, "headQQHeadBroadcast, getQQHead uinList: ", paramIntent);
  }
  
  private void a(Intent paramIntent, String paramString1, String paramString2, String paramString3, Bitmap paramBitmap, String paramString4)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "showNotification. cmd=" + paramString4 + ", ticker=" + Utils.a(paramString1) + ",msgShow:" + Utils.a(paramString3) + ", bitmap=" + paramBitmap);
    }
    Bitmap localBitmap = paramBitmap;
    if (paramBitmap == null) {
      localBitmap = BitmapManager.a(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getResources(), 2130838445);
    }
    if (localBitmap != null)
    {
      paramBitmap = new ToServiceMsg("mobileqq.service", a(), paramString4);
      extraData.putStringArray("cmds", new String[] { paramString1, paramString2, paramString3 });
      extraData.putParcelable("intent", paramIntent);
      extraData.putParcelable("bitmap", localBitmap);
      a(paramBitmap);
    }
  }
  
  private void a(QQMessageFacade.Message paramMessage, boolean paramBoolean)
  {
    boolean bool = NoDisturbUtil.a(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext(), this);
    if (QLog.isColorLevel()) {
      QLog.d("notification", 2, "showInComingMsg ,isFinished=" + g + ", isCanDisturb=" + bool + ", needTicker=" + paramBoolean + ", message=" + paramMessage);
    }
    if ((g) || (!bool)) {
      return;
    }
    Object localObject4 = "";
    Object localObject6 = "";
    Object localObject10 = null;
    Object localObject5 = null;
    Object localObject1;
    if (ActionMsgUtil.d(msgtype)) {
      localObject1 = EmosmUtils.a(a(), paramMessage);
    }
    for (;;)
    {
      label129:
      Object localObject8 = a(a(), paramMessage, true);
      ((Intent)localObject8).putExtra("entrance", 6);
      ((Intent)localObject8).putExtra("key_notification_click_action", true);
      Object localObject7 = ((Intent)localObject8).getStringExtra("uinname");
      if ((localObject7 == null) || ("".equals(localObject7))) {
        localObject7 = ((Intent)localObject8).getStringExtra("uin");
      }
      for (;;)
      {
        switch (istroop)
        {
        default: 
          localObject6 = localObject5;
          if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.d() == 1)
          {
            if (AppConstants.au.equals(frienduin)) {
              localObject6 = a(senderuin, true);
            }
          }
          else
          {
            label323:
            localObject5 = (String)localObject7 + ": ";
            localObject4 = localObject1;
          }
          break;
        }
        for (;;)
        {
          label350:
          label422:
          Object localObject9;
          if (ActionMsgUtil.a(msgtype)) {
            if ((actMsgContentValue != null) && (!"".endsWith(actMsgContentValue)))
            {
              if (QLog.isColorLevel()) {
                QLog.d(jdField_a_of_type_JavaLangString, 2, "isShareAppActionMsg+ actionDetailMsg=" + actMsgContentValue);
              }
              localObject1 = actMsgContentValue;
              localObject9 = localObject1;
              localObject4 = localObject1;
              label430:
              if (istroop != 1008) {
                break label2800;
              }
              localObject1 = (String)localObject5 + (String)localObject4;
              label462:
              localObject5 = localObject1;
              if (msgtype == 63520)
              {
                localObject4 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(getApplication(), paramMessage, true);
                localObject5 = localObject4;
              }
              localObject1 = localObject7;
              if (counter > 1)
              {
                if (counter <= 100) {
                  break label2839;
                }
                localObject1 = (String)localObject7 + " (" + a().getString(2131369735) + ")";
              }
              label558:
              if (!paramBoolean) {
                localObject5 = null;
              }
              if (istroop != 1008) {
                break label2937;
              }
              if ((extStr == null) || (((extLong & 0x1) == 0) && (!extStr.contains("lockDisplay"))) || (extStr == null) || (((extLong & 0x1) == 1) && (!paramMessage.getExtInfoFromExtStr("lockDisplay").equals("true")))) {
                break;
              }
              ((Intent)localObject8).putExtra("need_report", true);
              ((Intent)localObject8).putExtra("incoming_msguid", msgUid);
              ((Intent)localObject8).putExtra("incoming_shmsgseq", shmsgseq);
              localObject7 = ((Intent)localObject8).getStringExtra("uin");
              if ((TextUtils.isEmpty((CharSequence)localObject1)) || (TextUtils.isEmpty((CharSequence)localObject7))) {
                break label3375;
              }
              localObject5 = ((String)localObject1).replace((CharSequence)localObject7, "");
              label711:
              if (!TextUtils.isEmpty((CharSequence)localObject5)) {
                break label2891;
              }
              label719:
              if (!AppConstants.ad.equals(localObject7)) {
                break label2922;
              }
              localObject6 = a(frienduin, true);
              label741:
              localObject7 = localObject4;
              localObject5 = localObject1;
              localObject1 = localObject8;
              label753:
              if ((paramBoolean) && (istroop != 6000) && (istroop != 1009) && (!frienduin.equals(AppConstants.am))) {
                break label3279;
              }
              label790:
              a((Intent)localObject1, (String)localObject4, (String)localObject5, (String)localObject7, (Bitmap)localObject6, "CMD_SHOW_NOTIFIYCATION");
              return;
              if (msgtype == 63527)
              {
                localObject1 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a(getApplication(), paramMessage, true);
                break label129;
              }
              if (msgtype == 63496)
              {
                localObject1 = new MessageForApproval();
                msgData = msgData;
                localObject1 = ((MessageForApproval)localObject1).getFullTitle();
                break label129;
              }
              if (msgtype == 63495)
              {
                localObject1 = a().getString(2131371996);
                localObject4 = a().getString(2131371997);
                localObject1 = (String)localObject1 + " " + (String)localObject4;
                break label129;
              }
              Object localObject2;
              if (msgtype == 63525)
              {
                try
                {
                  localObject1 = StructMsgFactory.a(msgData);
                  if (localObject1 == null)
                  {
                    localObject1 = localObject4;
                    if (QLog.isColorLevel())
                    {
                      QLog.d("StructMsg", 2, "showInComingMsg,getStructMsg is null");
                      localObject1 = localObject4;
                    }
                  }
                  else
                  {
                    localObject1 = mMsgBrief;
                  }
                }
                catch (Exception localException1)
                {
                  if (QLog.isColorLevel()) {
                    QLog.d("StructMsg", 2, "showInComingMsg,getStructMsg error:" + localException1.getMessage(), localException1);
                  }
                  localObject2 = "";
                }
                break label129;
              }
              if (msgtype == 60527)
              {
                try
                {
                  localObject2 = BitAppMsgFactory.a(msgData);
                  if (localObject2 == null)
                  {
                    localObject2 = localObject4;
                    if (QLog.isColorLevel())
                    {
                      QLog.d("StructMsg", 2, "showInComingMsg,getBitAppMsg is null");
                      localObject2 = localObject4;
                    }
                  }
                  else
                  {
                    localObject2 = mMsgBrief;
                  }
                }
                catch (Exception localException2)
                {
                  if (QLog.isColorLevel()) {
                    QLog.d("StructMsg", 2, "showInComingMsg,getBitAppMsg error:" + localException2.getMessage(), localException2);
                  }
                  localObject3 = "";
                }
                break label129;
              }
              localObject4 = paramMessage.getMessageText();
              localObject3 = localObject4;
              if (localObject4 == null) {
                localObject3 = "";
              }
              if ((localObject3 instanceof QQText))
              {
                localObject3 = ((QQText)localObject3).a();
                break label129;
              }
              localObject3 = new QQText(((CharSequence)localObject3).toString(), 3).a();
              break label129;
              localObject4 = a(paramMessage);
              if ((nickName != null) && (!"".equals(nickName)))
              {
                localObject5 = (String)localObject4 + nickName + "(" + (String)localObject7 + ")" + ":";
                localObject4 = (String)localObject4 + nickName + ": " + (String)localObject3;
                label1332:
                if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.d() != 1) {
                  break label3421;
                }
                localObject6 = (DiscussionHandler)a(6);
                if (localObject6 == null) {
                  break label3415;
                }
              }
            }
          }
          label1655:
          label1738:
          label1905:
          label1933:
          label2800:
          label2839:
          label2891:
          label2922:
          label2937:
          label3279:
          label3373:
          label3375:
          label3400:
          label3415:
          for (localObject6 = ((DiscussionHandler)localObject6).a(frienduin, true);; localObject6 = null)
          {
            localObject9 = localObject4;
            localObject4 = localObject3;
            localObject3 = localObject9;
            break label350;
            localObject6 = ContactUtils.a(this, senderuin, 0);
            localObject5 = (String)localObject4 + (String)localObject6 + "(" + (String)localObject7 + ")" + ":";
            localObject4 = (String)localObject4 + (String)localObject6 + ": " + (String)localObject3;
            break label1332;
            if ((msgtype == 64523) || (msgtype == 63506) || (msgtype == 64489))
            {
              localObject5 = (String)localObject7 + ":";
              localObject4 = localObject3;
              localObject6 = localObject10;
              break label350;
            }
            localObject4 = "";
            String str;
            if (AnonymousChatHelper.a(paramMessage))
            {
              localObject5 = ab;
              new StringBuilder().append(a().getString(2131364597)).append((String)localObject5).append("(").append((String)localObject7).append(")").append(":").toString();
              new StringBuilder().append(a().getString(2131364597)).append((String)localObject5).append(": ").append((String)localObject3).toString();
              if (msgtype != 63501)
              {
                localObject5 = localObject3;
                if (msgtype != 63498) {}
              }
              else
              {
                localObject5 = MessageForGrayTips.getOrginMsg((String)localObject3);
              }
              localObject3 = localObject5;
              if (msgtype == 62530)
              {
                localObject3 = MessageForPubAccount.getMsgSummary(this, paramMessage, false);
                localObject4 = PublicAccountConfigUtil.a(this, getApplication().getApplicationContext());
              }
              if (!MsgProxyUtils.h(msgtype)) {
                break label1905;
              }
              localObject4 = a(paramMessage);
              str = (String)localObject4 + "(" + (String)localObject7 + ")" + ":";
              if (TextUtils.isEmpty((CharSequence)localObject4)) {
                break label1933;
              }
            }
            for (localObject4 = (String)localObject4 + ": " + (String)localObject3;; localObject4 = localObject3)
            {
              localObject6 = localObject4;
              localObject9 = localObject3;
              localObject5 = str;
              if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.d() != 1) {
                break label3400;
              }
              localObject6 = a(frienduin, (byte)3, false, false);
              localObject5 = localObject4;
              localObject4 = localObject3;
              localObject3 = localObject5;
              localObject5 = str;
              break;
              if (!TextUtils.isEmpty(nickName))
              {
                localObject4 = nickName;
                break label1655;
              }
              localObject4 = ContactUtils.f(this, frienduin, senderuin);
              break label1655;
              localObject4 = a(paramMessage) + (String)localObject4;
              break label1738;
            }
            localObject5 = ((Intent)localObject8).getStringExtra("subAccountLatestNick");
            if (localObject5 != null)
            {
              localObject4 = localObject5;
              if (((String)localObject5).length() != 0) {}
            }
            else
            {
              localObject4 = senderuin;
            }
            localObject6 = (String)localObject7 + "-" + (String)localObject4 + ":" + (String)localObject3;
            localObject5 = (String)localObject4 + ":" + (String)localObject3;
            localObject9 = null;
            localObject4 = localObject3;
            localObject3 = localObject5;
            localObject5 = localObject6;
            localObject6 = localObject9;
            break label350;
            localObject5 = (String)localObject7 + ": ";
            localObject4 = localObject3;
            localObject6 = localObject10;
            break label350;
            if (String.valueOf(AppConstants.aq).equals(frienduin))
            {
              localObject5 = ContactUtils.o(this, senderuin);
              localObject4 = localObject5;
              if (TextUtils.isEmpty((CharSequence)localObject5)) {
                localObject4 = senderuin;
              }
            }
            for (;;)
            {
              str = (String)localObject4 + "(" + (String)localObject7 + ")" + ":";
              localObject4 = a(paramMessage) + (String)localObject4 + ": " + (String)localObject3;
              localObject6 = localObject4;
              localObject9 = localObject3;
              localObject5 = str;
              if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.d() != 1) {
                break label3400;
              }
              localObject6 = a(frienduin, 200);
              localObject5 = localObject4;
              localObject4 = localObject3;
              localObject3 = localObject5;
              localObject5 = str;
              break;
              localObject5 = ContactUtils.o(this, frienduin);
              localObject4 = localObject5;
              if (TextUtils.isEmpty((CharSequence)localObject5)) {
                localObject4 = frienduin;
              }
            }
            localObject9 = SkinUtils.a(a().getResources().getDrawable(2130838455));
            localObject5 = XMLMessageUtils.a(paramMessage);
            if ((localObject5 != null) && (!items.isEmpty()))
            {
              localObject4 = items.get(0)).title;
              if ((items.get(0)).cover == null) && (items.get(0)).digestList != null))
              {
                localObject5 = (String)items.get(0)).digestList.get(0);
                localObject7 = localObject4;
                localObject4 = localObject5;
              }
            }
            for (;;)
            {
              localObject5 = localObject4;
              localObject4 = localObject3;
              localObject3 = localObject5;
              localObject5 = localObject6;
              localObject6 = localObject9;
              break label350;
              continue;
              localObject6 = SkinUtils.a(a().getResources().getDrawable(2130840205));
              localObject5 = (String)localObject7 + ": ";
              localObject4 = localObject3;
              break label350;
              if (("device_groupchat".equals(extStr)) && ((msgtype == 61035) || (msgtype == 61028)))
              {
                localObject5 = ContactUtils.b(this, senderuin, true);
                localObject4 = localObject5;
                if (!TextUtils.isEmpty(senderuin))
                {
                  localObject4 = localObject5;
                  if (senderuin.equals(frienduin)) {
                    localObject4 = SmartDeviceUtil.a(((SmartDeviceProxyMgr)a(51)).a(Long.parseLong(senderuin)));
                  }
                }
                localObject5 = localObject4;
                if (localObject4 == null) {
                  localObject5 = "";
                }
                localObject5 = (String)localObject5 + ": " + (String)localObject3;
                localObject4 = localObject3;
                localObject3 = localObject5;
                localObject5 = localObject6;
                localObject6 = localObject10;
                break label350;
              }
              localObject4 = localObject3;
              localObject5 = localObject6;
              localObject6 = localObject10;
              break label350;
              localObject6 = a(frienduin, true);
              break label323;
              localObject3 = a().a(AppShareIDUtil.a(shareAppID));
              if ((localObject3 == null) || (messagetail == null) || ("".equals(messagetail)))
              {
                localObject3 = a().getString(2131369824);
                break label422;
              }
              localObject3 = a().getString(2131369822) + messagetail + jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getString(2131369823);
              break label422;
              localObject3 = localObject5;
              if (istroop == 7000) {
                break label462;
              }
              localObject3 = (String)localObject5 + (String)localObject9;
              break label462;
              localObject3 = (String)localObject7 + " (" + counter + a().getString(2131368565) + ")";
              break label558;
              localObject4 = (String)localObject5 + " : " + (String)localObject4;
              break label719;
              localObject3 = a().getString(2131369395);
              break label741;
              if ((istroop == 1001) && (msgtype == 62535))
              {
                if (OpenAppClient.a(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext(), action, frienduin, istroop) == null) {
                  break;
                }
                localObject7 = localObject3;
                localObject3 = localObject8;
                localObject8 = localObject4;
                localObject4 = localObject5;
                localObject5 = localObject7;
                localObject7 = localObject8;
                break label753;
              }
              if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.d() > 1)
              {
                int i1 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b();
                localObject4 = new StringBuffer();
                ((StringBuffer)localObject4).append(String.format(a().getString(2131369740), new Object[] { Integer.valueOf(jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.d()) }));
                if (i1 == 0) {
                  break;
                }
                if (i1 > 1000) {
                  ((StringBuffer)localObject4).append(a().getString(2131369734));
                }
                for (;;)
                {
                  localObject3 = new Intent(a(), SplashActivity.class);
                  ((Intent)localObject3).addFlags(335544320);
                  ((Intent)localObject3).putExtra("tab_index", MainFragment.a);
                  localObject6 = a().getString(2131369733);
                  localObject7 = ((StringBuffer)localObject4).toString();
                  localObject8 = null;
                  localObject4 = localObject5;
                  localObject5 = localObject6;
                  localObject6 = localObject8;
                  break;
                  ((StringBuffer)localObject4).append(i1).append(a().getString(2131368565));
                }
              }
              if (istroop == 0)
              {
                ((Intent)localObject8).putExtra("need_report", true);
                ((Intent)localObject8).putExtra("incoming_msguid", msgUid);
                ((Intent)localObject8).putExtra("incoming_shmsgseq", shmsgseq);
                ((Intent)localObject8).putExtra("KEY_FROM", "notifcation");
              }
              localObject7 = localObject3;
              localObject3 = localObject8;
              localObject8 = localObject4;
              localObject4 = localObject5;
              localObject5 = localObject7;
              localObject7 = localObject8;
              break label753;
              if (!QQUtils.a(a())) {
                break label790;
              }
              localObject8 = (QQLSRecentManager)getManager(71);
              if (NotifyPushSettingActivity.a()) {}
              for (paramBoolean = false;; paramBoolean = SettingCloneUtil.readValue(a(), a(), a().getString(2131369309), "qqsetting_lock_screen_whenexit_key", true))
              {
                if (!paramBoolean) {
                  break label3373;
                }
                if (QLog.isColorLevel()) {
                  QLog.d("QQLSActivity", 2, "videochatting start lsActivity from appinterface  showInComingMsg");
                }
                ((QQLSRecentManager)localObject8).a(this, frienduin, istroop, false);
                break;
              }
              break label790;
              localObject5 = localObject3;
              break label711;
              localObject9 = localObject4;
              localObject4 = localObject3;
              break label430;
              localObject4 = localObject3;
            }
            localObject4 = localObject9;
            localObject3 = localObject6;
            localObject6 = localObject10;
            break label350;
          }
          label3421:
          localObject6 = localObject4;
          localObject4 = localObject3;
          Object localObject3 = localObject6;
          localObject6 = localObject10;
        }
      }
    }
  }
  
  private void a(QQMessageFacade.Message paramMessage, boolean paramBoolean1, boolean paramBoolean2)
  {
    int i3 = 1;
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "showMsgNotification: entryA message.frienduin=" + frienduin + ", " + "message.senderuin=" + senderuin + ", needSoundVibrationsTip " + paramBoolean1 + " , " + "isOnline " + paramBoolean2);
    }
    int i2;
    if (f())
    {
      a(paramMessage, true);
      i2 = 0;
      i1 = i2;
      if (bJ == 0)
      {
        i1 = i2;
        if (paramBoolean1) {
          i1 = 1;
        }
      }
      i2 = i1;
      if (istroop == 1001)
      {
        i2 = i1;
        if (msgtype == 62535) {
          i2 = 1;
        }
      }
      i1 = i2;
      if (istroop == 1008) {
        if ((extStr == null) || ((extLong & 0x1) != 0) || (!extStr.contains("lockDisplay")))
        {
          i1 = i2;
          if (extStr != null)
          {
            i1 = i2;
            if ((extLong & 0x1) == 1)
            {
              i1 = i2;
              if (!paramMessage.getExtInfoFromExtStr("lockDisplay").equals("true")) {}
            }
          }
        }
        else
        {
          i1 = i2;
          if (paramBoolean1) {
            i1 = 1;
          }
        }
      }
      i2 = i1;
      if (istroop == 1008)
      {
        i2 = i1;
        if (AppConstants.ad.equals(senderuin)) {
          i2 = 1;
        }
      }
      if (istroop != 9002) {
        break label320;
      }
    }
    label320:
    for (int i1 = i3;; i1 = i2)
    {
      if (i1 != 0) {
        d(paramMessage, paramBoolean2);
      }
      return;
      f(true);
      break;
    }
  }
  
  private void a(MessageRecord paramMessageRecord, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (f()) {
      b(paramMessageRecord, true);
    }
    for (;;)
    {
      int i2 = 0;
      int i1 = i2;
      if (bJ == 0)
      {
        i1 = i2;
        if (paramBoolean1) {
          i1 = 1;
        }
      }
      i2 = i1;
      if (istroop == 1001)
      {
        i2 = i1;
        if (msgtype == 62535) {
          i2 = 1;
        }
      }
      i1 = i2;
      if (istroop == 1008) {
        if ((extStr == null) || ((extLong & 0x1) != 0) || (!extStr.contains("lockDisplay")))
        {
          i1 = i2;
          if (extStr != null)
          {
            i1 = i2;
            if ((extLong & 0x1) == 1)
            {
              i1 = i2;
              if (!paramMessageRecord.getExtInfoFromExtStr("lockDisplay").equals("true")) {}
            }
          }
        }
        else
        {
          i1 = i2;
          if (paramBoolean1) {
            i1 = 1;
          }
        }
      }
      i2 = i1;
      if (istroop == 1008)
      {
        i2 = i1;
        if (AppConstants.ad.equals(senderuin)) {
          i2 = 1;
        }
      }
      if (i2 != 0) {
        d(paramMessageRecord, paramBoolean2);
      }
      return;
      c(paramMessageRecord, true);
    }
  }
  
  private void a(InputStream paramInputStream)
  {
    try
    {
      Object localObject1 = SAXParserFactory.newInstance().newSAXParser();
      Object localObject2 = new PlistHandler();
      ((SAXParser)localObject1).parse(paramInputStream, (DefaultHandler)localObject2);
      if ((((PlistHandler)localObject2).a() instanceof ArrayList))
      {
        paramInputStream = (ArrayList)((PlistHandler)localObject2).a();
        int i3 = paramInputStream.size();
        if (i3 >= 1)
        {
          bG = Integer.parseInt((String)paramInputStream.get(0));
          jdField_a_of_type_JavaUtilArrayList = new ArrayList();
          int i1 = 1;
          while (i1 < i3)
          {
            ArrayList localArrayList1 = (ArrayList)paramInputStream.get(i1);
            localObject1 = (String)localArrayList1.get(0);
            localObject2 = (String)localArrayList1.get(1);
            localArrayList1 = (ArrayList)localArrayList1.get(2);
            ArrayList localArrayList2 = new ArrayList();
            int i2 = 0;
            while (i2 < localArrayList1.size())
            {
              TagInfo localTagInfo = new TagInfo();
              bType = Byte.parseByte((String)((HashMap)localArrayList1.get(i2)).get("itemTagType"));
              iTagId = new BigDecimal((String)((HashMap)localArrayList1.get(i2)).get("itemTagID")).longValue();
              strContent = ((String)((HashMap)localArrayList1.get(i2)).get("itemTagString"));
              localArrayList2.add(localTagInfo);
              i2 += 1;
            }
            localObject1 = new TagArrayByType((String)localObject1, (String)localObject2, localArrayList2);
            jdField_a_of_type_JavaUtilArrayList.add(localObject1);
            i1 += 1;
          }
        }
      }
      return;
    }
    catch (ParserConfigurationException paramInputStream)
    {
      paramInputStream.printStackTrace();
      return;
    }
    catch (SAXException paramInputStream)
    {
      paramInputStream.printStackTrace();
      return;
    }
    catch (IOException paramInputStream)
    {
      paramInputStream.printStackTrace();
    }
  }
  
  private Object[] a(int paramInt1, String paramString, int paramInt2)
  {
    if ((paramInt1 == 109) && (paramString != null))
    {
      int i1 = paramString.indexOf("_");
      if (i1 > 0) {
        paramString = paramString.substring(i1 + 1);
      }
    }
    for (;;)
    {
      if ((paramInt1 != 101) && (paramInt1 != 109) && (paramInt1 != 1001) && (paramString != null))
      {
        Setting localSetting = (Setting)asecond;
        if ((localSetting != null) && (bHeadType == 0))
        {
          paramString = String.valueOf(systemHeadID);
          if (paramInt1 == 4) {
            paramInt1 = -56;
          }
        }
      }
      for (;;)
      {
        return new Object[] { Integer.valueOf(paramInt1), paramString };
        if (paramInt1 == 16) {
          paramInt1 = 16;
        } else {
          paramInt1 = -55;
        }
      }
    }
  }
  
  private Intent b(Context paramContext, QQMessageFacade.Message paramMessage, boolean paramBoolean)
  {
    paramContext = new Intent(paramContext, SplashActivity.class);
    paramContext.putExtra("uin", frienduin);
    paramContext.putExtra("troop_uin", senderuin);
    paramContext.putExtra("uintype", istroop);
    paramContext.putExtra("uinname", a(paramMessage, paramBoolean));
    paramContext = AIOUtils.a(paramContext, new int[] { 2 });
    paramContext.setAction("com.tencent.mobileqq.action.CHAT");
    return paramContext;
  }
  
  private BusinessHandler b(int paramInt)
  {
    Object localObject2 = null;
    long l1 = System.currentTimeMillis();
    Object localObject1 = localObject2;
    switch (paramInt)
    {
    default: 
      localObject1 = localObject2;
    }
    for (;;)
    {
      if (QLog.isColorLevel())
      {
        long l2 = System.currentTimeMillis();
        QLog.d("Conversation", 2, "createHandler,cost time:" + (l2 - l1));
      }
      return localObject1;
      localObject1 = new MessageHandler(this);
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler = ((MessageHandler)localObject1);
      continue;
      localObject1 = new FriendListHandler(this);
      continue;
      localObject1 = new CardHandler(this);
      continue;
      localObject1 = new LBSHandler(this);
      continue;
      localObject1 = new ConfigHandler(this);
      continue;
      localObject1 = new ReportHandler(this);
      continue;
      localObject1 = new DiscussionHandler(this);
      continue;
      localObject1 = new QZoneNotifyHandler(this);
      continue;
      localObject1 = new DataLineHandler_210(this);
      continue;
      localObject1 = new HuangyeHandler(this);
      continue;
      localObject1 = new RegisterProxySvcPackHandler(this);
      continue;
      localObject1 = new PublicAccountHandler(this);
      continue;
      localObject1 = new EmosmHandler(this);
      continue;
      localObject1 = new SVIPHandler(this);
      continue;
      localObject1 = new ThemeHandler(this);
      continue;
      localObject1 = new QvipSpecialCareHandler(this);
      continue;
      localObject1 = new ClubContentUpdateHandler(this);
      continue;
      localObject1 = new SubAccountBindHandler(this);
      continue;
      localObject1 = new ShieldListHandler(this);
      continue;
      localObject1 = new TroopHandler(this);
      continue;
      localObject1 = new EnterpriseQQHandler(this);
      continue;
      localObject1 = new BizTroopHandler(this);
      continue;
      localObject1 = new StartAppCheckHandler(this);
      continue;
      localObject1 = new SafeCenterPushHandler(this);
      continue;
      localObject1 = new QPSafeCheckHandler(this);
      continue;
      localObject1 = new StrangerHandler(this);
      continue;
      localObject1 = new VipInfoHandler(this);
      continue;
      localObject1 = new TroopQZoneUploadAlbumHandler(this);
      continue;
      localObject1 = new CardPayHandler(this);
      continue;
      localObject1 = new QWalletOpenHandler(this);
      continue;
      localObject1 = new RedTouchHandler(this);
      continue;
      localObject1 = new NearFieldDiscussHandler(this);
      continue;
      localObject1 = new SecSvcHandler(this);
      continue;
      localObject1 = new HotChatHandler(this);
      continue;
      localObject1 = new IndividualExpireInfoHandler(this);
      continue;
      localObject1 = new BmqqBusinessHandler(this);
      continue;
      localObject1 = new VideoC2CHandler(this);
      continue;
      localObject1 = new SecMsgHandler(this);
      continue;
      localObject1 = new SignatureHandler(this);
      continue;
      localObject1 = new QWalletAuthHandler(this);
      continue;
      localObject1 = new TroopRedTouchHandler(this);
      continue;
      localObject1 = new UniPayHandler(this);
      continue;
      localObject1 = new RecentCallHandler(this);
      continue;
      localObject1 = new VipSetFunCallHandler(this);
      continue;
      localObject1 = new QPayHandler(this);
      continue;
      localObject1 = new RouterHandler(this);
      continue;
      localObject1 = new DeviceMsgHandle(this);
      continue;
      localObject1 = new DeviceFileHandler(this);
      continue;
      localObject1 = new SmartDeviceProxyMgr(this);
      continue;
      localObject1 = new LightalkSwitchHanlder(this);
      continue;
      localObject1 = new ChatBackgroundAuthHandler(this);
      continue;
      localObject1 = new NumRedPointHandler(this);
      continue;
      localObject1 = new NumRedMsgHandler(this);
      continue;
      localObject1 = new NearFieldTroopHandler(this);
      continue;
      localObject1 = new PPCLoginAuthHandler(this);
      continue;
      localObject1 = new MessageRoamHandler(this);
      continue;
      localObject1 = new NearbyCardHandler(this);
      continue;
      localObject1 = new ArrangeHandler(this);
      continue;
      localObject1 = new ReadInJoyHandler(this);
      continue;
      localObject1 = new MSFNetTransportProvider(this);
      continue;
      localObject1 = new SubscriptHandler(this);
      continue;
      localObject1 = new DynamicMsgHandler(this);
      continue;
      localObject1 = new EcShopHandler(this);
      continue;
      localObject1 = new QQCardHandler(this);
      continue;
      localObject1 = new NearbyRelevantHandler(this);
      continue;
      localObject1 = new BubbleDiyHandler(this);
      continue;
      localObject1 = new DingdongPluginBizHandler(this);
      continue;
      localObject1 = new FavEmoRoamingHandler(this);
      continue;
      localObject1 = new VIPRecommendPayHandler(this);
      continue;
      localObject1 = new PrinterStatusHandler(this);
      continue;
      localObject1 = new SenseWhereHandler(this);
      continue;
      localObject1 = new QWalletHandler(this);
      continue;
      localObject1 = new VasExtensionHandler(this);
      continue;
      localObject1 = new LightalkShieldHandler(this);
      continue;
      localObject1 = new QCallCardHandler(this);
      continue;
      localObject1 = new VipComicMqqHandler(this);
      continue;
      localObject1 = new GlobalSearchHandler(this);
      continue;
      localObject1 = new PstnHandler(this);
      continue;
      localObject1 = new QQHotSpotListHandler(this);
      continue;
      localObject1 = new LoginWelcomeHandler(this);
    }
  }
  
  private void c(MessageRecord paramMessageRecord, boolean paramBoolean)
  {
    if ((g) || (!NoDisturbUtil.a(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext(), this))) {}
    Object localObject;
    int i1;
    Intent localIntent;
    StringBuffer localStringBuffer;
    do
    {
      do
      {
        do
        {
          return;
          localObject = (QCallFacade)getManager(37);
        } while (localObject == null);
        i1 = ((QCallFacade)localObject).c();
      } while (i1 == 0);
      if (i1 != 1) {
        break label377;
      }
      if (((msgtype != 63520) && (msgtype != 61528)) || (istroop != 3000)) {
        break;
      }
      localIntent = a(a(), frienduin, istroop);
      localIntent.putExtra("key_notification_click_action", true);
      localStringBuffer = new StringBuffer();
      localStringBuffer.append(a().getString(2131369739));
      i1 = ((QCallFacade)localObject).b();
    } while (i1 == 0);
    if (i1 > 1000)
    {
      localStringBuffer.append(a().getString(2131369736));
      label169:
      localObject = null;
      if (paramBoolean) {
        localObject = localStringBuffer.toString();
      }
      if (msgtype != 63520) {
        break label450;
      }
      if (QLog.isColorLevel()) {
        QLog.e(jdField_a_of_type_JavaLangString, 2, "AVNotify:MSG_TYPE_MULTI_VIDEO");
      }
      if (istroop == 3000)
      {
        if (QLog.isColorLevel()) {
          QLog.e(jdField_a_of_type_JavaLangString, 2, "AVNotify:UIN_TYPE_DISCUSSION");
        }
        localIntent.putExtra("qav_notify_flag", true);
      }
    }
    for (;;)
    {
      a(localIntent, (String)localObject, a().getResources().getString(2131369733), localStringBuffer.toString(), null, "CMD_SHOW_NOTIFIYCATION");
      return;
      if ((istroop == 1000) || (istroop == 1020) || (istroop == 1004))
      {
        localIntent = new Intent(a(), SplashActivity.class);
        localIntent.putExtra("tab_index", MainFragment.a);
        localIntent.putExtra("conversation_index", 1);
        localIntent.setFlags(335544320);
        break;
      }
      localIntent = a(a(), frienduin, istroop);
      break;
      label377:
      localIntent = new Intent(a(), SplashActivity.class);
      localIntent.putExtra("tab_index", MainFragment.a);
      localIntent.putExtra("conversation_index", 1);
      localIntent.setFlags(335544320);
      break;
      localStringBuffer.append(i1).append(a().getString(2131369738));
      break label169;
      label450:
      if (msgtype == 63527)
      {
        if (QLog.isColorLevel()) {
          QLog.e(jdField_a_of_type_JavaLangString, 2, "AVNotify:MSG_TYPE_MEDIA_VIDEO");
        }
        localIntent.putExtra("qav_notify_flag", true);
      }
    }
  }
  
  private boolean c(String paramString)
  {
    return (String.valueOf(AppConstants.ap).equals(paramString)) || (String.valueOf(AppConstants.ar).equals(paramString)) || (String.valueOf(AppConstants.aq).equals(paramString));
  }
  
  private void d(MessageRecord paramMessageRecord, boolean paramBoolean)
  {
    label126:
    boolean bool1;
    boolean bool4;
    boolean bool2;
    if (QLog.isColorLevel())
    {
      localObject1 = null;
      if (paramMessageRecord != null)
      {
        if (msgtype == 63516) {
          localObject1 = paramMessageRecord.getBaseInfoString();
        }
      }
      else {
        QLog.d("notification", 2, "message is:" + (String)localObject1 + ",isOnline is:" + paramBoolean);
      }
    }
    else
    {
      if (QLog.isColorLevel()) {
        QLog.d("notification", 2, "previous vibrate time is:" + jdField_e_of_type_Long + ",curr time is:" + System.currentTimeMillis());
      }
      if (jdField_e_of_type_Long != -1L) {
        break label388;
      }
      jdField_e_of_type_Long = System.currentTimeMillis();
      bool1 = h();
      bool4 = NoDisturbUtil.a(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext(), this);
      if (QLog.isColorLevel()) {
        QLog.d("notification", 2, "isRingerSilent is:" + bool1 + ",canDisturb is:" + bool4);
      }
      if ((paramMessageRecord == null) || (istroop != 1008) || (!AppConstants.ad.equals(senderuin))) {
        break label512;
      }
      bool2 = false;
      bool3 = false;
      paramMessageRecord = RingtoneManager.getActualDefaultRingtoneUri(a(), 2);
      localObject1 = (Vibrator)a().getSystemService("vibrator");
      if ((!k()) || (!bool4)) {
        break label436;
      }
      paramBoolean = true;
      bool1 = bool2;
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "canVibrator: " + paramBoolean + " canPlaySound: " + bool1 + " uri: " + paramMessageRecord);
      }
      if ((paramBoolean) && (localObject1 != null)) {
        ((Vibrator)localObject1).vibrate(jdField_b_of_type_ArrayOfLong, -1);
      }
      if ((bool1) && (paramMessageRecord != null)) {
        AudioUtil.a(paramMessageRecord, false, false);
      }
    }
    label388:
    label436:
    label512:
    while ((bool1) || (!bool4)) {
      for (;;)
      {
        return;
        localObject1 = "not shake msg,uinSeq is:" + uniseq;
        break;
        if (Math.abs(System.currentTimeMillis() - jdField_e_of_type_Long) > 2000L) {
          break label126;
        }
        if ((paramMessageRecord != null) && (msgtype == 63516) && (paramBoolean))
        {
          if (a() == 11L) {
            break label126;
          }
          return;
          if ((i()) && (j()) && (bool4))
          {
            bool1 = true;
            paramBoolean = true;
          }
          else
          {
            paramBoolean = bool3;
            bool1 = bool2;
            if (i())
            {
              paramBoolean = bool3;
              bool1 = bool2;
              if (!j())
              {
                paramBoolean = bool3;
                bool1 = bool2;
                if (bool4)
                {
                  bool1 = true;
                  paramBoolean = bool3;
                }
              }
            }
          }
        }
      }
    }
    SharedPreferences localSharedPreferences = a().getSharedPreferences("com.tencent.mobileqq_preferences", 0);
    Object localObject4 = (Vibrator)a().getSystemService("vibrator");
    boolean bool3 = d();
    Object localObject3 = "";
    Object localObject1 = "";
    int i1;
    label657:
    int i2;
    if (paramMessageRecord != null)
    {
      if ((istroop == 1000) || (istroop == 1004))
      {
        localObject1 = frienduin;
        localObject3 = "special_sound_type" + a() + (String)localObject1;
      }
    }
    else
    {
      bool1 = y();
      bool2 = x();
      i1 = RoamSettingController.a(this);
      if (i1 != 0) {
        break label905;
      }
      if (d() != 1) {
        break label900;
      }
      i1 = 1;
      i2 = i1;
      if ((paramMessageRecord == null) || (istroop != 1)) {
        break label1519;
      }
      if ((!bool1) || (!w())) {
        break label923;
      }
      bool1 = true;
      label687:
      if ((!bool2) || (!v())) {
        break label929;
      }
      bool2 = true;
    }
    label702:
    label900:
    label905:
    label923:
    label929:
    label1135:
    label1334:
    label1455:
    label1465:
    label1513:
    label1519:
    for (;;)
    {
      bool4 = m();
      boolean bool5 = u();
      if (QLog.isColorLevel()) {
        QLog.d("notification", 2, "canVibrator is:" + bool2 + ",isVideoing is:" + bool3 + ",isCallIdle is:" + bool4 + ",notRecordingPtt is:" + bool5);
      }
      if ((bool2) && (bool4) && (!bool3) && (bool5))
      {
        if ((paramMessageRecord != null) && (paramBoolean) && (msgtype == 63516) && (a() == 11L))
        {
          ((Vibrator)localObject4).vibrate(jdField_a_of_type_ArrayOfLong, -1);
          i1 = 2;
        }
        for (;;)
        {
          int i4 = jdField_d_of_type_JavaUtilList.size();
          int i3 = 0;
          while (i3 < i4)
          {
            ((VibrateListener)jdField_d_of_type_JavaUtilList.get(i3)).k(i1);
            i3 += 1;
          }
          localObject1 = senderuin;
          break;
          i1 = 0;
          break label657;
          if (i1 == 1) {}
          for (i1 = 1;; i1 = 0)
          {
            i2 = i1;
            break;
          }
          bool1 = false;
          break label687;
          bool2 = false;
          break label702;
          if (localSharedPreferences.contains((String)localObject3))
          {
            ((Vibrator)localObject4).vibrate(1000L);
            i1 = 3;
          }
          else
          {
            ((Vibrator)localObject4).vibrate(jdField_b_of_type_ArrayOfLong, -1);
            i1 = 1;
          }
        }
      }
      if ((i2 != 0) && (!bool3) && (!k()) && (!l()) && (bool4) && (bool5))
      {
        i1 = SettingCloneUtil.readValueForInt(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl, a(), "sound_type", "qqsetting_notify_soundtype_key", SoundAndVibrateActivity.f);
        if (localSharedPreferences.contains((String)localObject3))
        {
          if (QLog.isColorLevel()) {
            QLog.d("notification", 2, "-->SpecialSound");
          }
          localObject4 = (FriendsManager)getManager(50);
          if ((localObject4 != null) && (((FriendsManager)localObject4).b((String)localObject1)))
          {
            i1 = localSharedPreferences.getInt((String)localObject3, i1);
            if (i1 != 1) {
              break label1334;
            }
            try
            {
              ThreadManager.a(new ndb(this), 8, null, true);
              return;
            }
            catch (Exception localException)
            {
              if (QLog.isColorLevel()) {
                QLog.d("notification", 2, localException.getMessage());
              }
            }
          }
        }
      }
      Object localObject2;
      if ((bool1) && (!bool3) && (!k()) && (!l()) && (bool4) && (bool5))
      {
        i2 = SettingCloneUtil.readValueForInt(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl, a(), "sound_type", "qqsetting_notify_soundtype_key", SoundAndVibrateActivity.f);
        if (QLog.isColorLevel())
        {
          localObject2 = (AudioManager)a().getSystemService("audio");
          localObject3 = new StringBuilder().append("StreamVolume=");
          if (localObject2 != null) {
            break label1455;
          }
        }
      }
      for (i1 = 0;; i1 = ((AudioManager)localObject2).getStreamVolume(2))
      {
        QLog.d("notification", 2, i1 + ",SoundRid=" + i2);
        if (i2 != SoundAndVibrateActivity.f) {
          break label1513;
        }
        localObject2 = ThemeUtil.getThemeVoiceRootPath();
        if (localObject2 == null) {
          break label1465;
        }
        localObject2 = new File((String)localObject2 + File.separatorChar + "message.mp3");
        if (!((File)localObject2).exists()) {
          break label1465;
        }
        AudioUtil.a(Uri.fromFile((File)localObject2), false, true);
        return;
        localObject2 = localSharedPreferences.getString("special_sound_url" + i1, "");
        if (TextUtils.isEmpty((CharSequence)localObject2)) {
          break label1135;
        }
        localObject3 = new File(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getFilesDir(), (String)localObject2);
        if (((File)localObject3).exists())
        {
          AudioUtil.a(((File)localObject3).getAbsolutePath(), false);
          return;
        }
        if (jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager == null) {
          jdField_a_of_type_ComTencentMobileqqActivitySpecialcareQvipSpecialSoundManager = new QvipSpecialSoundManager(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext(), this);
        }
        a(new ndc(this, (String)localObject2, (File)localObject3));
        break label1135;
        break;
      }
      for (i1 = 2131165185;; i1 = i2)
      {
        i2 = i1;
        if (paramMessageRecord != null)
        {
          i2 = i1;
          if (c(frienduin)) {
            i2 = 2131165206;
          }
        }
        ThreadManager.a(new ndd(this, i2), 8, null, true);
        return;
      }
    }
  }
  
  public static void f(String paramString)
  {
    TextToSpeech localTextToSpeech = jdField_a_of_type_AndroidSpeechTtsTextToSpeech;
    if ((localTextToSpeech != null) && (!TextUtils.isEmpty(paramString))) {
      localTextToSpeech.speak(paramString, 1, null);
    }
  }
  
  private void f(boolean paramBoolean)
  {
    if ((g) || (!NoDisturbUtil.a(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext(), this))) {}
    Intent localIntent;
    StringBuffer localStringBuffer;
    int i1;
    do
    {
      return;
      if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.d() != 1) {
        break;
      }
      localIntent = a(a(), (QQMessageFacade.Message)jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().get(0), false);
      localIntent.putExtra("entrance", 6);
      localIntent.putExtra("key_notification_click_action", true);
      localStringBuffer = new StringBuffer();
      localStringBuffer.append(a().getString(2131369739));
      i1 = jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b();
    } while (i1 == 0);
    if (i1 > 1000)
    {
      localStringBuffer.append(a().getString(2131369734));
      label138:
      if (!paramBoolean) {
        break label239;
      }
    }
    label239:
    for (String str = localStringBuffer.toString();; str = null)
    {
      a(localIntent, str, a().getResources().getString(2131369733), localStringBuffer.toString(), null, "CMD_SHOW_NOTIFIYCATION");
      return;
      localIntent = new Intent(a(), SplashActivity.class);
      localIntent.addFlags(335544320);
      localIntent.putExtra("tab_index", MainFragment.a);
      break;
      localStringBuffer.append(i1).append(a().getString(2131368565));
      break label138;
    }
  }
  
  private String g()
  {
    try
    {
      int i1 = Process.myPid();
      Object localObject = ((ActivityManager)BaseApplication.getContext().getSystemService("activity")).getRunningAppProcesses().iterator();
      while (((Iterator)localObject).hasNext())
      {
        ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)((Iterator)localObject).next();
        if (pid == i1)
        {
          localObject = processName;
          return localObject;
        }
      }
    }
    catch (Exception localException)
    {
      QLog.d(jdField_a_of_type_JavaLangString, 1, "failed to get current process name");
    }
    return null;
  }
  
  /* Error */
  private String h()
  {
    // Byte code:
    //   0: ldc_w 2492
    //   3: astore 4
    //   5: aload_0
    //   6: getfield 794	com/tencent/mobileqq/app/QQAppInterface:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   9: invokevirtual 2496	com/tencent/common/app/BaseApplicationImpl:getPackageManager	()Landroid/content/pm/PackageManager;
    //   12: astore_3
    //   13: aload 4
    //   15: astore_2
    //   16: aload_3
    //   17: aload_0
    //   18: getfield 794	com/tencent/mobileqq/app/QQAppInterface:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   21: invokevirtual 791	com/tencent/common/app/BaseApplicationImpl:getPackageName	()Ljava/lang/String;
    //   24: iconst_0
    //   25: invokevirtual 2502	android/content/pm/PackageManager:getPackageInfo	(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    //   28: astore 5
    //   30: aload 4
    //   32: astore_3
    //   33: aload 5
    //   35: ifnull +99 -> 134
    //   38: aload 4
    //   40: astore_2
    //   41: aload 4
    //   43: astore_3
    //   44: aload 5
    //   46: getfield 2507	android/content/pm/PackageInfo:versionName	Ljava/lang/String;
    //   49: ifnull +85 -> 134
    //   52: aload 4
    //   54: astore_2
    //   55: aload 5
    //   57: getfield 2507	android/content/pm/PackageInfo:versionName	Ljava/lang/String;
    //   60: astore 4
    //   62: aload 4
    //   64: astore_3
    //   65: aload 4
    //   67: ifnull +67 -> 134
    //   70: aload 4
    //   72: astore_2
    //   73: aload 4
    //   75: ldc_w 2509
    //   78: invokevirtual 2513	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   81: astore 5
    //   83: iconst_3
    //   84: istore_1
    //   85: aload 4
    //   87: astore_2
    //   88: aload 4
    //   90: astore_3
    //   91: iload_1
    //   92: aload 5
    //   94: arraylength
    //   95: if_icmple +39 -> 134
    //   98: aload 4
    //   100: astore_2
    //   101: new 517	java/lang/StringBuilder
    //   104: dup
    //   105: invokespecial 520	java/lang/StringBuilder:<init>	()V
    //   108: aload 4
    //   110: invokevirtual 526	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   113: ldc_w 2515
    //   116: invokevirtual 526	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   119: invokevirtual 530	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   122: astore 4
    //   124: iload_1
    //   125: iconst_1
    //   126: isub
    //   127: istore_1
    //   128: goto -43 -> 85
    //   131: astore_3
    //   132: aload_2
    //   133: astore_3
    //   134: aload_3
    //   135: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	136	0	this	QQAppInterface
    //   84	44	1	i1	int
    //   15	118	2	str1	String
    //   12	79	3	localObject1	Object
    //   131	1	3	localException	Exception
    //   133	2	3	localObject2	Object
    //   3	120	4	str2	String
    //   28	65	5	localObject3	Object
    // Exception table:
    //   from	to	target	type
    //   16	30	131	java/lang/Exception
    //   44	52	131	java/lang/Exception
    //   55	62	131	java/lang/Exception
    //   73	83	131	java/lang/Exception
    //   91	98	131	java/lang/Exception
    //   101	124	131	java/lang/Exception
  }
  
  private boolean u()
  {
    return (jdField_a_of_type_ComTencentMobileqqAppCheckPttListener == null) || (!jdField_a_of_type_ComTencentMobileqqAppCheckPttListener.e());
  }
  
  private boolean v()
  {
    return c() != 0;
  }
  
  private boolean w()
  {
    return b() != 0;
  }
  
  private boolean x()
  {
    return e() != 0;
  }
  
  private boolean y()
  {
    return d() != 0;
  }
  
  public void A()
  {
    ISecureModuleService localISecureModuleService = a();
    if (localISecureModuleService.register(new ProductInfo(6, h(), Integer.parseInt("2755"), 201, null, getAccount())) == 0)
    {
      if (QLog.isColorLevel()) {
        QLog.d("security_scan", 2, "Start Security Scan");
      }
      if (jdField_a_of_type_ComTencentSecuremoduleServiceCloudScanListener == null) {
        jdField_a_of_type_ComTencentSecuremoduleServiceCloudScanListener = new ndf(this);
      }
      localISecureModuleService.registerCloudScanListener(a(), jdField_a_of_type_ComTencentSecuremoduleServiceCloudScanListener);
      localISecureModuleService.cloudScan();
    }
    while (!QLog.isColorLevel()) {
      return;
    }
    QLog.e("security_scan", 2, "regist security service error");
  }
  
  public void B()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppCallTabUnreadListener != null) {
      jdField_a_of_type_ComTencentMobileqqAppCallTabUnreadListener.a();
    }
  }
  
  public void C()
  {
    if (jdField_a_of_type_ComTencentMobileqqJumplightalkCallRedDotLightalkLis != null) {
      jdField_a_of_type_ComTencentMobileqqJumplightalkCallRedDotLightalkLis.a();
    }
  }
  
  public void D()
  {
    long l2 = 0L;
    long l1;
    if ((!jdField_a_of_type_AndroidOsHandler.hasMessages(0)) && (j))
    {
      l1 = l2;
      if (jdField_b_of_type_Long != 0L)
      {
        l1 = dv - (SystemClock.uptimeMillis() - jdField_b_of_type_Long);
        if (l1 >= 0L) {
          break label116;
        }
        l1 = l2;
      }
    }
    label116:
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "onResume send msg " + l1);
      }
      Message localMessage = jdField_a_of_type_AndroidOsHandler.obtainMessage(0, new WeakReference(this));
      jdField_a_of_type_AndroidOsHandler.sendMessageDelayed(localMessage, l1);
      return;
    }
  }
  
  public void E()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade != null) {
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.j();
    }
    Object localObject = (SubAccountManager)getManager(60);
    if (localObject != null) {
      ((SubAccountManager)localObject).c();
    }
    localObject = (ActivateFriendsManager)getManager(84);
    if (localObject != null) {
      ((ActivateFriendsManager)localObject).b();
    }
  }
  
  public void F()
  {
    if (jdField_a_of_type_JavaUtilArrayList == null) {}
    try
    {
      a(getApplication().getAssets().open("qqtags.xml"));
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public void G()
  {
    if ((isBackground_Stop) && (BadgeUtils.a())) {
      ThreadManager.a(new ndj(this), 5, null, false);
    }
  }
  
  public void H()
  {
    try
    {
      AccessibilityManager localAccessibilityManager = (AccessibilityManager)jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getSystemService("accessibility");
      bool1 = localAccessibilityManager.isEnabled();
      boolean bool2 = localAccessibilityManager.isTouchExplorationEnabled();
      if ((!bool1) || (!bool2)) {
        break label100;
      }
      bool1 = true;
      AppSetting.i = bool1;
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "set talkback enable: " + AppSetting.i);
      }
    }
    catch (Throwable localThrowable)
    {
      boolean bool1;
      label100:
      for (;;) {}
    }
    if (AppSetting.i) {
      if (jdField_a_of_type_AndroidSpeechTtsTextToSpeech == null) {
        jdField_a_of_type_AndroidSpeechTtsTextToSpeech = new TextToSpeech(BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl, null);
      }
    }
    while (jdField_a_of_type_AndroidSpeechTtsTextToSpeech == null)
    {
      return;
      bool1 = false;
      break;
    }
    jdField_a_of_type_AndroidSpeechTtsTextToSpeech.stop();
    jdField_a_of_type_AndroidSpeechTtsTextToSpeech = null;
  }
  
  public void I()
  {
    int i1 = 2131369973;
    if ((jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl != null) && (isLogin()))
    {
      if (QLog.isColorLevel()) {
        QLog.d("raw_photo", 2, "onX2Mobile ");
      }
      localObject1 = a();
      bool1 = ((TransFileController)localObject1).c();
      bool2 = ((TransFileController)localObject1).a();
      bool3 = ((TransFileController)localObject1).b();
      localObject2 = BaseActivity.sTopActivity;
      localObject1 = localObject2;
      if (localObject2 == null) {
        localObject1 = jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl;
      }
      if ((bool1) || (bool2) || (bool3))
      {
        localObject2 = new Intent((Context)localObject1, DialogActivity.class);
        ((Intent)localObject2).addFlags(268435456);
        ((Intent)localObject2).addFlags(536870912);
        ((Intent)localObject2).addFlags(67108864);
        ((Intent)localObject2).addFlags(131072);
        if (!bool2) {
          break label307;
        }
        if (!bool3) {
          break label296;
        }
      }
    }
    label296:
    label307:
    while (!QLog.isColorLevel())
    {
      Object localObject1;
      boolean bool1;
      boolean bool2;
      boolean bool3;
      Object localObject2;
      i1 = 2131369972;
      for (;;)
      {
        if (QLog.isColorLevel())
        {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "onX2Mobile==============pauseAllRawSendC2C:" + bool1);
          QLog.d(jdField_a_of_type_JavaLangString, 2, "onX2Mobile==============pauseAllShortVideoSend:" + bool2);
          QLog.d(jdField_a_of_type_JavaLangString, 2, "onX2Mobile==============pauseAllShortVideoReceive:" + bool3);
          QLog.d(jdField_a_of_type_JavaLangString, 2, "onX2Mobile==============dialog message:" + ((Context)localObject1).getResources().getString(i1));
        }
        ((Intent)localObject2).putExtra("key_dialog_msg_id", i1);
        ((Context)localObject1).startActivity((Intent)localObject2);
        return;
        if (!bool1)
        {
          i1 = 2131369969;
          continue;
          if (bool3)
          {
            if (!bool1) {
              i1 = 2131369970;
            }
          }
          else {
            i1 = 2131369971;
          }
        }
      }
    }
    QLog.d(jdField_a_of_type_JavaLangString, 2, "onX2Mobile app = null,maybe not QQ process");
  }
  
  public void J()
  {
    if (jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl != null) {
      if (QLog.isColorLevel()) {
        QLog.d("raw_photo", 2, "onX2Wifi ");
      }
    }
    while (!QLog.isColorLevel()) {
      return;
    }
    QLog.d(jdField_a_of_type_JavaLangString, 2, "onX2Wifi app = null,maybe not QQ process");
  }
  
  public int a()
  {
    return AppSetting.a;
  }
  
  public int a(int paramInt)
  {
    int i2 = -1;
    int i1;
    if ((jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl == null) || (paramInt < 0) || (paramInt >= 7))
    {
      i1 = i2;
      if (QLog.isColorLevel())
      {
        QLog.e(jdField_a_of_type_JavaLangString, 2, "readCallTabStateVal wrong index," + paramInt);
        i1 = i2;
      }
    }
    do
    {
      String str;
      do
      {
        return i1;
        str = SettingCloneUtil.readValue(getApplication(), a(), null, "qqsetting_calltab_show_key", "0111100");
        if ((str != null) && (str.length() == 7)) {
          break;
        }
        i1 = i2;
      } while (!QLog.isColorLevel());
      QLog.e(jdField_a_of_type_JavaLangString, 2, "readCallTabStateVal val is null");
      return -1;
      i2 = str.charAt(paramInt) - '0';
      i1 = i2;
    } while (!QLog.isColorLevel());
    QLog.i(jdField_a_of_type_JavaLangString, 2, "uin:" + a() + ",readCallTabStateVal index=" + paramInt + ", resut=" + i2);
    return i2;
  }
  
  public int a(String paramString)
  {
    int i3 = 0;
    try
    {
      Class[] arrayOfClass = Class.forName("com.android.internal.R").getDeclaredClasses();
      int i4 = arrayOfClass.length;
      int i1 = 0;
      for (;;)
      {
        int i2 = i3;
        if (i1 < i4)
        {
          Class localClass = arrayOfClass[i1];
          if ("id".equals(localClass.getSimpleName())) {
            i2 = localClass.getDeclaredField(paramString).getInt(null);
          }
        }
        else
        {
          return i2;
        }
        i1 += 1;
      }
      return 0;
    }
    catch (Exception paramString) {}
  }
  
  public long a()
  {
    if ((getAccount() != null) && (isLogin()))
    {
      if (jdField_d_of_type_Long == 31L)
      {
        jdField_d_of_type_Long = a().getSharedPreferences("acc_info" + getAccount(), 0).getLong("getProfileStatusNew", 11L);
        if (jdField_d_of_type_Long == 31L)
        {
          jdField_d_of_type_Long = 11L;
          a(11L, false);
        }
      }
      return jdField_d_of_type_Long;
    }
    return -1L;
  }
  
  public Intent a()
  {
    return jdField_b_of_type_AndroidContentIntent;
  }
  
  public Intent a(Context paramContext, QQMessageFacade.Message paramMessage, boolean paramBoolean)
  {
    if ((istroop == 1000) || (istroop == 1020) || (istroop == 1004))
    {
      if (RecentUtil.a(this, frienduin)) {
        return a(a(), paramMessage, 0);
      }
      return b(paramContext, paramMessage, paramBoolean);
    }
    return a(a(), paramMessage, istroop);
  }
  
  public Bitmap a(int paramInt1, String paramString, byte paramByte1, boolean paramBoolean, byte paramByte2, int paramInt2)
  {
    if ((paramInt1 == 1) && (paramString != null) && ((paramString.equals(AppConstants.ar)) || (paramString.equals(AppConstants.aq)) || (paramString.equals(AppConstants.an)) || (paramString.equals(AppConstants.ap)))) {
      return ImageUtil.g();
    }
    if ((paramInt1 == 11) && (!StringUtil.e(paramString))) {
      return null;
    }
    if (TextUtils.isEmpty(paramString)) {
      return null;
    }
    if ((paramInt1 == 101) || (paramInt1 == 1001)) {
      paramByte1 = 1;
    }
    String str1 = a(paramInt1, paramString, paramByte1, paramInt2);
    Object localObject1 = a(str1);
    boolean bool;
    String str2;
    BitmapManager.BitmapDecodeResult localBitmapDecodeResult;
    int i1;
    label329:
    Object localObject2;
    if (localObject1 == null) {
      if (paramBoolean)
      {
        localObject1 = a(paramInt1, paramString, paramInt2);
        if (localObject1 != null)
        {
          bool = ((Boolean)first).booleanValue();
          str2 = a(paramInt1, paramString, paramInt2);
          localObject1 = new BitmapFactory.Options();
          inPreferredConfig = jdField_a_of_type_AndroidGraphicsBitmap$Config;
          localBitmapDecodeResult = new BitmapManager.BitmapDecodeResult();
          i1 = 0;
          do
          {
            BitmapManager.a(str2, (BitmapFactory.Options)localObject1, localBitmapDecodeResult);
            if (e == 1) {
              K();
            }
            i1 += 1;
          } while ((i1 < 2) && (e == 1));
          if (e != 0) {
            QLog.i("Q.qqhead.qaif", 2, "getFaceBitmap decodeFile fail, faceType=" + paramInt1 + ", uin=" + paramString + ", result=" + e + ", facePath=" + str2);
          }
          if ((!bool) && (e == 1)) {
            return null;
          }
          if (e != 2)
          {
            i1 = 1;
            localObject1 = a;
            if ((localObject1 == null) && (e != 1) && (i1 != 0))
            {
              if (paramInt1 != 4) {
                break label892;
              }
              localObject2 = "troop_" + paramString;
            }
          }
        }
      }
    }
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        if (jdField_a_of_type_JavaUtilHashMap == null) {
          jdField_a_of_type_JavaUtilHashMap = new HashMap();
        }
        Integer localInteger = (Integer)jdField_a_of_type_JavaUtilHashMap.get(localObject2);
        int i2;
        if (localInteger == null)
        {
          i2 = 0;
          QLog.i("Q.qqhead.qaif", 1, "getFaceBitmap|file is damaged, key = " + (String)localObject2 + ", nDecodeFailCount = " + i2);
          if (i2 < 3)
          {
            i2 += 1;
            jdField_a_of_type_JavaUtilHashMap.put(localObject2, Integer.valueOf(i2));
            FileUtils.d(str2);
            QLog.i("Q.qqhead.qaif", 1, "getFaceBitmap|file is damaged, key = " + (String)localObject2 + ", del the damaged file" + ",nDecodeFailCount=" + i2);
          }
          if (localObject1 == null) {
            break label889;
          }
        }
        switch (paramByte1)
        {
        case 2: 
        default: 
          localObject1 = a((Bitmap)localObject1);
          if (localObject1 == null) {
            break label747;
          }
          a(str1, (Bitmap)localObject1, paramByte2);
          if (((localObject1 == null) && (paramBoolean) && (i1 == 0)) || (bool))
          {
            if (i1 == 0) {
              break label811;
            }
            paramByte2 = 1;
            localObject2 = (FriendListHandler)a(1);
          }
          switch (paramInt1)
          {
          default: 
            return localObject1;
            i1 = 0;
            break label329;
            i2 = localInteger.intValue();
          }
          break;
        }
      }
      continue;
      localObject1 = a((Bitmap)localObject1, 50, 50);
      continue;
      label747:
      if ((QLog.isColorLevel()) && (e == 0)) {
        QLog.i("Q.qqhead.qaif", 2, "getFaceBitmap decode shape fail, faceType=" + paramInt1 + ", uin=" + paramString + ", shape=" + paramByte1);
      }
      continue;
      label811:
      paramByte2 = 2;
      continue;
      ((FriendListHandler)localObject2).b(paramString, paramByte2);
      continue;
      ((FriendListHandler)localObject2).a(paramString, paramByte2);
      continue;
      ((FriendListHandler)localObject2).a(paramString, (byte)0, paramByte2);
      continue;
      ((FriendListHandler)localObject2).a(paramString, paramInt2, (byte)1, paramByte2);
      continue;
      ((FriendListHandler)localObject2).b(paramString, paramInt2, (byte)1, paramByte2);
      continue;
      ((FriendListHandler)localObject2).b(paramString, paramByte1);
      continue;
      label889:
      continue;
      label892:
      localObject2 = paramString;
      continue;
      bool = false;
      break;
      bool = false;
      i1 = 0;
    }
  }
  
  public Bitmap a(int paramInt1, String paramString, byte paramByte, boolean paramBoolean, int paramInt2)
  {
    return a(paramInt1, paramString, paramByte, paramBoolean, (byte)1, paramInt2);
  }
  
  public Bitmap a(int paramInt1, String paramString, boolean paramBoolean, int paramInt2)
  {
    return a(paramInt1, paramString, (byte)3, paramBoolean, paramInt2);
  }
  
  public Bitmap a(Bitmap paramBitmap)
  {
    return ImageUtil.b(paramBitmap, 50, 50);
  }
  
  public Bitmap a(Bitmap paramBitmap, int paramInt1, int paramInt2)
  {
    float f2 = jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getResources().getDisplayMetrics().density;
    int i1 = paramBitmap.getWidth();
    float f1 = f2;
    if (i1 > 0)
    {
      f1 = f2;
      if (i1 < paramInt1 * f2) {
        f1 = i1 / paramInt1;
      }
    }
    paramInt1 = (int)(paramInt1 * f1);
    paramInt2 = (int)(f1 * paramInt2);
    return ImageUtil.a(paramBitmap, paramInt1, paramInt1, paramInt2);
  }
  
  public Bitmap a(String paramString)
  {
    if (jdField_a_of_type_AndroidSupportV4UtilMQLruCache != null)
    {
      Bitmap localBitmap2 = (Bitmap)jdField_a_of_type_AndroidSupportV4UtilMQLruCache.get(paramString);
      Bitmap localBitmap1 = localBitmap2;
      if (localBitmap2 != null)
      {
        localBitmap1 = localBitmap2;
        if (jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap != null)
        {
          localBitmap1 = localBitmap2;
          if (jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString))
          {
            long l1 = ((Long)jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString)).longValue();
            localBitmap1 = localBitmap2;
            if (System.currentTimeMillis() - l1 > 86400000L)
            {
              jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.remove(paramString);
              jdField_a_of_type_AndroidSupportV4UtilMQLruCache.remove(paramString);
              localBitmap1 = null;
            }
          }
        }
      }
      return localBitmap1;
    }
    return null;
  }
  
  public Bitmap a(String paramString, byte paramByte, boolean paramBoolean)
  {
    return a(1, paramString, paramByte, paramBoolean, 0);
  }
  
  public Bitmap a(String paramString, byte paramByte, boolean paramBoolean1, boolean paramBoolean2)
  {
    Object localObject = a(4, paramString, paramByte, true, 0);
    paramString = (String)localObject;
    if (localObject == null) {
      paramString = ImageUtil.e();
    }
    localObject = paramString;
    if (paramString != null)
    {
      localObject = paramString;
      if (paramBoolean1) {
        localObject = ImageUtil.a(paramString);
      }
    }
    paramString = (String)localObject;
    if (localObject != null)
    {
      paramString = (String)localObject;
      if (paramBoolean2) {
        paramString = b((Bitmap)localObject);
      }
    }
    return paramString;
  }
  
  public Bitmap a(String paramString, int paramInt)
  {
    return a(32, paramString, true, paramInt);
  }
  
  public Bitmap a(String paramString, boolean paramBoolean)
  {
    return a(1, paramString, (byte)3, paramBoolean, 0);
  }
  
  public Drawable a(int paramInt)
  {
    Object localObject = null;
    try
    {
      Bitmap localBitmap = BitmapFactory.decodeResource(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getResources(), paramInt);
      localObject = localBitmap;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      for (;;)
      {
        localOutOfMemoryError.printStackTrace();
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
    return a(localObject);
  }
  
  public Drawable a(int paramInt, String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    return null;
  }
  
  public Drawable a(Bitmap paramBitmap)
  {
    return new BitmapDrawable(a(paramBitmap));
  }
  
  public Drawable a(String paramString)
  {
    return a(paramString, (byte)3, false, false);
  }
  
  @Deprecated
  public Drawable a(String paramString, byte paramByte)
  {
    Bitmap localBitmap = a(11, paramString, paramByte, true, 0);
    paramString = localBitmap;
    if (localBitmap == null) {
      paramString = ImageUtil.a();
    }
    return new BitmapDrawable(paramString);
  }
  
  public Drawable a(String paramString, byte paramByte, boolean paramBoolean1, boolean paramBoolean2)
  {
    Object localObject = a(paramString, paramByte, paramBoolean1, paramBoolean2);
    paramString = null;
    if (localObject != null) {
      paramString = new BitmapDrawable((Bitmap)localObject);
    }
    localObject = paramString;
    if (paramString == null) {
      localObject = ImageUtil.c();
    }
    return localObject;
  }
  
  @Deprecated
  public Drawable a(String paramString, boolean paramBoolean)
  {
    return a(paramString, paramBoolean, (byte)3);
  }
  
  public Pair a(int paramInt1, String paramString, int paramInt2)
  {
    String str;
    if (paramInt1 == 4)
    {
      str = "troop_" + paramString;
      if (TextUtils.isEmpty(str)) {
        break label463;
      }
    }
    label463:
    for (Setting localSetting1 = (Setting)jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.get(str);; localSetting1 = null)
    {
      Setting localSetting2 = localSetting1;
      if (localSetting1 == null)
      {
        localSetting2 = localSetting1;
        if (!l)
        {
          localSetting2 = localSetting1;
          if (!TextUtils.isEmpty(str))
          {
            localSetting2 = localSetting1;
            if (!jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(str))
            {
              localSetting2 = localSetting1;
              if (jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager != null)
              {
                localSetting1 = (Setting)jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(Setting.class, str);
                localSetting2 = localSetting1;
                if (localSetting1 != null)
                {
                  jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.put(str, localSetting1);
                  localSetting2 = localSetting1;
                }
              }
            }
          }
        }
      }
      if (localSetting2 == null)
      {
        return new Pair(Boolean.valueOf(true), localSetting2);
        if (paramInt1 == 32)
        {
          str = "stranger_" + String.valueOf(paramInt2) + "_" + paramString;
          break;
        }
        if (paramInt1 == 16)
        {
          str = "qcall_" + String.valueOf(paramInt2) + "_" + paramString;
          break;
        }
        if (paramInt1 == 109)
        {
          str = TroopUtils.a(paramString);
          break;
        }
        str = paramString;
        break;
      }
      boolean bool;
      switch (paramInt1)
      {
      default: 
        bool = false;
      }
      for (;;)
      {
        if ((QLog.isColorLevel()) && (bool)) {
          QLog.i("Q.qqhead.qaif", 2, "getQQHeadSetting. | uin=" + paramString + ", isNeedCheckQQHead=" + bool + ", accountStartTime=" + jdField_f_of_type_Long + ", updateTimestamp=" + updateTimestamp);
        }
        return new Pair(Boolean.valueOf(bool), localSetting2);
        if ((localSetting2 == null) || (System.currentTimeMillis() - updateTimestamp > 86400000L)) {
          bool = true;
        } else {
          bool = false;
        }
      }
    }
  }
  
  public Pair a(String paramString, int paramInt1, int paramInt2)
  {
    boolean bool = false;
    paramString = a(1, paramString, (byte)3, true, 0);
    if (paramString == null) {
      paramString = ImageUtil.a();
    }
    for (;;)
    {
      return Pair.create(Boolean.valueOf(bool), paramString);
      bool = true;
    }
  }
  
  public AvAddFriendService a()
  {
    if (jdField_a_of_type_ComTencentAvAppAvAddFriendService == null) {
      jdField_a_of_type_ComTencentAvAppAvAddFriendService = new AvAddFriendService(this);
    }
    return jdField_a_of_type_ComTencentAvAppAvAddFriendService;
  }
  
  public AVNotifyCenter a()
  {
    if (jdField_a_of_type_ComTencentAvGaudioAVNotifyCenter == null) {
      jdField_a_of_type_ComTencentAvGaudioAVNotifyCenter = new AVNotifyCenter(this);
    }
    return jdField_a_of_type_ComTencentAvGaudioAVNotifyCenter;
  }
  
  public BusinessHandler a(int paramInt)
  {
    Object localObject1 = jdField_a_of_type_ArrayOfComTencentMobileqqAppBusinessHandler[paramInt];
    if (localObject1 != null) {
      return localObject1;
    }
    synchronized (jdField_a_of_type_ArrayOfComTencentMobileqqAppBusinessHandler)
    {
      BusinessHandler localBusinessHandler = jdField_a_of_type_ArrayOfComTencentMobileqqAppBusinessHandler[paramInt];
      localObject1 = localBusinessHandler;
      if (localBusinessHandler == null)
      {
        localBusinessHandler = b(paramInt);
        localObject1 = localBusinessHandler;
        if (localBusinessHandler != null)
        {
          jdField_a_of_type_ArrayOfComTencentMobileqqAppBusinessHandler[paramInt] = localBusinessHandler;
          localObject1 = localBusinessHandler;
        }
      }
      return localObject1;
    }
  }
  
  public CheckPttListener a()
  {
    return jdField_a_of_type_ComTencentMobileqqAppCheckPttListener;
  }
  
  public HotChatManager a(boolean paramBoolean)
  {
    if ((jdField_a_of_type_ComTencentMobileqqAppHotChatManager == null) && (paramBoolean)) {
      jdField_a_of_type_ComTencentMobileqqAppHotChatManager = ((HotChatManager)getManager(59));
    }
    return jdField_a_of_type_ComTencentMobileqqAppHotChatManager;
  }
  
  public LebaHelper a()
  {
    o();
    return jdField_a_of_type_ComTencentMobileqqAppLebaHelper;
  }
  
  public MessageHandler a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMessageHandler == null) {
      jdField_a_of_type_ComTencentMobileqqAppMessageHandler = ((MessageHandler)a(0));
    }
    return jdField_a_of_type_ComTencentMobileqqAppMessageHandler;
  }
  
  public QQGAudioMsgHandler a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQGAudioMsgHandler == null) {
      jdField_a_of_type_ComTencentMobileqqAppQQGAudioMsgHandler = new QQGAudioMsgHandler(this);
    }
    return jdField_a_of_type_ComTencentMobileqqAppQQGAudioMsgHandler;
  }
  
  public SQLiteDatabase a()
  {
    SQLiteOpenHelper localSQLiteOpenHelper = a();
    if (localSQLiteOpenHelper != null) {
      return localSQLiteOpenHelper.a();
    }
    return null;
  }
  
  public SQLiteDatabase a(String paramString)
  {
    paramString = a(paramString);
    if (paramString != null) {
      return paramString.a();
    }
    return null;
  }
  
  public CacheManager a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheManager == null) {
      jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheManager = ((CacheManager)getManager(18));
    }
    return jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheManager;
  }
  
  public ConversationFacade a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMessageConversationFacade == null) {
      jdField_a_of_type_ComTencentMobileqqAppMessageConversationFacade = ((ConversationFacade)getManager(28));
    }
    return jdField_a_of_type_ComTencentMobileqqAppMessageConversationFacade;
  }
  
  public MsgProxy a(int paramInt)
  {
    if (a() != null) {
      return a().a().a(paramInt);
    }
    return null;
  }
  
  public MultiMsgProxy a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager != null) {
      return jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a();
    }
    return null;
  }
  
  public QQMessageFacade a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade == null) {
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade = ((QQMessageFacade)getManager(19));
    }
    return jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade;
  }
  
  public DataLineMsgProxy a(int paramInt)
  {
    return a().a(paramInt);
  }
  
  public FTSDBManager a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppProxyFTSDBManager == null) {
      jdField_a_of_type_ComTencentMobileqqAppProxyFTSDBManager = ((FTSDBManager)getManager(129));
    }
    return jdField_a_of_type_ComTencentMobileqqAppProxyFTSDBManager;
  }
  
  public ProxyManager a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager == null) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager = ((ProxyManager)getManager(17));
    }
    return jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager;
  }
  
  public AboutConfig a()
  {
    O();
    return jdField_a_of_type_ComTencentMobileqqConfigAboutConfig;
  }
  
  public Config a(String paramString)
  {
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqConfigConfig == null) {
        jdField_a_of_type_ComTencentMobileqqConfigConfig = new Config(this, paramString);
      }
      paramString = jdField_a_of_type_ComTencentMobileqqConfigConfig;
      return paramString;
    }
    finally {}
  }
  
  public Setting a(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    while (!l) {
      return null;
    }
    return (Setting)jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
  }
  
  public FileManagerEngine a()
  {
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileManagerEngine == null) {
      jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileManagerEngine = new FileManagerEngine(this);
    }
    return jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileManagerEngine;
  }
  
  public FileTransferHandler a()
  {
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferHandler == null) {
      jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferHandler = new FileTransferHandler(this);
    }
    return jdField_a_of_type_ComTencentMobileqqFilemanagerAppFileTransferHandler;
  }
  
  public FileManagerDataCenter a()
  {
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerDataCenter == null) {
      jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerDataCenter = new FileManagerDataCenter(this);
    }
    return jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerDataCenter;
  }
  
  public FileManagerNotifyCenter a()
  {
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerNotifyCenter == null) {
      jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerNotifyCenter = new FileManagerNotifyCenter(this);
    }
    return jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerNotifyCenter;
  }
  
  public FileManagerRSCenter a()
  {
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerRSCenter == null) {
      jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerRSCenter = new FileManagerRSCenter(this);
    }
    return jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerRSCenter;
  }
  
  public OnlineFileSessionCenter a()
  {
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerCoreOnlineFileSessionCenter == null) {
      jdField_a_of_type_ComTencentMobileqqFilemanagerCoreOnlineFileSessionCenter = new OnlineFileSessionCenter(this);
    }
    return jdField_a_of_type_ComTencentMobileqqFilemanagerCoreOnlineFileSessionCenter;
  }
  
  public FileManagerProxy a()
  {
    ProxyManager localProxyManager = a();
    if (localProxyManager != null) {
      return localProxyManager.a();
    }
    return null;
  }
  
  public PrivacyInfoUtil a()
  {
    if (jdField_a_of_type_ComTencentMobileqqFilemanagerUtilPrivacyInfoUtil == null) {
      jdField_a_of_type_ComTencentMobileqqFilemanagerUtilPrivacyInfoUtil = new PrivacyInfoUtil();
    }
    return jdField_a_of_type_ComTencentMobileqqFilemanagerUtilPrivacyInfoUtil;
  }
  
  public UniformDownloadBPTransProxy a()
  {
    ProxyManager localProxyManager = a();
    if (localProxyManager != null) {
      return localProxyManager.a();
    }
    return null;
  }
  
  public NearbyProxy a()
  {
    return (NearbyProxy)getManager(115);
  }
  
  public EntityManagerFactory a()
  {
    String str = getAccount();
    if (str == null) {
      throw new IllegalStateException("WTF");
    }
    if (jdField_a_of_type_ComTencentMobileqqDataQQEntityManagerFactory != null) {
      return jdField_a_of_type_ComTencentMobileqqDataQQEntityManagerFactory;
    }
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqDataQQEntityManagerFactory == null)
      {
        jdField_a_of_type_ComTencentMobileqqDataQQEntityManagerFactory = new QQEntityManagerFactory(str);
        ThreadManager.b().postDelayed(new ndo(this), 3000L);
      }
      return jdField_a_of_type_ComTencentMobileqqDataQQEntityManagerFactory;
    }
    finally {}
  }
  
  @Deprecated
  public EntityManagerFactory a(String paramString)
  {
    if (!paramString.equals(getAccount())) {
      throw new IllegalStateException(paramString + "!=" + getAccount());
    }
    return a();
  }
  
  public PicPreDownloader a()
  {
    if (jdField_a_of_type_ComTencentMobileqqPicPicPreDownloader == null) {
      jdField_a_of_type_ComTencentMobileqqPicPicPreDownloader = ((PicPreDownloader)getManager(38));
    }
    return jdField_a_of_type_ComTencentMobileqqPicPicPreDownloader;
  }
  
  public QCallFacade a()
  {
    if (jdField_a_of_type_ComTencentMobileqqQcallQCallFacade == null) {
      jdField_a_of_type_ComTencentMobileqqQcallQCallFacade = ((QCallFacade)getManager(37));
    }
    return jdField_a_of_type_ComTencentMobileqqQcallQCallFacade;
  }
  
  public QzoneContactsFeedManager a()
  {
    return (QzoneContactsFeedManager)getManager(90);
  }
  
  public MessageCache a()
  {
    if (jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache == null) {}
    synchronized (jdField_a_of_type_ArrayOfComTencentMobileqqAppBusinessHandler)
    {
      if (jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache == null) {
        jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache = new MessageCache(this);
      }
      return jdField_a_of_type_ComTencentMobileqqServiceMessageMessageCache;
    }
  }
  
  public ShortVideoPreDownloader a()
  {
    if (jdField_a_of_type_ComTencentMobileqqShortvideoShortVideoPreDownloader == null) {
      jdField_a_of_type_ComTencentMobileqqShortvideoShortVideoPreDownloader = ((ShortVideoPreDownloader)getManager(94));
    }
    return jdField_a_of_type_ComTencentMobileqqShortvideoShortVideoPreDownloader;
  }
  
  public ReportController a()
  {
    if (jdField_a_of_type_ComTencentMobileqqStatisticsReportController == null) {}
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqStatisticsReportController == null) {
        jdField_a_of_type_ComTencentMobileqqStatisticsReportController = ReportControllerImpl.a(this);
      }
      return jdField_a_of_type_ComTencentMobileqqStatisticsReportController;
    }
    finally {}
  }
  
  public INetEngine a(int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqTransfileNetEngineFactory == null) {
      jdField_a_of_type_ComTencentMobileqqTransfileNetEngineFactory = ((NetEngineFactory)getManager(20));
    }
    return jdField_a_of_type_ComTencentMobileqqTransfileNetEngineFactory.a(this, paramInt);
  }
  
  public TransFileController a()
  {
    if (jdField_a_of_type_ComTencentMobileqqTransfileTransFileController == null) {
      jdField_a_of_type_ComTencentMobileqqTransfileTransFileController = new TransFileController(this);
    }
    return jdField_a_of_type_ComTencentMobileqqTransfileTransFileController;
  }
  
  public BaseApplication a()
  {
    return jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl;
  }
  
  public ISecureModuleService a()
  {
    if (jdField_a_of_type_ComTencentSecuremoduleServiceISecureModuleService == null) {
      jdField_a_of_type_ComTencentSecuremoduleServiceISecureModuleService = SecureModuleService.getInstance(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl);
    }
    return jdField_a_of_type_ComTencentSecuremoduleServiceISecureModuleService;
  }
  
  public QQProxyForQlink a()
  {
    if (jdField_a_of_type_CooperationQlinkQQProxyForQlink == null) {
      jdField_a_of_type_CooperationQlinkQQProxyForQlink = new QQProxyForQlink(this);
    }
    return jdField_a_of_type_CooperationQlinkQQProxyForQlink;
  }
  
  public QlinkServiceManager a()
  {
    if (jdField_a_of_type_CooperationQlinkQlinkServiceManager == null) {
      jdField_a_of_type_CooperationQlinkQlinkServiceManager = new QlinkServiceManager(this);
    }
    return jdField_a_of_type_CooperationQlinkQlinkServiceManager;
  }
  
  public String a()
  {
    return getAccount();
  }
  
  public String a(int paramInt, String paramString)
  {
    Object localObject = MD5.toMD5(paramString);
    localObject = MD5.toMD5((String)localObject + paramString);
    paramString = MD5.toMD5((String)localObject + paramString);
    localObject = new StringBuilder(256);
    if (paramInt == 4) {
      if (SystemUtil.a()) {
        ((StringBuilder)localObject).append(AppConstants.bA);
      }
    }
    for (;;)
    {
      if (paramInt == 101) {
        ((StringBuilder)localObject).append("discussion_");
      }
      ((StringBuilder)localObject).append(paramString);
      ((StringBuilder)localObject).append(".png");
      return ((StringBuilder)localObject).toString();
      ((StringBuilder)localObject).append(SystemUtil.b + "head/_thd/");
      continue;
      if (SystemUtil.a()) {
        ((StringBuilder)localObject).append(AppConstants.bz);
      } else {
        ((StringBuilder)localObject).append(SystemUtil.b + "head/_hd/");
      }
    }
  }
  
  public String a(int paramInt1, String paramString, byte paramByte, int paramInt2)
  {
    StringBuilder localStringBuilder = new StringBuilder(16);
    Object[] arrayOfObject = a(paramInt1, paramString, paramInt2);
    switch (((Integer)arrayOfObject[0]).intValue())
    {
    }
    for (;;)
    {
      localStringBuilder.append(paramString);
      if (paramByte > 0) {
        localStringBuilder.append("_").append(paramByte);
      }
      return localStringBuilder.toString();
      localStringBuilder.append("troop_sys_b_");
      paramString = (String)arrayOfObject[1];
      continue;
      localStringBuilder.append("sys_");
      paramString = (String)arrayOfObject[1];
      continue;
      localStringBuilder.append("dis_e_");
      continue;
      localStringBuilder.append("dis_pstn_e_");
      continue;
      localStringBuilder.append("troop_");
      continue;
      localStringBuilder.append("sub_");
      localStringBuilder.append("stranger_").append(Integer.toString(paramInt2)).append("_");
      continue;
      localStringBuilder.append("qcall_").append(Integer.toString(paramInt2)).append("_");
      continue;
      localStringBuilder.append("troopOrg_");
      paramString = (String)arrayOfObject[1];
    }
  }
  
  public String a(int paramInt1, String paramString, int paramInt2)
  {
    StringBuilder localStringBuilder = new StringBuilder(256);
    Object localObject;
    if (paramInt1 == 32) {
      if (SystemUtil.a())
      {
        localStringBuilder.append(AppConstants.bD);
        localObject = a(paramInt1, paramString, paramInt2);
        switch (((Integer)localObject[0]).intValue())
        {
        }
      }
    }
    for (;;)
    {
      localObject = MD5.toMD5(paramString);
      localObject = MD5.toMD5((String)localObject + paramString);
      localStringBuilder.append(MD5.toMD5((String)localObject + paramString));
      localStringBuilder.append(".jpg_");
      return localStringBuilder.toString();
      localStringBuilder.append(SystemUtil.b + "head/_stranger/");
      break;
      if (SystemUtil.a())
      {
        localStringBuilder.append(AppConstants.bz);
        break;
      }
      localStringBuilder.append(SystemUtil.b + "head/_hd/");
      break;
      localStringBuilder.append("troop_sys_b_");
      paramString = (String)localObject[1];
      continue;
      localStringBuilder.append("sys_");
      paramString = (String)localObject[1];
      continue;
      localStringBuilder.append("dis_e_");
      paramString = a() + paramString;
      continue;
      localStringBuilder.append("dis_pstn_e_");
      paramString = a() + paramString;
      continue;
      localStringBuilder.append("troop_");
      continue;
      localStringBuilder.append("stranger_").append(Integer.toString(paramInt2)).append("_");
      continue;
      localStringBuilder.append("qcall_").append(Integer.toString(paramInt2)).append("_");
      continue;
      localStringBuilder.append("troopOrg_");
      paramString = (String)localObject[1];
    }
  }
  
  public String a(ServerConfigManager.ConfigType paramConfigType, String paramString)
  {
    Object localObject2 = null;
    StringBuilder localStringBuilder;
    if (QLog.isColorLevel())
    {
      localStringBuilder = new StringBuilder(32);
      localStringBuilder.append("getServerConfigValue type=").append(paramConfigType).append(", key=").append(paramString).append(", value=");
    }
    for (;;)
    {
      long l1 = System.currentTimeMillis();
      if ((jdField_b_of_type_JavaUtilHashtable.containsKey(paramConfigType)) && (jdField_b_of_type_JavaUtilHashMap.containsKey(paramConfigType)) && (l1 - ((Long)jdField_b_of_type_JavaUtilHashMap.get(paramConfigType)).longValue() < 7200000L))
      {
        paramConfigType = (HashMap)jdField_b_of_type_JavaUtilHashtable.get(paramConfigType);
        if (paramConfigType.containsKey(paramString))
        {
          if (QLog.isColorLevel())
          {
            localStringBuilder.append((String)paramConfigType.get(paramString));
            QLog.d(jdField_a_of_type_JavaLangString, 2, localStringBuilder.toString());
          }
          paramConfigType = (String)paramConfigType.get(paramString);
        }
      }
      label277:
      do
      {
        do
        {
          return paramConfigType;
          paramConfigType = localObject2;
        } while (!QLog.isColorLevel());
        localStringBuilder.append("null");
        QLog.d(jdField_a_of_type_JavaLangString, 2, localStringBuilder.toString());
        return null;
        if (getAccount() == null) {}
        for (Object localObject1 = "0";; localObject1 = getAccount())
        {
          localObject1 = ((ServerConfigManager)getManager(4)).getServerConfig((String)localObject1, paramConfigType);
          if ((localObject1 != null) && (((String)localObject1).length() != 0)) {
            break label277;
          }
          paramConfigType = localObject2;
          if (!QLog.isColorLevel()) {
            break;
          }
          localStringBuilder.append("null, configText is null");
          QLog.d(jdField_a_of_type_JavaLangString, 2, localStringBuilder.toString());
          return null;
        }
        try
        {
          localObject1 = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ServerConfig>" + (String)localObject1 + "</ServerConfig>";
          XMLReader localXMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
          ndv localNdv = new ndv(this);
          localXMLReader.setContentHandler(localNdv);
          localXMLReader.parse(new InputSource(new ByteArrayInputStream(((String)localObject1).getBytes("UTF-8"))));
          localObject1 = localNdv.a();
          jdField_b_of_type_JavaUtilHashtable.put(paramConfigType, localObject1);
          jdField_b_of_type_JavaUtilHashMap.put(paramConfigType, Long.valueOf(l1));
          if (QLog.isColorLevel())
          {
            localStringBuilder.append((String)((HashMap)localObject1).get(paramString));
            QLog.d(jdField_a_of_type_JavaLangString, 2, localStringBuilder.toString());
          }
          paramConfigType = (String)((HashMap)localObject1).get(paramString);
          return paramConfigType;
        }
        catch (Exception paramString)
        {
          paramConfigType = localObject2;
        }
      } while (!QLog.isColorLevel());
      QLog.e(jdField_a_of_type_JavaLangString, 2, localStringBuilder.toString(), paramString);
      return null;
      localStringBuilder = null;
    }
  }
  
  public String a(boolean paramBoolean, String paramString)
  {
    if (paramBoolean) {
      return a(4, paramString, 0);
    }
    return a(1, paramString, 0);
  }
  
  /* Error */
  public HashMap a(int paramInt)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 6
    //   3: aconst_null
    //   4: astore 4
    //   6: new 747	java/util/HashMap
    //   9: dup
    //   10: invokespecial 748	java/util/HashMap:<init>	()V
    //   13: astore 7
    //   15: aload_0
    //   16: getfield 794	com/tencent/mobileqq/app/QQAppInterface:jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl	Lcom/tencent/common/app/BaseApplicationImpl;
    //   19: invokevirtual 3253	com/tencent/common/app/BaseApplicationImpl:getContentResolver	()Landroid/content/ContentResolver;
    //   22: new 517	java/lang/StringBuilder
    //   25: dup
    //   26: invokespecial 520	java/lang/StringBuilder:<init>	()V
    //   29: ldc_w 3255
    //   32: invokevirtual 526	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   35: aload_0
    //   36: invokevirtual 937	com/tencent/mobileqq/app/QQAppInterface:a	()Ljava/lang/String;
    //   39: invokevirtual 526	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   42: invokevirtual 530	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   45: invokestatic 3258	android/net/Uri:parse	(Ljava/lang/String;)Landroid/net/Uri;
    //   48: iconst_1
    //   49: anewarray 511	java/lang/String
    //   52: dup
    //   53: iconst_0
    //   54: ldc_w 3260
    //   57: aastore
    //   58: aconst_null
    //   59: aconst_null
    //   60: aconst_null
    //   61: invokevirtual 3266	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   64: astore_3
    //   65: aload_3
    //   66: astore 4
    //   68: aload 4
    //   70: ifnull +133 -> 203
    //   73: aload 4
    //   75: invokeinterface 3271 1 0
    //   80: ifle +123 -> 203
    //   83: aload 4
    //   85: ldc_w 3260
    //   88: invokeinterface 3274 2 0
    //   93: istore_2
    //   94: new 635	java/util/ArrayList
    //   97: dup
    //   98: invokespecial 636	java/util/ArrayList:<init>	()V
    //   101: astore 5
    //   103: aload 5
    //   105: astore_3
    //   106: aload 4
    //   108: invokeinterface 3277 1 0
    //   113: ifeq +92 -> 205
    //   116: aload 4
    //   118: iload_2
    //   119: invokeinterface 3278 2 0
    //   124: astore_3
    //   125: aload_3
    //   126: ifnull -23 -> 103
    //   129: aload 5
    //   131: aload_3
    //   132: invokevirtual 1361	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   135: pop
    //   136: goto -33 -> 103
    //   139: astore_3
    //   140: aload 5
    //   142: astore_3
    //   143: aload_3
    //   144: astore 5
    //   146: aload 4
    //   148: ifnull +460 -> 608
    //   151: aload 4
    //   153: invokeinterface 3281 1 0
    //   158: iload_1
    //   159: bipush -2
    //   161: if_icmpne +77 -> 238
    //   164: aload_3
    //   165: ifnull +35 -> 200
    //   168: aload_3
    //   169: invokevirtual 920	java/util/ArrayList:size	()I
    //   172: ifle +28 -> 200
    //   175: aload 7
    //   177: bipush -2
    //   179: invokestatic 1785	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   182: aload_3
    //   183: aload_3
    //   184: invokevirtual 920	java/util/ArrayList:size	()I
    //   187: anewarray 511	java/lang/String
    //   190: invokevirtual 3285	java/util/ArrayList:toArray	([Ljava/lang/Object;)[Ljava/lang/Object;
    //   193: checkcast 3287	[Ljava/lang/String;
    //   196: invokevirtual 2802	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   199: pop
    //   200: aload 7
    //   202: areturn
    //   203: aconst_null
    //   204: astore_3
    //   205: aload_3
    //   206: astore 5
    //   208: aload 4
    //   210: ifnull +398 -> 608
    //   213: aload 4
    //   215: invokeinterface 3281 1 0
    //   220: goto -62 -> 158
    //   223: astore_3
    //   224: aload 4
    //   226: ifnull +10 -> 236
    //   229: aload 4
    //   231: invokeinterface 3281 1 0
    //   236: aload_3
    //   237: athrow
    //   238: aload_3
    //   239: ifnull +357 -> 596
    //   242: aload_0
    //   243: aload_3
    //   244: invokevirtual 3290	com/tencent/mobileqq/app/QQAppInterface:a	(Ljava/util/List;)Ljava/util/Map;
    //   247: astore 8
    //   249: aload 8
    //   251: ifnull +316 -> 567
    //   254: new 635	java/util/ArrayList
    //   257: dup
    //   258: invokespecial 636	java/util/ArrayList:<init>	()V
    //   261: astore 6
    //   263: new 635	java/util/ArrayList
    //   266: dup
    //   267: invokespecial 636	java/util/ArrayList:<init>	()V
    //   270: astore 4
    //   272: new 635	java/util/ArrayList
    //   275: dup
    //   276: invokespecial 636	java/util/ArrayList:<init>	()V
    //   279: astore 5
    //   281: iconst_0
    //   282: istore_2
    //   283: iload_2
    //   284: aload_3
    //   285: invokevirtual 920	java/util/ArrayList:size	()I
    //   288: if_icmpge +130 -> 418
    //   291: aload_3
    //   292: iload_2
    //   293: invokevirtual 1348	java/util/ArrayList:get	(I)Ljava/lang/Object;
    //   296: checkcast 511	java/lang/String
    //   299: astore 9
    //   301: aload 8
    //   303: aload 9
    //   305: invokeinterface 3293 2 0
    //   310: checkcast 1782	java/lang/Integer
    //   313: invokevirtual 2817	java/lang/Integer:intValue	()I
    //   316: tableswitch	default:+32->348, 1:+39->355, 2:+60->376, 3:+32->348, 4:+81->397
    //   348: iload_2
    //   349: iconst_1
    //   350: iadd
    //   351: istore_2
    //   352: goto -69 -> 283
    //   355: iload_1
    //   356: iconst_m1
    //   357: if_icmpeq +8 -> 365
    //   360: iload_1
    //   361: iconst_1
    //   362: if_icmpne -14 -> 348
    //   365: aload 6
    //   367: aload 9
    //   369: invokevirtual 1361	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   372: pop
    //   373: goto -25 -> 348
    //   376: iload_1
    //   377: iconst_m1
    //   378: if_icmpeq +8 -> 386
    //   381: iload_1
    //   382: iconst_2
    //   383: if_icmpne -35 -> 348
    //   386: aload 4
    //   388: aload 9
    //   390: invokevirtual 1361	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   393: pop
    //   394: goto -46 -> 348
    //   397: iload_1
    //   398: iconst_m1
    //   399: if_icmpeq +8 -> 407
    //   402: iload_1
    //   403: iconst_4
    //   404: if_icmpne -56 -> 348
    //   407: aload 5
    //   409: aload 9
    //   411: invokevirtual 1361	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   414: pop
    //   415: goto -67 -> 348
    //   418: aload 6
    //   420: astore_3
    //   421: aload_3
    //   422: ifnull +44 -> 466
    //   425: aload_3
    //   426: invokevirtual 920	java/util/ArrayList:size	()I
    //   429: ifle +37 -> 466
    //   432: iload_1
    //   433: iconst_m1
    //   434: if_icmpeq +8 -> 442
    //   437: iload_1
    //   438: iconst_1
    //   439: if_icmpne +27 -> 466
    //   442: aload 7
    //   444: iconst_1
    //   445: invokestatic 1785	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   448: aload_3
    //   449: aload_3
    //   450: invokevirtual 920	java/util/ArrayList:size	()I
    //   453: anewarray 511	java/lang/String
    //   456: invokevirtual 3285	java/util/ArrayList:toArray	([Ljava/lang/Object;)[Ljava/lang/Object;
    //   459: checkcast 3287	[Ljava/lang/String;
    //   462: invokevirtual 2802	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   465: pop
    //   466: aload 4
    //   468: ifnull +47 -> 515
    //   471: aload 4
    //   473: invokevirtual 920	java/util/ArrayList:size	()I
    //   476: ifle +39 -> 515
    //   479: iload_1
    //   480: iconst_m1
    //   481: if_icmpeq +8 -> 489
    //   484: iload_1
    //   485: iconst_2
    //   486: if_icmpne +29 -> 515
    //   489: aload 7
    //   491: iconst_2
    //   492: invokestatic 1785	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   495: aload 4
    //   497: aload 4
    //   499: invokevirtual 920	java/util/ArrayList:size	()I
    //   502: anewarray 511	java/lang/String
    //   505: invokevirtual 3285	java/util/ArrayList:toArray	([Ljava/lang/Object;)[Ljava/lang/Object;
    //   508: checkcast 3287	[Ljava/lang/String;
    //   511: invokevirtual 2802	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   514: pop
    //   515: aload 5
    //   517: ifnull +47 -> 564
    //   520: aload 5
    //   522: invokevirtual 920	java/util/ArrayList:size	()I
    //   525: ifle +39 -> 564
    //   528: iload_1
    //   529: iconst_m1
    //   530: if_icmpeq +8 -> 538
    //   533: iload_1
    //   534: iconst_4
    //   535: if_icmpne +29 -> 564
    //   538: aload 7
    //   540: iconst_4
    //   541: invokestatic 1785	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   544: aload 5
    //   546: aload 5
    //   548: invokevirtual 920	java/util/ArrayList:size	()I
    //   551: anewarray 511	java/lang/String
    //   554: invokevirtual 3285	java/util/ArrayList:toArray	([Ljava/lang/Object;)[Ljava/lang/Object;
    //   557: checkcast 3287	[Ljava/lang/String;
    //   560: invokevirtual 2802	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   563: pop
    //   564: aload 7
    //   566: areturn
    //   567: aconst_null
    //   568: astore 4
    //   570: aload 6
    //   572: astore 5
    //   574: goto -153 -> 421
    //   577: astore_3
    //   578: goto -354 -> 224
    //   581: astore_3
    //   582: aconst_null
    //   583: astore 4
    //   585: aconst_null
    //   586: astore_3
    //   587: goto -444 -> 143
    //   590: astore_3
    //   591: aconst_null
    //   592: astore_3
    //   593: goto -450 -> 143
    //   596: aconst_null
    //   597: astore 4
    //   599: aconst_null
    //   600: astore_3
    //   601: aload 6
    //   603: astore 5
    //   605: goto -184 -> 421
    //   608: aload 5
    //   610: astore_3
    //   611: goto -453 -> 158
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	614	0	this	QQAppInterface
    //   0	614	1	paramInt	int
    //   93	259	2	i1	int
    //   64	68	3	localObject1	Object
    //   139	1	3	localException1	Exception
    //   142	64	3	localObject2	Object
    //   223	69	3	localList	List
    //   420	30	3	localArrayList1	ArrayList
    //   577	1	3	localObject3	Object
    //   581	1	3	localException2	Exception
    //   586	1	3	localObject4	Object
    //   590	1	3	localException3	Exception
    //   592	19	3	localObject5	Object
    //   4	594	4	localObject6	Object
    //   101	508	5	localObject7	Object
    //   1	601	6	localArrayList2	ArrayList
    //   13	552	7	localHashMap	HashMap
    //   247	55	8	localMap	Map
    //   299	111	9	str	String
    // Exception table:
    //   from	to	target	type
    //   106	125	139	java/lang/Exception
    //   129	136	139	java/lang/Exception
    //   15	65	223	finally
    //   73	103	577	finally
    //   106	125	577	finally
    //   129	136	577	finally
    //   15	65	581	java/lang/Exception
    //   73	103	590	java/lang/Exception
  }
  
  public List a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppLebaHelper != null) {
      return jdField_a_of_type_ComTencentMobileqqAppLebaHelper.a();
    }
    return null;
  }
  
  public List a(int paramInt)
  {
    if (paramInt == 1) {
      return jdField_a_of_type_JavaUtilList;
    }
    if (paramInt == 2) {
      return jdField_b_of_type_JavaUtilList;
    }
    if (paramInt == 0) {
      return jdField_c_of_type_JavaUtilList;
    }
    return jdField_c_of_type_JavaUtilList;
  }
  
  public Map a(List paramList)
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null) {
      return localRoamSettingController.a(paramList, 1);
    }
    return null;
  }
  
  public void a()
  {
    if (!jdField_f_of_type_Boolean) {
      jdField_f_of_type_Boolean = true;
    }
    while ((!isLogin()) || (!jdField_f_of_type_Boolean)) {
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.i("qqfav", 2, "Wifi, tryReuploadQfavItems");
    }
    QfavHelper.a(this);
  }
  
  public void a(int paramInt)
  {
    try
    {
      ((ConfigHandler)a(4)).a(paramInt);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public void a(int paramInt1, String paramString, int paramInt2)
  {
    int i1 = 0;
    paramString = a(paramInt1, paramString, (byte)0, paramInt2);
    paramInt1 = i1;
    while (paramInt1 <= 3)
    {
      String str = paramString + "_" + paramInt1;
      jdField_a_of_type_AndroidSupportV4UtilMQLruCache.remove(str);
      paramInt1 += 1;
    }
  }
  
  public void a(int paramInt1, String arg2, int paramInt2, String arg4)
  {
    if (QLog.isColorLevel()) {
      QLog.i("Q.qqhead.broadcast", 2, "sendQQHeadBroadcast.type=" + paramInt1 + ",uin=" + ??? + ",idType=" + paramInt2 + ",path=" + ???);
    }
    if (!jdField_a_of_type_JavaUtilHashtable.containsKey(???)) {
      return;
    }
    synchronized (jdField_a_of_type_JavaUtilHashtable)
    {
      jdField_a_of_type_JavaUtilHashtable.remove(???);
      if (paramInt1 != 1) {}
    }
    Object localObject;
    for (;;)
    {
      synchronized (jdField_b_of_type_JavaUtilArrayList)
      {
        jdField_b_of_type_JavaUtilArrayList.add(???);
        ??? = jdField_b_of_type_AndroidOsHandler.obtainMessage();
        what = 990;
        jdField_b_of_type_AndroidOsHandler.sendMessageDelayed(???, 500L);
        if (jdField_a_of_type_JavaUtilHashtable.size() <= 50) {
          break;
        }
        synchronized (jdField_a_of_type_JavaUtilHashtable)
        {
          long l1 = System.currentTimeMillis();
          ??? = new ArrayList();
          localObject = jdField_a_of_type_JavaUtilHashtable.keys();
          if (!((Enumeration)localObject).hasMoreElements()) {
            break label334;
          }
          String str = (String)((Enumeration)localObject).nextElement();
          if (Math.abs(l1 - ((Long)jdField_a_of_type_JavaUtilHashtable.get(str)).longValue()) <= 180000L) {
            continue;
          }
          ???.add(str);
        }
        ??? = finally;
        throw ???;
      }
      if (paramInt1 == 4) {
        synchronized (jdField_c_of_type_JavaUtilArrayList)
        {
          jdField_c_of_type_JavaUtilArrayList.add(???);
          ??? = jdField_b_of_type_AndroidOsHandler.obtainMessage();
          what = 991;
          jdField_b_of_type_AndroidOsHandler.sendMessageDelayed(???, 500L);
        }
      }
    }
    label334:
    paramInt1 = 0;
    while (paramInt1 < ???.size())
    {
      localObject = (String)???.get(paramInt1);
      jdField_a_of_type_JavaUtilHashtable.remove(localObject);
      paramInt1 += 1;
    }
  }
  
  public void a(int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    int i1 = 0;
    if (QLog.isColorLevel()) {
      QLog.d("notification", 2, "receivedMsgNotification , size is:" + paramInt + ",isOnline is:" + paramBoolean2);
    }
    if (paramInt == 0) {}
    Object localObject;
    QQMessageFacade.Message localMessage;
    label183:
    boolean bool;
    label387:
    ActivateFriendsManager localActivateFriendsManager;
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    return;
                    localObject = a();
                  } while (localObject == null);
                  localMessage = ((QQMessageFacade)localObject).a();
                } while (localMessage == null);
                PublicAccountManager.a().d(this);
                if ((1000 != istroop) && (1020 != istroop)) {
                  break;
                }
                if ((frienduin == null) || (!frienduin.equalsIgnoreCase(a()))) {
                  break label183;
                }
              } while (!QLog.isColorLevel());
              QLog.d("notification", 2, "receivedMsgNotification , stranger  self message");
              return;
              if ((senderuin == null) || (!senderuin.equalsIgnoreCase(a()))) {
                break;
              }
            } while (!QLog.isColorLevel());
            QLog.d("notification", 2, "receivedMsgNotification ,self message");
            return;
            if ((!a(localMessage)) || (localMessage.needNotification())) {
              break;
            }
          } while (!QLog.isColorLevel());
          QLog.d("notification", 2, "receivedMsgNotification , isTroopMark");
          return;
        } while (((1008 == istroop) && (TroopBarAssistantManager.a().b(this, senderuin))) || (7100 == istroop) || ((istroop == 1008) && ((extStr == null) || (((extLong & 0x1) == 0) && (!extStr.contains("lockDisplay"))) || (extStr == null) || (((extLong & 0x1) == 1) && (!localMessage.getExtInfoFromExtStr("lockDisplay").equals("true"))))));
        if (!UserguideActivity.a(a(), a())) {
          break;
        }
      } while (!QLog.isColorLevel());
      QLog.d("notification", 2, "receivedMsgNotification , showUserGuide");
      return;
      if (QLog.isColorLevel())
      {
        if ((!isBackground_Pause) && (!isBackground_Stop)) {
          break;
        }
        bool = true;
        QLog.d("notification", 2, new Object[] { "receivedMsgNotification , isRunBackground :", Boolean.valueOf(bool), ",userActiveStatus:", Integer.valueOf(bJ), ",needSoundVibrationsTip:", Boolean.valueOf(paramBoolean1), ",baseInfo:", localMessage.getBaseInfoString() });
      }
      if (GuardManager.a != null) {
        GuardManager.a.b(0, null);
      }
      bool = ((KeyguardManager)jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext().getSystemService("keyguard")).inKeyguardRestrictedInputMode();
      if (((!isBackground_Pause) && (!isBackground_Stop) && (!bool)) || ((istroop != 6000) && (bJ != 0) && ((istroop != 1001) || (msgtype != 62535)) && (istroop != 1008) && (istroop != 9002))) {
        break label748;
      }
      if (istroop != 9002) {
        break label733;
      }
      localActivateFriendsManager = (ActivateFriendsManager)getManager(84);
    } while (!localActivateFriendsManager.a(msgData));
    if (localActivateFriendsManager.b(msgData)) {
      counter += paramInt;
    }
    label634:
    OpenApiManager.a().a(localMessage);
    ((QQMessageFacade)localObject).c(localMessage);
    if (QLog.isColorLevel()) {
      QLog.d("notification", 2, "receivedMsgNotification , frienduin " + frienduin + ",type " + istroop + ",counter:" + counter);
    }
    a(localMessage, paramBoolean1, paramBoolean2);
    label733:
    label748:
    label1000:
    label1065:
    for (;;)
    {
      G();
      return;
      bool = false;
      break label387;
      counter += paramInt;
      break label634;
      if ((msgtype == 64523) || (msgtype == 63506) || (msgtype == 64489) || (msgtype == 64517) || (msgtype == 64518)) {
        break;
      }
      if ((istroop == 1008) && (AppConstants.ad.equals(senderuin)))
      {
        d(localMessage, paramBoolean2);
        return;
      }
      if ((paramBoolean1) && ((istroop == 6000) || (bJ == 0) || ((istroop == 1001) && (msgtype == 62535)) || (istroop == 1008) || (istroop == 9002)))
      {
        if (m) {
          break label1000;
        }
        d(localMessage, paramBoolean2);
      }
      for (;;)
      {
        if ((!paramBoolean1) || ((istroop != 6000) && (bJ != 0) && ((istroop != 1001) || (msgtype != 62535))) || (istroop != 1001) || (msgtype != 62535)) {
          break label1065;
        }
        OpenAppClient.a(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext(), action);
        break;
        if ((jdField_c_of_type_ArrayOfLong[0] == uniseq) && (jdField_c_of_type_ArrayOfLong[1] == 1L))
        {
          d(localMessage, paramBoolean2);
        }
        else
        {
          jdField_a_of_type_ArrayOfByte[0] = 1;
          localObject = jdField_a_of_type_ArrayOfByte;
          paramInt = i1;
          if (paramBoolean2) {
            paramInt = 1;
          }
          localObject[1] = ((byte)paramInt);
        }
      }
    }
  }
  
  public void a(int paramInt, boolean paramBoolean1, boolean paramBoolean2, MessageRecord paramMessageRecord)
  {
    int i2 = 0;
    if (QLog.isColorLevel()) {
      QLog.d("notification", 2, "receivedMsgNotification , size is:" + paramInt + ",isOnline is:" + paramBoolean2);
    }
    if (paramInt == 0) {}
    label50:
    label169:
    do
    {
      do
      {
        do
        {
          do
          {
            break label50;
            break label50;
            break label50;
            break label50;
            do
            {
              return;
            } while (paramMessageRecord == null);
            if ((1000 != istroop) && (1020 != istroop)) {
              break;
            }
            if ((frienduin == null) || (!frienduin.equalsIgnoreCase(a()))) {
              break label169;
            }
          } while (!QLog.isColorLevel());
          QLog.d("notification", 2, "receivedMsgNotification , stranger  self message");
          return;
          if ((senderuin == null) || (!senderuin.equalsIgnoreCase(a())) || (msgtype == 61528)) {
            break;
          }
        } while (!QLog.isColorLevel());
        QLog.d("notification", 2, "receivedMsgNotification ,self message");
        return;
      } while (((1008 == istroop) && (TroopBarAssistantManager.a().b(this, senderuin))) || (7100 == istroop) || ((istroop == 1008) && ((extStr == null) || (((extLong & 0x1) == 0) && (!extStr.contains("lockDisplay"))) || (extStr == null) || (((extLong & 0x1) == 1) && (!paramMessageRecord.getExtInfoFromExtStr("lockDisplay").equals("true"))))));
      if (!UserguideActivity.a(a(), a())) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.d("notification", 2, "receivedMsgNotification , showUserGuide");
    return;
    if (GuardManager.a != null) {
      GuardManager.a.b(0, null);
    }
    boolean bool = ((KeyguardManager)jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext().getSystemService("keyguard")).inKeyguardRestrictedInputMode();
    Object localObject = ((ActivityManager)BaseApplicationImpl.a().getSystemService("activity")).getRunningTasks(1);
    if ((localObject != null) && (((List)localObject).size() > 0))
    {
      localObject = (ActivityManager.RunningTaskInfo)((List)localObject).get(0);
      if (QLog.isColorLevel()) {
        QLog.d("notification", 2, "locking activity:" + topActivity.getClassName());
      }
      localObject = topActivity.getClassName();
      if ((((String)localObject).equals("com.tencent.av.ui.VideoInviteLock")) || (((String)localObject).equals("com.tencent.av.gaudio.GaInviteLockActivity")) || (((String)localObject).equals("com.tencent.av.ui.AVActivity"))) {
        paramInt = 1;
      }
    }
    for (;;)
    {
      int i1 = i2;
      if (msgtype == 63520)
      {
        i1 = i2;
        if (istroop == 3000) {
          i1 = 1;
        }
      }
      if ((paramInt != 0) && (i1 != 0)) {
        break;
      }
      if (QLog.isColorLevel())
      {
        QLog.d("notification", 2, "isBackground_Pause:" + isBackground_Pause);
        QLog.d("notification", 2, "isBackground_Stop:" + isBackground_Stop);
        QLog.d("notification", 2, "isScreenLocked:" + bool);
      }
      if (((!isBackground_Pause) && (!isBackground_Stop) && (!bool)) || ((istroop != 6000) && (bJ != 0) && ((istroop != 1001) || (msgtype != 62535)) && (istroop != 1008))) {
        break;
      }
      a(paramMessageRecord, paramBoolean1, paramBoolean2);
      return;
      paramInt = 0;
      continue;
      paramInt = 0;
    }
  }
  
  public void a(long paramLong)
  {
    if (paramLong >= 0L) {
      jdField_b_of_type_Long = paramLong;
    }
    jdField_a_of_type_AndroidOsHandler.removeMessages(0);
  }
  
  public void a(long paramLong, boolean paramBoolean)
  {
    if (e())
    {
      a().getSharedPreferences("acc_info" + getAccount(), 0).edit().putLong("getProfileStatusNew", paramLong).commit();
      jdField_d_of_type_Long = paramLong;
      if (paramBoolean) {
        m();
      }
    }
  }
  
  public void a(Context paramContext)
  {
    a(paramContext, null);
  }
  
  public void a(Context paramContext, Class paramClass)
  {
    if (!b()) {
      break label7;
    }
    label7:
    while (paramContext == null) {
      return;
    }
    Object localObject;
    if (paramClass == null) {
      if ((paramContext instanceof Activity))
      {
        paramClass = new Intent(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext(), paramContext.getClass());
        localObject = ((Activity)paramContext).getIntent().getExtras();
        paramContext = paramClass;
        if (localObject != null)
        {
          ((Bundle)localObject).remove("single");
          ((Bundle)localObject).remove("selfuin");
          paramClass.putExtras((Bundle)localObject);
          paramContext = paramClass;
        }
      }
    }
    for (;;)
    {
      paramContext.putExtra("fromNotification", true);
      paramContext.addFlags(536870912).addFlags(67108864);
      if (!e()) {
        break;
      }
      String str = a();
      localObject = null;
      Friends localFriends = ((FriendsManager)getManager(50)).c(str);
      paramClass = str;
      if (localFriends != null)
      {
        Bitmap localBitmap = SkinUtils.a(a(uin, false));
        paramClass = str;
        localObject = localBitmap;
        if (name != null)
        {
          paramClass = str;
          localObject = localBitmap;
          if (name.length() > 0)
          {
            paramClass = name;
            localObject = localBitmap;
          }
        }
      }
      a(paramContext, "", paramClass, jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getString(2131366987), (Bitmap)localObject, "CMD_IDLE_NOTIFIYCATION");
      return;
      paramContext = new Intent(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext(), SplashActivity.class);
      continue;
      paramContext = new Intent(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext(), paramClass);
    }
  }
  
  public void a(Intent paramIntent)
  {
    jdField_b_of_type_AndroidContentIntent = paramIntent;
  }
  
  public void a(BusinessObserver paramBusinessObserver)
  {
    a(paramBusinessObserver, false);
  }
  
  public void a(BusinessObserver paramBusinessObserver, boolean paramBoolean)
  {
    if (paramBusinessObserver == null) {
      return;
    }
    if (paramBoolean) {
      synchronized (jdField_b_of_type_JavaUtilList)
      {
        if (!jdField_b_of_type_JavaUtilList.contains(paramBusinessObserver)) {
          jdField_b_of_type_JavaUtilList.add(paramBusinessObserver);
        }
        return;
      }
    }
    synchronized (jdField_a_of_type_JavaUtilList)
    {
      if (!jdField_a_of_type_JavaUtilList.contains(paramBusinessObserver)) {
        jdField_a_of_type_JavaUtilList.add(paramBusinessObserver);
      }
      return;
    }
  }
  
  public void a(CallTabUnreadListener paramCallTabUnreadListener)
  {
    jdField_a_of_type_ComTencentMobileqqAppCallTabUnreadListener = paramCallTabUnreadListener;
  }
  
  public void a(CheckPttListener paramCheckPttListener)
  {
    jdField_a_of_type_ComTencentMobileqqAppCheckPttListener = paramCheckPttListener;
  }
  
  public void a(MsgTabUnreadListener paramMsgTabUnreadListener)
  {
    jdField_a_of_type_ComTencentMobileqqAppMsgTabUnreadListener = paramMsgTabUnreadListener;
  }
  
  public void a(VibrateListener paramVibrateListener)
  {
    if (paramVibrateListener == null) {}
    while (jdField_d_of_type_JavaUtilList.indexOf(paramVibrateListener) >= 0) {
      return;
    }
    jdField_d_of_type_JavaUtilList.add(paramVibrateListener);
  }
  
  public void a(QQMessageFacade.Message paramMessage)
  {
    if (QLog.isColorLevel()) {
      QLog.d("notification", 2, "showReadedMsgNotification msgFacade.getMessages().size()" + jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().size() + ",msgFacade.getCounter():" + jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b());
    }
    if ((paramMessage == null) || (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.a().size() == 0) || (jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade.b() == 0))
    {
      j();
      return;
    }
    if (f())
    {
      a(paramMessage, false);
      return;
    }
    f(false);
  }
  
  public void a(ResourcePluginListener paramResourcePluginListener)
  {
    o();
    jdField_a_of_type_ComTencentMobileqqAppLebaHelper.a(paramResourcePluginListener);
  }
  
  public void a(MessageRecord paramMessageRecord, boolean paramBoolean)
  {
    Object localObject2;
    Object localObject3;
    Bitmap localBitmap;
    QQMessageFacade.Message localMessage;
    Intent localIntent;
    if ((1010 == istroop) || (1001 == istroop))
    {
      boolean bool = ((KeyguardManager)jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext().getSystemService("keyguard")).inKeyguardRestrictedInputMode();
      localObject1 = "";
      localObject2 = "";
      localObject3 = "";
      localBitmap = null;
      localMessage = new QQMessageFacade.Message();
      MessageRecord.copyMessageRecordBaseField(localMessage, paramMessageRecord);
      if ((!isBackground_Pause) && (!isBackground_Stop) && (!bool)) {
        break label650;
      }
      localIntent = new Intent(a(), MsgBoxListActivity.class);
      localIntent.addFlags(335544320);
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "OneWayMessageNotifyVibert mr.frienduin" + frienduin + ", mr.istroop" + istroop);
      }
      if (1010 != istroop) {
        break label467;
      }
      localIntent.putExtra("uin", AppConstants.aG);
      localIntent.putExtra("uintype", istroop);
      localIntent.setAction("com.tencent.mobileqq.action.CHAT");
      localIntent.putExtra("uinname", "");
      localIntent.putExtra("entrance", 6);
      localIntent.putExtra("key_notification_click_action", true);
      if (istroop != 1010) {
        break label505;
      }
      localBitmap = SkinUtils.a(a().getResources().getDrawable(2130840647));
      paramMessageRecord = BaseApplicationImpl.a().getString(2131371739);
      localObject2 = BaseApplicationImpl.a().getString(2131371740);
      localIntent.putExtra("key_notifycation_oneway_message", true);
      localObject1 = DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.OneyWayDateMsgNotifyCfg.name());
      if (((String)localObject1).length() <= 0) {
        break label676;
      }
      localObject1 = ((String)localObject1).split("\\|");
      if (localObject1.length < 6) {
        break label676;
      }
      paramMessageRecord = localObject1[4];
      localObject2 = localObject1[5];
    }
    label363:
    label453:
    label467:
    label505:
    label617:
    label650:
    label669:
    label676:
    for (Object localObject1 = localObject2;; localObject1 = localObject2)
    {
      localObject3 = localObject2;
      localObject2 = paramMessageRecord;
      for (;;)
      {
        a(localIntent, (String)localObject1, (String)localObject2, (String)localObject3, localBitmap, "CMD_SHOW_NOTIFIYCATION");
        if (QQUtils.a(a()))
        {
          paramMessageRecord = (QQLSRecentManager)getManager(71);
          if (SettingCloneUtil.readValue(a(), a(), a().getString(2131369309), "qqsetting_lock_screen_whenexit_key", true))
          {
            if (1001 != istroop) {
              break label617;
            }
            paramMessageRecord.a(this, AppConstants.aL, istroop, false);
          }
        }
        if (!paramBoolean) {}
        for (paramBoolean = true;; paramBoolean = false)
        {
          d(localMessage, paramBoolean);
          return;
          if (1001 != istroop) {
            break;
          }
          localIntent.putExtra("uin", AppConstants.aq);
          localIntent.putExtra("uintype", istroop);
          break;
          if (istroop != 1001) {
            break label363;
          }
          localBitmap = SkinUtils.a(a().getResources().getDrawable(2130838453));
          localObject2 = BaseApplicationImpl.a().getString(2131371741);
          localObject3 = BaseApplicationImpl.a().getString(2131371742);
          localIntent.putExtra("key_notifycation_oneway_message", true);
          paramMessageRecord = DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.OneyWayLBSFriendMsgNotifyCfg.name());
          if (paramMessageRecord.length() <= 0) {
            break label669;
          }
          paramMessageRecord = paramMessageRecord.split("\\|");
          if (paramMessageRecord.length < 6) {
            break label669;
          }
          localObject2 = paramMessageRecord[4];
          localObject3 = paramMessageRecord[5];
          localObject1 = localObject3;
          break label363;
          if (1010 != istroop) {
            break label453;
          }
          paramMessageRecord.a(this, AppConstants.aM, istroop, false);
          break label453;
        }
        if (!paramBoolean) {}
        for (paramBoolean = true;; paramBoolean = false)
        {
          d(localMessage, paramBoolean);
          return;
        }
        localObject1 = localObject3;
      }
    }
  }
  
  public void a(Setting paramSetting)
  {
    if (paramSetting != null)
    {
      paramSetting = paramSetting.clone();
      if (paramSetting != null)
      {
        url = null;
        if (!TextUtils.isEmpty(uin)) {
          jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.put(uin, paramSetting);
        }
      }
    }
  }
  
  public void a(CallRedDotLightalkLis paramCallRedDotLightalkLis)
  {
    jdField_a_of_type_ComTencentMobileqqJumplightalkCallRedDotLightalkLis = paramCallRedDotLightalkLis;
  }
  
  public void a(ToServiceMsg paramToServiceMsg)
  {
    jdField_a_of_type_ComTencentMobileqqServiceMobileQQService.a(paramToServiceMsg);
  }
  
  public void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    jdField_a_of_type_ComTencentMobileqqServiceMobileQQService.a(paramFromServiceMsg.isSuccess(), paramToServiceMsg, paramFromServiceMsg, null);
  }
  
  public void a(Runnable paramRunnable)
  {
    ThreadManager.d(paramRunnable);
  }
  
  public void a(String paramString)
  {
    if (jdField_a_of_type_AndroidSupportV4UtilMQLruCache != null) {
      jdField_a_of_type_AndroidSupportV4UtilMQLruCache.remove(paramString);
    }
    if (jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap != null) {
      jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.remove(paramString);
    }
  }
  
  public void a(String paramString, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.i("Q.qqhead.", 2, "deleteStrangerFace.id=" + paramString + ",idType=" + paramInt);
    }
    if (TextUtils.isEmpty(paramString)) {}
    do
    {
      do
      {
        return;
      } while ((paramInt != 200) && (paramInt != 204) && (paramInt != 202));
      a(32, paramString, paramInt);
      IPCFaceHelper localIPCFaceHelper = a().a(false);
      if (localIPCFaceHelper != null) {
        localIPCFaceHelper.a(32, paramString, paramInt);
      }
      paramString = new File(a(32, paramString, paramInt));
    } while ((paramString == null) || (!paramString.exists()));
    paramString.delete();
  }
  
  public void a(String paramString, int paramInt, long paramLong)
  {
    if ((TextUtils.isEmpty(paramString)) || (paramLong <= 0L)) {}
    label13:
    long l1;
    do
    {
      do
      {
        do
        {
          break label13;
          do
          {
            return;
          } while ((paramInt != 200) && (paramInt != 204) && (paramInt != 202));
          localObject = a(32, paramString, paramInt);
        } while ((localObject == null) || (second == null));
        l1 = second).headImgTimestamp;
      } while (l1 == paramLong);
      Object localObject = (FriendListHandler)a(1);
      if (localObject != null) {
        ((FriendListHandler)localObject).a(paramString, paramInt, (byte)1, (byte)0);
      }
    } while (!QLog.isColorLevel());
    QLog.d("Q.qqhead.qaif", 2, "refreshStrangerFaceWithTimeStamp id=" + paramString + ", idtype =" + paramInt + ", timestamp=" + paramLong + ",headImgTimestamp=" + l1);
  }
  
  public void a(String paramString, int paramInt, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.i("Q.qqhead.", 2, "refreshStrangerFace.id=" + paramString + ",idType=" + paramInt + ",delLocalCache=" + paramBoolean);
    }
    if (TextUtils.isEmpty(paramString)) {}
    Object localObject;
    do
    {
      do
      {
        return;
      } while ((paramInt != 200) && (paramInt != 204) && (paramInt != 202));
      if (paramBoolean)
      {
        a(32, paramString, paramInt);
        localObject = new File(a(32, paramString, paramInt));
        if ((localObject != null) && (((File)localObject).exists())) {
          ((File)localObject).delete();
        }
      }
      localObject = (FriendListHandler)a(1);
    } while (localObject == null);
    ((FriendListHandler)localObject).a(paramString, paramInt, (byte)1, (byte)0);
  }
  
  public void a(String paramString, Bitmap paramBitmap)
  {
    if (jdField_a_of_type_AndroidSupportV4UtilMQLruCache != null)
    {
      jdField_a_of_type_AndroidSupportV4UtilMQLruCache.put(paramString, paramBitmap);
      if (jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap != null) {
        jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, Long.valueOf(System.currentTimeMillis()));
      }
    }
  }
  
  public void a(String paramString, Bitmap paramBitmap, byte paramByte)
  {
    if (jdField_a_of_type_AndroidSupportV4UtilMQLruCache != null)
    {
      jdField_a_of_type_AndroidSupportV4UtilMQLruCache.put(paramString, paramBitmap, paramByte);
      if (jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap != null) {
        jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.put(paramString, Long.valueOf(System.currentTimeMillis()));
      }
    }
  }
  
  public void a(String paramString, Integer paramInteger)
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null)
    {
      String str = RoamSettingController.a(paramString, 1);
      if (QLog.isColorLevel()) {
        QLog.d("RoamSetting", 2, "setTroopMsgFilterToServer, path=" + str + " value=" + paramInteger);
      }
      localRoamSettingController.a(str, paramInteger);
      TroopAssistantManager.a().a(this, paramString);
    }
  }
  
  public void a(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt1, int paramInt2, String paramString6, String paramString7, String paramString8, String paramString9)
  {
    ReportController.b(this, paramString1, paramString2, paramString3, paramString4, paramString5, paramInt1, paramInt2, paramString6, paramString7, paramString8, paramString9);
  }
  
  public void a(String paramString, boolean paramBoolean)
  {
    jdField_e_of_type_Long = System.currentTimeMillis();
    boolean bool1 = h();
    boolean bool2 = NoDisturbUtil.a(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext(), this);
    if (QLog.isColorLevel()) {
      QLog.d("notification", 2, "isRingerSilent is:" + bool1 + ",canDisturb is:" + bool2);
    }
    if ((!bool1) && (bool2))
    {
      SharedPreferences localSharedPreferences = PreferenceManager.getDefaultSharedPreferences(a());
      Vibrator localVibrator = (Vibrator)a().getSystemService("vibrator");
      bool1 = d();
      bool2 = y();
      boolean bool3 = x();
      boolean bool4 = m();
      boolean bool5 = u();
      if (QLog.isColorLevel()) {
        QLog.d("notification", 2, "canVibrator is:" + bool3 + ",isVideoing is:" + bool1 + ",isCallIdle is:" + bool4 + ",notRecordingPtt is:" + bool5);
      }
      if ((bool3) && (bool4) && (!bool1) && (bool5)) {
        localVibrator.vibrate(jdField_a_of_type_ArrayOfLong, -1);
      }
      if ((paramBoolean) && (bool2) && (!bool1) && (!k()) && (!l()) && (m()) && (u()))
      {
        int i1 = localSharedPreferences.getInt("sound_type" + a(), 2131165185);
        if (c(paramString)) {
          i1 = 2131165206;
        }
        AudioUtil.b(i1, false);
      }
    }
  }
  
  public void a(ArrayList paramArrayList)
  {
    F();
    if (jdField_a_of_type_JavaUtilArrayList == null) {
      return;
    }
    int i1 = 0;
    label14:
    TagInfo localTagInfo1;
    TagArrayByType localTagArrayByType;
    int i2;
    if (i1 < paramArrayList.size())
    {
      localTagInfo1 = (TagInfo)paramArrayList.get(i1);
      if ((localTagInfo1 != null) && ((strContent == null) || ("".equals(strContent.trim()))))
      {
        localTagArrayByType = null;
        i2 = 0;
        label67:
        if (i2 >= jdField_a_of_type_JavaUtilArrayList.size()) {
          break label265;
        }
        localTagArrayByType = (TagArrayByType)jdField_a_of_type_JavaUtilArrayList.get(i2);
        if (bType != mTags.get(0)).bType) {
          break label237;
        }
      }
    }
    label121:
    label237:
    label265:
    for (;;)
    {
      int i3;
      if (localTagArrayByType == null)
      {
        i2 = 0;
        i3 = 0;
      }
      for (;;)
      {
        if (i3 < i2)
        {
          TagInfo localTagInfo2 = (TagInfo)mTags.get(i3);
          if ((localTagInfo2 != null) && (iTagId == iTagId)) {
            strContent = strContent;
          }
        }
        else
        {
          if ((localTagInfo1 != null) && (QLog.isColorLevel())) {
            QLog.d("ProfileService.SetUserInfoReq", 2, "id = " + iTagId + ", strContent = " + strContent);
          }
          i1 += 1;
          break label14;
          break;
          i2 += 1;
          break label67;
          i2 = mTags.size();
          break label121;
        }
        i3 += 1;
      }
    }
  }
  
  public void a(boolean paramBoolean)
  {
    int i1 = 0;
    int i2 = 0;
    if (paramBoolean)
    {
      int[] arrayOfInt = jdField_a_of_type_ArrayOfInt;
      int i3 = arrayOfInt.length;
      i1 = i2;
      while (i1 < i3)
      {
        getManager(arrayOfInt[i1]);
        i1 += 1;
      }
    }
    while (i1 < 146)
    {
      if ((i1 != 23) && (i1 != 125)) {
        getManager(i1);
      }
      i1 += 1;
    }
  }
  
  public void a(boolean paramBoolean, int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppMsgTabUnreadListener != null) {
      jdField_a_of_type_ComTencentMobileqqAppMsgTabUnreadListener.a(paramBoolean, paramInt);
    }
  }
  
  public void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBoolean2)
    {
      ((CardHandler)a(2)).a(paramBoolean1);
      return;
    }
    a().edit().putBoolean(a().getString(2131367564) + a(), paramBoolean1).commit();
  }
  
  public void a(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    if (jdField_a_of_type_ComTencentMobileqqDataSigInfo == null) {
      jdField_a_of_type_ComTencentMobileqqDataSigInfo = new SigInfo();
    }
    if ((paramArrayOfByte1 != null) && (paramArrayOfByte2 != null))
    {
      jdField_a_of_type_ComTencentMobileqqDataSigInfo.sessionKey = new byte[paramArrayOfByte1.length];
      System.arraycopy(paramArrayOfByte1, 0, jdField_a_of_type_ComTencentMobileqqDataSigInfo.sessionKey, 0, paramArrayOfByte1.length);
      jdField_a_of_type_ComTencentMobileqqDataSigInfo.signature = new byte[paramArrayOfByte2.length];
      System.arraycopy(paramArrayOfByte2, 0, jdField_a_of_type_ComTencentMobileqqDataSigInfo.signature, 0, paramArrayOfByte2.length);
      jdField_a_of_type_ComTencentMobileqqDataSigInfo.wSignatureLen = ((short)jdField_a_of_type_ComTencentMobileqqDataSigInfo.signature.length);
    }
  }
  
  public void a(Integer[] paramArrayOfInteger)
  {
    boolean bool = false;
    Object localObject2 = SettingCloneUtil.readValue(getApplication(), a(), null, "qqsetting_calltab_show_key", "0111100");
    if ((localObject2 == null) || (((String)localObject2).length() > "0111100".length()) || (paramArrayOfInteger == null) || (paramArrayOfInteger.length != 7))
    {
      if (QLog.isColorLevel()) {
        QLog.e(jdField_a_of_type_JavaLangString, 2, "writeCallTabStateVal valid val," + (String)localObject2 + "," + paramArrayOfInteger);
      }
      return;
    }
    Object localObject1 = localObject2;
    if (((String)localObject2).length() < "0111100".length()) {
      localObject1 = (String)localObject2 + "0111100".substring(((String)localObject2).length());
    }
    localObject1 = new StringBuilder((String)localObject1);
    int i1 = 0;
    label159:
    if (i1 < paramArrayOfInteger.length)
    {
      localObject2 = paramArrayOfInteger[i1];
      if (localObject2 == null) {}
      for (;;)
      {
        i1 += 1;
        break label159;
        if ((((Integer)localObject2).intValue() < 0) || (((Integer)localObject2).intValue() > 9))
        {
          if (!QLog.isColorLevel()) {
            break;
          }
          QLog.e(jdField_a_of_type_JavaLangString, 2, "writeCallTabStateVal wrong index,," + localObject2);
          return;
        }
        ((StringBuilder)localObject1).setCharAt(i1, (char)(((Integer)localObject2).intValue() + 48));
      }
    }
    if (paramArrayOfInteger[0] != null)
    {
      if (((StringBuilder)localObject1).charAt(4) != '0') {
        break label382;
      }
      i1 = 0;
      dA = i1;
      if (dA != 0) {
        break label387;
      }
    }
    for (;;)
    {
      k = bool;
      if (QLog.isColorLevel()) {
        QLog.i(jdField_a_of_type_JavaLangString, 2, "uin:" + a() + ",writeCallTabStateVal vals=" + paramArrayOfInteger + ",mIsCallTabShow=" + dA + ",isCallTabShow=" + k);
      }
      SettingCloneUtil.writeValue(getApplication(), a(), null, "qqsetting_calltab_show_key", ((StringBuilder)localObject1).toString());
      return;
      label382:
      i1 = 1;
      break;
      label387:
      bool = true;
    }
  }
  
  public boolean a()
  {
    return isLogin();
  }
  
  public boolean a(int paramInt1, String paramString, int paramInt2)
  {
    byte b1 = 3;
    if (paramInt1 == 101) {
      b1 = 1;
    }
    String str = a(paramInt1, paramString, b1, paramInt2);
    if (jdField_a_of_type_AndroidSupportV4UtilMQLruCache.get(str) != null) {}
    do
    {
      return true;
      paramString = new File(a(paramInt1, paramString, paramInt2));
    } while ((paramString.exists()) && (paramString.isFile()));
    return false;
  }
  
  public boolean a(Context paramContext)
  {
    Object localObject = (ActivityManager)paramContext.getApplicationContext().getSystemService("activity");
    paramContext = paramContext.getApplicationContext().getPackageName();
    localObject = ((ActivityManager)localObject).getRunningAppProcesses();
    if (localObject == null) {
      return false;
    }
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext())
    {
      ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)((Iterator)localObject).next();
      if ((processName.equals(paramContext)) && (importance == 100)) {
        return true;
      }
    }
    return false;
  }
  
  public boolean a(QQMessageFacade.Message paramMessage)
  {
    return a(frienduin, istroop);
  }
  
  @Deprecated
  public boolean a(String paramString)
  {
    boolean bool = false;
    if (jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getSharedPreferences(a(), 0).getLong(a() + paramString, 1L) == 1L) {
      bool = true;
    }
    return bool;
  }
  
  public boolean a(String paramString, int paramInt)
  {
    if (paramInt == 1)
    {
      paramInt = b(paramString);
      if ((paramInt == 3) || (paramInt == 2) || (paramInt == 4)) {
        return true;
      }
    }
    return false;
  }
  
  public boolean a(boolean paramBoolean)
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "getAllGeneralSettings , needTroopSettings=" + paramBoolean);
      }
      localRoamSettingController.a(paramBoolean, null);
      return true;
    }
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "getAllGeneralSettings roamSettingController is null ");
    }
    return false;
  }
  
  public boolean a(boolean paramBoolean1, boolean paramBoolean2)
  {
    int i1;
    if (paramBoolean1)
    {
      i1 = dt;
      dt = (i1 + 1);
      if (i1 < 3) {}
    }
    do
    {
      return false;
      i1 = du;
      du = (i1 + 1);
    } while (i1 >= 3);
    ((CardHandler)a(2)).a(paramBoolean1, paramBoolean2);
    return true;
  }
  
  public byte[] a()
  {
    if ((getAccount() != null) && (isLogin()) && (jdField_a_of_type_ComTencentMobileqqDataSigInfo != null)) {
      return jdField_a_of_type_ComTencentMobileqqDataSigInfo.sessionKey;
    }
    return null;
  }
  
  public String[] a()
  {
    Object localObject = a(-1);
    String[] arrayOfString1 = (String[])((HashMap)localObject).get(Integer.valueOf(1));
    String[] arrayOfString2 = (String[])((HashMap)localObject).get(Integer.valueOf(4));
    localObject = (String[])((HashMap)localObject).get(Integer.valueOf(2));
    if (arrayOfString1 != null) {}
    for (int i2 = arrayOfString1.length + 0;; i2 = 0)
    {
      int i1 = i2;
      if (arrayOfString2 != null) {
        i1 = i2 + arrayOfString2.length;
      }
      i2 = i1;
      if (localObject != null) {
        i2 = i1 + localObject.length;
      }
      String[] arrayOfString3;
      if (i2 > 0)
      {
        arrayOfString3 = new String[i2];
        if (arrayOfString1 == null) {
          break label153;
        }
        System.arraycopy(arrayOfString1, 0, arrayOfString3, 0, arrayOfString1.length);
      }
      label153:
      for (i1 = arrayOfString1.length;; i1 = 0)
      {
        if (arrayOfString2 != null)
        {
          System.arraycopy(arrayOfString2, 0, arrayOfString3, 0, arrayOfString2.length);
          i1 = arrayOfString2.length;
        }
        if (localObject != null) {
          System.arraycopy(localObject, 0, arrayOfString3, i1, localObject.length);
        }
        return arrayOfString3;
        return null;
      }
    }
  }
  
  public String[] a(int paramInt)
  {
    return (String[])a(paramInt).get(Integer.valueOf(paramInt));
  }
  
  protected void addManager(int paramInt, Manager paramManager)
  {
    if (jdField_a_of_type_ArrayOfMqqManagerManager[paramInt] != null) {
      return;
    }
    jdField_a_of_type_ArrayOfMqqManagerManager[paramInt] = paramManager;
  }
  
  public int b()
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null) {
      return localRoamSettingController.b("message.group.ring", 0);
    }
    return 0;
  }
  
  public int b(String paramString)
  {
    Object localObject = new ArrayList();
    ((ArrayList)localObject).add(paramString);
    localObject = a((List)localObject);
    if (localObject != null)
    {
      paramString = (Integer)((Map)localObject).get(paramString);
      if (paramString != null) {
        return paramString.intValue();
      }
    }
    return 1;
  }
  
  public Bitmap b(Bitmap paramBitmap)
  {
    try
    {
      Bitmap localBitmap = BitmapFactory.decodeResource(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getResources(), 2130842794);
      if (localBitmap != null) {
        new Canvas(paramBitmap).drawBitmap(localBitmap, paramBitmap.getWidth() - localBitmap.getWidth() - 1, paramBitmap.getHeight() - localBitmap.getHeight() - 1, new Paint());
      }
      return paramBitmap;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      for (;;)
      {
        localOutOfMemoryError.printStackTrace();
        Object localObject1 = null;
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
        Object localObject2 = null;
      }
    }
  }
  
  public Bitmap b(String paramString, int paramInt)
  {
    return a(16, paramString, true, paramInt);
  }
  
  public Drawable b(int paramInt, String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    return null;
  }
  
  @Deprecated
  public Drawable b(String paramString)
  {
    return a(paramString, false, (byte)3);
  }
  
  public SQLiteDatabase b()
  {
    SQLiteOpenHelper localSQLiteOpenHelper = a();
    if (localSQLiteOpenHelper != null) {
      return localSQLiteOpenHelper.b();
    }
    return null;
  }
  
  public SQLiteDatabase b(String paramString)
  {
    paramString = a(paramString);
    if (paramString != null) {
      return paramString.b();
    }
    return null;
  }
  
  public Config b(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqConfigConfig == null) {
      a(paramString);
    }
    return jdField_a_of_type_ComTencentMobileqqConfigConfig;
  }
  
  public Setting b(String paramString)
  {
    return (Setting)jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
  }
  
  public String b()
  {
    return ContactUtils.k(this, a());
  }
  
  public String b(String paramString)
  {
    String str = getApplication().getProperty(Constants.PropertiesKey.uinDisplayName.toString() + paramString);
    if ((str == null) || (str.length() == 0)) {
      return paramString;
    }
    return str;
  }
  
  public void b()
  {
    int i1 = 0;
    jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
    Object localObject = jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager.a(Setting.class, new Setting().getTableName(), false, null, null, null, null, null, null);
    if ((localObject != null) && (((List)localObject).size() > 0)) {
      while (i1 < ((List)localObject).size())
      {
        Setting localSetting = (Setting)((List)localObject).get(i1);
        if (localSetting != null)
        {
          url = null;
          if (!TextUtils.isEmpty(uin)) {
            jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.put(uin, localSetting);
          }
        }
        i1 += 1;
      }
    }
    l = true;
    localObject = new IntentFilter();
    ((IntentFilter)localObject).addAction("com.tencent.qqhead.getheadreq");
    a().registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, (IntentFilter)localObject);
  }
  
  public void b(int paramInt)
  {
    a(new nde(this, paramInt));
  }
  
  public void b(BusinessObserver paramBusinessObserver)
  {
    synchronized (jdField_a_of_type_JavaUtilList)
    {
      jdField_a_of_type_JavaUtilList.remove(paramBusinessObserver);
      synchronized (jdField_b_of_type_JavaUtilList)
      {
        jdField_b_of_type_JavaUtilList.remove(paramBusinessObserver);
      }
    }
    synchronized (jdField_c_of_type_JavaUtilList)
    {
      jdField_c_of_type_JavaUtilList.remove(paramBusinessObserver);
      return;
      paramBusinessObserver = finally;
      throw paramBusinessObserver;
      paramBusinessObserver = finally;
      throw paramBusinessObserver;
    }
  }
  
  public void b(VibrateListener paramVibrateListener)
  {
    if (paramVibrateListener == null) {
      return;
    }
    jdField_d_of_type_JavaUtilList.remove(paramVibrateListener);
  }
  
  public void b(ResourcePluginListener paramResourcePluginListener)
  {
    O();
    jdField_a_of_type_ComTencentMobileqqConfigAboutConfig.a(paramResourcePluginListener);
  }
  
  public void b(MessageRecord paramMessageRecord, boolean paramBoolean)
  {
    boolean bool = NoDisturbUtil.a(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getApplicationContext(), this);
    if (QLog.isColorLevel()) {
      QLog.d("notification", 2, "showInComingMsg ,isFinished=" + g + ", isCanDisturb=" + bool + ", needTicker=" + paramBoolean + ", message=" + paramMessageRecord);
    }
    if ((g) || (!bool)) {}
    QCallFacade localQCallFacade;
    do
    {
      return;
      localQCallFacade = (QCallFacade)getManager(37);
    } while (localQCallFacade == null);
    Object localObject4 = senderuin;
    if ((msgtype == 63520) || (msgtype == 61528)) {
      localObject4 = afrienduin, istroop).senderUin;
    }
    for (;;)
    {
      int i1 = localQCallFacade.c();
      if (i1 == 0) {
        break;
      }
      Intent localIntent;
      if (i1 == 1) {
        if (((msgtype == 63520) || (msgtype == 61528)) && (istroop == 3000))
        {
          localIntent = a(a(), frienduin, istroop);
          localObject1 = (DiscussionHandler)a(6);
          if (localObject1 == null) {
            break label1754;
          }
        }
      }
      label431:
      label463:
      label545:
      label582:
      label654:
      label827:
      label1491:
      label1530:
      label1580:
      label1686:
      label1741:
      label1754:
      for (Object localObject1 = ((DiscussionHandler)localObject1).a(frienduin, true);; localObject1 = null)
      {
        Object localObject3 = ContactUtils.a(this, (String)localObject4, 0);
        bool = true;
        Object localObject5;
        Object localObject2;
        Object localObject6;
        int i2;
        for (;;)
        {
          localIntent.putExtra("key_notification_click_action", true);
          localObject5 = localIntent.getStringExtra("uinname");
          if (localObject5 != null)
          {
            localObject2 = localObject5;
            if (!"".equals(localObject5)) {}
          }
          else
          {
            localObject2 = localIntent.getStringExtra("uin");
          }
          if (localObject3 != null)
          {
            localObject5 = localObject3;
            if (!"".equals(localObject3)) {}
          }
          else
          {
            localObject5 = localObject4;
          }
          localObject5 = localQCallFacade.a((String)localObject5, bool);
          switch (istroop)
          {
          default: 
            localObject6 = (String)localObject2 + ": ";
            localObject3 = localObject5;
            localObject4 = localObject1;
            localObject1 = localObject6;
            if (istroop != 1008) {
              break label1491;
            }
            localObject6 = (String)localObject1 + (String)localObject3;
            if (!paramBoolean) {
              localObject6 = null;
            }
            i2 = localQCallFacade.b();
            localObject1 = localObject2;
            if (i2 > 1)
            {
              localObject1 = localObject2;
              if (i1 == 1)
              {
                if (i2 <= 100) {
                  break label1530;
                }
                localObject1 = (String)localObject2 + " (" + a().getString(2131369737) + ")";
              }
            }
            if ((paramBoolean) && (istroop != 6000) && (istroop != 1009) && (!frienduin.equals(AppConstants.am))) {
              break label1580;
            }
            if ((msgtype != 63520) && (msgtype != 61528)) {
              break label1686;
            }
            if (QLog.isColorLevel()) {
              QLog.e(jdField_a_of_type_JavaLangString, 2, "AVNotify:MSG_TYPE_MULTI_VIDEO");
            }
            if (istroop == 3000)
            {
              if (QLog.isColorLevel()) {
                QLog.e(jdField_a_of_type_JavaLangString, 2, "AVNotify:UIN_TYPE_DISCUSSION");
              }
              localIntent.putExtra("qav_notify_flag", true);
            }
            a(localIntent, (String)localObject6, (String)localObject1, (String)localObject3, (Bitmap)localObject4, "CMD_SHOW_NOTIFIYCATION");
            return;
            if ((istroop == 1000) || (istroop == 1020) || (istroop == 1004))
            {
              localIntent = new Intent(a(), SplashActivity.class);
              localIntent.putExtra("tab_index", MainFragment.a);
              localIntent.putExtra("conversation_index", 1);
              localIntent.setFlags(335544320);
              localIntent.putExtra("uinname", a(frienduin, (String)localObject4, istroop, true));
            }
            for (;;)
            {
              if (!AppConstants.au.equals(frienduin)) {
                break label827;
              }
              localObject1 = a((String)localObject4, true);
              bool = false;
              localObject3 = "";
              break;
              localIntent = a(a(), frienduin, istroop);
            }
            if ((istroop == 1001) || (istroop == 1010))
            {
              localObject1 = a(frienduin, 200);
              bool = false;
              localObject3 = "";
            }
            else
            {
              localObject1 = a(frienduin, true);
              bool = false;
              localObject3 = "";
            }
            break;
          }
        }
        if (((msgtype == 63520) || (msgtype == 61528)) && (istroop == 3000)) {}
        for (bool = true;; bool = false)
        {
          localIntent = new Intent(a(), SplashActivity.class);
          localIntent.putExtra("tab_index", MainFragment.a);
          localIntent.putExtra("conversation_index", 1);
          localIntent.setFlags(335544320);
          localIntent.putExtra("uinname", a().getString(2131369733));
          localObject1 = null;
          localObject3 = "";
          break;
          localObject3 = ContactUtils.a(this, (String)localObject4, 0);
          localObject6 = (String)localObject3 + "(" + (String)localObject2 + ")" + ":";
          localObject3 = localObject5;
          localObject4 = localObject1;
          localObject1 = localObject6;
          break label431;
          localObject3 = localIntent.getStringExtra("subAccountLatestNick");
          localObject1 = localObject4;
          if (localObject3 != null) {
            if (((String)localObject3).length() != 0) {
              break label1741;
            }
          }
          for (localObject1 = localObject4;; localObject1 = localObject3)
          {
            localObject4 = (String)localObject2 + "-" + (String)localObject1 + ":" + (String)localObject5;
            localObject3 = (String)localObject1 + ":" + (String)localObject5;
            localObject1 = localObject4;
            localObject4 = null;
            break;
            localObject6 = (String)localObject2 + ": ";
            localObject3 = localObject5;
            localObject4 = localObject1;
            localObject1 = localObject6;
            break;
            if (i1 > 1)
            {
              localObject6 = (String)localObject2 + ": ";
              localObject3 = localObject5;
              localObject4 = localObject1;
              localObject1 = localObject6;
              break;
            }
            localObject3 = ContactUtils.o(this, frienduin);
            localObject6 = (String)localObject3 + "(" + (String)localObject2 + ")" + ":";
            localObject3 = (String)localObject3 + ": " + (String)localObject5;
            localObject4 = localObject1;
            localObject1 = localObject6;
            break;
            localObject3 = SkinUtils.a(a().getResources().getDrawable(2130838455));
            localObject4 = XMLMessageUtils.a(paramMessageRecord);
            if ((localObject4 != null) && (!items.isEmpty()))
            {
              localObject1 = items.get(0)).title;
              if ((items.get(0)).cover == null) && (items.get(0)).digestList != null))
              {
                localObject4 = (String)items.get(0)).digestList.get(0);
                localObject2 = localObject1;
                localObject1 = localObject4;
              }
              for (;;)
              {
                localObject4 = localObject3;
                localObject3 = localObject1;
                localObject1 = "";
                break;
              }
              localObject6 = localObject1;
              if (istroop == 7000) {
                break label463;
              }
              localObject6 = (String)localObject1 + (String)localObject5;
              break label463;
              localObject1 = (String)localObject2 + " (" + i2 + a().getString(2131368566) + ")";
              break label545;
              if (!QQUtils.a(a())) {
                break label582;
              }
              localObject2 = (QQLSRecentManager)getManager(71);
              if (!SettingCloneUtil.readValue(a(), a(), a().getString(2131369309), "qqsetting_lock_screen_whenexit_key", true)) {
                break label582;
              }
              if (QLog.isColorLevel()) {
                QLog.d("QQLSActivity", 2, "videochatting start lsActivity from appinterface  showInComingMsgForQAV");
              }
              if (bool)
              {
                ((QQLSRecentManager)localObject2).a(this, frienduin, istroop, true);
                break label582;
              }
              ((QQLSRecentManager)localObject2).a(this, frienduin, istroop, false);
              break label582;
              if (msgtype != 63527) {
                break label654;
              }
              if (QLog.isColorLevel()) {
                QLog.e(jdField_a_of_type_JavaLangString, 2, "AVNotify:MSG_TYPE_MEDIA_VIDEO");
              }
              localIntent.putExtra("qav_notify_flag", true);
              break label654;
            }
            localObject1 = "";
            localObject4 = localObject3;
            localObject3 = localObject5;
            break;
          }
        }
      }
    }
  }
  
  public void b(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "checkIfNeedSignonNet onNetNeedSignon() called url:" + paramString);
    }
    MqqHandler localMqqHandler = a(Conversation.class);
    if (localMqqHandler != null)
    {
      Message localMessage = Message.obtain();
      obj = paramString;
      arg1 = 2;
      what = 1134024;
      localMqqHandler.sendMessage(localMessage);
    }
  }
  
  public void b(String paramString, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.qqhead.qaif", 2, "deleteQCallFace id=" + paramString + ", idtype =" + paramInt);
    }
    if (TextUtils.isEmpty(paramString)) {}
    do
    {
      do
      {
        return;
      } while ((paramInt != 200) && (paramInt != 204) && (paramInt != 202));
      a(16, paramString, paramInt);
      paramString = new File(a(16, paramString, paramInt));
    } while ((paramString == null) || (!paramString.exists()));
    paramString.delete();
  }
  
  public void b(String paramString, int paramInt, long paramLong)
  {
    if ((TextUtils.isEmpty(paramString)) || (paramLong <= 0L)) {}
    label13:
    long l1;
    do
    {
      do
      {
        do
        {
          break label13;
          do
          {
            return;
          } while ((paramInt != 200) && (paramInt != 204) && (paramInt != 202));
          localObject = a(16, paramString, paramInt);
        } while ((localObject == null) || (second == null));
        l1 = second).headImgTimestamp;
      } while (l1 == paramLong);
      Object localObject = (FriendListHandler)a(1);
      if (localObject != null) {
        ((FriendListHandler)localObject).a(paramString, paramInt, (byte)1, (byte)0);
      }
    } while (!QLog.isColorLevel());
    QLog.d("Q.qqhead.qaif", 2, "refreshQCallFaceWithTimeStamp id=" + paramString + ", idtype =" + paramInt + ", timestamp=" + paramLong + ",headImgTimestamp=" + l1);
  }
  
  public void b(String paramString, int paramInt, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.qqhead.qaif", 2, "refreshQCallFace id=" + paramString + ", idtype =" + paramInt + ", delLocalCache =" + paramBoolean);
    }
    if (TextUtils.isEmpty(paramString)) {}
    Object localObject;
    do
    {
      do
      {
        return;
      } while ((paramInt != 200) && (paramInt != 204) && (paramInt != 202));
      if (paramBoolean)
      {
        a(16, paramString, paramInt);
        localObject = new File(a(16, paramString, paramInt));
        if ((localObject != null) && (((File)localObject).exists())) {
          ((File)localObject).delete();
        }
      }
      localObject = (FriendListHandler)a(1);
    } while (localObject == null);
    ((FriendListHandler)localObject).b(paramString, paramInt, (byte)1, (byte)0);
  }
  
  public void b(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt1, int paramInt2, String paramString6, String paramString7, String paramString8, String paramString9)
  {
    ReportController.a(this, paramString1, paramString2, paramString3, paramString4, paramString5, paramInt1, paramInt2, paramString6, paramString7, paramString8, paramString9);
  }
  
  public void b(boolean paramBoolean)
  {
    boolean bool = true;
    if (QLog.isColorLevel()) {
      QLog.d("exit", 2, a() + " qq start to exit ");
    }
    N();
    StatisticHitRateCollector.a().d(a());
    PreloadProcHitMgr.a();
    M();
    if (isLogin())
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "kickPC get value in exit........... kickpc = false");
      }
      if (jdField_a_of_type_Boolean)
      {
        sendOnlineStatus(AppRuntime.Status.receiveofflinemsg, false, 0L);
        ((PushManager)getManager(5)).unregistProxyMessagePush(a(), jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getPackageName() + ":video");
      }
    }
    else
    {
      if (GuardManager.a != null) {
        GuardManager.a.a();
      }
      if (!paramBoolean) {
        break label231;
      }
      localMobileQQ = getApplication();
      if (isLogin()) {
        break label226;
      }
    }
    label226:
    for (paramBoolean = true;; paramBoolean = false)
    {
      localMobileQQ.QQProcessExit(paramBoolean);
      i();
      WebAccelerateHelper.a(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl, 2);
      SharedPreferencesProxyManager.getInstance().trySave();
      HeavyTaskExecutor.a();
      return;
      if (paramBoolean)
      {
        sendOnlineStatus(AppRuntime.Status.offline, false, 0L);
        break;
      }
      sendOnlineStatus(AppRuntime.Status.offline, true, 0L);
      break;
    }
    label231:
    MobileQQ localMobileQQ = getApplication();
    if (!jdField_a_of_type_Boolean) {}
    for (paramBoolean = bool;; paramBoolean = false)
    {
      localMobileQQ.QQProcessExit(paramBoolean);
      break;
    }
  }
  
  public void b(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBoolean2)
    {
      a().edit().putBoolean(a().getString(2131367562) + a(), paramBoolean1).commit();
      return;
    }
    ((LBSHandler)a(3)).b(paramBoolean1);
  }
  
  public boolean b()
  {
    boolean bool = false;
    try
    {
      String str = a().getString(2131369885);
      if (str != null) {
        bool = SettingCloneUtil.readValue(a(), null, str, "qqsetting_notify_icon_key", false);
      }
      return bool;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject = null;
      }
    }
  }
  
  public boolean b(String paramString)
  {
    boolean bool2 = false;
    paramString = a().k(paramString);
    boolean bool1 = bool2;
    if (paramString != null)
    {
      bool1 = bool2;
      if (paramString.length > 0) {
        bool1 = true;
      }
    }
    return bool1;
  }
  
  public final boolean b(boolean paramBoolean)
  {
    if (paramBoolean) {
      ((CardHandler)a(2)).b();
    }
    return a().getBoolean(a().getString(2131367564) + a(), true);
  }
  
  public int c()
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null) {
      return localRoamSettingController.b("message.group.vibrate", 0);
    }
    return 0;
  }
  
  @Deprecated
  public Drawable c(String paramString)
  {
    return a(paramString, false, (byte)3);
  }
  
  public String c()
  {
    Object localObject3 = null;
    Object localObject1 = jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getSharedPreferences("mobileQQ", 0);
    if (NetworkUtil.b(BaseApplication.getContext()) == 1) {}
    for (Object localObject2 = ((SharedPreferences)localObject1).getString("serverlist_wifi", null);; localObject2 = ((SharedPreferences)localObject1).getString("serverlist_2g3g", null))
    {
      localObject1 = localObject3;
      if (localObject2 != null)
      {
        localObject2 = ((String)localObject2).split(",");
        localObject1 = localObject3;
        if (localObject2 != null) {
          localObject1 = localObject2[((int)(Math.random() * localObject2.length))];
        }
      }
      return localObject1;
    }
  }
  
  public void c()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onMessageConnect...");
    }
    if ((jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator == null) || (!e())) {
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator != null) {
      jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.b();
    }
    d();
    a().a();
    a().a();
    for (;;)
    {
      Object localObject3;
      HashMap localHashMap;
      try
      {
        Object localObject1 = g();
        Object localObject2 = BaseApplication.getContext().getSharedPreferences("pull_msf" + (String)localObject1, 0);
        String str = ((SharedPreferences)localObject2).getString("uin", " ");
        localObject3 = ((SharedPreferences)localObject2).getString("time", "0");
        if ((!str.equals(" ")) && (!((String)localObject3).equals("0")))
        {
          localHashMap = new HashMap();
          localHashMap.put("uin", str);
          localHashMap.put("time", localObject3);
          localHashMap.put("process", ((SharedPreferences)localObject2).getString("process", ""));
          localHashMap.put("availMem", ((SharedPreferences)localObject2).getString("availMem", ""));
          localHashMap.put("lowMem", ((SharedPreferences)localObject2).getString("lowMem", ""));
          localHashMap.put("state", ((SharedPreferences)localObject2).getString("state", ""));
          localHashMap.put("version", "150806");
          if (Build.VERSION.SDK_INT >= 21)
          {
            StatisticCollector.a(BaseApplicationImpl.getContext()).a(a(), "pullMsfReport_V3", false, 0L, 0L, localHashMap, "");
            localObject2 = ((SharedPreferences)localObject2).edit();
            ((SharedPreferences.Editor)localObject2).clear();
            ((SharedPreferences.Editor)localObject2).commit();
          }
        }
        else
        {
          localObject1 = BaseApplication.getContext().getSharedPreferences("pull_msf_succ" + (String)localObject1, 0);
          localObject2 = ((SharedPreferences)localObject1).getString("uin", " ");
          str = ((SharedPreferences)localObject1).getString("time", "0");
          if ((((String)localObject2).equals(" ")) || (str.equals("0"))) {
            break;
          }
          localObject3 = new HashMap();
          ((HashMap)localObject3).put("uin", localObject2);
          ((HashMap)localObject3).put("time", str);
          ((HashMap)localObject3).put("process", ((SharedPreferences)localObject1).getString("process", ""));
          ((HashMap)localObject3).put("availMem", ((SharedPreferences)localObject1).getString("availMem", ""));
          ((HashMap)localObject3).put("lowMem", ((SharedPreferences)localObject1).getString("lowMem", ""));
          ((HashMap)localObject3).put("state", ((SharedPreferences)localObject1).getString("state", ""));
          ((HashMap)localObject3).put("version", "150806");
          if (Build.VERSION.SDK_INT < 21) {
            break label615;
          }
          StatisticCollector.a(BaseApplicationImpl.getContext()).a(a(), "pullMsfReport_succ_V2", false, 0L, 0L, (HashMap)localObject3, "");
          localObject1 = ((SharedPreferences)localObject1).edit();
          ((SharedPreferences.Editor)localObject1).clear();
          ((SharedPreferences.Editor)localObject1).commit();
          return;
        }
      }
      catch (Exception localException)
      {
        QLog.d(jdField_a_of_type_JavaLangString, 1, "Failed to report pull Msf Event");
        return;
      }
      StatisticCollector.a(BaseApplicationImpl.getContext()).a(a(), "pullMsfReportOther_V3", false, 0L, 0L, localHashMap, "");
      continue;
      label615:
      StatisticCollector.a(BaseApplicationImpl.getContext()).a(a(), "pullMsfReport_succOther_V2", false, 0L, 0L, (HashMap)localObject3, "");
    }
  }
  
  public void c(int paramInt)
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null) {
      localRoamSettingController.a("message.group.ring", Integer.valueOf(paramInt));
    }
  }
  
  public void c(BusinessObserver paramBusinessObserver)
  {
    synchronized (jdField_c_of_type_JavaUtilList)
    {
      if (!jdField_c_of_type_JavaUtilList.contains(paramBusinessObserver)) {
        jdField_c_of_type_JavaUtilList.add(paramBusinessObserver);
      }
      return;
    }
  }
  
  public void c(ResourcePluginListener paramResourcePluginListener)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppLebaHelper != null) {
      jdField_a_of_type_ComTencentMobileqqAppLebaHelper.b(paramResourcePluginListener);
    }
  }
  
  public void c(String paramString)
  {
    FriendListHandler localFriendListHandler = (FriendListHandler)a(1);
    if (localFriendListHandler != null) {
      localFriendListHandler.d(paramString);
    }
  }
  
  public void c(boolean paramBoolean) {}
  
  public void c(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBoolean2)
    {
      ((FriendListHandler)a(1)).d(paramBoolean1);
      return;
    }
    a().edit().putBoolean(a().getString(2131371147) + a(), paramBoolean1).commit();
  }
  
  public boolean c()
  {
    boolean bool = true;
    if (!SettingCloneUtil.readValue(a(), a(), "login_accounts", "qqsetting_bothonline_key", true)) {}
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "kickPC get value........... kickpc = " + bool);
      }
      return bool;
      bool = false;
    }
  }
  
  public final boolean c(boolean paramBoolean)
  {
    if (paramBoolean) {
      ((FriendListHandler)a(1)).d();
    }
    return a().getBoolean(a().getString(2131371147) + a(), true);
  }
  
  protected boolean canAutoLogin(String paramString)
  {
    return SharedPreUtils.a(getApplication().getApplicationContext(), paramString);
  }
  
  public int d()
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null) {
      return localRoamSettingController.b("message.ring.switch", 1);
    }
    return 1;
  }
  
  public Drawable d(String paramString)
  {
    Object localObject = a(109, paramString, (byte)3, true, 0);
    paramString = null;
    if (localObject != null) {
      paramString = new BitmapDrawable((Bitmap)localObject);
    }
    localObject = paramString;
    if (paramString == null) {
      localObject = ImageUtil.b();
    }
    return localObject;
  }
  
  public String d()
  {
    return ((TicketManager)getManager(2)).getVkey(getAccount());
  }
  
  public void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onConnOpenAndStartGetMsg");
    }
    LoadingStateManager.a().a(1);
    MqqHandler localMqqHandler = a(Conversation.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(1134014, null).sendToTarget();
    }
  }
  
  public void d(int paramInt)
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null) {
      localRoamSettingController.a("message.group.vibrate", Integer.valueOf(paramInt));
    }
  }
  
  public void d(ResourcePluginListener paramResourcePluginListener)
  {
    if (jdField_a_of_type_ComTencentMobileqqConfigAboutConfig != null) {
      jdField_a_of_type_ComTencentMobileqqConfigAboutConfig.b(paramResourcePluginListener);
    }
  }
  
  public void d(String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {}
    FriendListHandler localFriendListHandler;
    do
    {
      return;
      localFriendListHandler = (FriendListHandler)a(1);
    } while (localFriendListHandler == null);
    if (paramString.startsWith("+"))
    {
      localFriendListHandler.e(paramString);
      return;
    }
    localFriendListHandler.c(paramString);
  }
  
  public void d(boolean paramBoolean)
  {
    m = paramBoolean;
  }
  
  public void d(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBoolean1) {
      dt = 1;
    }
    for (;;)
    {
      ((CardHandler)a(2)).a(paramBoolean1, paramBoolean2);
      return;
      du = 1;
    }
  }
  
  public boolean d()
  {
    if (aab != -1) {
      return true;
    }
    if ((!a().c()) && (a().b() == 0)) {
      return false;
    }
    if (QQServiceForAV.a())
    {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "VideoProcessAlive");
      }
      return true;
    }
    Object localObject = ((ActivityManager)a().getSystemService("activity")).getRunningAppProcesses();
    if (localObject != null)
    {
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext()) {
        if (nextprocessName.equals("com.tencent.mobileqq:video")) {
          return true;
        }
      }
    }
    return false;
  }
  
  public boolean d(boolean paramBoolean)
  {
    if (paramBoolean) {
      ((FriendListHandler)a(1)).a(a(), 1);
    }
    return a().getBoolean(a().getString(2131371526) + a(), false);
  }
  
  public int e()
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null) {
      return localRoamSettingController.b("message.vibrate.switch", 1);
    }
    return 1;
  }
  
  public String e()
  {
    String str = d();
    if (str != null) {
      try
      {
        str = HexUtil.a(str.getBytes("utf-8"));
        return str;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        localUnsupportedEncodingException.printStackTrace();
      }
    }
    return null;
  }
  
  public void e()
  {
    BaseApplicationImpl.jdField_a_of_type_MqqOsMqqHandler.post(new ncz(this));
  }
  
  public void e(int paramInt)
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null) {
      localRoamSettingController.a("message.ring.switch", Integer.valueOf(paramInt));
    }
  }
  
  public void e(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.qqhead.qaif", 2, "deleteTroopOrgFace id=" + paramString);
    }
    if (TextUtils.isEmpty(paramString)) {}
    do
    {
      return;
      a(109, paramString, 0);
      paramString = new File(a(109, paramString, 0));
    } while ((paramString == null) || (!paramString.exists()));
    paramString.delete();
  }
  
  public void e(boolean paramBoolean)
  {
    SharedPreferences.Editor localEditor = PreferenceManager.getDefaultSharedPreferences(BaseApplication.getContext()).edit();
    localEditor.putBoolean(BaseApplication.getContext().getString(2131367515) + a(), paramBoolean);
    localEditor.commit();
  }
  
  public void e(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBoolean2)
    {
      ((FriendListHandler)a(1)).a(paramBoolean1, a(), 1);
      return;
    }
    a().edit().putBoolean(a().getString(2131371526) + a(), paramBoolean1).commit();
  }
  
  public boolean e()
  {
    return (getAccount() != null) && (isLogin());
  }
  
  public boolean e(boolean paramBoolean)
  {
    if (paramBoolean) {
      ((FriendListHandler)a(1)).a(a(), 2);
    }
    return a().getBoolean(a().getString(2131371527) + a(), false);
  }
  
  public int f()
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null) {
      return localRoamSettingController.b("sync.c2c_message", 1);
    }
    return 1;
  }
  
  public String f()
  {
    String str = "";
    if (!a().equals("0")) {
      str = a();
    }
    return str;
  }
  
  public void f()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onConnClose");
    }
    jdField_e_of_type_Boolean = false;
    LoadingStateManager.a().a(1);
    MqqHandler localMqqHandler = a(Conversation.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(1134014, null).sendToTarget();
    }
  }
  
  public void f(int paramInt)
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null) {
      localRoamSettingController.a("message.vibrate.switch", Integer.valueOf(paramInt));
    }
  }
  
  public void f(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBoolean2)
    {
      ((FriendListHandler)a(1)).a(paramBoolean1, a(), 2);
      return;
    }
    a().edit().putBoolean(a().getString(2131371527) + a(), paramBoolean1).commit();
  }
  
  public boolean f()
  {
    return SettingCloneUtil.readValue(a(), a(), a().getString(2131368180), "qqsetting_notify_showcontent_key", true);
  }
  
  public boolean f(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("SUB_ACCOUNT", 2, "startAllSubMessageAccountMsg() isFromPush=" + paramBoolean);
    }
    Object localObject1 = null;
    Object localObject2 = (SubAccountManager)getManager(60);
    if (localObject2 != null) {
      localObject1 = ((SubAccountManager)localObject2).a();
    }
    if (localObject1 != null)
    {
      localObject1 = ((ArrayList)localObject1).iterator();
      boolean bool1 = false;
      for (;;)
      {
        bool2 = bool1;
        if (!((Iterator)localObject1).hasNext()) {
          break;
        }
        localObject2 = (String)((Iterator)localObject1).next();
        if ((localObject2 != null) && (((String)localObject2).length() > 4))
        {
          bool1 = true;
          SubAccountControll.a(this, (String)localObject2, paramBoolean);
        }
        else if (QLog.isColorLevel())
        {
          QLog.d("SUB_ACCOUNT", 2, "startAllSubMessageAccountMsg() continue, subUin=" + (String)localObject2);
        }
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("SUB_ACCOUNT", 2, "startAllSubMessageAccountMsg() listSubUin==null");
    }
    boolean bool2 = false;
    if (QLog.isColorLevel()) {
      QLog.d("SUB_ACCOUNT", 2, "startAllSubMessageAccountMsg() result=" + bool2 + " forground=" + BaseActivity.mAppForground);
    }
    localObject1 = (SubAccountControll)getManager(61);
    if (localObject1 != null)
    {
      if (!bool2) {
        break label258;
      }
      if (BaseActivity.mAppForground) {
        ((SubAccountControll)localObject1).d(this);
      }
    }
    return bool2;
    label258:
    ((SubAccountControll)localObject1).e(this);
    return bool2;
  }
  
  protected void finalize()
  {
    super.finalize();
    QQEntityManagerFactory localQQEntityManagerFactory = jdField_a_of_type_ComTencentMobileqqDataQQEntityManagerFactory;
    if (localQQEntityManagerFactory != null) {
      localQQEntityManagerFactory.close();
    }
  }
  
  public int g()
  {
    int i1 = 0;
    int i2 = 0;
    Object localObject = a();
    if (localObject != null)
    {
      QCallFacade localQCallFacade = a();
      i1 = i2;
      if (localQCallFacade != null) {
        i1 = localQCallFacade.a();
      }
      i1 = ((QQMessageFacade)localObject).e() + i1;
      localObject = (PhoneContactManagerImp)getManager(10);
      if (localObject != null) {
        i1 = ((PhoneContactManagerImp)localObject).b() + i1;
      }
    }
    else
    {
      return i1;
    }
    return i1;
  }
  
  public void g()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onRecvFistResp");
    }
    jdField_e_of_type_Boolean = true;
    MqqHandler localMqqHandler = a(Conversation.class);
    if (!LoadingStateManager.a().d())
    {
      LoadingStateManager.a().a(2);
      if (localMqqHandler != null) {
        localMqqHandler.obtainMessage(1134012, null).sendToTarget();
      }
    }
    for (;;)
    {
      if (localMqqHandler != null)
      {
        Message localMessage = Message.obtain();
        arg1 = 0;
        what = 1134024;
        localMqqHandler.sendMessage(localMessage);
      }
      return;
      if ((LoadingStateManager.a().b()) && (localMqqHandler != null)) {
        localMqqHandler.obtainMessage(1134015, null).sendToTarget();
      }
    }
  }
  
  public void g(int paramInt)
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null) {
      localRoamSettingController.a("sync.c2c_message", Integer.valueOf(paramInt));
    }
  }
  
  public void g(boolean paramBoolean1, boolean paramBoolean2)
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null) {
      localRoamSettingController.a(paramBoolean1, paramBoolean2);
    }
  }
  
  public boolean g()
  {
    if (y())
    {
      Object localObject = ThemeUtil.getUserCurrentThemeId(this);
      if ((localObject != null) && (!((String)localObject).equals("1000")))
      {
        localObject = ThemeUtil.getThemeInfo(getApplication(), (String)localObject);
        if ((localObject != null) && (isVoiceTheme)) {
          return true;
        }
      }
    }
    return false;
  }
  
  public Manager getManager(int paramInt)
  {
    Manager localManager1 = jdField_a_of_type_ArrayOfMqqManagerManager[paramInt];
    if (localManager1 == null) {}
    for (;;)
    {
      Manager localManager2;
      synchronized (jdField_a_of_type_ArrayOfMqqManagerManager)
      {
        localManager2 = jdField_a_of_type_ArrayOfMqqManagerManager[paramInt];
        if ((localManager2 == null) && ((getAccount() != null) || (paramInt <= 7) || (paramInt == 26))) {
          break label1710;
        }
        return localManager2;
        if (localManager1 != null) {
          addManager(paramInt, localManager1);
        }
        return localManager1;
      }
      Object localObject2 = new AccountManagerImpl(this);
      continue;
      localObject2 = new WtloginManagerImpl(this);
      continue;
      localObject2 = new TicketManagerImpl(this);
      continue;
      localObject2 = new ProxyIpManagerImpl(this);
      continue;
      localObject2 = new QZoneManagerImp(this);
      continue;
      localObject2 = new PhoneContactManagerImp(this);
      continue;
      localObject2 = new GameCenterManagerImp(this);
      continue;
      localObject2 = new WebProcessManager(this);
      continue;
      localObject2 = new EmoticonManagerImp(this);
      continue;
      localObject2 = StatusManager.a(this);
      continue;
      localObject2 = new ShieldMsgManger(this);
      continue;
      localObject2 = new SttManager(this);
      continue;
      localObject2 = new ProxyManager(this);
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager = ((ProxyManager)localObject2);
      continue;
      localObject2 = new CacheManager(this);
      jdField_a_of_type_ComTencentMobileqqAppAsyncdbCacheManager = ((CacheManager)localObject2);
      continue;
      getManager(28);
      localObject2 = new QQMessageFacade(this);
      jdField_a_of_type_ComTencentMobileqqAppMessageQQMessageFacade = ((QQMessageFacade)localObject2);
      continue;
      localObject2 = new NetEngineFactory();
      jdField_a_of_type_ComTencentMobileqqTransfileNetEngineFactory = ((NetEngineFactory)localObject2);
      continue;
      localObject2 = new RecommendTroopManagerImp(this);
      continue;
      localObject2 = new FileTransferManager(this);
      continue;
      localObject2 = new MediaPlayerManager(this);
      continue;
      localObject2 = IPluginManager.a(this);
      continue;
      localObject2 = new SubAccountProtocManager(this);
      continue;
      localObject2 = new ConversationFacade(this);
      jdField_a_of_type_ComTencentMobileqqAppMessageConversationFacade = ((ConversationFacade)localObject2);
      continue;
      localObject2 = new DiscussionMemberManager(this);
      continue;
      localObject2 = new RoamSettingController(this);
      continue;
      localObject2 = new TroopCreateLogic(this);
      continue;
      localObject2 = new RecentManagerFor3rdPart(this);
      continue;
      localObject2 = new NewFriendManager(this);
      continue;
      localObject2 = new CircleManager(this);
      continue;
      localObject2 = new RedTouchManager(this);
      continue;
      localObject2 = new TroopInfoManager(this);
      continue;
      localObject2 = new QCallFacade(this);
      continue;
      localObject2 = new PicPreDownloader(this);
      continue;
      localObject2 = new RoamSettingManager(this);
      continue;
      localObject2 = new ContactSyncManager(this);
      continue;
      localObject2 = new FontManager(this);
      continue;
      localObject2 = new EmojiManager(this);
      continue;
      localObject2 = new BubbleManager(this);
      continue;
      localObject2 = new ColorRingManager(this);
      continue;
      localObject2 = new AvatarPendantManager(this);
      continue;
      localObject2 = new DownloaderFactory(this);
      continue;
      localObject2 = new TroopGagMgr(this);
      continue;
      localObject2 = new MyBusinessManager(this);
      continue;
      localObject2 = new FriendsManager(this);
      continue;
      localObject2 = new TroopManager(this);
      continue;
      localObject2 = new DiscussionManager(this);
      continue;
      localObject2 = new ContactFacade(this);
      continue;
      localObject2 = new SearchHistoryManager(this);
      continue;
      localObject2 = new PublicAccountDataManager(this);
      continue;
      localObject2 = new SecMsgManager(this);
      continue;
      localObject2 = new SignatureManager(this);
      continue;
      localObject2 = new ConditionSearchManager(this);
      continue;
      jdField_a_of_type_ComTencentMobileqqAppHotChatManager = new HotChatManager(this);
      localObject2 = jdField_a_of_type_ComTencentMobileqqAppHotChatManager;
      continue;
      localObject2 = new SubAccountManager(this);
      continue;
      localObject2 = new SubAccountControll(this);
      continue;
      localObject2 = new ChatBackgroundManager(this);
      continue;
      localObject2 = new NumRedPointManager(this);
      continue;
      localObject2 = new NumRedMsgManager(this);
      continue;
      localObject2 = new LbsInfoMgr(this);
      continue;
      localObject2 = new ShortVideoTransManager(this);
      continue;
      localObject2 = new DeviceProfileManager.AccountDpcManager(this);
      continue;
      localObject2 = new EqqDetailDataManager(this);
      continue;
      localObject2 = new TroopRedTouchManager(this);
      continue;
      localObject2 = new DatingProxyManager(this);
      continue;
      localObject2 = new QQLSRecentManager(this);
      continue;
      localObject2 = new PicStatisticsManager(this);
      continue;
      localObject2 = new NearbyBannerManager(this);
      continue;
      localObject2 = new VipGiftManager(this);
      continue;
      localObject2 = new EarlyDownloadManager(this);
      continue;
      localObject2 = new QQWiFiMainManager(this);
      continue;
      localObject2 = new PortalManager(this);
      continue;
      localObject2 = new AddContactTroopManage(this);
      continue;
      localObject2 = new TroopTipsMsgMgr(this);
      continue;
      localObject2 = new WordMatchManager(this);
      continue;
      localObject2 = new PngFrameManager(this);
      continue;
      localObject2 = new VipFunCallManager(this);
      continue;
      localObject2 = new ActivateFriendsManager(this);
      continue;
      localObject2 = new LightalkSwitchManager(this);
      continue;
      localObject2 = new LifeOnlineAccountInfoManager(this);
      continue;
      localObject2 = new EcShopAssistantManager(this);
      continue;
      localObject2 = new PttConfigController(this);
      continue;
      localObject2 = new VipImageUploadManager(this);
      continue;
      localObject2 = new QzoneContactsFeedManager(this);
      continue;
      localObject2 = new MessageRoamManager(this);
      continue;
      localObject2 = new NearbyGrayTipsManager(this);
      continue;
      localObject2 = new SecSpyFileManager(this);
      continue;
      localObject2 = new ShortVideoPreDownloader(this);
      continue;
      localObject2 = new ReadInJoyManager(this);
      continue;
      localObject2 = new TroopTopicMgr(this);
      continue;
      localObject2 = new DynamicMsgInfoManager(this);
      continue;
      localObject2 = new PAReportManager(this);
      continue;
      localObject2 = new PhoneUnityManager(this);
      continue;
      localObject2 = new FavroamingManager(this);
      continue;
      localObject2 = new FullMessageSearchManager(this);
      continue;
      localObject2 = new QzoneAlbumRedTouchManager(this);
      continue;
      localObject2 = new TroopAppMgr(this);
      continue;
      localObject2 = new TroopAioADManager(this);
      continue;
      localObject2 = new IndividuationManager(this);
      continue;
      localObject2 = new NearbyCardManager(this);
      continue;
      localObject2 = new ODProxy(this);
      continue;
      localObject2 = new TroopGiftManager(this);
      continue;
      localObject2 = new DingdongPluginManager(this);
      continue;
      localObject2 = new WeatherManager(this);
      continue;
      localObject2 = new QQCardManager(this);
      continue;
      localObject2 = new QQHotSpotRemoteManager(this);
      continue;
      localObject2 = new NearbyProxy(this);
      continue;
      localObject2 = new HotPatchManager(this);
      continue;
      localObject2 = new TroopPluginManager(this);
      continue;
      localObject2 = new PttPreSendManager(this);
      continue;
      localObject2 = new PTTPreDownloader(this);
      continue;
      localObject2 = new ArkAppCenter(this);
      continue;
      localObject2 = new SenseWhereManager(this);
      continue;
      localObject2 = new PasswdRedBagManager(this);
      continue;
      localObject2 = new HotChatPKActivityManager(this);
      continue;
      localObject2 = new HotchatSCMng(this);
      continue;
      localObject2 = new BusinessCardManager(this);
      continue;
      localObject2 = new FTSDBManager(this);
      jdField_a_of_type_ComTencentMobileqqAppProxyFTSDBManager = ((FTSDBManager)localObject2);
      continue;
      localObject2 = new QRProcessManager(this);
      continue;
      localObject2 = new NearbyFlowerManager(this);
      continue;
      localObject2 = new TroopOrgDataManager(this);
      continue;
      localObject2 = new TroopOrgProtocolManager(this);
      continue;
      localObject2 = new IndividualRedPacketManager(this);
      continue;
      localObject2 = new TroopBindPublicAccountMgr(this);
      continue;
      localObject2 = new BlessManager(this);
      continue;
      localObject2 = new DAUStatistic(this);
      continue;
      localObject2 = new PublicQuickPayManager(this);
      continue;
      localObject2 = new LightalkShieldManager(this);
      continue;
      localObject2 = new QCallCardManager(this);
      continue;
      localObject2 = new VipComicMqqManager(this);
      continue;
      localObject2 = new QQComicPreloadManager(this);
      continue;
      localObject2 = new BitAppManager(this);
      continue;
      localObject2 = new PstnManager(this);
      continue;
      localObject2 = new PullActiveManager(this);
      continue;
      localObject2 = new LoginWelcomeManager(this);
      continue;
      return localObject2;
      label1710:
      localObject2 = localManager2;
      switch (paramInt)
      {
      }
      localObject2 = localManager2;
    }
  }
  
  protected String[] getMessagePushSSOCommands()
  {
    return new String[] { "OnlinePush.ReqPush", "MessageSvc.PushGroupMsg", "MessageSvc.PushForceOffline", "MessageSvc.PushNotify", "MessageSvc.PushForceOffline", "MessageSvc.RequestPushStatus", "RegPrxySvc.PullDisGroupSeq", "MessageSvc.RequestBatchPushFStatus", "MessageSvc.PushFStatus", "AccostSvc.SvrMsg", "ADMsgSvc.PushMsg", "StreamSvr.PushStreamMsg", "friendlist.getOnlineFriend", "MessageSvc.WNSQzone", "RegPrxySvc.PbGetMsg", "RegPrxySvc.getOffMsg", "RegPrxySvc.PbGetGroupMsg", "RegPrxySvc.PullDisMsgSeq", "RegPrxySvc.infoNew", "RegPrxySvc.PullDisMsgProxy", "RegPrxySvc.PbGetDiscussMsg", "RegPrxySvc.PullGroupMsgProxy", "RegPrxySvc.GetMsgV2", "RegPrxySvc.PullGroupMsgSeq", "RegPrxySvc.NoticeEnd", "RegPrxySvc.PbSyncMsg", "account.ResponseNotifyForRecommendUpdate", "MessageSvc.PushReaded", "RegPrxySvc.infoLogin", "baseSdk.Msf.NotifyResp", "RegPrxySvc.PushParam", "OnlinePush.PbPushGroupMsg", "OnlinePush.PbPushTransMsg", "OnlinePush.PbPushDisMsg", "OnlinePush.PbC2CMsgSync", "cmd_connAllFailed", "cmd_recvFirstResp", "MultiVideo.s2c", "MultiVideo.c2sack", "NearFieldTranFileSvr.NotifyList", "ProfileService.CheckUpdateReq", "NearFieldDiscussSvr.NotifyList", "RegPrxySvc.QueryIpwdStat", "StatSvc.SvcReqMSFLoginNotify", "SharpSvr.s2cpstncallback" };
  }
  
  protected Class[] getMessagePushServlets()
  {
    return new Class[] { TempServlet.class, CliNotifyPush.class, ContactBindServlet.class };
  }
  
  public void h()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "onConnAllFailed");
    }
    LoadingStateManager.a().a(4);
    MqqHandler localMqqHandler = a(Conversation.class);
    if (localMqqHandler != null) {
      localMqqHandler.obtainMessage(1134013, null).sendToTarget();
    }
  }
  
  public void h(boolean paramBoolean1, boolean paramBoolean2)
  {
    RoamSettingController localRoamSettingController = (RoamSettingController)getManager(30);
    if (localRoamSettingController != null) {
      localRoamSettingController.b(paramBoolean1, paramBoolean2);
    }
  }
  
  public boolean h()
  {
    AudioManager localAudioManager = (AudioManager)a().getSystemService("audio");
    if (localAudioManager != null) {}
    for (;;)
    {
      try
      {
        i1 = localAudioManager.getRingerMode();
        if (i1 == 0) {
          return true;
        }
      }
      catch (NullPointerException localNullPointerException)
      {
        i1 = 2;
        continue;
      }
      return false;
      int i1 = 2;
    }
  }
  
  public void i()
  {
    ThreadManager.b().post(new ndr(this));
    a(new ToServiceMsg("mobileqq.service", a(), "CMD_STOP_NOTIFIYCATION"));
  }
  
  public boolean i()
  {
    AudioManager localAudioManager = (AudioManager)a().getSystemService("audio");
    return (localAudioManager != null) && (localAudioManager.getRingerMode() == 2);
  }
  
  public void j()
  {
    try
    {
      NotificationManager localNotificationManager = (NotificationManager)jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getSystemService("notification");
      localNotificationManager.cancel(121);
      localNotificationManager.cancel(119);
      a(a());
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public boolean j()
  {
    String str = Build.MANUFACTURER + Build.MODEL;
    if ((!TextUtils.isEmpty(str)) && (str.toLowerCase().contains("xiaomi"))) {
      if (Settings.System.getInt(a().getContentResolver(), "vibrate_in_normal", -1) != 1) {}
    }
    do
    {
      do
      {
        do
        {
          return true;
          return false;
          if (Build.VERSION.SDK_INT >= 11) {
            break;
          }
        } while (Settings.System.getInt(a().getContentResolver(), "vibrate_on", -1) > 4);
        return false;
        if (Build.VERSION.SDK_INT >= 16) {
          break;
        }
      } while (Settings.System.getInt(a().getContentResolver(), "vibrate_on", -1) == 5);
      return false;
    } while (Settings.System.getInt(a().getContentResolver(), "vibrate_when_ringing", -1) == 1);
    return false;
  }
  
  public boolean k()
  {
    AudioManager localAudioManager = (AudioManager)a().getSystemService("audio");
    return (localAudioManager != null) && (localAudioManager.getRingerMode() == 1);
  }
  
  public void l()
  {
    if (jdField_a_of_type_ComTencentAvAppAvAddFriendService != null)
    {
      jdField_a_of_type_ComTencentAvAppAvAddFriendService.a();
      jdField_a_of_type_ComTencentAvAppAvAddFriendService = null;
    }
  }
  
  public boolean l()
  {
    AudioManager localAudioManager = (AudioManager)a().getSystemService("audio");
    return (localAudioManager != null) && (localAudioManager.getStreamVolume(2) == 0);
  }
  
  public void logout(boolean paramBoolean)
  {
    if (paramBoolean) {
      N();
    }
    ((PushManager)getManager(5)).unregistProxyMessagePush(a(), jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getPackageName() + ":video");
    LoadingStateManager.a().a();
    M();
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "kickPC in app  do logout");
    }
    String str = a();
    if (str != null) {}
    try
    {
      SdkContext.cleanCokiee(a(), Long.parseLong(str));
      super.logout(paramBoolean);
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
  }
  
  public void m()
  {
    AppRuntime.Status localStatus;
    if (isLogin()) {
      switch ((int)a())
      {
      default: 
        localStatus = AppRuntime.Status.offline;
      }
    }
    for (;;)
    {
      ((PushManager)getManager(5)).registProxyMessagePush(a(), jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getPackageName() + ":video", "com.tencent.av.ui.VChatActivity", new String[] { "VideoSvc.Send", "VideoCCSvc.Adaptation", "SharpSvr.c2sack", "SharpSvr.s2c" });
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "kickPC get value in sendRegisterPush........... kickpc = " + c());
      }
      sendOnlineStatus(localStatus, c(), a().getSharedPreferences(getAccount(), 0).getInt("GetFrdListReq_seq", 0));
      return;
      localStatus = AppRuntime.Status.online;
      continue;
      localStatus = AppRuntime.Status.away;
      continue;
      localStatus = AppRuntime.Status.invisiable;
    }
  }
  
  public boolean m()
  {
    TelephonyManager localTelephonyManager = (TelephonyManager)a().getSystemService("phone");
    return (localTelephonyManager != null) && (localTelephonyManager.getCallState() == 0);
  }
  
  public void n()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "getVideoConfigUpdate");
    }
    NewIntent localNewIntent = new NewIntent(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl, VideoConfigServlet.class);
    localNewIntent.putExtra("reqType", 11);
    startServlet(localNewIntent);
  }
  
  public boolean n()
  {
    return a().getBoolean(a().getString(2131367562) + a(), false);
  }
  
  public void o()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppLebaHelper == null)
    {
      jdField_a_of_type_ComTencentMobileqqAppLebaHelper = new LebaHelper(this);
      jdField_a_of_type_ComTencentMobileqqAppLebaHelper.a();
    }
  }
  
  public boolean o()
  {
    Object localObject = a();
    localObject = ((FriendsManager)getManager(50)).a((String)localObject);
    if (localObject == null) {
      return false;
    }
    if (((Card)localObject).isShowZan()) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    startServlet(new NewIntent(getApplication(), PushServlet.class));
    jdField_a_of_type_ComTencentMobileqqServiceMobileQQService = new MobileQQService(this);
    jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator = new Automator(this);
    if (e())
    {
      QCallFacade.a(this, System.currentTimeMillis());
      jdField_a_of_type_ComTencentMobileqqPersistenceEntityManager = a().createEntityManager();
      jdField_f_of_type_Long = System.currentTimeMillis();
      if (StartService.jdField_a_of_type_Boolean) {
        jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.a(StepFactory.a(jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator, "{83,{4,3,5,6},[11,12,14],17,20,21,56,57,22,41,42,[79,76,62,25,10,26,27,28,29,30,31,32,34,35,37,38,39,40,44,45,47,52,66,67,68,69,48,50,51,58,60,73,78,64,77,70,74,75,80,82],54,84}"));
      }
      if (StartService.jdField_a_of_type_Boolean) {
        ThemeUtil.initTheme(this);
      }
      P();
    }
    paramBundle = new IntentFilter("com.tencent.qzone.cleanunreadcount");
    paramBundle.addAction("com.tecent.qzone.clearAlbumRedTouch");
    jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.registerReceiver(jdField_c_of_type_AndroidContentBroadcastReceiver, paramBundle);
    VideoBroadcastReceiver.a(this);
    if (StartService.jdField_a_of_type_Boolean) {
      ProfileCardUtil.a();
    }
    if (GuardManager.a != null) {
      GuardManager.a.a(this);
    }
    jdField_d_of_type_Boolean = true;
    a().a();
    a().d();
    UniformDownloadMgr.a().a(this);
    PluginManageHandler.getInstance().setPluginManagerProvider(this, false);
    L();
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    BaseApplicationImpl.jdField_b_of_type_Long = 0L;
    BaseApplicationImpl.jdField_a_of_type_Long = 0L;
    BaseApplicationImpl.c = 0L;
    FMTSrvAddrProvider.b();
    M();
    ThemeUiPlugin.destroy(this);
    ChatBackgroundManager.a();
    AppNetConnInfo.unregisterNetInfoHandler(jdField_a_of_type_Ndu);
    ThreadManager.a(new ndh(this), 8, null, false);
    i();
    if (QLog.isColorLevel()) {
      QLog.d("security_scan", 2, "Unregist Cloud Scan Listener");
    }
    try
    {
      jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.unregisterReceiver(jdField_c_of_type_AndroidContentBroadcastReceiver);
      jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
      try
      {
        jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.unregisterReceiver(jdField_b_of_type_AndroidContentBroadcastReceiver);
        UniformDownloadMgr.a().a();
        if (jdField_a_of_type_ComTencentMobileqqTransfileTransFileController != null) {
          a().a();
        }
        Config.b();
        OpenApiManager.a().c(this);
        AppLaucherHelper.a();
        TroopFileUploadingManager.a(this);
        QWalletHelper.b(this);
        if (jdField_a_of_type_ComTencentMobileqqFilemanagerCoreOnlineFileSessionCenter != null) {
          jdField_a_of_type_ComTencentMobileqqFilemanagerCoreOnlineFileSessionCenter.e();
        }
        if (jdField_a_of_type_ComTencentMobileqqHighwayHwEngine != null) {
          jdField_a_of_type_ComTencentMobileqqHighwayHwEngine.closeEngine();
        }
        if (!TextUtils.isEmpty(a())) {
          QQOperateManager.b();
        }
        if (jdField_a_of_type_ComTencentMobileqqFilemanagerCoreFileManagerDataCenter != null) {
          a().e();
        }
        if (jdField_a_of_type_CooperationQlinkQQProxyForQlink != null) {
          a().e();
        }
        PresendPicMgr localPresendPicMgr = PresendPicMgr.a(null);
        if (localPresendPicMgr != null) {
          localPresendPicMgr.b();
        }
        LeakInspector.a(this, String.format("QQAppInterface@%x_%d", new Object[] { Integer.valueOf(hashCode()), Long.valueOf(getLongAccountUin()) }));
        return;
      }
      catch (Exception localException1)
      {
        for (;;) {}
      }
    }
    catch (Exception localException2)
    {
      for (;;) {}
    }
  }
  
  public RemotePluginManager.Stub onGetPluginManager()
  {
    return (PluginManagerV2)getManager(26);
  }
  
  public void onProxyIpChanged()
  {
    ThreadManager.a(new ndt(this), 8, null, false);
  }
  
  public void onRunningBackground()
  {
    super.onRunningBackground();
    G();
    if (jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager != null) {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.e();
    }
    ReportController.a(this);
    a().b();
    Object localObject = (QzoneAlbumRedTouchManager)getManager(103);
    if (localObject != null) {
      ((QzoneAlbumRedTouchManager)localObject).c();
    }
    localObject = (MediaPlayerManager)jdField_a_of_type_ArrayOfMqqManagerManager[23];
    if ((localObject != null) && (((MediaPlayerManager)localObject).b())) {
      ((MediaPlayerManager)localObject).a(false);
    }
    PublicAccountManager.a().b(this);
    a(-1L);
  }
  
  public void onRunningForeground()
  {
    super.onRunningForeground();
    ReportController.b(this, "CliOper", "", "", "0X8004014", "0X8004014", 0, 0, "", "", "", "");
    Object localObject = a();
    if ((localObject != null) && (((QQMessageFacade)localObject).e() > 1)) {
      ReportController.b(this, "CliOper", "", "", "0X8004015", "0X8004015", 0, 0, "", "", "", "");
    }
    ReportController.a(this, false);
    QlinkReliableReport.a();
    localObject = new Intent("com.tencent.intent.QZONE_PRE_DOWNLOAD_CANCEL");
    BaseApplication.getContext().sendBroadcast((Intent)localObject);
    localObject = (PhoneContactManagerImp)getManager(10);
    if (localObject != null) {
      ((PhoneContactManagerImp)localObject).c();
    }
    localObject = (GameCenterManagerImp)getManager(11);
    if (localObject != null)
    {
      ((GameCenterManagerImp)localObject).c();
      ((NumRedPointManager)getManager(63)).a();
      localObject = BaseApplication.getContext().getSharedPreferences(getAccount(), 0);
      int i1 = ((SharedPreferences)localObject).getInt("NumRedTimeInterval", 600);
      int i2 = ((SharedPreferences)localObject).getInt("NumRedLastTime", 0);
      if ((int)(System.currentTimeMillis() / 1000L) - i2 > i1) {
        ((NumRedPointHandler)a(55)).a();
      }
    }
    localObject = (QZoneManager)getManager(9);
    if (localObject != null)
    {
      if (((QZoneManager)localObject).a() > 0) {
        ((QZoneManager)localObject).b(((QZoneManager)localObject).a());
      }
      ((QZoneManager)localObject).b(2);
    }
    f(false);
    QWalletPushManager.a(this, false);
    QWalletCommonManager.a(this);
    if (!QQUtils.a(a().getBaseContext()))
    {
      localObject = (DingdongPluginManager)getManager(114);
      if (localObject != null) {
        ((DingdongPluginManager)localObject).a(this);
      }
    }
    localObject = (ActivateFriendsManager)getManager(84);
    if (localObject != null) {
      ((ActivateFriendsManager)localObject).a();
    }
    PublicAccountManager.a().a(this);
    StatisticCollector.a(BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl).a(this);
    D();
    ShowNodeTaskManager.a();
  }
  
  public void p()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppLebaHelper != null) {
      jdField_a_of_type_ComTencentMobileqqAppLebaHelper.c();
    }
  }
  
  public boolean p()
  {
    return a().getBoolean(a().getString(2131367563) + a(), false);
  }
  
  public void q()
  {
    boolean bool = true;
    if (QLog.isColorLevel()) {
      QLog.d("notification", 2, "trySoundAndVibrate is called,needSoundAndVibrations is:" + Arrays.toString(jdField_a_of_type_ArrayOfByte));
    }
    Object localObject = a();
    if (localObject == null) {}
    do
    {
      do
      {
        return;
        localObject = ((QQMessageFacade)localObject).a();
      } while (localObject == null);
      jdField_c_of_type_ArrayOfLong[0] = uniseq;
      jdField_c_of_type_ArrayOfLong[1] = 1L;
    } while (jdField_a_of_type_ArrayOfByte[0] != 1);
    if (jdField_a_of_type_ArrayOfByte[1] == 1) {}
    for (;;)
    {
      d((MessageRecord)localObject, bool);
      jdField_a_of_type_ArrayOfByte[0] = 0;
      return;
      bool = false;
    }
  }
  
  public boolean q()
  {
    return (jdField_a_of_type_ComTencentMobileqqAppCheckPttListener != null) && (jdField_a_of_type_ComTencentMobileqqAppCheckPttListener.e());
  }
  
  public void r()
  {
    d(null, false);
  }
  
  public boolean r()
  {
    boolean bool2 = false;
    Object localObject = PreferenceManager.getDefaultSharedPreferences(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl);
    boolean bool3 = SettingCloneUtil.readValue(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl, null, "security_scan_key", "qqsetting_security_scan_key", false);
    boolean bool4 = ((SharedPreferences)localObject).getBoolean("security_scan_last_result", false);
    long l1 = ((SharedPreferences)localObject).getLong("security_scan_last_time", 0L);
    localObject = new Date(l1);
    Date localDate = new Date();
    ((Date)localObject).setHours(0);
    ((Date)localObject).setMinutes(0);
    ((Date)localObject).setSeconds(0);
    boolean bool1 = bool2;
    if (bool3) {
      if ((l1 != 0L) && (localDate.getTime() - ((Date)localObject).getTime() <= 604800000L))
      {
        bool1 = bool2;
        if (!bool4) {}
      }
      else
      {
        bool1 = true;
      }
    }
    return bool1;
  }
  
  public void s()
  {
    ((LBSHandler)a(3)).a();
  }
  
  public boolean s()
  {
    String str1 = a();
    String str2 = ContactUtils.i(this, str1);
    Object localObject;
    if ((!TextUtils.isEmpty(str1)) && (str1.equals(str2)))
    {
      localObject = (FriendsManager)getManager(50);
      if (localObject == null)
      {
        localObject = null;
        if ((localObject != null) && (name != null)) {
          break label136;
        }
        localObject = (FriendListHandler)a(1);
        if (localObject == null) {
          break label136;
        }
        ((FriendListHandler)localObject).b(str1);
      }
    }
    label136:
    for (boolean bool = true;; bool = false)
    {
      if (QLog.isDevelopLevel()) {
        QLog.i(jdField_a_of_type_JavaLangString, 4, "checkAndGetSelfNickName, [" + str2 + "," + bool + "]");
      }
      return bool;
      localObject = ((FriendsManager)localObject).c(str1);
      break;
    }
  }
  
  public void setAutoLogin(boolean paramBoolean)
  {
    String str = "";
    if (!a().equals("0")) {
      str = a();
    }
    SharedPreUtils.a(getApplication().getApplicationContext(), str, paramBoolean);
  }
  
  public void start(boolean paramBoolean)
  {
    if ((paramBoolean) && (BaseApplicationImpl.jdField_a_of_type_ComTencentMobileqqStartupDirectorStartupDirector != null)) {
      return;
    }
    jdField_a_of_type_Ndu = new ndu(this, null);
    AppNetConnInfo.registerConnectionChangeReceiver(getApplication(), jdField_a_of_type_Ndu);
    super.start(paramBoolean);
  }
  
  public void t()
  {
    ((CardHandler)a(2)).a();
  }
  
  public boolean t()
  {
    return PreferenceManager.getDefaultSharedPreferences(BaseApplication.getContext()).getBoolean(BaseApplication.getContext().getString(2131367515) + a(), true);
  }
  
  public void u()
  {
    synchronized (jdField_b_of_type_JavaLangObject)
    {
      a().a(AppConstants.ap, 0);
      a().a().f();
      return;
    }
  }
  
  protected void userLogoutReleaseData()
  {
    N();
    HeavyTaskExecutor.a(new nda(this));
    UpgradeController.a().a(true);
    SystemMsgController.a().c();
    FriendSystemMsgController.a().c();
    GroupSystemMsgController.a().c();
    MsgAutoMonitorUtil.a().a();
    ChatActivityUtils.c();
    BadgeUtils.a(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl, 0);
    SharedPreferences.Editor localEditor = jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getSharedPreferences("unreadcount", 4).edit();
    localEditor.putInt("unread", 0);
    localEditor.commit();
    WebAccelerateHelper.a(jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl, 1);
    if (jdField_a_of_type_ComTencentMobileqqTransfileTransFileController != null)
    {
      jdField_a_of_type_ComTencentMobileqqTransfileTransFileController.b();
      jdField_a_of_type_ComTencentMobileqqTransfileTransFileController.a();
    }
    OpenApiManager.a().b(this);
    LoginWelcomeManager.a(this).e();
    jdField_a_of_type_ComTencentMobileqqAppAutomatorAutomator.g();
  }
  
  public void v()
  {
    synchronized (jdField_b_of_type_JavaLangObject)
    {
      a().a(AppConstants.ap, 0);
      return;
    }
  }
  
  public void w()
  {
    synchronized (jdField_b_of_type_JavaLangObject)
    {
      a().a(AppConstants.av, 0);
      a().a().f();
      return;
    }
  }
  
  public void x()
  {
    synchronized (jdField_b_of_type_JavaLangObject)
    {
      a().a(AppConstants.av, 0);
      return;
    }
  }
  
  public void y()
  {
    synchronized (jdField_b_of_type_JavaLangObject)
    {
      if (QLog.isColorLevel()) {
        QLog.d("systemmsg", 2, "clearFriendSystemMsg");
      }
      a().a(AppConstants.au, 0);
      a().a().d();
      return;
    }
  }
  
  public void z()
  {
    synchronized (jdField_b_of_type_JavaLangObject)
    {
      if (QLog.isColorLevel()) {
        QLog.d("systemmsg", 2, "clearFriendSystemMsgHistory");
      }
      a().a(AppConstants.au, 0);
      return;
    }
  }
}
