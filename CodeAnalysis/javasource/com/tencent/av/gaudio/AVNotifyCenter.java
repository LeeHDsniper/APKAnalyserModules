package com.tencent.av.gaudio;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build.VERSION;
import android.os.Looper;
import android.os.SystemClock;
import android.preference.PreferenceManager;
import com.tencent.arrange.op.MeetingInfo;
import com.tencent.av.app.PstnSessionInfo;
import com.tencent.av.core.VcSystemInfo;
import com.tencent.av.utils.PhoneStatusMonitor;
import com.tencent.av.utils.PstnUtils;
import com.tencent.av.utils.UITools;
import com.tencent.av.utils.VideoMsgTools;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.PhoneContactManager;
import com.tencent.mobileqq.servlet.VideoConfigServlet;
import com.tencent.mobileqq.utils.SharedPreUtils;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import ffj;
import ffk;
import ffl;
import ffm;
import ffn;
import ffo;
import ffp;
import ffq;
import ffr;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Observable;
import java.util.Set;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;
import mqq.app.NewIntent;
import mqq.os.MqqHandler;
import org.json.JSONException;
import org.json.JSONObject;

public class AVNotifyCenter
  extends Observable
{
  protected static final String a = "AVNotifyCenter";
  public static final int f = 10002;
  public static final int g = 10003;
  public static final int h = 10004;
  private static String jdField_h_of_type_JavaLangString = "QAVPreSetting";
  public static final int i = 10005;
  private static String i = "BeautyFeature";
  public static final int j = 10006;
  private static String j = "BeautyPopupGuide";
  public static final int k = 10007;
  private static String k = "BeautyValue";
  public static final int l = 10008;
  public static final int m = 10009;
  public static final int n = 10010;
  public static final int o = 10011;
  public static final int p = 10012;
  public static final int q = 10013;
  public static final int r = 10014;
  int jdField_a_of_type_Int = 0;
  long jdField_a_of_type_Long = 0L;
  public Bitmap a;
  PstnSessionInfo jdField_a_of_type_ComTencentAvAppPstnSessionInfo = new PstnSessionInfo();
  public PhoneStatusMonitor a;
  public QQAppInterface a;
  ffm jdField_a_of_type_Ffm = new ffm(this);
  ffn jdField_a_of_type_Ffn = new ffn(this);
  Runnable jdField_a_of_type_JavaLangRunnable = new ffk(this);
  HashMap jdField_a_of_type_JavaUtilHashMap = new HashMap();
  Map jdField_a_of_type_JavaUtilMap = new HashMap();
  public ConcurrentHashMap a;
  public MqqHandler a;
  boolean jdField_a_of_type_Boolean = true;
  int jdField_b_of_type_Int = 0;
  public long b;
  public ffm b;
  Runnable jdField_b_of_type_JavaLangRunnable;
  String jdField_b_of_type_JavaLangString = null;
  HashMap jdField_b_of_type_JavaUtilHashMap = new HashMap();
  public Map b;
  public ConcurrentHashMap b;
  boolean jdField_b_of_type_Boolean = false;
  int jdField_c_of_type_Int = 0;
  String jdField_c_of_type_JavaLangString = null;
  HashMap jdField_c_of_type_JavaUtilHashMap = new HashMap();
  private Map jdField_c_of_type_JavaUtilMap = new HashMap();
  public ConcurrentHashMap c;
  boolean jdField_c_of_type_Boolean = false;
  int jdField_d_of_type_Int = 0;
  String jdField_d_of_type_JavaLangString = null;
  HashMap jdField_d_of_type_JavaUtilHashMap = new HashMap();
  ConcurrentHashMap jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
  public boolean d;
  int jdField_e_of_type_Int = 0;
  String jdField_e_of_type_JavaLangString = null;
  public boolean e;
  String f;
  public boolean f;
  String g;
  public boolean g;
  private boolean jdField_h_of_type_Boolean = false;
  int s = 0;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public AVNotifyCenter(QQAppInterface paramQQAppInterface)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
    jdField_f_of_type_JavaLangString = null;
    jdField_g_of_type_JavaLangString = null;
    jdField_a_of_type_AndroidGraphicsBitmap = null;
    jdField_a_of_type_MqqOsMqqHandler = null;
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_b_of_type_JavaUtilMap = new HashMap();
    jdField_d_of_type_Boolean = false;
    jdField_e_of_type_Boolean = false;
    jdField_f_of_type_Boolean = false;
    jdField_b_of_type_Ffm = jdField_a_of_type_Ffm;
    jdField_b_of_type_Long = 0L;
    jdField_g_of_type_Boolean = true;
    if (paramQQAppInterface != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
      jdField_c_of_type_JavaLangString = paramQQAppInterface.a();
      jdField_a_of_type_MqqOsMqqHandler = new ffo(this, Looper.getMainLooper());
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(getClass(), jdField_a_of_type_MqqOsMqqHandler);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.runOnUiThread(new ffj(this));
      b();
    }
  }
  
  private void b()
  {
    SharedPreferences localSharedPreferences = BaseApplication.getContext().getSharedPreferences("mobileQQ", 0);
    if (localSharedPreferences != null) {
      jdField_h_of_type_Boolean = localSharedPreferences.getBoolean("group_video_push_cfg_txt." + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getAccount() + ".mutex", true);
    }
  }
  
  public static void b(String paramString, int paramInt)
  {
    SharedPreferences localSharedPreferences = BaseApplicationImpl.a().getSharedPreferences(jdField_h_of_type_JavaLangString, 0);
    paramString = k + paramString;
    localSharedPreferences.edit().putInt(paramString, paramInt).commit();
  }
  
  public static int c(String paramString)
  {
    return BaseApplicationImpl.a().getSharedPreferences(jdField_h_of_type_JavaLangString, 0).getInt(k + paramString, -1);
  }
  
  public static boolean e(String paramString)
  {
    paramString = BaseApplicationImpl.a().getSharedPreferences(jdField_h_of_type_JavaLangString, 0);
    String str = i;
    int i2 = paramString.getInt(str, -1);
    int i1 = i2;
    if (i2 == -1) {
      if (!VcSystemInfo.g()) {
        break label67;
      }
    }
    label67:
    for (i1 = 1;; i1 = 0)
    {
      paramString.edit().putInt(str, i1).commit();
      return i1 >= 1;
    }
  }
  
  public static boolean f(String paramString)
  {
    SharedPreferences localSharedPreferences = BaseApplicationImpl.a().getSharedPreferences(jdField_h_of_type_JavaLangString, 0);
    paramString = j + paramString;
    boolean bool = localSharedPreferences.getBoolean(paramString, true);
    if (bool) {
      localSharedPreferences.edit().putBoolean(paramString, false).commit();
    }
    return bool;
  }
  
  public int a()
  {
    return jdField_b_of_type_Ffm.jdField_c_of_type_Int;
  }
  
  public int a(long paramLong)
  {
    if (jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Long.valueOf(paramLong))) {
      return jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.get(Long.valueOf(paramLong))).jdField_a_of_type_Int;
    }
    return 10004;
  }
  
  public int a(String paramString)
  {
    int i1 = 0;
    paramString = a(paramString, false);
    if (paramString != null) {
      i1 = jdField_a_of_type_Int;
    }
    return i1;
  }
  
  public long a()
  {
    return jdField_b_of_type_Ffm.jdField_a_of_type_Long;
  }
  
  public long a(int paramInt, long paramLong)
  {
    ffp localFfp;
    if (paramInt == 2)
    {
      if (jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Long.valueOf(paramLong)))
      {
        localFfp = (ffp)jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.get(Long.valueOf(paramLong));
        if (localFfp != null) {
          return jdField_a_of_type_Long;
        }
      }
    }
    else if ((paramInt == 1) && (jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Long.valueOf(paramLong))))
    {
      localFfp = (ffp)jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.get(Long.valueOf(paramLong));
      if (localFfp != null) {
        return jdField_a_of_type_Long;
      }
    }
    return 0L;
  }
  
  public long a(String paramString)
  {
    synchronized (jdField_d_of_type_JavaUtilHashMap)
    {
      if (jdField_d_of_type_JavaUtilHashMap.containsKey(paramString))
      {
        long l1 = jdField_d_of_type_JavaUtilHashMap.get(paramString)).jdField_a_of_type_Long;
        return l1;
      }
      return 0L;
    }
  }
  
  public Bitmap a()
  {
    return jdField_a_of_type_AndroidGraphicsBitmap;
  }
  
  public MeetingInfo a(int paramInt, String paramString)
  {
    if (paramInt == 2) {
      return (MeetingInfo)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString);
    }
    if (paramInt == 1) {}
    return null;
  }
  
  public PstnSessionInfo a()
  {
    return jdField_a_of_type_ComTencentAvAppPstnSessionInfo;
  }
  
  public AVNotifyCenter.UserInfo a(int paramInt, long paramLong)
  {
    if ((paramInt == 2) && (jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap != null) && (jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Long.valueOf(paramLong))))
    {
      Vector localVector = jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.get(Long.valueOf(paramLong))).jdField_a_of_type_JavaUtilVector;
      if ((localVector != null) && (localVector.size() > 0)) {
        return (AVNotifyCenter.UserInfo)localVector.get(0);
      }
    }
    return null;
  }
  
  public AVNotifyCenter.VideoRoomInfo a(long paramLong)
  {
    Object localObject1 = String.valueOf(paramLong) + String.valueOf(2);
    Object localObject2 = String.valueOf(paramLong) + String.valueOf(10);
    localObject1 = (AVNotifyCenter.VideoRoomInfo)jdField_c_of_type_JavaUtilMap.get(localObject1);
    localObject2 = (AVNotifyCenter.VideoRoomInfo)jdField_c_of_type_JavaUtilMap.get(localObject2);
    Object localObject3 = String.valueOf(paramLong) + String.valueOf(12);
    localObject3 = (AVNotifyCenter.VideoRoomInfo)jdField_c_of_type_JavaUtilMap.get(localObject3);
    int i1 = b(paramLong);
    if ((i1 != 0) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(1, paramLong))) {
      if (i1 != 12) {}
    }
    while ((localObject3 != null) && (jdField_a_of_type_Int > 0))
    {
      return localObject3;
      if (i1 == 2) {
        return localObject1;
      }
      if (i1 != 10) {
        break;
      }
      return localObject2;
    }
    if ((localObject1 != null) && (jdField_a_of_type_Int > 0)) {
      return localObject1;
    }
    if ((localObject2 != null) && (jdField_a_of_type_Int > 0)) {
      return localObject2;
    }
    return null;
  }
  
  public AVNotifyCenter.VideoRoomInfo a(long paramLong, int paramInt)
  {
    String str = String.valueOf(paramLong) + String.valueOf(paramInt);
    return (AVNotifyCenter.VideoRoomInfo)jdField_c_of_type_JavaUtilMap.get(str);
  }
  
  /* Error */
  public ffm a(String paramString, boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aconst_null
    //   3: astore_3
    //   4: aload_0
    //   5: getfield 154	com/tencent/av/gaudio/AVNotifyCenter:jdField_c_of_type_JavaUtilHashMap	Ljava/util/HashMap;
    //   8: aload_1
    //   9: invokevirtual 319	java/util/HashMap:containsKey	(Ljava/lang/Object;)Z
    //   12: ifeq +19 -> 31
    //   15: aload_0
    //   16: getfield 154	com/tencent/av/gaudio/AVNotifyCenter:jdField_c_of_type_JavaUtilHashMap	Ljava/util/HashMap;
    //   19: aload_1
    //   20: invokevirtual 320	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   23: checkcast 156	ffm
    //   26: astore_3
    //   27: aload_0
    //   28: monitorexit
    //   29: aload_3
    //   30: areturn
    //   31: iload_2
    //   32: ifeq -5 -> 27
    //   35: invokestatic 371	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   38: ifeq +29 -> 67
    //   41: ldc 8
    //   43: iconst_2
    //   44: new 231	java/lang/StringBuilder
    //   47: dup
    //   48: invokespecial 232	java/lang/StringBuilder:<init>	()V
    //   51: ldc_w 373
    //   54: invokevirtual 238	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   57: aload_1
    //   58: invokevirtual 238	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   61: invokevirtual 246	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   64: invokestatic 376	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   67: new 156	ffm
    //   70: dup
    //   71: aload_0
    //   72: invokespecial 159	ffm:<init>	(Lcom/tencent/av/gaudio/AVNotifyCenter;)V
    //   75: astore 4
    //   77: aload_0
    //   78: getfield 154	com/tencent/av/gaudio/AVNotifyCenter:jdField_c_of_type_JavaUtilHashMap	Ljava/util/HashMap;
    //   81: aload_1
    //   82: aload 4
    //   84: invokevirtual 380	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   87: pop
    //   88: aload 4
    //   90: astore_3
    //   91: aload_0
    //   92: getfield 154	com/tencent/av/gaudio/AVNotifyCenter:jdField_c_of_type_JavaUtilHashMap	Ljava/util/HashMap;
    //   95: invokevirtual 381	java/util/HashMap:size	()I
    //   98: iconst_1
    //   99: if_icmpne -72 -> 27
    //   102: aload_0
    //   103: aload 4
    //   105: putfield 163	com/tencent/av/gaudio/AVNotifyCenter:jdField_b_of_type_Ffm	Lffm;
    //   108: aload 4
    //   110: astore_3
    //   111: goto -84 -> 27
    //   114: astore_1
    //   115: aload_0
    //   116: monitorexit
    //   117: aload_1
    //   118: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	119	0	this	AVNotifyCenter
    //   0	119	1	paramString	String
    //   0	119	2	paramBoolean	boolean
    //   3	108	3	localObject	Object
    //   75	34	4	localFfm	ffm
    // Exception table:
    //   from	to	target	type
    //   4	27	114	finally
    //   35	67	114	finally
    //   67	88	114	finally
    //   91	108	114	finally
  }
  
  public String a()
  {
    return jdField_b_of_type_JavaLangString;
  }
  
  public String a(long paramLong)
  {
    if (jdField_a_of_type_JavaUtilHashMap.containsKey(Long.valueOf(paramLong)))
    {
      String str1 = jdField_a_of_type_JavaUtilHashMap.get(Long.valueOf(paramLong))).telInfo.mobile;
      String str2 = a(str1);
      if (str2 != null) {
        return str2;
      }
      return PstnUtils.a(str1, 4);
    }
    return null;
  }
  
  String a(String paramString)
  {
    PhoneContactManager localPhoneContactManager = (PhoneContactManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(10);
    if (localPhoneContactManager == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("AVNotifyCenter", 2, "getPhoneNameByPhoneNum --> can not get PhoneContactManager");
      }
      return null;
    }
    paramString = localPhoneContactManager.b(paramString);
    if ((paramString == null) || (name == null))
    {
      if (QLog.isColorLevel()) {
        QLog.e("AVNotifyCenter", 2, "getPhoneNameByPhoneNum --> can not get phoneContact Or Name");
      }
      return null;
    }
    return name;
  }
  
  public HashMap a()
  {
    return jdField_b_of_type_JavaUtilHashMap;
  }
  
  public void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "clearMultiRoomInfos");
    }
    jdField_b_of_type_Ffm.jdField_c_of_type_Int = 0;
    jdField_b_of_type_Ffm.jdField_a_of_type_Long = 0L;
    jdField_b_of_type_Ffm.jdField_d_of_type_Boolean = false;
    jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.clear();
  }
  
  public void a(int paramInt)
  {
    jdField_c_of_type_Int = paramInt;
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    jdField_a_of_type_Int = paramInt1;
    jdField_b_of_type_Int = paramInt2;
  }
  
  public void a(int paramInt1, int paramInt2, long paramLong1, long paramLong2)
  {
    try
    {
      setChanged();
      notifyObservers(new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2), Long.valueOf(paramLong1), Long.valueOf(paramLong2) });
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void a(int paramInt1, int paramInt2, long paramLong1, long paramLong2, int paramInt3)
  {
    try
    {
      setChanged();
      notifyObservers(new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2), Long.valueOf(paramLong1), Long.valueOf(paramLong2), Integer.valueOf(paramInt3) });
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void a(int paramInt1, int paramInt2, long paramLong1, long paramLong2, String paramString)
  {
    try
    {
      setChanged();
      notifyObservers(new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2), Long.valueOf(paramLong1), Long.valueOf(paramLong2), paramString });
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public void a(int paramInt1, int paramInt2, String paramString1, String paramString2)
  {
    try
    {
      setChanged();
      notifyObservers(new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2), paramString1, paramString2 });
      return;
    }
    finally
    {
      paramString1 = finally;
      throw paramString1;
    }
  }
  
  public void a(int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "onSelfEnterRoom-->relationType==" + paramInt + " discussId" + paramLong);
    }
    Object localObject1;
    long l1;
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null)
    {
      if (paramInt != 2) {
        break label185;
      }
      localObject1 = jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap;
      l1 = Long.valueOf(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()).longValue();
      if (!((ConcurrentHashMap)localObject1).containsKey(Long.valueOf(paramLong))) {
        break label285;
      }
      if (QLog.isColorLevel()) {
        QLog.d("AVNotifyCenter", 2, "onSelfEnterRoom-->containsKey");
      }
      localObject1 = (ffp)((ConcurrentHashMap)localObject1).get(Long.valueOf(paramLong));
      localVector = jdField_a_of_type_JavaUtilVector;
      if ((localVector == null) || (localVector.size() <= 0)) {
        break label206;
      }
      int i1 = localVector.size();
      paramInt = 0;
      label145:
      if (paramInt >= i1) {
        break label206;
      }
      if (l1 != elementAtjdField_a_of_type_Long) {
        break label199;
      }
      if (QLog.isColorLevel()) {
        QLog.d("AVNotifyCenter", 2, "onSelfEnterRoom-->uin in uinlist");
      }
    }
    label185:
    label199:
    label206:
    do
    {
      do
      {
        do
        {
          return;
        } while (paramInt != 1);
        localObject1 = jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap;
        break;
        paramInt += 1;
        break label145;
      } while (localVector == null);
      localObject2 = new AVNotifyCenter.UserInfo(this);
      jdField_a_of_type_Long = l1;
      localVector.add(localObject2);
      jdField_a_of_type_Long += 1L;
    } while (!QLog.isColorLevel());
    QLog.d("AVNotifyCenter", 2, "onSelfEnterRoom-->infoRoomNum=" + jdField_a_of_type_Long);
    return;
    label285:
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "onSelfEnterRoom-->insert new uinlist");
    }
    Vector localVector = new Vector();
    Object localObject2 = new AVNotifyCenter.UserInfo(this);
    jdField_a_of_type_Long = l1;
    localVector.add(localObject2);
    localObject2 = new ffp(this);
    jdField_a_of_type_Long = 1L;
    jdField_a_of_type_JavaUtilVector = localVector;
    ((ConcurrentHashMap)localObject1).put(Long.valueOf(paramLong), localObject2);
  }
  
  public void a(int paramInt1, long paramLong, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "onSelfLeaveRoom() relationType==" + paramInt1 + " relationId" + paramLong + " avtype:" + paramInt2);
    }
    Object localObject;
    int i1;
    String str;
    long l1;
    Vector localVector;
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null)
    {
      if (paramInt1 != 2) {
        break label223;
      }
      localObject = jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap;
      i1 = 3000;
      str = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      l1 = Long.valueOf(str).longValue();
      label221:
      if (((ConcurrentHashMap)localObject).containsKey(Long.valueOf(paramLong)))
      {
        ffp localFfp = (ffp)((ConcurrentHashMap)localObject).get(Long.valueOf(paramLong));
        localVector = jdField_a_of_type_JavaUtilVector;
        jdField_a_of_type_Long -= 1L;
        if (QLog.isColorLevel()) {
          QLog.d("shanezhai", 2, "onSelfLeaveRoom");
        }
        if (jdField_a_of_type_Long != 0L) {
          break label278;
        }
        ((ConcurrentHashMap)localObject).remove(Long.valueOf(paramLong));
        localObject = Long.toString(paramLong);
        if (paramInt1 != 2) {
          break label240;
        }
        VideoMsgTools.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, i1, 14, false, (String)localObject, str, false, null, false, new Object[] { new Integer(paramInt2) });
      }
    }
    for (;;)
    {
      return;
      label223:
      if (paramInt1 == 1)
      {
        localObject = jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap;
        i1 = 1;
        break;
        label240:
        VideoMsgTools.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, i1, 14, false, (String)localObject, str, false, null, false, paramInt2, new Object[] { new Integer(paramInt2) });
        return;
        label278:
        if ((localVector == null) || (localVector.size() <= 0)) {
          break label221;
        }
        paramInt2 = localVector.size();
        paramInt1 = 0;
        while (paramInt1 < paramInt2)
        {
          if (l1 == elementAtjdField_a_of_type_Long)
          {
            localVector.remove(paramInt1);
            return;
          }
          paramInt1 += 1;
        }
      }
    }
  }
  
  public void a(int paramInt, long paramLong, boolean paramBoolean1, boolean paramBoolean2)
  {
    ffm localFfm = a(String.valueOf(paramLong), false);
    if (localFfm != null)
    {
      jdField_c_of_type_Boolean = paramBoolean1;
      if (!paramBoolean1) {
        break label47;
      }
      if (!paramBoolean2) {
        break label40;
      }
      jdField_d_of_type_Boolean = false;
    }
    label40:
    label47:
    while (paramBoolean1)
    {
      return;
      jdField_d_of_type_Boolean = true;
      return;
    }
    jdField_d_of_type_Boolean = true;
  }
  
  public void a(int paramInt, long paramLong, long[] paramArrayOfLong)
  {
    int i2 = 0;
    if (paramInt == 2) {}
    Vector localVector;
    int i1;
    for (ConcurrentHashMap localConcurrentHashMap = jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap;; localConcurrentHashMap = jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap)
    {
      if (QLog.isColorLevel()) {
        QLog.d("AVNotifyCenter", 2, "setMultiRoomMember-->relationType=" + paramInt + " relationId=" + paramLong + " length=" + paramArrayOfLong.length);
      }
      if (localConcurrentHashMap.containsKey(Long.valueOf(paramLong))) {
        localConcurrentHashMap.remove(Long.valueOf(paramLong));
      }
      localVector = new Vector();
      int i3 = paramArrayOfLong.length;
      i1 = 0;
      paramInt = i2;
      while (paramInt < i3)
      {
        AVNotifyCenter.UserInfo localUserInfo = new AVNotifyCenter.UserInfo(this);
        jdField_a_of_type_Long = paramArrayOfLong[paramInt];
        localVector.add(localUserInfo);
        i1 += 1;
        paramInt += 1;
      }
      if (paramInt != 1) {
        return;
      }
    }
    paramArrayOfLong = new ffp(this);
    jdField_a_of_type_Long = i1;
    jdField_a_of_type_JavaUtilVector = localVector;
    localConcurrentHashMap.put(Long.valueOf(paramLong), paramArrayOfLong);
  }
  
  public void a(int paramInt, long paramLong1, long[] paramArrayOfLong, long paramLong2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("setMultiRoomMember", 2, "setMultiRoomMember : relationType = " + paramInt + ", relationId " + paramLong1 + ", Num:" + paramLong2);
    }
    if (paramInt == 2)
    {
      if (jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Long.valueOf(paramLong1))) {
        jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.remove(Long.valueOf(paramLong1));
      }
      if ((paramLong2 != 0L) && (paramArrayOfLong != null)) {}
    }
    do
    {
      do
      {
        return;
        Vector localVector = new Vector();
        int i1 = paramArrayOfLong.length;
        paramInt = 0;
        while (paramInt < i1)
        {
          AVNotifyCenter.UserInfo localUserInfo = new AVNotifyCenter.UserInfo(this);
          jdField_a_of_type_Long = paramArrayOfLong[paramInt];
          localVector.add(localUserInfo);
          paramInt += 1;
        }
        paramArrayOfLong = new ffp(this);
        jdField_a_of_type_Long = paramLong2;
        jdField_a_of_type_JavaUtilVector = localVector;
        jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.put(Long.valueOf(paramLong1), paramArrayOfLong);
        return;
      } while (paramInt != 1);
      if (jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Long.valueOf(paramLong1))) {
        jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.remove(Long.valueOf(paramLong1));
      }
    } while (paramLong2 == 0L);
    paramArrayOfLong = new ffp(this);
    jdField_a_of_type_Long = paramLong2;
    jdField_a_of_type_JavaUtilVector = null;
    jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.put(Long.valueOf(paramLong1), paramArrayOfLong);
  }
  
  public void a(int paramInt, long paramLong1, long[] paramArrayOfLong, int[] paramArrayOfInt, long paramLong2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("setMultiRoomMember", 2, "setMultiRoomMember : relationType = " + paramInt + ", relationId " + paramLong1 + ", Num:" + paramLong2);
    }
    if (paramInt == 2)
    {
      if (jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Long.valueOf(paramLong1))) {
        jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.remove(Long.valueOf(paramLong1));
      }
      if ((paramLong2 != 0L) && (paramArrayOfLong != null) && (paramArrayOfInt != null) && (paramArrayOfLong.length == paramArrayOfInt.length)) {}
    }
    do
    {
      do
      {
        return;
        Vector localVector = new Vector();
        int i1 = paramArrayOfLong.length;
        ArrayList localArrayList = new ArrayList();
        paramInt = 0;
        if (paramInt < i1)
        {
          AVNotifyCenter.UserInfo localUserInfo = new AVNotifyCenter.UserInfo(this);
          jdField_a_of_type_Long = paramArrayOfLong[paramInt];
          if (paramArrayOfInt[paramInt] == 1) {}
          for (boolean bool = true;; bool = false)
          {
            jdField_a_of_type_Boolean = bool;
            if ((jdField_a_of_type_Boolean) && (!jdField_a_of_type_JavaUtilHashMap.containsKey(Long.valueOf(jdField_a_of_type_Long)))) {
              localArrayList.add(Long.valueOf(jdField_a_of_type_Long));
            }
            localVector.add(localUserInfo);
            paramInt += 1;
            break;
          }
        }
        a(localArrayList);
        paramArrayOfLong = new ffp(this);
        jdField_a_of_type_Long = paramLong2;
        jdField_a_of_type_JavaUtilVector = localVector;
        jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.put(Long.valueOf(paramLong1), paramArrayOfLong);
        return;
      } while (paramInt != 1);
      if (jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Long.valueOf(paramLong1))) {
        jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.remove(Long.valueOf(paramLong1));
      }
    } while (paramLong2 == 0L);
    paramArrayOfLong = new ffp(this);
    jdField_a_of_type_Long = paramLong2;
    jdField_a_of_type_JavaUtilVector = null;
    jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.put(Long.valueOf(paramLong1), paramArrayOfLong);
  }
  
  public void a(int paramInt, Long paramLong, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "setChating discussId is:relationType = " + paramInt + ", relationId = " + paramLong + ", isChatting = " + paramBoolean);
    }
    Object localObject = String.valueOf(paramLong);
    if (!paramBoolean) {
      return;
    }
    localObject = a((String)localObject, true);
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Long = paramLong.longValue();
    jdField_c_of_type_Int = paramInt;
    if (jdField_c_of_type_Int == 1) {
      jdField_b_of_type_Int = 1;
    }
    for (;;)
    {
      jdField_d_of_type_Boolean = paramBoolean;
      return;
      if (jdField_c_of_type_Int == 2) {
        jdField_b_of_type_Int = 3000;
      } else if (jdField_c_of_type_Int == 3) {
        jdField_b_of_type_Int = 0;
      }
    }
  }
  
  public void a(int paramInt1, Long paramLong, boolean paramBoolean, int paramInt2)
  {
    a(paramInt1, paramLong, paramBoolean);
  }
  
  public void a(int paramInt, String paramString)
  {
    try
    {
      setChanged();
      long l1 = 0L;
      try
      {
        long l2 = Long.parseLong(paramString);
        l1 = l2;
      }
      catch (NumberFormatException paramString)
      {
        for (;;) {}
      }
      notifyObservers(new Object[] { Integer.valueOf(36), Integer.valueOf(2), Long.valueOf(l1), Integer.valueOf(0) });
      return;
    }
    finally {}
  }
  
  public void a(int paramInt, String paramString1, String paramString2, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "setChating uinType:" + paramInt + ", peerUin" + paramString1);
    }
    ffm localFfm = a(paramString1, true);
    jdField_a_of_type_Boolean = true;
    jdField_b_of_type_Int = paramInt;
    jdField_a_of_type_JavaLangString = paramString1;
    jdField_b_of_type_JavaLangString = paramString2;
    jdField_b_of_type_Boolean = paramBoolean;
  }
  
  public void a(long paramLong)
  {
    jdField_a_of_type_Long = paramLong;
  }
  
  public void a(long paramLong, int paramInt)
  {
    if (paramInt == 0) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(false);
    }
    jdField_a_of_type_JavaUtilMap.put(Long.valueOf(paramLong), Integer.valueOf(paramInt));
  }
  
  public void a(long paramLong, int paramInt1, int paramInt2)
  {
    int i1 = 1;
    Object localObject2 = (String)jdField_b_of_type_JavaUtilMap.get(Long.valueOf(paramLong));
    Object localObject1 = localObject2;
    if (localObject2 == null) {
      localObject1 = "0;0";
    }
    if (paramInt2 > 0) {
      if (paramInt1 == 2)
      {
        localObject2 = a(paramLong, 10);
        paramInt1 = i1;
      }
    }
    for (;;)
    {
      if (localObject2 != null) {
        if (jdField_a_of_type_Int > 0) {
          localObject1 = "1;" + (jdField_a_of_type_Int + paramInt2);
        }
      }
      for (;;)
      {
        jdField_b_of_type_JavaUtilMap.put(String.valueOf(paramLong), localObject1);
        return;
        if (paramInt1 != 10) {
          break label164;
        }
        localObject2 = a(paramLong, 2);
        paramInt1 = i1;
        break;
        localObject1 = "0;0";
        continue;
        if (paramInt1 != 0)
        {
          localObject1 = "0;0";
          continue;
          localObject1 = "0;0";
        }
      }
      label164:
      paramInt1 = 0;
      localObject2 = null;
    }
  }
  
  public void a(long paramLong, int paramInt1, int paramInt2, int paramInt3)
  {
    if (QLog.isColorLevel()) {
      QLog.d("setVideoRoomInfo", 2, "groupid:" + paramLong + " avtype : " + paramInt1 + "event:" + paramInt2 + "memberNum:" + paramInt3);
    }
    AVNotifyCenter.VideoRoomInfo localVideoRoomInfo = new AVNotifyCenter.VideoRoomInfo(this);
    jdField_a_of_type_Long = paramLong;
    jdField_b_of_type_Int = paramInt1;
    jdField_c_of_type_Int = paramInt2;
    jdField_a_of_type_Int = paramInt3;
    String str = String.valueOf(paramLong) + String.valueOf(paramInt1);
    jdField_c_of_type_JavaUtilMap.put(str, localVideoRoomInfo);
  }
  
  public void a(long paramLong, boolean paramBoolean, int paramInt)
  {
    if (Build.VERSION.SDK_INT < 11) {}
    String str1;
    SharedPreferences localSharedPreferences;
    String str2;
    do
    {
      return;
      str1 = String.valueOf(paramLong);
      HashSet localHashSet = new HashSet();
      localSharedPreferences = PreferenceManager.getDefaultSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      str2 = "ADD_FRIEND_DIALOG" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
      localObject = localHashSet;
      if (localSharedPreferences.contains(str2)) {
        localObject = localSharedPreferences.getStringSet(str2, localHashSet);
      }
      if (QLog.isColorLevel()) {
        QLog.d("AVNotifyCenter", 2, "setAddFriendNotifyMaps-->uin=" + paramLong + " bNotify=" + paramBoolean + " srcId=" + paramInt + " size=" + ((Set)localObject).size() + " info=" + localObject.toString());
      }
    } while ((((Set)localObject).size() >= 3) || (((Set)localObject).contains(str1)));
    if (jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Long.valueOf(paramLong))) {
      jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.remove(Long.valueOf(paramLong));
    }
    if (!paramBoolean)
    {
      ((Set)localObject).add(str1);
      localSharedPreferences.edit().putStringSet(str2, (Set)localObject).commit();
      return;
    }
    Object localObject = new ffl();
    jdField_a_of_type_Int = paramInt;
    jdField_a_of_type_Long = paramLong;
    jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.put(Long.valueOf(paramLong), localObject);
  }
  
  public void a(Resources paramResources, int paramInt)
  {
    try
    {
      paramResources = BitmapFactory.decodeResource(paramResources, paramInt);
      jdField_e_of_type_Int = paramResources.getHeight();
      jdField_d_of_type_Int = paramResources.getWidth();
      return;
    }
    catch (OutOfMemoryError paramResources)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e("AVNotifyCenter", 2, "adaptFamousChattingHeadSize --> OOM Exception");
      return;
    }
    catch (Exception paramResources)
    {
      while (!QLog.isColorLevel()) {}
      QLog.d("AVNotifyCenter", 2, "Can not Get Bitmap From Resid");
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, String paramString)
  {
    if (paramString == null) {
      if (QLog.isColorLevel()) {
        QLog.d("AVNotifyCenter", 2, "saveFamousPersonChattingConfigContent --> strContent is null");
      }
    }
    for (;;)
    {
      return;
      try
      {
        paramQQAppInterface = new JSONObject(paramString);
        paramString = paramQQAppInterface.keys();
        if (paramString.hasNext())
        {
          String str = (String)paramString.next();
          if (str.equals("open_flag")) {
            if (paramQQAppInterface.getInt(str) != 1) {
              break label182;
            }
          }
          label182:
          for (boolean bool = true;; bool = false)
          {
            jdField_b_of_type_Boolean = bool;
            if (str.equals("title")) {
              jdField_d_of_type_JavaLangString = paramQQAppInterface.getString(str);
            }
            if (str.equals("url")) {
              jdField_e_of_type_JavaLangString = paramQQAppInterface.getString(str);
            }
            if (str.equals("desc_text")) {
              jdField_f_of_type_JavaLangString = paramQQAppInterface.getString(str);
            }
            bool = str.equals("web_url");
            if (!bool) {
              break;
            }
            try
            {
              jdField_g_of_type_JavaLangString = URLDecoder.decode(paramQQAppInterface.getString(str), "UTF-8");
            }
            catch (Exception localException) {}
            break;
          }
        }
        if (QLog.isColorLevel())
        {
          QLog.d("AVNotifyCenter", 2, "Flag = " + jdField_b_of_type_Boolean + " , Title = " + jdField_d_of_type_JavaLangString + " , Url = " + jdField_e_of_type_JavaLangString);
          QLog.d("AVNotifyCenter", 2, "saveFamousPersonChattingConfigContent mFamousPersonChattingSecondLineText = " + jdField_f_of_type_JavaLangString);
          QLog.d("AVNotifyCenter", 2, "saveFamousPersonChattingConfigContent mFamousPersonChattingWebUrl = " + jdField_g_of_type_JavaLangString);
        }
        if (jdField_e_of_type_JavaLangString != null)
        {
          jdField_a_of_type_Ffn.execute(new String[] { jdField_e_of_type_JavaLangString });
          return;
        }
      }
      catch (Exception paramQQAppInterface)
      {
        jdField_b_of_type_Boolean = false;
        jdField_d_of_type_JavaLangString = null;
      }
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, String paramString, int paramInt)
  {
    boolean bool = false;
    SharedPreUtils.b(paramQQAppInterface.getApplication(), paramInt, paramQQAppInterface.getAccount());
    SharedPreferences.Editor localEditor = BaseApplication.getContext().getSharedPreferences("mobileQQ", 0).edit();
    localEditor.putString("group_video_push_cfg_txt." + paramQQAppInterface.getAccount(), paramString).commit();
    try
    {
      paramString = new JSONObject(paramString).getJSONObject("mav");
      if (paramString != null)
      {
        JSONObject localJSONObject = paramString.getJSONObject("relationType1");
        if (localJSONObject != null) {
          if (localJSONObject.getInt("mutex") != 0) {
            break label316;
          }
        }
      }
      for (;;)
      {
        jdField_h_of_type_Boolean = bool;
        localEditor.putBoolean("group_video_push_cfg_txt." + paramQQAppInterface.getAccount() + ".mutex", jdField_h_of_type_Boolean);
        paramString = paramString.getJSONObject("noiseCtrl");
        if (paramString != null)
        {
          paramInt = paramString.getInt("level");
          int i1 = paramString.getInt("sendDura");
          int i2 = paramString.getInt("validDura");
          localEditor.putInt("group_video_push_cfg_txt." + paramQQAppInterface.getAccount() + ".level", paramInt);
          localEditor.putInt("group_video_push_cfg_txt." + paramQQAppInterface.getAccount() + ".sendDura", i1);
          localEditor.putInt("group_video_push_cfg_txt." + paramQQAppInterface.getAccount() + ".validDura", i2);
        }
        localEditor.commit();
        return;
        label316:
        bool = true;
      }
      return;
    }
    catch (JSONException paramQQAppInterface)
    {
      paramQQAppInterface.printStackTrace();
    }
  }
  
  public void a(String paramString)
  {
    jdField_b_of_type_JavaLangString = paramString;
  }
  
  public void a(String paramString, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "setSessionType peerUin:" + paramString + ", sessionType" + paramInt);
    }
    if (paramInt == 0) {
      c(paramString);
    }
    do
    {
      return;
      paramString = a(paramString, true);
    } while (paramString == null);
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_Int = paramInt;
  }
  
  public void a(String paramString, long paramLong, int paramInt)
  {
    synchronized (jdField_d_of_type_JavaUtilHashMap)
    {
      jdField_d_of_type_JavaUtilHashMap.put(paramString, new ffq(this, paramLong, paramInt));
      return;
    }
  }
  
  public void a(String paramString, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "setDoubleVideoMeetingFlag-->isDoubleVideoMeeting = " + paramBoolean);
    }
    paramString = a(paramString, false);
    if (paramString != null) {
      jdField_e_of_type_Boolean = paramBoolean;
    }
  }
  
  public void a(String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    paramString = a(String.valueOf(paramString), false);
    if (paramString != null)
    {
      jdField_c_of_type_Boolean = paramBoolean1;
      if (!paramBoolean1) {
        break label39;
      }
      if (!paramBoolean2) {
        break label33;
      }
      jdField_d_of_type_Boolean = false;
    }
    label33:
    label39:
    while (paramBoolean1)
    {
      return;
      jdField_d_of_type_Boolean = true;
      return;
    }
    jdField_d_of_type_Boolean = true;
  }
  
  void a(ArrayList paramArrayList)
  {
    NewIntent localNewIntent = new NewIntent(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getApplication(), VideoConfigServlet.class);
    localNewIntent.putExtra("reqType", 15);
    localNewIntent.putExtra("tinyid_list", paramArrayList);
    try
    {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.startServlet(localNewIntent);
      return;
    }
    catch (Exception paramArrayList)
    {
      QLog.e("AVNotifyCenter", 2, "getOpenIdFromTinyId --> StartServlet Error");
    }
  }
  
  public void a(boolean paramBoolean)
  {
    jdField_c_of_type_Boolean = paramBoolean;
  }
  
  public void a(boolean paramBoolean, String paramString)
  {
    try
    {
      setChanged();
      notifyObservers(new Object[] { Integer.valueOf(408), Boolean.valueOf(paramBoolean), paramString });
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public boolean a()
  {
    if (jdField_a_of_type_ComTencentAvUtilsPhoneStatusMonitor != null) {
      return jdField_a_of_type_ComTencentAvUtilsPhoneStatusMonitor.a();
    }
    return false;
  }
  
  public boolean a(int paramInt, long paramLong)
  {
    boolean bool = false;
    ffm localFfm = a(String.valueOf(paramLong), false);
    if (localFfm != null) {
      bool = jdField_d_of_type_Boolean;
    }
    return bool;
  }
  
  public boolean a(int paramInt1, long paramLong, int paramInt2)
  {
    boolean bool2 = false;
    boolean bool1;
    if (paramInt1 == 2) {
      bool1 = a(paramInt1, paramLong);
    }
    ffm localFfm;
    do
    {
      do
      {
        do
        {
          return bool1;
          paramInt1 = b(paramLong);
          bool1 = bool2;
        } while (paramInt1 < 0);
        localFfm = a(String.valueOf(paramLong), false);
        bool1 = bool2;
      } while (localFfm == null);
      bool1 = bool2;
    } while (paramInt2 != paramInt1);
    return jdField_d_of_type_Boolean;
  }
  
  public boolean a(int paramInt, String paramString)
  {
    if (paramInt == 2) {
      return jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(paramString);
    }
    if (paramInt == 1) {}
    return false;
  }
  
  public boolean a(long paramLong)
  {
    if (Build.VERSION.SDK_INT < 11) {
      return false;
    }
    HashSet localHashSet = new HashSet();
    SharedPreferences localSharedPreferences = PreferenceManager.getDefaultSharedPreferences(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    String str = "ADD_FRIEND_DIALOG" + jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    Object localObject = localHashSet;
    if (localSharedPreferences.contains(str)) {
      localObject = localSharedPreferences.getStringSet(str, localHashSet);
    }
    if (((Set)localObject).size() >= 3) {
      return false;
    }
    if (((Set)localObject).contains(String.valueOf(paramLong))) {
      return false;
    }
    return jdField_d_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Long.valueOf(paramLong));
  }
  
  public boolean a(String paramString)
  {
    paramString = (String)jdField_b_of_type_JavaUtilMap.get(paramString);
    if (paramString == null) {
      return false;
    }
    if (paramString.split(";")[0].equals("1")) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public int b()
  {
    return jdField_a_of_type_Int;
  }
  
  public int b(long paramLong)
  {
    Integer localInteger = (Integer)jdField_a_of_type_JavaUtilMap.get(Long.valueOf(paramLong));
    if (localInteger != null) {
      return localInteger.intValue();
    }
    return 0;
  }
  
  public int b(String paramString)
  {
    synchronized (jdField_d_of_type_JavaUtilHashMap)
    {
      if (jdField_d_of_type_JavaUtilHashMap.containsKey(paramString))
      {
        int i1 = jdField_d_of_type_JavaUtilHashMap.get(paramString)).jdField_a_of_type_Int;
        return i1;
      }
      return 0;
    }
  }
  
  public long b()
  {
    return jdField_a_of_type_Long;
  }
  
  public String b()
  {
    return jdField_d_of_type_JavaLangString;
  }
  
  public String b(long paramLong)
  {
    synchronized (jdField_d_of_type_JavaUtilHashMap)
    {
      Iterator localIterator = jdField_d_of_type_JavaUtilHashMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        if (jdField_d_of_type_JavaUtilHashMap.get(str)).jdField_a_of_type_Long == paramLong) {
          return str;
        }
      }
      return "";
    }
  }
  
  public void b(int paramInt)
  {
    s = paramInt;
  }
  
  public void b(int paramInt1, long paramLong, int paramInt2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "setSessionType relaitonType:" + paramInt1 + ", relationId" + paramLong + ", sessionType" + paramInt2);
    }
    Object localObject = String.valueOf(paramLong);
    if (paramInt2 == 0) {
      c((String)localObject);
    }
    do
    {
      return;
      localObject = a((String)localObject, true);
    } while (localObject == null);
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_Int = paramInt2;
  }
  
  public void b(int paramInt, String paramString)
  {
    try
    {
      setChanged();
      long l1 = 0L;
      try
      {
        long l2 = Long.parseLong(paramString);
        l1 = l2;
      }
      catch (NumberFormatException paramString)
      {
        for (;;) {}
      }
      notifyObservers(new Object[] { Integer.valueOf(37), Integer.valueOf(2), Long.valueOf(l1), Integer.valueOf(0) });
      return;
    }
    finally {}
  }
  
  public void b(long paramLong)
  {
    jdField_b_of_type_Long = paramLong;
  }
  
  public void b(String paramString)
  {
    synchronized (jdField_d_of_type_JavaUtilHashMap)
    {
      if (jdField_d_of_type_JavaUtilHashMap.containsKey(paramString)) {
        jdField_d_of_type_JavaUtilHashMap.remove(paramString);
      }
      return;
    }
  }
  
  public void b(ArrayList paramArrayList)
  {
    if (paramArrayList == null) {}
    for (;;)
    {
      return;
      paramArrayList = paramArrayList.iterator();
      while (paramArrayList.hasNext())
      {
        AVPhoneUserInfo localAVPhoneUserInfo = (AVPhoneUserInfo)paramArrayList.next();
        long l1 = account;
        if (!jdField_a_of_type_JavaUtilHashMap.containsKey(Long.valueOf(l1))) {
          jdField_a_of_type_JavaUtilHashMap.put(Long.valueOf(l1), localAVPhoneUserInfo);
        }
      }
    }
  }
  
  public void b(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "startOrStopGAudioTimer start: " + paramBoolean);
    }
    if (paramBoolean)
    {
      if (!jdField_b_of_type_Ffm.jdField_d_of_type_Boolean) {
        jdField_b_of_type_Long = 0L;
      }
      if (jdField_b_of_type_JavaLangRunnable == null) {
        jdField_b_of_type_JavaLangRunnable = new ffr(this);
      }
    }
    while ((c()) || (jdField_b_of_type_JavaLangRunnable == null) || (jdField_a_of_type_MqqOsMqqHandler == null)) {
      for (;;)
      {
        if (jdField_a_of_type_MqqOsMqqHandler != null) {
          jdField_a_of_type_MqqOsMqqHandler.postDelayed(jdField_b_of_type_JavaLangRunnable, 1000L);
        }
        return;
        if (jdField_a_of_type_MqqOsMqqHandler != null) {
          jdField_a_of_type_MqqOsMqqHandler.removeCallbacks(jdField_b_of_type_JavaLangRunnable);
        }
      }
    }
    jdField_a_of_type_MqqOsMqqHandler.removeCallbacks(jdField_b_of_type_JavaLangRunnable);
  }
  
  public boolean b()
  {
    return jdField_c_of_type_Boolean;
  }
  
  public boolean b(int paramInt, long paramLong)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "hasMultiVideo --> RelationType = " + paramInt + " ,RelationId = " + paramLong);
    }
    if (paramInt == 2) {
      if (jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.size() != 0) {}
    }
    do
    {
      do
      {
        do
        {
          return false;
        } while (!jdField_b_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Long.valueOf(paramLong)));
        return true;
        if (paramInt != 1) {
          break;
        }
      } while ((jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.size() == 0) || (!jdField_c_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(Long.valueOf(paramLong))));
      return true;
    } while (!QLog.isColorLevel());
    QLog.e("AVNotifyCenter", 2, "hasMultiVideo --> RelationType is Wrong");
    return false;
  }
  
  public boolean b(String paramString)
  {
    boolean bool2 = false;
    ffm localFfm = a(paramString, false);
    boolean bool1;
    if (localFfm != null) {
      bool1 = jdField_e_of_type_Boolean;
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.e("AVNotifyCenter", 2, "isDoubleVideoMeeting --> isDoubleVideoMeeting = " + bool1);
      }
      return bool1;
      bool1 = bool2;
      if (QLog.isColorLevel())
      {
        QLog.e("AVNotifyCenter", 2, "isDoubleVideoMeeting --> can not get data from uin --> peerUin = " + paramString);
        bool1 = bool2;
      }
    }
  }
  
  public int c()
  {
    return jdField_b_of_type_Int;
  }
  
  public String c()
  {
    return jdField_f_of_type_JavaLangString;
  }
  
  public void c(String paramString)
  {
    try
    {
      setChanged();
      notifyObservers(new Object[] { Integer.valueOf(800), paramString });
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public void c(boolean paramBoolean)
  {
    long l1 = SystemClock.elapsedRealtime();
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "setNetworkState: Begin");
    }
    if ((jdField_a_of_type_Boolean != paramBoolean) && (!paramBoolean) && (jdField_a_of_type_MqqOsMqqHandler != null))
    {
      jdField_a_of_type_MqqOsMqqHandler.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
      jdField_a_of_type_MqqOsMqqHandler.postDelayed(jdField_a_of_type_JavaLangRunnable, 5000L);
    }
    if ((paramBoolean) && (jdField_a_of_type_MqqOsMqqHandler != null)) {
      jdField_a_of_type_MqqOsMqqHandler.removeCallbacks(jdField_a_of_type_JavaLangRunnable);
    }
    jdField_a_of_type_Boolean = paramBoolean;
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "setNetworkState: End=" + (SystemClock.elapsedRealtime() - l1));
    }
  }
  
  public boolean c()
  {
    return (jdField_b_of_type_Ffm.jdField_a_of_type_Int != 0) && (jdField_b_of_type_Ffm.jdField_d_of_type_Boolean);
  }
  
  public boolean c(String paramString)
  {
    for (;;)
    {
      try
      {
        if (QLog.isColorLevel()) {
          QLog.d("AVNotifyCenter", 2, "removeChatSession sessionId : " + paramString);
        }
        if (!jdField_c_of_type_JavaUtilHashMap.containsKey(paramString))
        {
          if (QLog.isColorLevel()) {
            QLog.e("AVNotifyCenter", 2, "removeChatSession not exist sessionId : " + paramString);
          }
          bool = false;
          return bool;
        }
        jdField_c_of_type_JavaUtilHashMap.remove(paramString);
        if (jdField_c_of_type_JavaUtilHashMap.size() == 1)
        {
          Object localObject = jdField_c_of_type_JavaUtilHashMap.keySet();
          paramString = null;
          localObject = ((Set)localObject).iterator();
          if (((Iterator)localObject).hasNext())
          {
            paramString = (String)((Iterator)localObject).next();
            paramString = (ffm)jdField_c_of_type_JavaUtilHashMap.get(paramString);
            continue;
          }
          jdField_b_of_type_Ffm = paramString;
        }
        else if (jdField_c_of_type_JavaUtilHashMap.isEmpty())
        {
          jdField_b_of_type_Ffm = jdField_a_of_type_Ffm;
          jdField_b_of_type_Long = 0L;
          if ((jdField_b_of_type_JavaLangRunnable != null) && (jdField_a_of_type_MqqOsMqqHandler != null)) {
            jdField_a_of_type_MqqOsMqqHandler.removeCallbacks(jdField_b_of_type_JavaLangRunnable);
          }
        }
      }
      finally {}
      boolean bool = true;
    }
  }
  
  public int d()
  {
    return jdField_c_of_type_Int;
  }
  
  public String d()
  {
    return jdField_g_of_type_JavaLangString;
  }
  
  public void d(boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AVNotifyCenter", 2, "setNotifyUpdateTime-->bNotify" + paramBoolean);
    }
    jdField_g_of_type_Boolean = paramBoolean;
  }
  
  public boolean d()
  {
    return jdField_b_of_type_Ffm.jdField_c_of_type_Boolean;
  }
  
  public boolean d(String paramString)
  {
    synchronized (jdField_d_of_type_JavaUtilHashMap)
    {
      return jdField_d_of_type_JavaUtilHashMap.containsKey(paramString);
    }
  }
  
  public int e()
  {
    return jdField_e_of_type_Int;
  }
  
  public String e()
  {
    return jdField_b_of_type_Ffm.jdField_a_of_type_JavaLangString;
  }
  
  public boolean e()
  {
    return jdField_b_of_type_Ffm.jdField_b_of_type_Boolean;
  }
  
  public int f()
  {
    return jdField_d_of_type_Int;
  }
  
  public String f()
  {
    return jdField_b_of_type_Ffm.jdField_b_of_type_JavaLangString;
  }
  
  public boolean f()
  {
    return jdField_h_of_type_Boolean;
  }
  
  public int g()
  {
    return jdField_b_of_type_Ffm.jdField_a_of_type_Int;
  }
  
  public String g()
  {
    return UITools.a(jdField_b_of_type_Long);
  }
  
  public boolean g()
  {
    return jdField_b_of_type_Boolean;
  }
  
  public int h()
  {
    int i2 = jdField_b_of_type_Ffm.jdField_b_of_type_Int;
    int i1 = i2;
    if (i2 == 21) {
      i1 = 1011;
    }
    return i1;
  }
  
  public boolean h()
  {
    if ((!VcSystemInfo.e()) || (!VcSystemInfo.f()))
    {
      if (QLog.isColorLevel()) {
        QLog.d("AVNotifyCenter", 2, "device not surpport Sharp audio");
      }
      return false;
    }
    return true;
  }
  
  public int i()
  {
    return s;
  }
}
