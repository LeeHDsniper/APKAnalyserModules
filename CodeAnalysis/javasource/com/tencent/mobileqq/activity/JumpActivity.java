package com.tencent.mobileqq.activity;

import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Parcelable;
import android.text.TextUtils;
import com.tencent.av.camera.QavCameraUsage;
import com.tencent.biz.thridappshare.ThridAppShareHelper;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.QQMapActivityProxy;
import com.tencent.mobileqq.equipmentlock.DevlockPhoneStatus;
import com.tencent.mobileqq.equipmentlock.EquipmentLockImpl;
import com.tencent.mobileqq.filemanager.util.FileManagerReporter;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.forward.ForwardFileOption;
import com.tencent.mobileqq.gesturelock.GesturePWDUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.utils.Base64Util;
import com.tencent.mobileqq.utils.JumpAction;
import com.tencent.mobileqq.utils.JumpParser;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import cooperation.buscard.BuscardPluginInstallActivity;
import cooperation.comic.VipComicJumpActivity;
import cooperation.dingdong.DingdongPluginNotificationUtil;
import cooperation.groupvideo.GroupVideoHelper;
import cooperation.qlink.QQProxyForQlink;
import cooperation.qqfav.QfavUtil;
import cooperation.qqreader.QRBridgeActivity;
import cooperation.qqwifi.QQWiFiHelper;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import jdf;
import jdg;
import jdh;
import jdi;
import jdj;
import mqq.app.MobileQQ;
import mqq.observer.WtloginObserver;
import oicq.wlogin_sdk.devicelock.DevlockInfo;

public class JumpActivity
  extends BaseActivity
{
  public static final int a = 18;
  private static final String jdField_a_of_type_JavaLangString = "JumpAction";
  private static HashMap jdField_a_of_type_JavaUtilHashMap;
  public static boolean a = false;
  private static String[] jdField_a_of_type_ArrayOfJavaLangString = { "mqq", "mqqapi", "mqqmdpass", "mqqwpa", "mqqopensdkapi", "mqqflyticket", "wtloginmqq", "imto", "mqqtribe", "mqqvoipivr", "mqqverifycode", "mqqdevlock", "qapp", "qqwifi", "mqqconnect" };
  public static final int b = 19;
  public static final int c = 20;
  public static final int d = 21;
  public static final int e = 22;
  private static volatile boolean e = false;
  public static final int f = 1;
  public static final int g = 2;
  private static int h;
  private Intent jdField_a_of_type_AndroidContentIntent = null;
  private Uri jdField_a_of_type_AndroidNetUri;
  private QQMapActivityProxy jdField_a_of_type_ComTencentMobileqqAppQQMapActivityProxy;
  private WtloginObserver jdField_a_of_type_MqqObserverWtloginObserver = new jdf(this);
  private Intent jdField_b_of_type_AndroidContentIntent = null;
  private String jdField_b_of_type_JavaLangString;
  private boolean jdField_b_of_type_Boolean = false;
  private String jdField_c_of_type_JavaLangString;
  private boolean jdField_c_of_type_Boolean = false;
  private String jdField_d_of_type_JavaLangString;
  private boolean jdField_d_of_type_Boolean;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    h = -1;
    e = false;
  }
  
  public JumpActivity() {}
  
  private String a(InputStream paramInputStream)
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    byte[] arrayOfByte = new byte['Ѐ'];
    for (;;)
    {
      int i = paramInputStream.read(arrayOfByte);
      if (i == -1) {
        break;
      }
      localByteArrayOutputStream.write(arrayOfByte, 0, i);
    }
    localByteArrayOutputStream.close();
    return new String(localByteArrayOutputStream.toByteArray(), "UTF-8");
  }
  
  private String a(String paramString)
  {
    if ((paramString == null) || ("".equals(paramString)) || (paramString.length() == 0)) {
      return null;
    }
    try
    {
      paramString = new String(Base64Util.decode(paramString, 0));
      return paramString;
    }
    catch (Exception paramString) {}
    return null;
  }
  
  public static void a(Intent paramIntent)
  {
    String str = paramIntent.getDataString();
    if ((paramIntent.getComponent() == null) && (!TextUtils.isEmpty(str)))
    {
      Object localObject = Uri.parse(str).getScheme();
      if ((a((String)localObject)) && (b((String)localObject)))
      {
        localObject = StatisticCollector.a(BaseApplication.getContext());
        HashMap localHashMap = new HashMap();
        localHashMap.put("URL", str);
        ((StatisticCollector)localObject).a("", "JA_ILLEGAL", true, 0L, 0L, localHashMap, "");
        paramIntent.setComponent(new ComponentName("com.tencent.mobileqq", "com.tencent.mobileqq.activity.JumpActivity"));
      }
    }
  }
  
  private void a(Intent paramIntent, Bundle paramBundle)
  {
    new jdg(this, paramIntent, paramBundle).run();
  }
  
  private void a(Bundle paramBundle)
  {
    new jdh(this, paramBundle).run();
  }
  
  private void a(String paramString)
  {
    if ("com.tencent.mobileqq.msf.qqwifi.campus".equals(paramString))
    {
      if (QLog.isDevelopLevel()) {
        QLog.i("JumpAction", 4, "gotoQQWIFI with  campus action");
      }
      QQWiFiHelper.b(app, getIntent());
    }
    for (;;)
    {
      finish();
      return;
      a();
      QQWiFiHelper.a(this, app);
    }
  }
  
  public static void a(String paramString, boolean paramBoolean)
  {
    for (;;)
    {
      try
      {
        if (QLog.isColorLevel()) {
          QLog.d("JumpAction", 2, "initJASwitch with " + paramString + " inited=" + e);
        }
        boolean bool = e;
        if (bool) {
          return;
        }
      }
      finally {}
      try
      {
        h = (int)Long.parseLong(paramString, 16);
        if (paramBoolean) {
          BaseApplicationImpl.a.getSharedPreferences("Jump_Action", 0).edit().putString("JASwitch", paramString).commit();
        }
      }
      catch (NumberFormatException paramString)
      {
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.e("JumpAction", 2, "initJASwitch error", paramString);
        continue;
      }
      e = true;
    }
  }
  
  private void a(boolean paramBoolean)
  {
    Intent localIntent = getIntent();
    Object localObject2 = localIntent.getExtras();
    Object localObject1 = localObject2;
    if (localObject2 == null) {
      localObject1 = new Bundle();
    }
    if ((paramBoolean) && (!app.isLogin()))
    {
      localObject2 = new Intent(this, LoginActivity.class);
      ((Intent)localObject2).putExtra("isActionSend", true);
      ((Intent)localObject2).putExtras((Bundle)localObject1);
      ((Intent)localObject2).putExtras(localIntent);
      startActivityForResult((Intent)localObject2, 20);
      return;
    }
    a(localIntent, (Bundle)localObject1);
  }
  
  private void a(boolean paramBoolean1, String paramString, boolean paramBoolean2)
  {
    Object localObject = getIntent();
    if ((paramBoolean1) && (!app.isLogin()))
    {
      jdField_a_of_type_Boolean = true;
      paramString = new Intent(this, LoginActivity.class);
      paramString.putExtra("isActionSend", true);
      paramString.putExtras(paramString);
      paramString.setFlags(16777216);
      startActivityForResult(paramString, 21);
      return;
    }
    if ((paramBoolean2) && (GesturePWDUtils.getJumpLock(this, app.a())))
    {
      startActivityForResult(new Intent(getActivity(), GesturePWDUnlockActivity.class), 22);
      return;
    }
    jdField_a_of_type_Boolean = false;
    localObject = ((Intent)localObject).getDataString();
    localObject = JumpParser.a(app, this, (String)localObject);
    ((JumpAction)localObject).a(paramString);
    ((JumpAction)localObject).b();
    finish();
  }
  
  private static boolean a(String paramString)
  {
    if (jdField_a_of_type_JavaUtilHashMap == null) {}
    try
    {
      if (jdField_a_of_type_JavaUtilHashMap == null)
      {
        jdField_a_of_type_JavaUtilHashMap = new HashMap();
        int i = 0;
        while (i < jdField_a_of_type_ArrayOfJavaLangString.length)
        {
          String str = jdField_a_of_type_ArrayOfJavaLangString[i];
          jdField_a_of_type_JavaUtilHashMap.put(str, Integer.valueOf(i));
          i += 1;
        }
        if (!e) {
          f();
        }
      }
      return jdField_a_of_type_JavaUtilHashMap.containsKey(paramString);
    }
    finally {}
  }
  
  private void b(Intent paramIntent)
  {
    Intent localIntent;
    if (!app.isLogin())
    {
      localIntent = new Intent();
      localIntent.setClass(this, LoginActivity.class);
      localIntent.addFlags(67371008);
      localIntent.putExtra("QREADER_SHORTCUT_JUMP_KEY", paramIntent);
      localIntent.putExtras(paramIntent.getExtras());
      startActivity(localIntent);
      finish();
      return;
    }
    if ((GesturePWDUtils.getJumpLock(this, app.a())) && (!GesturePWDUtils.getAppForground(this)))
    {
      localIntent = new Intent(getActivity(), GesturePWDUnlockActivity.class);
      localIntent.putExtra("key_gesture_from_jumpactivity", true);
      jdField_a_of_type_AndroidContentIntent = new Intent();
      jdField_a_of_type_AndroidContentIntent.putExtras(paramIntent);
      startActivityForResult(localIntent, 571);
      return;
    }
    c(paramIntent);
  }
  
  private void b(String paramString)
  {
    if ((paramString == null) || (jdField_d_of_type_JavaLangString == null) || (jdField_c_of_type_JavaLangString == null) || (jdField_b_of_type_JavaLangString == null)) {}
    do
    {
      do
      {
        do
        {
          return;
        } while ("app".equals(jdField_b_of_type_JavaLangString));
        if (!"web".equals(jdField_b_of_type_JavaLangString)) {
          break;
        }
      } while (!"javascript".equals(jdField_c_of_type_JavaLangString));
      paramString = "javascript:" + jdField_d_of_type_JavaLangString + "('" + paramString + "')";
      Intent localIntent = new Intent(this, QQBrowserActivity.class);
      localIntent.putExtra("uin", app.a());
      localIntent.setData(Uri.parse(paramString));
      startActivity(localIntent);
      return;
    } while (!"internal".equals(jdField_b_of_type_JavaLangString));
  }
  
  private void b(boolean paramBoolean)
  {
    Bundle localBundle = getIntent().getExtras();
    if (localBundle == null)
    {
      finish();
      return;
    }
    if ((paramBoolean) && (!app.isLogin()))
    {
      Intent localIntent = new Intent(this, LoginActivity.class);
      localIntent.putExtra("isActionSend", true);
      localIntent.putExtras(localBundle);
      localIntent.putExtras(localIntent);
      startActivityForResult(localIntent, 19);
      return;
    }
    if (localBundle.getBoolean("qqfav_extra_from_system_share", false))
    {
      int i = a(localBundle);
      if (i == 4) {
        QfavUtil.a(this, 2131365853, 1);
      }
      for (;;)
      {
        finish();
        return;
        if (i != 0) {
          QfavUtil.a(this, 2131365854, 1);
        }
      }
    }
    a(localBundle);
  }
  
  private static boolean b(String paramString)
  {
    if (jdField_a_of_type_JavaUtilHashMap != null) {
      return (1 << ((Integer)jdField_a_of_type_JavaUtilHashMap.get(paramString)).intValue() & h) != 0;
    }
    return false;
  }
  
  private void c()
  {
    FileManagerUtil.a(this);
    FileManagerReporter.a("0X8005533");
    finish();
  }
  
  private void c(Intent paramIntent)
  {
    Intent localIntent = new Intent(this, QRBridgeActivity.class);
    localIntent.putExtras(paramIntent);
    startActivity(localIntent);
    finish();
  }
  
  private void d()
  {
    String str1 = getPackageName();
    String str2 = InstallActivity.class.getName();
    Intent localIntent = new Intent("android.intent.action.MAIN");
    localIntent.addCategory("android.intent.category.LAUNCHER");
    localIntent.addFlags(268435456);
    localIntent.setComponent(new ComponentName(str1, str2));
    startActivity(localIntent);
    finish();
  }
  
  private void d(Intent paramIntent)
  {
    Intent localIntent;
    if (!app.isLogin())
    {
      localIntent = new Intent();
      localIntent.setClass(this, LoginActivity.class);
      localIntent.addFlags(67371008);
      localIntent.putExtra("QQCOMIC_SHORTCUT_JUMP_KEY", paramIntent);
      localIntent.putExtras(paramIntent.getExtras());
      startActivity(localIntent);
      finish();
      return;
    }
    if ((GesturePWDUtils.getJumpLock(this, app.a())) && (!GesturePWDUtils.getAppForground(this)))
    {
      localIntent = new Intent(getActivity(), GesturePWDUnlockActivity.class);
      localIntent.putExtra("key_gesture_from_jumpactivity", true);
      jdField_b_of_type_AndroidContentIntent = new Intent();
      jdField_b_of_type_AndroidContentIntent.putExtras(paramIntent);
      startActivityForResult(localIntent, 572);
      return;
    }
    e(paramIntent);
  }
  
  private void e()
  {
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqAppQQMapActivityProxy == null) {
        jdField_a_of_type_ComTencentMobileqqAppQQMapActivityProxy = new QQMapActivityProxy(app.getAccount());
      }
      startActivityForResult(new Intent(this, QQMapActivity.class).putExtra("uin", app.getAccount()), 18);
      return;
    }
    catch (Exception localException)
    {
      if (jdField_d_of_type_Boolean) {
        b("Google Map not exist");
      }
      finish();
    }
  }
  
  private void e(Intent paramIntent)
  {
    if (paramIntent != null)
    {
      localObject = paramIntent.getStringExtra("comicID");
      if ((!((String)localObject).equalsIgnoreCase("0")) && (!TextUtils.isEmpty((CharSequence)localObject))) {
        break label57;
      }
    }
    label57:
    for (Object localObject = new Intent(this, VipComicJumpActivity.class);; localObject = new Intent(this, QQBrowserActivity.class))
    {
      ((Intent)localObject).putExtras(paramIntent);
      startActivity((Intent)localObject);
      finish();
      return;
    }
  }
  
  private static void f()
  {
    a(BaseApplicationImpl.a.getSharedPreferences("Jump_Action", 0).getString("JASwitch", "FFFFFFFF"), false);
  }
  
  private void f(Intent paramIntent)
  {
    Intent localIntent;
    if (!app.isLogin())
    {
      localIntent = new Intent();
      localIntent.setClass(this, LoginActivity.class);
      localIntent.addFlags(67371008);
      localIntent.putExtra("QFILE_SHORTCUT_JUMP_KEY", paramIntent);
      localIntent.putExtras(paramIntent.getExtras());
      startActivity(localIntent);
      finish();
      return;
    }
    if ((GesturePWDUtils.getJumpLock(this, app.a())) && (!GesturePWDUtils.getAppForground(this)))
    {
      localIntent = new Intent(getActivity(), GesturePWDUnlockActivity.class);
      localIntent.putExtra("key_gesture_from_jumpactivity", true);
      localIntent.putExtras(paramIntent.getExtras());
      startActivityForResult(localIntent, 570);
      return;
    }
    c();
  }
  
  private void g(Intent paramIntent)
  {
    if (QLog.isDevelopLevel()) {
      QLog.i("JumpAction", 4, "action=android.nfc.action.TECH_DISCOVERED");
    }
    Object localObject = "{ \"viewTag\":\"busCard\", \"comeForm\":4, \"appInfo\":\"appid#0|bargainor_id#0|channel#qwallet_gotonfc\", \"userId\":\"" + app.a() + "\" }";
    Parcelable localParcelable = paramIntent.getParcelableExtra("android.nfc.extra.TAG");
    if (QLog.isDevelopLevel()) {
      QLog.i("JumpAction", 4, "gotoQWalletNfc() 1");
    }
    paramIntent = new Bundle();
    paramIntent.putString("json", (String)localObject);
    paramIntent.putString("callbackSn", "0");
    paramIntent.putParcelable("android.nfc.extra.TAG", localParcelable);
    if (QLog.isDevelopLevel()) {
      QLog.i("JumpAction", 4, "gotoQWalletNfc() 2");
    }
    localObject = new Intent();
    ((Intent)localObject).setClass(this, BuscardPluginInstallActivity.class);
    ((Intent)localObject).putExtras(paramIntent);
    startActivity((Intent)localObject);
    if (QLog.isDevelopLevel()) {
      QLog.i("JumpAction", 4, "after startActivity");
    }
    finish();
  }
  
  private void h(Intent paramIntent)
  {
    boolean bool = paramIntent.getBooleanExtra("IS_LOGIN_SUC_CALL", false);
    if (!app.isLogin())
    {
      if (bool)
      {
        finish();
        return;
      }
      Intent localIntent = new Intent();
      localIntent.setClass(this, LoginActivity.class);
      localIntent.addFlags(67371008);
      localIntent.putExtra("QLINK_SHORTCUT_JUMP_KEY", paramIntent);
      startActivity(localIntent);
      finish();
      return;
    }
    QQProxyForQlink.a(this, 7, null);
    finish();
  }
  
  private static void i(Intent paramIntent)
  {
    String str = paramIntent.getAction();
    paramIntent = paramIntent.getDataString();
    if (QLog.isColorLevel()) {
      QLog.d("JumpAction", 2, "reportJumpArguments action=" + str + "; data=" + paramIntent);
    }
    StatisticCollector localStatisticCollector = StatisticCollector.a(BaseApplication.getContext());
    HashMap localHashMap = new HashMap();
    localHashMap.put("action", str);
    localHashMap.put("data", paramIntent);
    localStatisticCollector.a("", "JA_ARGUMENTS", true, 0L, 0L, localHashMap, "");
  }
  
  protected int a(Bundle paramBundle)
  {
    Object localObject2 = null;
    String str5;
    HashMap localHashMap;
    int i;
    for (;;)
    {
      try
      {
        if (QLog.isDevelopLevel()) {
          QLog.d("qqfav|QfavJumpActivity", 4, "startSystemShareToQQFav|beg");
        }
        Object localObject3 = (Uri)paramBundle.getParcelable("android.intent.extra.STREAM");
        if ((localObject3 != null) && ("file".equals(((Uri)localObject3).getScheme())) && (((Uri)localObject3).getPath().startsWith("/storage"))) {
          return 4;
        }
        Object localObject1 = paramBundle.getString("android.intent.extra.TITLE");
        paramBundle.getString("android.intent.extra.SUBJECT");
        String str4 = paramBundle.getString("android.intent.extra.TEXT");
        paramBundle.getString("image_url");
        paramBundle.getString("detail_url");
        str5 = getIntent().getType();
        if (TextUtils.isEmpty(str5))
        {
          if (!QLog.isColorLevel()) {
            break label1245;
          }
          QLog.d("qqfav|QfavJumpActivity", 2, "startSystemShareToQQFav|type null");
          break label1245;
        }
        localHashMap = new HashMap();
        localHashMap.put("src_type", "app");
        localHashMap.put("version", "1");
        localHashMap.put("cflag", Base64Util.encodeToString("1".getBytes(), 0));
        if (TextUtils.isEmpty((CharSequence)localObject1))
        {
          localObject1 = "";
          localHashMap.put("title", localObject1);
          if (!str5.startsWith("text")) {
            break label599;
          }
          if (paramBundle.containsKey("android.intent.extra.STREAM")) {
            continue;
          }
          localHashMap.put("req_type", Base64Util.encodeToString("6".getBytes(), 0));
          if (TextUtils.isEmpty(str4))
          {
            paramBundle = "";
            localHashMap.put("description", paramBundle);
            paramBundle = new StringBuilder("mqqapi://share/to_qqfav?");
            localObject1 = localHashMap.keySet();
            localObject2 = ((Set)localObject1).iterator();
            i = 0;
            label309:
            if (!((Iterator)localObject2).hasNext()) {
              break label1176;
            }
            localObject3 = (String)((Iterator)localObject2).next();
            paramBundle.append((String)localObject3);
            paramBundle.append("=");
            paramBundle.append((String)localHashMap.get(localObject3));
            if (i == ((Set)localObject1).size() - 1) {
              break label1247;
            }
            paramBundle.append("&");
            break label1247;
          }
        }
        else
        {
          localObject1 = Base64Util.encodeToString(((String)localObject1).getBytes(), 0);
          continue;
        }
        paramBundle = Base64Util.encodeToString(str4.getBytes(), 0);
        continue;
        if (localObject3 == null) {
          continue;
        }
        try
        {
          paramBundle = super.getContentResolver().openInputStream((Uri)localObject3);
        }
        catch (Exception localException1)
        {
          try
          {
            localObject1 = a(paramBundle);
            paramBundle.close();
            if (TextUtils.isEmpty((CharSequence)localObject1))
            {
              if (!QLog.isColorLevel()) {
                break label1254;
              }
              QLog.d("qqfav|QfavJumpActivity", 2, "startSystemShareToQQFav|text, extra_stream, empty");
              break label1254;
            }
            localHashMap.put("req_type", Base64Util.encodeToString("6".getBytes(), 0));
            if (!TextUtils.isEmpty((CharSequence)localObject1)) {
              continue;
            }
            paramBundle = "";
            localHashMap.put("description", paramBundle);
          }
          catch (Exception localException2)
          {
            String str2;
            boolean bool;
            continue;
            paramBundle = null;
            break label1258;
          }
          localException1 = localException1;
          paramBundle = null;
        }
        if (QLog.isColorLevel()) {
          QLog.d("qqfav|QfavJumpActivity", 2, "startSystemShareToQQFav|text, extra_stream, exp:" + localException1.getMessage());
        }
        if (paramBundle != null) {}
        try
        {
          paramBundle.close();
          return 1;
          paramBundle = Base64Util.encodeToString(localException1.getBytes(), 0);
        }
        catch (IOException paramBundle)
        {
          paramBundle.printStackTrace();
          continue;
        }
        if (!str5.startsWith("image")) {
          break label1139;
        }
      }
      catch (OutOfMemoryError paramBundle)
      {
        if (QLog.isColorLevel()) {
          QLog.d("qqfav|QfavJumpActivity", 2, "startSystemShareToQQFav|outofmemoryerror");
        }
        return 1;
      }
      label599:
      localHashMap.put("req_type", Base64Util.encodeToString("5".getBytes(), 0));
      if (getIntent().getAction().equals("android.intent.action.SEND"))
      {
        paramBundle = paramBundle.get("android.intent.extra.STREAM");
        if (paramBundle == null)
        {
          if (!QLog.isColorLevel()) {
            break label1256;
          }
          QLog.d("qqfav|QfavJumpActivity", 2, "startSystemShareToQQFav|action_send extra_stream null");
          break label1256;
        }
        if ((paramBundle instanceof Uri))
        {
          paramBundle = (Uri)paramBundle;
          break label1258;
        }
        if (!(paramBundle instanceof String)) {
          break label1240;
        }
        paramBundle = Uri.parse((String)paramBundle);
        break label1258;
        label709:
        paramBundle = ForwardFileOption.a(this, paramBundle);
        if ((TextUtils.isEmpty(paramBundle)) || (!new File(paramBundle).exists()))
        {
          if (QLog.isColorLevel()) {
            QLog.d("qqfav|QfavJumpActivity", 2, "startSystemShareToQQFav|action_send file path invalid. path=" + paramBundle);
          }
          return 1;
        }
        try
        {
          String str1 = URLEncoder.encode(paramBundle, "UTF-8");
          localHashMap.put("file_data", Base64Util.encodeToString(str1.getBytes(), 0));
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException1)
        {
          if (QLog.isColorLevel()) {
            QLog.d("qqfav|QfavJumpActivity", 2, "startSystemShareToQQFav|encode fail. path=" + paramBundle + ",exp:" + localUnsupportedEncodingException1.getMessage());
          }
          return 1;
        }
      }
    }
    try
    {
      paramBundle = (ArrayList)paramBundle.get("android.intent.extra.STREAM");
      if (paramBundle == null)
      {
        if (!QLog.isColorLevel()) {
          break label1264;
        }
        QLog.d("qqfav|QfavJumpActivity", 2, "startSystemShareToQQFav|action_send_muti extra_stream null");
      }
    }
    catch (Exception paramBundle)
    {
      for (;;)
      {
        paramBundle.printStackTrace();
        paramBundle = (Bundle)localObject2;
      }
      localObject2 = new ArrayList();
      i = 0;
      for (;;)
      {
        if (i < paramBundle.size())
        {
          str2 = ForwardFileOption.a(this, (Uri)paramBundle.get(i));
          if (!TextUtils.isEmpty(str2))
          {
            bool = new File(str2).exists();
            if (!bool) {}
          }
          try
          {
            ((ArrayList)localObject2).add(URLEncoder.encode(str2, "UTF-8"));
            i += 1;
          }
          catch (UnsupportedEncodingException localUnsupportedEncodingException2)
          {
            for (;;)
            {
              if (QLog.isColorLevel()) {
                QLog.d("qqfav|QfavJumpActivity", 2, "startSystemShareToQQFav|action_send_muti path encode fail: %s" + localUnsupportedEncodingException2.getMessage());
              }
            }
          }
        }
      }
      if (!((ArrayList)localObject2).isEmpty()) {
        break label1268;
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("qqfav|QfavJumpActivity", 2, "startSystemShareToQQFav|action_send_muti pathlist empty");
    }
    for (;;)
    {
      if (i < ((ArrayList)localObject2).size())
      {
        String str3 = paramBundle + (String)((ArrayList)localObject2).get(i);
        paramBundle = str3;
        if (i != ((ArrayList)localObject2).size() - 1) {
          paramBundle = str3 + ";";
        }
      }
      else
      {
        localHashMap.put("file_data", Base64Util.encodeToString(paramBundle.getBytes(), 0));
        break;
        label1139:
        if (!QLog.isColorLevel()) {
          break label1283;
        }
        QLog.d("qqfav|QfavJumpActivity", 2, "startSystemShareToQQFav|unknown type. type=" + str5);
        break label1283;
        label1176:
        paramBundle = JumpParser.a(app, this, paramBundle.toString());
        if (paramBundle == null)
        {
          if (!QLog.isColorLevel()) {
            break label1285;
          }
          QLog.d("qqfav|QfavJumpActivity", 2, "startSystemShareToQQFav|jump parse fail");
          break label1285;
        }
        paramBundle.b();
        if (QLog.isDevelopLevel()) {
          QLog.d("qqfav|QfavJumpActivity", 4, "startSystemShareToQQFav|end");
        }
        return 0;
        label1240:
        label1245:
        return 1;
        label1247:
        i += 1;
        break label309;
        label1254:
        return 1;
        label1256:
        return 1;
        label1258:
        if (paramBundle != null) {
          break label709;
        }
        return 1;
        label1264:
        return 1;
        return 1;
        label1268:
        paramBundle = "";
        i = 0;
        continue;
      }
      i += 1;
    }
    label1283:
    return 1;
    label1285:
    return 1;
  }
  
  public void a()
  {
    try
    {
      Object localObject2 = getSystemService("statusbar");
      Object localObject1 = Class.forName("android.app.StatusBarManager");
      if (Build.VERSION.SDK_INT <= 16) {}
      for (localObject1 = ((Class)localObject1).getMethod("collapse", new Class[0]);; localObject1 = ((Class)localObject1).getMethod("collapsePanels", new Class[0]))
      {
        ((Method)localObject1).setAccessible(true);
        ((Method)localObject1).invoke(localObject2, new Object[0]);
        return;
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  void a(int paramInt)
  {
    Intent localIntent = new Intent("android.intent.action.GET_CONTENT");
    localIntent.setType("image/*");
    startActivityForResult(localIntent, paramInt);
  }
  
  public void a(DevlockInfo paramDevlockInfo)
  {
    boolean bool2 = true;
    boolean bool1 = true;
    DevlockPhoneStatus localDevlockPhoneStatus = DevlockPhoneStatus.a();
    if ((localDevlockPhoneStatus != null) && (localDevlockPhoneStatus.a() == DevlockPhoneStatus.d))
    {
      localIntent = new Intent();
      localIntent.setAction("mqq.intent.action.DEVLOCK_ROAM");
      if (paramDevlockInfo != null) {
        if (DevSetup == 1)
        {
          localIntent.putExtra("auth_dev_open", bool1);
          localIntent.putExtra("guardphone_state", localDevlockPhoneStatus.a());
          if (paramDevlockInfo == null) {
            break label122;
          }
        }
      }
      label122:
      for (paramDevlockInfo = Mobile;; paramDevlockInfo = "")
      {
        localIntent.putExtra("guardphone_mask", paramDevlockInfo);
        sendBroadcast(localIntent, "com.tencent.msg.permission.pushnotify");
        finish();
        return;
        bool1 = false;
        break;
        bool1 = false;
        break;
      }
    }
    Intent localIntent = new Intent(getIntent());
    localIntent.putExtra("devlock_need_broadcast", true);
    if ((localIntent.getBooleanExtra("enable_open_allowset_dev", false)) && (paramDevlockInfo != null) && (DevSetup == 0) && (AllowSet == 1))
    {
      localIntent.setClass(this, AuthDevActivity.class);
      localIntent.putExtra("phone_num", Mobile);
      localIntent.putExtra("country_code", CountryCode);
      localIntent.putExtra("auth_dev_open", false);
      localIntent.putExtra("allow_set", true);
    }
    for (;;)
    {
      startActivity(localIntent);
      if (!localIntent.getBooleanExtra("open_devlock_from_roam", false)) {
        break;
      }
      overridePendingTransition(2130968585, 2130968583);
      break;
      if ((paramDevlockInfo != null) && (DevSetup == 1))
      {
        localIntent.setClass(this, AuthDevActivity.class);
        localIntent.putExtra("phone_num", Mobile);
        localIntent.putExtra("country_code", CountryCode);
        if (DevSetup == 1)
        {
          bool1 = true;
          label327:
          localIntent.putExtra("auth_dev_open", bool1);
          if (AllowSet != 1) {
            break label365;
          }
        }
        label365:
        for (bool1 = bool2;; bool1 = false)
        {
          localIntent.putExtra("allow_set", bool1);
          break;
          bool1 = false;
          break label327;
        }
      }
      localIntent.setClass(this, AuthDevOpenUgActivity.class);
      localIntent.putExtra("DevlockInfo", paramDevlockInfo);
    }
  }
  
  protected boolean a(Intent paramIntent)
  {
    return false;
  }
  
  void b()
  {
    if (QavCameraUsage.b(BaseApplicationImpl.getContext())) {
      return;
    }
    Object localObject = new File(AppConstants.bd + "photo/");
    if (!((File)localObject).exists()) {
      ((File)localObject).mkdirs();
    }
    jdField_a_of_type_AndroidNetUri = Uri.fromFile(new File(AppConstants.bd + "photo/" + System.currentTimeMillis() + ".jpg"));
    localObject = new Intent("android.media.action.IMAGE_CAPTURE");
    ((Intent)localObject).putExtra("output", jdField_a_of_type_AndroidNetUri);
    ((Intent)localObject).putExtra("android.intent.extra.videoQuality", 100);
    startActivityForResult((Intent)localObject, 3);
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    Object localObject2 = null;
    Object localObject1;
    if (QLog.isColorLevel())
    {
      StringBuilder localStringBuilder = new StringBuilder().append("JumpActivity onActivityResult,requestCode=").append(paramInt1).append(",resultCode=").append(paramInt2).append(",data=");
      if (paramIntent != null)
      {
        localObject1 = paramIntent.toString();
        QLog.d("JumpAction", 2, (String)localObject1);
      }
    }
    else
    {
      super.doOnActivityResult(paramInt1, paramInt2, paramIntent);
      if (paramInt2 != -1) {
        break label439;
      }
    }
    switch (paramInt1)
    {
    default: 
    case 800: 
    case 880: 
    case 18: 
    case 19: 
    case 20: 
    case 21: 
    case 22: 
    case 1: 
      do
      {
        do
        {
          do
          {
            return;
            localObject1 = "null";
            break;
            if (jdField_d_of_type_Boolean) {
              b("HexUtil.bytes2HexStr(fileKey)");
            }
            finish();
            return;
            if (jdField_a_of_type_ComTencentMobileqqAppQQMapActivityProxy != null) {
              jdField_a_of_type_ComTencentMobileqqAppQQMapActivityProxy = null;
            }
            localObject1 = localObject2;
            if (paramIntent != null) {
              localObject1 = paramIntent.getExtras();
            }
          } while (localObject1 == null);
          paramIntent = ((Bundle)localObject1).getString("latitude");
          localObject1 = ((Bundle)localObject1).getString("longitude");
          if (jdField_d_of_type_Boolean) {
            b("ret=0&lon=" + (String)localObject1 + "&lat=" + paramIntent);
          }
          finish();
          return;
          b(false);
          return;
          a(false);
          return;
          a(false, null, true);
          return;
          a(true, null, false);
          return;
          if ((-1 != paramInt2) || (paramIntent == null)) {
            break label389;
          }
          paramIntent = paramIntent.getStringExtra("roomId");
        } while (paramIntent == null);
        localObject1 = new jdi(this);
      } while (!ChatActivityUtils.a(app, this, 3000, paramIntent, true, true, (Handler.Callback)localObject1, null));
      finish();
      return;
      finish();
      return;
    case 2: 
      finish();
      return;
    case 571: 
      label389:
      if (jdField_a_of_type_AndroidContentIntent != null) {
        c(jdField_a_of_type_AndroidContentIntent);
      }
      finish();
      return;
    }
    if (jdField_b_of_type_AndroidContentIntent != null) {
      e(jdField_b_of_type_AndroidContentIntent);
    }
    finish();
    return;
    label439:
    if (paramInt1 == 570)
    {
      new Handler().postDelayed(new jdj(this), 10L);
      return;
    }
    finish();
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    Object localObject2 = null;
    Intent localIntent;
    boolean bool;
    for (;;)
    {
      try
      {
        super.doOnCreate(paramBundle);
        if (QLog.isColorLevel()) {
          QLog.d("JumpAction", 2, "JumpActivity doOnCreate()");
        }
        if (a(getIntent()))
        {
          finish();
          return false;
        }
        localIntent = getIntent();
        i(localIntent);
        if (localIntent == null) {
          break label190;
        }
        bool = "from_nearby_pb".equals(localIntent.getStringExtra("from"));
        if (!bool) {
          break label190;
        }
      }
      catch (Exception paramBundle)
      {
        QLog.e("JumpAction", 1, "doOnCreate|exp:" + paramBundle.getMessage());
        finish();
        return false;
      }
      try
      {
        paramBundle = localIntent.getDataString();
        if (!TextUtils.isEmpty(paramBundle))
        {
          paramBundle = JumpParser.a(app, this, paramBundle);
          if (paramBundle != null) {
            paramBundle.a();
          }
        }
      }
      catch (Exception paramBundle)
      {
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.d("Q.nearby", 2, "nearby_pb|exception:" + paramBundle.toString());
      }
    }
    finish();
    return false;
    label190:
    if ((localIntent != null) && (!TextUtils.isEmpty(localIntent.getAction())) && ((localIntent.getAction().equals("android.intent.action.SEND")) || (localIntent.getAction().equals("android.intent.action.SEND_MULTIPLE"))))
    {
      b(true);
      return false;
    }
    if ((localIntent != null) && (!TextUtils.isEmpty(localIntent.getAction())) && (localIntent.getAction().equals("android.intent.action.VIEW")) && (!TextUtils.isEmpty(localIntent.getScheme())) && ((localIntent.getScheme().equals("file")) || (localIntent.getScheme().equals("content"))))
    {
      a(true);
      return false;
    }
    if ((localIntent != null) && (!TextUtils.isEmpty(localIntent.getAction())) && (localIntent.getAction().equals("android.intent.action.SENDTO")) && (!TextUtils.isEmpty(localIntent.getScheme())) && (localIntent.getScheme().equals("imto")))
    {
      d();
      return false;
    }
    if ((localIntent != null) && (!TextUtils.isEmpty(localIntent.getAction())) && ((localIntent.getAction().equals("com.tencent.mobileqq.action.QQWiFiProxy")) || (localIntent.getAction().equals("com.tencent.mobileqq.action.QQWiFi")) || (localIntent.getAction().equals("com.tencent.mobileqq.msf.qqwifi.settings")) || (localIntent.getAction().equals("com.tencent.mobileqq.msf.qqwifi.redtouch")) || (localIntent.getAction().equals("com.tencent.mobileqq.msf.qqwifi.campus"))))
    {
      a(localIntent.getAction());
      return false;
    }
    if ((localIntent != null) && ("android.settings.WIFI_SETTINGS".equals(localIntent.getAction())) && (QQWiFiHelper.a(app.getApplication().getApplicationContext(), app.a()))) {
      a(localIntent.getAction());
    }
    if ((localIntent != null) && ("thridapp".equals(localIntent.getStringExtra("share_from"))))
    {
      if (!ThridAppShareHelper.a().a(String.valueOf(Long.valueOf(localIntent.getLongExtra("req_share_id", 0L)))))
      {
        super.finish();
        return false;
      }
      paramBundle = new Intent(this, SplashActivity.class);
      paramBundle.putExtras(localIntent.getExtras());
      startActivity(AIOUtils.a(paramBundle, null));
      return false;
    }
    if ((localIntent != null) && (((!TextUtils.isEmpty(localIntent.getAction())) && (localIntent.getAction().equals("android.intent.action.MAIN")) && (localIntent.getBooleanExtra("_is_from_qlink_shortcut", false))) || (localIntent.getBooleanExtra("_goto_qlink_when_login_suc_", false))))
    {
      h(localIntent);
      return false;
    }
    if ((localIntent != null) && (!TextUtils.isEmpty(localIntent.getAction())) && (localIntent.getAction().equals("com.tencent.qreader.SHORT_CUT")) && (localIntent.getBooleanExtra("is_from_qreader_shortcut", false)))
    {
      b(localIntent);
      return false;
    }
    if ((localIntent != null) && (!TextUtils.isEmpty(localIntent.getAction())) && (localIntent.getAction().equals("com.tencent.qqcomic.SHORT_CUT")))
    {
      d(localIntent);
      return false;
    }
    if ((localIntent != null) && (((!TextUtils.isEmpty(localIntent.getAction())) && (localIntent.getAction().equals("android.intent.action.MAIN")) && (localIntent.getBooleanExtra("_is_from_qfile_shortcut", false))) || (localIntent.getBooleanExtra("_goto_qfile_when_login_suc_", false))))
    {
      f(localIntent);
      return false;
    }
    if ((localIntent != null) && (localIntent.getBooleanExtra("_dingdong_notification_schedule_has_flag_", false)))
    {
      DingdongPluginNotificationUtil.a(this, localIntent);
      return false;
    }
    if ((Build.VERSION.SDK_INT >= 10) && (localIntent != null) && (!TextUtils.isEmpty(localIntent.getAction())) && ("android.nfc.action.TECH_DISCOVERED".equals(localIntent.getAction())))
    {
      g(localIntent);
      return false;
    }
    String str1 = getIntent().getDataString();
    String str2 = getIntent().getStringExtra("from");
    try
    {
      localObject1 = getCallingPackage();
      paramBundle = (Bundle)localObject1;
      if (localObject1 == null) {
        paramBundle = getIntent().getStringExtra("pkg_name");
      }
      JumpAction localJumpAction;
      if (str1 != null)
      {
        if (QLog.isColorLevel()) {
          QLog.d("JumpAction", 2, "jump url:" + str1);
        }
        localJumpAction = JumpParser.a(app, this, str1);
        if (("webview".equals(str2)) && (localJumpAction != null)) {
          localJumpAction.a(str2);
        }
        if (localJumpAction != null)
        {
          jdField_a_of_type_Boolean = true;
          if ((ec != null) && (ec.equals("puzzle_verify_code")) && (ed != null))
          {
            paramBundle = new Intent(getIntent());
            if (ed.equals("PUZZLEVERIFYCODE")) {
              paramBundle.setClass(this, QQBrowserActivity.class);
            }
            for (;;)
            {
              super.startActivity(paramBundle);
              super.finish();
              return false;
              if (ed.equals("VERIFYCODE")) {
                paramBundle.setClass(this, VerifyCodeActivity.class);
              } else if (ed.equals("DEVLOCK_CODE")) {
                paramBundle.setClass(this, AuthDevUgActivity.class);
              }
            }
          }
          if ((ec == null) || (!ec.equals("ptlogin")) || (ed == null) || (!ed.equals("qlogin"))) {
            break label2118;
          }
        }
      }
      label2118:
      for (int i = 0;; i = 1)
      {
        if ((!str1.startsWith("mqqwpa://im")) && (!str1.startsWith("mqqwpaopenid://im")))
        {
          if (!str1.startsWith(String.format("%s%s", new Object[] { "mqqvoipivr://", "crmivr" }))) {}
        }
        else
        {
          a(true, str2, true);
          return false;
        }
        localObject1 = paramBundle;
        if (str1.startsWith("mqqapi:")) {
          if (paramBundle != null)
          {
            localObject1 = paramBundle;
            if (!"com.tencent.mobileqq".equals(paramBundle)) {}
          }
          else
          {
            localObject1 = getIntent().getStringExtra("pkg_name");
          }
        }
        if ((!app.isLogin()) && (i != 0))
        {
          localObject2 = new StringBuilder().append(str1);
          if (str1.indexOf("?") <= -1) {
            break label2132;
          }
          paramBundle = "&";
          paramBundle = paramBundle;
          paramBundle = paramBundle + "jfrom=login";
          localObject2 = new Intent(this, LoginActivity.class);
          ((Intent)localObject2).putExtra("scheme_content", paramBundle);
          ((Intent)localObject2).putExtra("pkg_name", (String)localObject1);
          ((Intent)localObject2).putExtras((Intent)localObject2);
          ((Intent)localObject2).setFlags(268435456);
          if (VersionUtils.e()) {
            ((Intent)localObject2).addFlags(32768);
          }
          startActivity((Intent)localObject2);
          bool = true;
        }
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.d("JumpAction", 2, "JumpActivity is finish");
          }
          if ((ec != null) && (ed != null)) {
            break;
          }
          finish();
          return false;
          if ((GesturePWDUtils.getJumpLock(this, app.a())) && (!GesturePWDUtils.getAppForground(this)))
          {
            paramBundle = new Intent(getActivity(), GesturePWDUnlockActivity.class);
            paramBundle.putExtra("key_gesture_from_jumpactivity", true);
            paramBundle.putExtra("scheme_content", str1);
            paramBundle.putExtra("pkg_name", (String)localObject1);
            startActivity(paramBundle);
            bool = true;
          }
          else
          {
            if ((ec != null) && (ec.equals("devlock")) && (ed != null) && (ed.equals("open")))
            {
              if (!NetworkUtil.e(this))
              {
                QQToast.a(this, getString(2131366990), 0).b(getTitleBarHeight());
                return false;
              }
              EquipmentLockImpl.a().a(app, app.a(), jdField_a_of_type_MqqObserverWtloginObserver);
              return false;
            }
            if ((ec != null) && (ec.equals("gvideo")) && (ed != null) && (ed.equals("open_plugin")))
            {
              GroupVideoHelper.a(app, this, localIntent, 1);
              return false;
            }
            if (str1.startsWith("mqqapi://tenpay/pay?"))
            {
              paramBundle = (Bundle)localObject2;
              if (localIntent != null) {
                paramBundle = localIntent.getStringExtra("url_app_info");
              }
              if (!TextUtils.isEmpty(paramBundle)) {
                localJumpAction.a("url_app_info", paramBundle);
              }
            }
            localJumpAction.b((String)localObject1);
            bool = localJumpAction.b();
          }
        }
        if ((ec.equals("gav")) && (ed.equals("request")))
        {
          if (("0".equals(localJumpAction.a("relation_id"))) || (!bool)) {
            break;
          }
          finish();
          return false;
        }
        if ((("videochat".equals(ec)) && ("request".equals(ed))) || (("randomavchat".equals(ec)) && ("request".equals(ed))) || (("guildavchat".equals(ec)) && ("request".equals(ed))))
        {
          if (!bool) {
            break;
          }
          finish();
          return false;
        }
        if ((ec.equals("wallet")) && (ed.equals("modify_pass")))
        {
          if (!bool) {
            break;
          }
          finish();
          return false;
        }
        if (localJumpAction.d())
        {
          if (!bool) {
            break;
          }
          finish();
          return false;
        }
        finish();
        return false;
        paramBundle = getIntent().getStringExtra("action");
        if (paramBundle == null)
        {
          finish();
          return false;
        }
        jdField_d_of_type_Boolean = getIntent().getBooleanExtra("doCallBack", false);
        jdField_b_of_type_JavaLangString = getIntent().getStringExtra("src_type");
        jdField_c_of_type_JavaLangString = getIntent().getStringExtra("callback_type");
        jdField_d_of_type_JavaLangString = getIntent().getStringExtra("callback_name");
        if ("photo".equals(paramBundle)) {
          jdField_b_of_type_Boolean = true;
        }
        while ((!jdField_b_of_type_Boolean) && (jdField_c_of_type_Boolean))
        {
          e();
          return false;
          if ("select_location".equals(paramBundle)) {
            jdField_c_of_type_Boolean = true;
          }
        }
      }
      return false;
    }
    catch (Exception paramBundle)
    {
      for (;;)
      {
        Object localObject1 = null;
        continue;
        label2132:
        paramBundle = "?";
      }
    }
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    jdField_a_of_type_Boolean = false;
  }
  
  protected void requestWindowFeature(Intent paramIntent)
  {
    requestWindowFeature(1);
  }
}
