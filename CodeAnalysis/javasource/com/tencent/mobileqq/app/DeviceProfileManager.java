package com.tencent.mobileqq.app;

import android.app.Application;
import android.content.BroadcastReceiver;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build.VERSION;
import android.os.Handler;
import com.tencent.common.app.AppInterface;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.config.struct.splashproto.ConfigurationService.CPU;
import com.tencent.mobileqq.config.struct.splashproto.ConfigurationService.Camera;
import com.tencent.mobileqq.config.struct.splashproto.ConfigurationService.ConfigSeq;
import com.tencent.mobileqq.config.struct.splashproto.ConfigurationService.DeviceInfo;
import com.tencent.mobileqq.config.struct.splashproto.ConfigurationService.Memory;
import com.tencent.mobileqq.config.struct.splashproto.ConfigurationService.OS;
import com.tencent.mobileqq.config.struct.splashproto.ConfigurationService.ReqGetConfig;
import com.tencent.mobileqq.config.struct.splashproto.ConfigurationService.RespGetConfig;
import com.tencent.mobileqq.config.struct.splashproto.ConfigurationService.Screen;
import com.tencent.mobileqq.config.struct.splashproto.ConfigurationService.Storage;
import com.tencent.mobileqq.cooperation.ApkUtils;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBBoolField;
import com.tencent.mobileqq.pb.PBEnumField;
import com.tencent.mobileqq.pb.PBInt32Field;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.mobileqq.utils.ReflectedMethods;
import com.tencent.qphone.base.util.QLog;
import java.io.ByteArrayInputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import mqq.app.AppRuntime;
import mqq.app.MobileQQ;
import mqq.os.MqqHandler;
import mvx;
import mvy;
import mvz;
import org.xml.sax.InputSource;

public class DeviceProfileManager
{
  private static DeviceProfileManager.AccountDpcManager jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager$AccountDpcManager;
  private static volatile DeviceProfileManager jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager;
  public static ConfigurationService.ReqGetConfig a;
  public static final String a;
  private static List jdField_a_of_type_JavaUtilList;
  public static boolean a = false;
  private static final String[] jdField_a_of_type_ArrayOfJavaLangString;
  private static Field[] jdField_a_of_type_ArrayOfJavaLangReflectField;
  public static final int b = 1;
  public static final String b = "dpcConfig";
  public static boolean b = false;
  public static final int c = 2;
  public static final String c = "dpcConfig_account";
  public static final int d = 3;
  public static final String d = "last_update_time";
  public static final int e = 4;
  public static final String e = "account_last_update_time";
  public static final String f = "key_versioncode";
  public static final String g = "server_version";
  public static final String h = "key_type";
  public static final String i = "ab_rand";
  public static final String j = "9|960|960|960|960|960|960|80|70|70";
  public static final String k = "0|0|0|0|1|0|1|1|1048576|0|307200|307200|0|90|70|50";
  public static final String l = "1|1|1";
  public static final String m = "135|135";
  public static final String n = "1200|400|1400|400|600|200|700|200";
  public static final String o = "1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|32|35|38|40|41|44|53|54|60";
  public static final String p = "0|0|1.0|5|480000";
  public static final String q = "1|1|1";
  private static final String r = "com.tentcent.mobileqq.dpc.broadcast";
  private static final String s = "com.tencent.msg.permission.pushnotify";
  public int a;
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver = new mvx(this);
  private HashMap jdField_a_of_type_JavaUtilHashMap = new HashMap();
  private AtomicInteger jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger = new AtomicInteger(1);
  private HashMap b;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = DeviceProfileManager.class.getSimpleName();
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentMobileqqConfigStructSplashprotoConfigurationService$ReqGetConfig = null;
    jdField_a_of_type_ArrayOfJavaLangString = new String[] { "featureValue" };
    jdField_b_of_type_Boolean = false;
  }
  
  private DeviceProfileManager()
  {
    jdField_b_of_type_JavaUtilHashMap = new HashMap();
    c();
  }
  
  /* Error */
  public static int a(String paramString, Object[] paramArrayOfObject, DeviceProfileManager.StringParser paramStringParser)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore 5
    //   3: aload_1
    //   4: ifnull +109 -> 113
    //   7: aload_2
    //   8: ifnull +105 -> 113
    //   11: aload_0
    //   12: invokestatic 137	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   15: ifne +98 -> 113
    //   18: aload_0
    //   19: ldc -117
    //   21: invokevirtual 143	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   24: astore_0
    //   25: aload_0
    //   26: arraylength
    //   27: aload_1
    //   28: arraylength
    //   29: invokestatic 149	java/lang/Math:min	(II)I
    //   32: istore_3
    //   33: iload_3
    //   34: istore 4
    //   36: iload 5
    //   38: iload_3
    //   39: if_icmpge +67 -> 106
    //   42: aload_1
    //   43: iload 5
    //   45: aload_2
    //   46: aload_0
    //   47: iload 5
    //   49: aaload
    //   50: invokeinterface 154 2 0
    //   55: aastore
    //   56: iload 5
    //   58: iconst_1
    //   59: iadd
    //   60: istore 5
    //   62: goto -29 -> 33
    //   65: astore_0
    //   66: iconst_0
    //   67: istore_3
    //   68: iload_3
    //   69: istore 4
    //   71: invokestatic 160	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   74: ifeq +32 -> 106
    //   77: getstatic 89	com/tencent/mobileqq/app/DeviceProfileManager:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   80: iconst_2
    //   81: new 162	java/lang/StringBuilder
    //   84: dup
    //   85: invokespecial 163	java/lang/StringBuilder:<init>	()V
    //   88: ldc -91
    //   90: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   93: aload_0
    //   94: invokevirtual 172	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   97: invokevirtual 175	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   100: invokestatic 178	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   103: iload_3
    //   104: istore 4
    //   106: iload 4
    //   108: ireturn
    //   109: astore_0
    //   110: goto -42 -> 68
    //   113: iconst_0
    //   114: ireturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	115	0	paramString	String
    //   0	115	1	paramArrayOfObject	Object[]
    //   0	115	2	paramStringParser	DeviceProfileManager.StringParser
    //   32	72	3	i1	int
    //   34	73	4	i2	int
    //   1	60	5	i3	int
    // Exception table:
    //   from	to	target	type
    //   18	33	65	java/lang/Exception
    //   42	56	109	java/lang/Exception
  }
  
  private DeviceProfileManager.DPCConfigInfo a(String paramString)
  {
    HashMap localHashMap;
    if (DeviceProfileManager.AccountDpcManager.jdField_a_of_type_JavaUtilHashSet.contains(paramString))
    {
      if (jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager$AccountDpcManager == null)
      {
        if (QLog.isColorLevel()) {
          QLog.e(jdField_a_of_type_JavaLangString, 2, "getFeatureValue() accountDpcManager is null");
        }
        return null;
      }
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "getFeatureValue() accountDpcNames=" + paramString);
      }
      localHashMap = jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager$AccountDpcManagerjdField_a_of_type_JavaUtilHashMap;
      paramString = DeviceProfileManager.AccountDpcManager.a(jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager$AccountDpcManager, paramString);
    }
    for (;;)
    {
      return (DeviceProfileManager.DPCConfigInfo)localHashMap.get(paramString);
      localHashMap = jdField_a_of_type_JavaUtilHashMap;
    }
  }
  
  public static DeviceProfileManager a()
  {
    return a(BaseApplicationImpl.a.a(), 67);
  }
  
  public static DeviceProfileManager a(AppRuntime paramAppRuntime)
  {
    return a(paramAppRuntime, 67);
  }
  
  public static DeviceProfileManager a(AppRuntime paramAppRuntime, int paramInt)
  {
    if (paramAppRuntime != null)
    {
      paramAppRuntime = paramAppRuntime.getManager(paramInt);
      if ((paramAppRuntime instanceof DeviceProfileManager.AccountDpcManager)) {
        jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager$AccountDpcManager = (DeviceProfileManager.AccountDpcManager)paramAppRuntime;
      }
    }
    if (jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager == null) {}
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager == null) {
        jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager = new DeviceProfileManager();
      }
      return jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager;
    }
    finally {}
  }
  
  public static ConfigurationService.ReqGetConfig a(AppInterface paramAppInterface)
  {
    if ((jdField_a_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqConfigStructSplashprotoConfigurationService$ReqGetConfig != null))
    {
      if (QLog.isColorLevel()) {
        QLog.i(jdField_a_of_type_JavaLangString, 2, "test mode is enable");
      }
      a(jdField_a_of_type_ComTencentMobileqqConfigStructSplashprotoConfigurationService$ReqGetConfig);
      return jdField_a_of_type_ComTencentMobileqqConfigStructSplashprotoConfigurationService$ReqGetConfig;
    }
    Object localObject1 = new ConfigurationService.OS();
    ((ConfigurationService.OS)localObject1).setHasFlag(true);
    type.set(2);
    kernel.set(DeviceInfoUtil.m());
    sdk.set(String.valueOf(DeviceInfoUtil.a()));
    version.set(DeviceInfoUtil.e());
    rom.set(DeviceInfoUtil.j());
    ConfigurationService.CPU localCPU = new ConfigurationService.CPU();
    localCPU.setHasFlag(true);
    model.set(DeviceInfoUtil.g());
    cores.set(DeviceInfoUtil.b());
    frequency.set((int)DeviceInfoUtil.a());
    ConfigurationService.Memory localMemory = new ConfigurationService.Memory();
    localMemory.setHasFlag(true);
    total.set(DeviceInfoUtil.c());
    process.set(DeviceInfoUtil.e());
    ConfigurationService.Storage localStorage = new ConfigurationService.Storage();
    localStorage.setHasFlag(true);
    builtin.set(DeviceInfoUtil.b());
    Object localObject2 = DeviceInfoUtil.b();
    external.set(localObject2[0] * 1048576L + localObject2[1] * 1024L * 1024L);
    localObject2 = new ConfigurationService.Screen();
    ((ConfigurationService.Screen)localObject2).setHasFlag(true);
    model.set("");
    width.set((int)DeviceInfoUtil.f());
    height.set((int)DeviceInfoUtil.g());
    dpi.set(DeviceInfoUtil.d());
    multi_touch.set(DeviceInfoUtil.c());
    ConfigurationService.Camera localCamera = new ConfigurationService.Camera();
    localCamera.setHasFlag(true);
    primary.set(0L);
    secondary.set(0L);
    flash.set(false);
    Object localObject3 = new ConfigurationService.ConfigSeq();
    ((ConfigurationService.ConfigSeq)localObject3).setHasFlag(true);
    type.set(4);
    long l1 = System.currentTimeMillis();
    SharedPreferences localSharedPreferences = ReflectedMethods.a(BaseApplicationImpl.getContext(), "dpcConfig_account");
    long l2 = localSharedPreferences.getLong(DeviceProfileManager.AccountDpcManager.a(paramAppInterface, "last_update_time"), 0L);
    int i3 = ApkUtils.a(BaseApplicationImpl.getContext());
    int i4 = localSharedPreferences.getInt("key_versioncode", 0);
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "DeviceProfileManager.KEY_LAST_UPDATE_TIME=" + l2 + ",nowSystemTime=" + l1 + "versionCode=" + i3 + ",key_versioncode=" + i4);
    }
    int i2 = 0;
    int i1 = i2;
    if (172800L > Math.abs(l1 - l2) / 1000L)
    {
      i1 = i2;
      if (i4 >= i3) {
        i1 = localSharedPreferences.getInt(DeviceProfileManager.AccountDpcManager.a(paramAppInterface, "server_version"), 0);
      }
    }
    version.set(i1);
    paramAppInterface = new ArrayList();
    paramAppInterface.add(localObject3);
    localObject3 = new ConfigurationService.DeviceInfo();
    ((ConfigurationService.DeviceInfo)localObject3).setHasFlag(true);
    brand.set(DeviceInfoUtil.h());
    model.set(DeviceInfoUtil.d());
    os = ((ConfigurationService.OS)localObject1);
    cpu = localCPU;
    memory = localMemory;
    storage = localStorage;
    screen = ((ConfigurationService.Screen)localObject2);
    camera = localCamera;
    localObject1 = new ConfigurationService.ReqGetConfig();
    device_info = ((ConfigurationService.DeviceInfo)localObject3);
    seq_list.addAll(paramAppInterface);
    a((ConfigurationService.ReqGetConfig)localObject1);
    return localObject1;
  }
  
  private void a(long paramLong)
  {
    if (a() != 4) {
      synchronized (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger)
      {
        int i1 = a();
        if (i1 != 4) {}
        try
        {
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "waitDPCServerData() is waiting threadID=" + Thread.currentThread().getId());
          }
          jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.wait(paramLong);
        }
        catch (InterruptedException localInterruptedException)
        {
          for (;;)
          {
            localInterruptedException.printStackTrace();
            if (QLog.isColorLevel()) {
              QLog.e(jdField_a_of_type_JavaLangString, 1, "waitDpcServerData failed", localInterruptedException);
            }
          }
        }
        return;
      }
    }
  }
  
  public static void a(DeviceProfileManager.DPCObserver paramDPCObserver)
  {
    if (jdField_a_of_type_JavaUtilList == null) {
      jdField_a_of_type_JavaUtilList = new CopyOnWriteArrayList();
    }
    jdField_a_of_type_JavaUtilList.add(paramDPCObserver);
  }
  
  private static void a(ConfigurationService.ReqGetConfig paramReqGetConfig)
  {
    ConfigurationService.DeviceInfo localDeviceInfo = device_info;
    StringBuilder localStringBuilder = new StringBuilder(1024);
    localStringBuilder.append("config.version = " + seq_list.get(0)).version.get() + "\n");
    localStringBuilder.append("buidldReqConfig{");
    localStringBuilder.append(" brand= ");
    localStringBuilder.append(brand.get());
    localStringBuilder.append(" ,model= ");
    localStringBuilder.append(model.get());
    localStringBuilder.append(" ,os.type= ");
    localStringBuilder.append(os.type.get());
    localStringBuilder.append(" ,os.kernel= ");
    localStringBuilder.append(os.kernel.get());
    localStringBuilder.append(" ,os.sdk= ");
    localStringBuilder.append(os.sdk.get());
    localStringBuilder.append(" ,os.version= ");
    localStringBuilder.append(os.version.get());
    localStringBuilder.append(" ,os.rom= ");
    localStringBuilder.append(os.rom.get());
    localStringBuilder.append(" ,cpu.model= ");
    localStringBuilder.append(cpu.model.get());
    localStringBuilder.append(" ,cpu.cores= ");
    localStringBuilder.append(cpu.cores.get());
    localStringBuilder.append(" ,cpu.frequency= ");
    localStringBuilder.append(cpu.frequency.get());
    localStringBuilder.append(" ,memory.total= ");
    localStringBuilder.append(memory.total.get());
    localStringBuilder.append(" ,memory.process= ");
    localStringBuilder.append(memory.process.get());
    localStringBuilder.append(" ,storage.builtin= ");
    localStringBuilder.append(storage.builtin.get());
    localStringBuilder.append(" ,storage.external= ");
    localStringBuilder.append(storage.external.get());
    localStringBuilder.append(" ,screen.model= ");
    localStringBuilder.append(screen.model.get());
    localStringBuilder.append(" ,screen.width= ");
    localStringBuilder.append(screen.width.get());
    localStringBuilder.append(" ,screen.height= ");
    localStringBuilder.append(screen.height.get());
    localStringBuilder.append(" ,screen.dpi= ");
    localStringBuilder.append(screen.dpi.get());
    localStringBuilder.append(" ,screen.multi_touch= ");
    localStringBuilder.append(screen.multi_touch.get());
    localStringBuilder.append(" ,camera.primary= ");
    localStringBuilder.append(camera.primary.get());
    localStringBuilder.append(" ,camera.secondary= ");
    localStringBuilder.append(camera.secondary.get());
    localStringBuilder.append(" ,camera.flash= ");
    localStringBuilder.append(camera.flash.get());
    localStringBuilder.append(" }");
    QLog.i(jdField_a_of_type_JavaLangString, 1, localStringBuilder.toString());
  }
  
  private void a(boolean paramBoolean)
  {
    if (jdField_a_of_type_JavaUtilList == null) {}
    for (;;)
    {
      return;
      Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
      while (localIterator.hasNext())
      {
        DeviceProfileManager.DPCObserver localDPCObserver = (DeviceProfileManager.DPCObserver)localIterator.next();
        if (localDPCObserver != null) {
          localDPCObserver.a(paramBoolean);
        }
      }
    }
  }
  
  public static DeviceProfileManager b()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager == null) {}
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager == null) {
        jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager = new DeviceProfileManager();
      }
      return jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager;
    }
    finally {}
  }
  
  private void b()
  {
    Object localObject = DeviceProfileManager.DpcNames.values();
    int i2 = localObject.length;
    int i1 = 0;
    while (i1 < i2)
    {
      localDPCConfigInfo = localObject[i1];
      jdField_b_of_type_JavaUtilHashMap.put(localDPCConfigInfo.name(), new DeviceProfileManager.DPCConfigInfo());
      i1 += 1;
    }
    localObject = new DeviceProfileManager.DPCConfigInfo();
    featureValue = "1";
    jdField_b_of_type_JavaUtilHashMap.put(DeviceProfileManager.DpcNames.magicface_support.name(), localObject);
    DeviceProfileManager.DPCConfigInfo localDPCConfigInfo = new DeviceProfileManager.DPCConfigInfo();
    featureValue = "1";
    jdField_b_of_type_JavaUtilHashMap.put(DeviceProfileManager.DpcNames.h5magic_support.name(), localDPCConfigInfo);
    DeviceProfileManager.DPCConfigInfofeatureValue = "1";
    jdField_b_of_type_JavaUtilHashMap.put(DeviceProfileManager.DpcNames.aio_eggs.name(), localObject);
    localObject = new DeviceProfileManager.DPCConfigInfo();
    featureValue = "1|3|10|30|约会打招呼|有人在约会上给你打招呼，快去看看！";
    jdField_b_of_type_JavaUtilHashMap.put(DeviceProfileManager.DpcNames.OneyWayDateMsgNotifyCfg.name(), localObject);
    localObject = new DeviceProfileManager.DPCConfigInfo();
    featureValue = "1|5|10|50|附近打招呼|有附近的人给你打招呼，快去看看！";
    jdField_b_of_type_JavaUtilHashMap.put(DeviceProfileManager.DpcNames.OneyWayLBSFriendMsgNotifyCfg.name(), localObject);
  }
  
  public static void b(DeviceProfileManager.DPCObserver paramDPCObserver)
  {
    if (jdField_a_of_type_JavaUtilList != null) {
      jdField_a_of_type_JavaUtilList.remove(paramDPCObserver);
    }
  }
  
  private static boolean b(DeviceProfileManager.DPCConfigInfo paramDPCConfigInfo, String paramString)
  {
    if ((paramString == null) || (paramString.length() == 0) || (paramDPCConfigInfo == null)) {}
    String[] arrayOfString;
    do
    {
      return false;
      arrayOfString = new String[1];
      arrayOfString[0] = paramString.toString().trim();
    } while ((arrayOfString == null) || (arrayOfString.length == 0));
    if (jdField_a_of_type_ArrayOfJavaLangReflectField == null)
    {
      jdField_a_of_type_ArrayOfJavaLangReflectField = new Field[jdField_a_of_type_ArrayOfJavaLangString.length];
      i1 = 0;
      for (;;)
      {
        if (i1 < jdField_a_of_type_ArrayOfJavaLangReflectField.length) {
          try
          {
            jdField_a_of_type_ArrayOfJavaLangReflectField[i1] = paramDPCConfigInfo.getClass().getField(jdField_a_of_type_ArrayOfJavaLangString[i1]);
            jdField_a_of_type_ArrayOfJavaLangReflectField[i1].setAccessible(true);
            i1 += 1;
          }
          catch (NoSuchFieldException paramString)
          {
            for (;;)
            {
              paramString.printStackTrace();
              jdField_a_of_type_ArrayOfJavaLangReflectField[i1] = null;
            }
          }
        }
      }
    }
    int i2 = Math.min(jdField_a_of_type_ArrayOfJavaLangReflectField.length, arrayOfString.length);
    int i1 = 0;
    boolean bool1 = false;
    boolean bool2;
    while (i1 < i2)
    {
      paramString = arrayOfString[i1];
      bool2 = bool1;
      if (paramString != null)
      {
        if (paramString.length() == 0) {
          bool2 = bool1;
        }
      }
      else
      {
        i1 += 1;
        bool1 = bool2;
        continue;
      }
      if ((paramString.indexOf('{', 0) != 0) || (paramString.lastIndexOf('}') != paramString.length() - 1)) {
        break label288;
      }
      paramString = paramString.substring(1, paramString.length() - 1);
    }
    label285:
    label288:
    for (;;)
    {
      try
      {
        if ((jdField_a_of_type_ArrayOfJavaLangReflectField[i1] == null) || (paramString.equals((String)jdField_a_of_type_ArrayOfJavaLangReflectField[i1].get(paramDPCConfigInfo)))) {
          break label285;
        }
        jdField_a_of_type_ArrayOfJavaLangReflectField[i1].set(paramDPCConfigInfo, paramString);
        bool1 = true;
        bool2 = bool1;
      }
      catch (IllegalArgumentException paramString)
      {
        paramString.printStackTrace();
        bool2 = bool1;
      }
      catch (IllegalAccessException paramString)
      {
        paramString.printStackTrace();
        bool2 = bool1;
      }
      break;
      return bool1;
    }
  }
  
  private void c()
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "DeviceProfileManager init DPC content");
    }
    jdField_b_of_type_Boolean = true;
    b();
    SharedPreferences localSharedPreferences = ReflectedMethods.a(BaseApplicationImpl.a(), "dpcConfig");
    jdField_a_of_type_Int = localSharedPreferences.getInt("ab_rand", -1);
    Object localObject;
    int i1;
    label120:
    DeviceProfileManager.DpcNames localDpcNames;
    String str;
    if (jdField_a_of_type_Int == -1)
    {
      jdField_a_of_type_Int = new Random().nextInt(10000);
      localObject = localSharedPreferences.edit();
      ((SharedPreferences.Editor)localObject).putInt("ab_rand", jdField_a_of_type_Int);
      if (Build.VERSION.SDK_INT < 9) {
        ((SharedPreferences.Editor)localObject).commit();
      }
    }
    else
    {
      DeviceProfileManager.DpcNames[] arrayOfDpcNames = DeviceProfileManager.DpcNames.values();
      int i2 = arrayOfDpcNames.length;
      i1 = 0;
      if (i1 >= i2) {
        return;
      }
      localDpcNames = arrayOfDpcNames[i1];
      str = localSharedPreferences.getString(localDpcNames.name(), "");
      if (!"".equals(str)) {
        break label261;
      }
      localObject = (DeviceProfileManager.DPCConfigInfo)((DeviceProfileManager.DPCConfigInfo)jdField_b_of_type_JavaUtilHashMap.get(localDpcNames.name())).clone();
    }
    for (;;)
    {
      jdField_a_of_type_JavaUtilHashMap.put(localDpcNames.name(), localObject);
      if (QLog.isColorLevel()) {
        QLog.i(jdField_a_of_type_JavaLangString, 2, "init loop mFeatureMapLV2 MAP: " + localDpcNames.name() + "=" + ((DeviceProfileManager.DPCConfigInfo)localObject).toString());
      }
      i1 += 1;
      break label120;
      ((SharedPreferences.Editor)localObject).apply();
      break;
      label261:
      localObject = new DeviceProfileManager.DPCConfigInfo();
      b((DeviceProfileManager.DPCConfigInfo)localObject, str);
    }
  }
  
  public int a()
  {
    return jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.get();
  }
  
  /* Error */
  public String a(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: invokespecial 790	com/tencent/mobileqq/app/DeviceProfileManager:a	(Ljava/lang/String;)Lcom/tencent/mobileqq/app/DeviceProfileManager$DPCConfigInfo;
    //   7: astore_2
    //   8: invokestatic 160	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   11: ifeq +55 -> 66
    //   14: getstatic 89	com/tencent/mobileqq/app/DeviceProfileManager:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   17: astore_3
    //   18: new 162	java/lang/StringBuilder
    //   21: dup
    //   22: invokespecial 163	java/lang/StringBuilder:<init>	()V
    //   25: ldc_w 792
    //   28: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   31: aload_1
    //   32: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   35: ldc_w 782
    //   38: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   41: astore 4
    //   43: aload_2
    //   44: ifnull +51 -> 95
    //   47: aload_2
    //   48: invokevirtual 783	com/tencent/mobileqq/app/DeviceProfileManager$DPCConfigInfo:toString	()Ljava/lang/String;
    //   51: astore_1
    //   52: aload_3
    //   53: iconst_2
    //   54: aload 4
    //   56: aload_1
    //   57: invokevirtual 169	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   60: invokevirtual 175	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   63: invokestatic 178	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   66: aload_2
    //   67: ifnull +20 -> 87
    //   70: aload_2
    //   71: getfield 666	com/tencent/mobileqq/app/DeviceProfileManager$DPCConfigInfo:featureValue	Ljava/lang/String;
    //   74: ifnull +13 -> 87
    //   77: aload_2
    //   78: getfield 666	com/tencent/mobileqq/app/DeviceProfileManager$DPCConfigInfo:featureValue	Ljava/lang/String;
    //   81: invokevirtual 698	java/lang/String:length	()I
    //   84: ifne +18 -> 102
    //   87: ldc_w 359
    //   90: astore_1
    //   91: aload_0
    //   92: monitorexit
    //   93: aload_1
    //   94: areturn
    //   95: ldc_w 794
    //   98: astore_1
    //   99: goto -47 -> 52
    //   102: aload_2
    //   103: getfield 666	com/tencent/mobileqq/app/DeviceProfileManager$DPCConfigInfo:featureValue	Ljava/lang/String;
    //   106: astore_1
    //   107: goto -16 -> 91
    //   110: astore_1
    //   111: aload_0
    //   112: monitorexit
    //   113: aload_1
    //   114: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	115	0	this	DeviceProfileManager
    //   0	115	1	paramString	String
    //   7	96	2	localDPCConfigInfo	DeviceProfileManager.DPCConfigInfo
    //   17	36	3	str	String
    //   41	14	4	localStringBuilder	StringBuilder
    // Exception table:
    //   from	to	target	type
    //   2	43	110	finally
    //   47	52	110	finally
    //   52	66	110	finally
    //   70	87	110	finally
    //   102	107	110	finally
  }
  
  public String a(String paramString, long paramLong)
  {
    a(paramLong);
    return a(paramString);
  }
  
  /* Error */
  public String a(String paramString1, String paramString2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: invokevirtual 799	com/tencent/mobileqq/app/DeviceProfileManager:a	(Ljava/lang/String;)Ljava/lang/String;
    //   7: astore 4
    //   9: aload_2
    //   10: astore_1
    //   11: aload 4
    //   13: ifnull +18 -> 31
    //   16: ldc_w 359
    //   19: aload 4
    //   21: invokevirtual 733	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   24: istore_3
    //   25: iload_3
    //   26: ifeq +9 -> 35
    //   29: aload_2
    //   30: astore_1
    //   31: aload_0
    //   32: monitorexit
    //   33: aload_1
    //   34: areturn
    //   35: aload 4
    //   37: astore_1
    //   38: goto -7 -> 31
    //   41: astore_1
    //   42: aload_0
    //   43: monitorexit
    //   44: aload_1
    //   45: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	46	0	this	DeviceProfileManager
    //   0	46	1	paramString1	String
    //   0	46	2	paramString2	String
    //   24	2	3	bool	boolean
    //   7	29	4	str	String
    // Exception table:
    //   from	to	target	type
    //   2	9	41	finally
    //   16	25	41	finally
  }
  
  public void a()
  {
    if (QLog.isColorLevel())
    {
      StringBuilder localStringBuilder = new StringBuilder(1024);
      localStringBuilder.append("mFeatureMapLV2 start loop: \n");
      Iterator localIterator = jdField_a_of_type_JavaUtilHashMap.entrySet().iterator();
      Map.Entry localEntry;
      while (localIterator.hasNext())
      {
        localEntry = (Map.Entry)localIterator.next();
        localStringBuilder.append("key=" + localEntry.getKey() + ", value=" + localEntry.getValue().toString() + "\n");
      }
      localStringBuilder.append("mFeatureMapLV2 end loop: \n");
      localStringBuilder.append("mFeatureAccountMapLV2 start loop: \n");
      localIterator = jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager$AccountDpcManagerjdField_a_of_type_JavaUtilHashMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        localEntry = (Map.Entry)localIterator.next();
        localStringBuilder.append("key=" + localEntry.getKey() + ", value=" + localEntry.getValue().toString() + "\n");
      }
      localStringBuilder.append("mFeatureAccountMapLV2 end loop: \n");
      QLog.i(jdField_a_of_type_JavaLangString, 2, localStringBuilder.toString());
    }
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.set(paramInt);
    if (paramInt == 4) {}
    synchronized (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger)
    {
      jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.notifyAll();
      a(true);
      return;
    }
  }
  
  public void a(AppInterface paramAppInterface)
  {
    if (paramAppInterface == null) {
      return;
    }
    paramAppInterface = paramAppInterface.getApplication();
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("com.tentcent.mobileqq.dpc.broadcast");
    paramAppInterface.registerReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver, localIntentFilter, "com.tencent.msg.permission.pushnotify", new Handler(ThreadManager.b()));
  }
  
  public boolean a(ConfigurationService.RespGetConfig paramRespGetConfig, String paramString)
  {
    try
    {
      ThreadManager.b().post(new mvy(this, paramRespGetConfig, paramString));
      return true;
    }
    finally
    {
      paramRespGetConfig = finally;
      throw paramRespGetConfig;
    }
  }
  
  public boolean a(String paramString)
  {
    for (;;)
    {
      try
      {
        Object localObject;
        if (DeviceProfileManager.AccountDpcManager.jdField_a_of_type_JavaUtilHashSet.contains(paramString))
        {
          if (jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager$AccountDpcManager == null)
          {
            if (QLog.isDevelopLevel()) {
              QLog.e(jdField_a_of_type_JavaLangString, 2, "isFeatureSupported() accountDpcManager is null");
            }
            bool = false;
            return bool;
          }
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "isFeatureSupported() accountDpcNames=" + paramString);
          }
          localObject = jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager$AccountDpcManagerjdField_a_of_type_JavaUtilHashMap;
          paramString = DeviceProfileManager.AccountDpcManager.a(jdField_a_of_type_ComTencentMobileqqAppDeviceProfileManager$AccountDpcManager, paramString);
          localObject = (DeviceProfileManager.DPCConfigInfo)((HashMap)localObject).get(paramString);
          if ((QLog.isColorLevel()) && (localObject != null)) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "isFeatureSupported: " + paramString + "=" + ((DeviceProfileManager.DPCConfigInfo)localObject).toString());
          }
          if ((localObject == null) || (featureValue == null)) {
            break label238;
          }
          if (featureValue.length() == 0) {
            break label238;
          }
        }
        else
        {
          localObject = jdField_a_of_type_JavaUtilHashMap;
          continue;
        }
        if ((featureValue.equals("0")) || (featureValue.equals("2"))) {
          break label243;
        }
        bool = featureValue.equals("1");
        if (bool)
        {
          bool = true;
          continue;
        }
        bool = false;
        continue;
        bool = false;
      }
      finally {}
      label238:
      continue;
      label243:
      boolean bool = false;
    }
  }
  
  public boolean a(String paramString, long paramLong)
  {
    a(paramLong);
    return a(paramString);
  }
  
  public boolean a(String paramString, HashMap paramHashMap)
  {
    QLog.i(jdField_a_of_type_JavaLangString, 1, paramString);
    if ((paramString == null) || (paramString.length() == 0)) {
      return false;
    }
    paramHashMap = new mvz(paramHashMap);
    try
    {
      SAXParserFactory.newInstance().newSAXParser().parse(new InputSource(new ByteArrayInputStream(paramString.getBytes("utf-8"))), paramHashMap);
      return true;
    }
    catch (Exception paramString)
    {
      if (QLog.isColorLevel()) {
        QLog.e(jdField_a_of_type_JavaLangString, 2, "pareseDCPXML", paramString);
      }
      paramString.printStackTrace();
    }
    return false;
  }
  
  public void b(AppInterface paramAppInterface)
  {
    if (paramAppInterface == null) {
      return;
    }
    paramAppInterface.getApplication().unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
  }
}
