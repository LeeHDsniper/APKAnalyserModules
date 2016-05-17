package com.tencent.mobileqq.activity.aio;

import android.app.Application;
import android.bluetooth.BluetoothAdapter;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.media.AudioManager;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.SystemClock;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.ptt.player.IPttPlayer;
import com.tencent.mobileqq.ptt.player.IPttPlayerListener;
import com.tencent.mobileqq.utils.AudioHelper;
import com.tencent.mobileqq.utils.AudioHelper.AudioPlayerParameter;
import com.tencent.mobileqq.utils.AudioUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.Arrays;
import java.util.List;
import kpm;
import kpn;
import kpo;

public class AudioPlayer
  implements IPttPlayerListener, Runnable
{
  private static final float jdField_a_of_type_Float = 0.1F;
  public static final int a = -1;
  private static final long jdField_a_of_type_Long = 200L;
  public static final String a;
  private static final List jdField_a_of_type_JavaUtilList = Arrays.asList(new Integer[] { Integer.valueOf(1796) });
  public static boolean a = false;
  public static final int b = -2;
  public static final int c = 0;
  public static final int d = 1;
  private static boolean jdField_e_of_type_Boolean = false;
  private static int f = 0;
  private static final int g = 1000;
  private Application jdField_a_of_type_AndroidAppApplication;
  private BroadcastReceiver jdField_a_of_type_AndroidContentBroadcastReceiver;
  private AudioManager jdField_a_of_type_AndroidMediaAudioManager;
  private Handler jdField_a_of_type_AndroidOsHandler = new kpm(this);
  private AudioPlayer.AudioPlayerListener jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer$AudioPlayerListener;
  private IPttPlayer jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer;
  private volatile AudioHelper.AudioPlayerParameter jdField_a_of_type_ComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter;
  AudioHelper.AudioPlayerParameter[] jdField_a_of_type_ArrayOfComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter;
  private String jdField_b_of_type_JavaLangString;
  private boolean jdField_b_of_type_Boolean = false;
  private boolean c = false;
  private boolean d = true;
  private volatile int jdField_e_of_type_Int;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = AudioPlayer.class.getSimpleName();
    jdField_a_of_type_Boolean = true;
    f = -1;
  }
  
  public AudioPlayer(Context paramContext, AudioPlayer.AudioPlayerListener paramAudioPlayerListener)
  {
    jdField_a_of_type_AndroidAppApplication = ((Application)paramContext.getApplicationContext());
    jdField_a_of_type_AndroidMediaAudioManager = ((AudioManager)jdField_a_of_type_AndroidAppApplication.getSystemService("audio"));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer$AudioPlayerListener = paramAudioPlayerListener;
  }
  
  private AudioHelper.AudioPlayerParameter a()
  {
    if (jdField_a_of_type_ArrayOfComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter == null) {
      jdField_a_of_type_ArrayOfComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter = AudioHelper.a();
    }
    if ((jdField_a_of_type_AndroidMediaAudioManager.isBluetoothScoOn()) && (jdField_a_of_type_Boolean)) {
      return jdField_a_of_type_ArrayOfComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter[4];
    }
    if (jdField_b_of_type_Boolean) {
      return jdField_a_of_type_ArrayOfComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter[2];
    }
    if (c) {
      return jdField_a_of_type_ArrayOfComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter[3];
    }
    AudioHelper.AudioPlayerParameter[] arrayOfAudioPlayerParameter = jdField_a_of_type_ArrayOfComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter;
    if (d) {}
    for (int i = 0;; i = 1) {
      return arrayOfAudioPlayerParameter[i];
    }
  }
  
  private void a(int paramInt)
  {
    if (jdField_b_of_type_JavaLangString != null) {
      a(jdField_b_of_type_JavaLangString, paramInt);
    }
  }
  
  private void a(AudioManager paramAudioManager)
  {
    paramAudioManager.setBluetoothScoOn(true);
  }
  
  public static boolean a(AudioManager paramAudioManager)
  {
    if (!jdField_a_of_type_Boolean) {}
    BluetoothAdapter localBluetoothAdapter;
    do
    {
      do
      {
        return false;
      } while (Build.VERSION.SDK_INT < 14);
      localBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
    } while ((localBluetoothAdapter == null) || (!localBluetoothAdapter.isEnabled()) || (localBluetoothAdapter.getProfileConnectionState(1) != 2) || (localBluetoothAdapter.getProfileConnectionState(2) == 2) || (jdField_a_of_type_JavaUtilList.contains(Integer.valueOf(f))) || (jdField_e_of_type_Boolean) || (paramAudioManager.isBluetoothScoOn()) || (!paramAudioManager.isBluetoothScoAvailableOffCall()));
    return true;
  }
  
  /* Error */
  private boolean a(String paramString, int paramInt)
  {
    // Byte code:
    //   0: iconst_1
    //   1: istore 6
    //   3: iconst_m1
    //   4: istore_3
    //   5: aload_0
    //   6: monitorenter
    //   7: aload_0
    //   8: aload_1
    //   9: putfield 141	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   12: aload_0
    //   13: invokestatic 192	com/tencent/mobileqq/app/ThreadManager:a	(Ljava/lang/Runnable;)Z
    //   16: pop
    //   17: getstatic 56	com/tencent/mobileqq/activity/aio/AudioPlayer:f	I
    //   20: iconst_m1
    //   21: if_icmpne +14 -> 35
    //   24: aload_0
    //   25: aload_1
    //   26: iload_2
    //   27: invokevirtual 195	com/tencent/mobileqq/activity/aio/AudioPlayer:a	(Ljava/lang/String;I)V
    //   30: aload_0
    //   31: monitorexit
    //   32: iload 6
    //   34: ireturn
    //   35: aload_0
    //   36: getfield 110	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_AndroidMediaAudioManager	Landroid/media/AudioManager;
    //   39: invokestatic 197	com/tencent/mobileqq/activity/aio/AudioPlayer:a	(Landroid/media/AudioManager;)Z
    //   42: ifeq +17 -> 59
    //   45: aload_0
    //   46: aload_1
    //   47: iload_2
    //   48: invokespecial 199	com/tencent/mobileqq/activity/aio/AudioPlayer:b	(Ljava/lang/String;I)V
    //   51: goto -21 -> 30
    //   54: astore_1
    //   55: aload_0
    //   56: monitorexit
    //   57: aload_1
    //   58: athrow
    //   59: aload_1
    //   60: invokestatic 204	com/tencent/mobileqq/utils/FileUtils:b	(Ljava/lang/String;)Z
    //   63: ifne +63 -> 126
    //   66: invokestatic 209	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   69: ifeq +29 -> 98
    //   72: getstatic 52	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   75: iconst_2
    //   76: new 211	java/lang/StringBuilder
    //   79: dup
    //   80: invokespecial 212	java/lang/StringBuilder:<init>	()V
    //   83: ldc -42
    //   85: invokevirtual 218	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   88: aload_1
    //   89: invokevirtual 218	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   92: invokevirtual 221	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   95: invokestatic 224	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   98: aload_0
    //   99: invokevirtual 226	com/tencent/mobileqq/activity/aio/AudioPlayer:c	()V
    //   102: aload_0
    //   103: getfield 112	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer$AudioPlayerListener	Lcom/tencent/mobileqq/activity/aio/AudioPlayer$AudioPlayerListener;
    //   106: ifnull +14 -> 120
    //   109: aload_0
    //   110: getfield 112	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer$AudioPlayerListener	Lcom/tencent/mobileqq/activity/aio/AudioPlayer$AudioPlayerListener;
    //   113: aload_0
    //   114: iconst_m1
    //   115: invokeinterface 230 3 0
    //   120: iconst_0
    //   121: istore 6
    //   123: goto -93 -> 30
    //   126: aload_0
    //   127: invokespecial 232	com/tencent/mobileqq/activity/aio/AudioPlayer:e	()V
    //   130: new 234	java/io/FileInputStream
    //   133: dup
    //   134: aload_1
    //   135: invokespecial 237	java/io/FileInputStream:<init>	(Ljava/lang/String;)V
    //   138: astore 8
    //   140: aload 8
    //   142: astore 7
    //   144: aload 8
    //   146: invokestatic 242	com/tencent/mobileqq/utils/RecordParams:a	(Ljava/io/InputStream;)B
    //   149: istore 4
    //   151: aload 8
    //   153: astore 7
    //   155: iload 4
    //   157: istore_3
    //   158: invokestatic 209	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   161: ifeq +46 -> 207
    //   164: aload 8
    //   166: astore 7
    //   168: iload 4
    //   170: istore_3
    //   171: getstatic 52	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   174: iconst_2
    //   175: new 211	java/lang/StringBuilder
    //   178: dup
    //   179: invokespecial 212	java/lang/StringBuilder:<init>	()V
    //   182: ldc -12
    //   184: invokevirtual 218	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   187: aload_1
    //   188: invokevirtual 218	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   191: ldc -10
    //   193: invokevirtual 218	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   196: iload 4
    //   198: invokevirtual 249	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   201: invokevirtual 221	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   204: invokestatic 224	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   207: iload 4
    //   209: istore 5
    //   211: aload 8
    //   213: ifnull +12 -> 225
    //   216: aload 8
    //   218: invokevirtual 254	java/io/InputStream:close	()V
    //   221: iload 4
    //   223: istore 5
    //   225: iload 5
    //   227: iflt +195 -> 422
    //   230: aload_0
    //   231: new 256	com/tencent/mobileqq/ptt/player/SilkPlayer
    //   234: dup
    //   235: invokespecial 257	com/tencent/mobileqq/ptt/player/SilkPlayer:<init>	()V
    //   238: putfield 123	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer	Lcom/tencent/mobileqq/ptt/player/IPttPlayer;
    //   241: aload_0
    //   242: getfield 123	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer	Lcom/tencent/mobileqq/ptt/player/IPttPlayer;
    //   245: aload_1
    //   246: invokeinterface 261 2 0
    //   251: aload_0
    //   252: getfield 123	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer	Lcom/tencent/mobileqq/ptt/player/IPttPlayer;
    //   255: iload_2
    //   256: invokeinterface 263 2 0
    //   261: aload_0
    //   262: getfield 123	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer	Lcom/tencent/mobileqq/ptt/player/IPttPlayer;
    //   265: iconst_m1
    //   266: iload 5
    //   268: invokeinterface 266 3 0
    //   273: aload_0
    //   274: getfield 123	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer	Lcom/tencent/mobileqq/ptt/player/IPttPlayer;
    //   277: aload_0
    //   278: invokeinterface 269 2 0
    //   283: aload_0
    //   284: getfield 123	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer	Lcom/tencent/mobileqq/ptt/player/IPttPlayer;
    //   287: invokeinterface 271 1 0
    //   292: goto -262 -> 30
    //   295: astore_1
    //   296: invokestatic 209	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   299: ifeq +14 -> 313
    //   302: getstatic 52	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   305: iconst_2
    //   306: ldc_w 273
    //   309: aload_1
    //   310: invokestatic 276	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   313: aload_0
    //   314: aload_0
    //   315: getfield 123	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer	Lcom/tencent/mobileqq/ptt/player/IPttPlayer;
    //   318: iconst_0
    //   319: iconst_0
    //   320: invokevirtual 279	com/tencent/mobileqq/activity/aio/AudioPlayer:a	(Lcom/tencent/mobileqq/ptt/player/IPttPlayer;II)V
    //   323: iconst_0
    //   324: istore 6
    //   326: goto -296 -> 30
    //   329: astore 9
    //   331: aconst_null
    //   332: astore 8
    //   334: aload 8
    //   336: astore 7
    //   338: invokestatic 209	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   341: ifeq +38 -> 379
    //   344: aload 8
    //   346: astore 7
    //   348: getstatic 52	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   351: iconst_2
    //   352: new 211	java/lang/StringBuilder
    //   355: dup
    //   356: invokespecial 212	java/lang/StringBuilder:<init>	()V
    //   359: ldc_w 281
    //   362: invokevirtual 218	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   365: aload 9
    //   367: invokevirtual 284	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   370: invokevirtual 218	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   373: invokevirtual 221	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   376: invokestatic 224	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   379: iload_3
    //   380: istore 5
    //   382: aload 8
    //   384: ifnull -159 -> 225
    //   387: aload 8
    //   389: invokevirtual 254	java/io/InputStream:close	()V
    //   392: iload_3
    //   393: istore 5
    //   395: goto -170 -> 225
    //   398: astore 7
    //   400: iload_3
    //   401: istore 5
    //   403: goto -178 -> 225
    //   406: astore_1
    //   407: aconst_null
    //   408: astore 7
    //   410: aload 7
    //   412: ifnull +8 -> 420
    //   415: aload 7
    //   417: invokevirtual 254	java/io/InputStream:close	()V
    //   420: aload_1
    //   421: athrow
    //   422: aload_0
    //   423: new 286	com/tencent/mobileqq/ptt/player/AmrPlayer
    //   426: dup
    //   427: invokespecial 287	com/tencent/mobileqq/ptt/player/AmrPlayer:<init>	()V
    //   430: putfield 123	com/tencent/mobileqq/activity/aio/AudioPlayer:jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer	Lcom/tencent/mobileqq/ptt/player/IPttPlayer;
    //   433: goto -192 -> 241
    //   436: astore 7
    //   438: iload 4
    //   440: istore 5
    //   442: goto -217 -> 225
    //   445: astore 7
    //   447: goto -27 -> 420
    //   450: astore_1
    //   451: goto -41 -> 410
    //   454: astore 9
    //   456: goto -122 -> 334
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	459	0	this	AudioPlayer
    //   0	459	1	paramString	String
    //   0	459	2	paramInt	int
    //   4	397	3	b1	byte
    //   149	290	4	b2	byte
    //   209	232	5	b3	byte
    //   1	324	6	bool	boolean
    //   142	205	7	localFileInputStream1	java.io.FileInputStream
    //   398	1	7	localException1	Exception
    //   408	8	7	localObject	Object
    //   436	1	7	localException2	Exception
    //   445	1	7	localException3	Exception
    //   138	250	8	localFileInputStream2	java.io.FileInputStream
    //   329	37	9	localException4	Exception
    //   454	1	9	localException5	Exception
    // Exception table:
    //   from	to	target	type
    //   7	30	54	finally
    //   35	51	54	finally
    //   59	98	54	finally
    //   98	120	54	finally
    //   126	130	54	finally
    //   216	221	54	finally
    //   230	241	54	finally
    //   241	292	54	finally
    //   296	313	54	finally
    //   313	323	54	finally
    //   387	392	54	finally
    //   415	420	54	finally
    //   420	422	54	finally
    //   422	433	54	finally
    //   126	130	295	java/lang/Exception
    //   230	241	295	java/lang/Exception
    //   241	292	295	java/lang/Exception
    //   420	422	295	java/lang/Exception
    //   422	433	295	java/lang/Exception
    //   130	140	329	java/lang/Exception
    //   387	392	398	java/lang/Exception
    //   130	140	406	finally
    //   216	221	436	java/lang/Exception
    //   415	420	445	java/lang/Exception
    //   144	151	450	finally
    //   158	164	450	finally
    //   171	207	450	finally
    //   338	344	450	finally
    //   348	379	450	finally
    //   144	151	454	java/lang/Exception
    //   158	164	454	java/lang/Exception
    //   171	207	454	java/lang/Exception
  }
  
  private void b(String paramString, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "tryStartBlueToothSco " + paramString);
    }
    f();
    paramString = new kpo(this, paramString, paramInt);
    jdField_a_of_type_AndroidAppApplication.registerReceiver(paramString, new IntentFilter("android.media.ACTION_SCO_AUDIO_STATE_UPDATED"));
    jdField_a_of_type_AndroidContentBroadcastReceiver = paramString;
    jdField_a_of_type_AndroidMediaAudioManager.startBluetoothSco();
  }
  
  private void e()
  {
    if (jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer != null)
    {
      if (jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer.a()) {
        jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer.c();
      }
      jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer.d();
      jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer.e();
      jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer = null;
    }
  }
  
  private void f()
  {
    if (jdField_a_of_type_AndroidContentBroadcastReceiver != null) {
      if (QLog.isColorLevel()) {
        QLog.d(jdField_a_of_type_JavaLangString, 2, "unregister sco receiver:  " + SystemClock.uptimeMillis());
      }
    }
    try
    {
      jdField_a_of_type_AndroidAppApplication.unregisterReceiver(jdField_a_of_type_AndroidContentBroadcastReceiver);
      jdField_a_of_type_AndroidContentBroadcastReceiver = null;
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public int a()
  {
    return jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer.a();
  }
  
  public void a()
  {
    f();
    c();
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer$AudioPlayerListener != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer$AudioPlayerListener.a(this);
    }
  }
  
  public void a(IPttPlayer paramIPttPlayer, int paramInt1, int paramInt2)
  {
    f();
    c();
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer$AudioPlayerListener != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer$AudioPlayerListener.a(this, -2);
    }
  }
  
  public void a(String paramString, int paramInt)
  {
    if (Build.VERSION.SDK_INT < 14)
    {
      f = 0;
      a(paramString, paramInt);
      return;
    }
    BluetoothAdapter localBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
    if (localBluetoothAdapter == null)
    {
      f = 0;
      a(paramString, paramInt);
      return;
    }
    if (!localBluetoothAdapter.isEnabled())
    {
      f = 0;
      a(paramString, paramInt);
      return;
    }
    if (localBluetoothAdapter.getProfileConnectionState(1) != 2)
    {
      f = 0;
      a(paramString, paramInt);
      return;
    }
    if (localBluetoothAdapter.getProfileConnectionState(2) == 2)
    {
      f = 0;
      a(paramString, paramInt);
      return;
    }
    paramString = new kpn(this, paramString, paramInt, localBluetoothAdapter);
    localBluetoothAdapter.getProfileProxy(BaseApplication.getContext(), paramString, 1);
  }
  
  public void a(boolean paramBoolean)
  {
    jdField_b_of_type_Boolean = paramBoolean;
    if (a()) {
      a(jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer.a());
    }
  }
  
  public boolean a()
  {
    return (jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer != null) && (jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer.a());
  }
  
  public boolean a(String paramString)
  {
    return a(paramString, 0);
  }
  
  public boolean a(boolean paramBoolean)
  {
    return a(paramBoolean, false);
  }
  
  public boolean a(boolean paramBoolean1, boolean paramBoolean2)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (!jdField_b_of_type_Boolean)
    {
      bool1 = bool2;
      if (!c) {
        if (paramBoolean1 == d)
        {
          bool1 = bool2;
          if (!paramBoolean2) {}
        }
        else
        {
          d = paramBoolean1;
          if (a()) {
            a(0);
          }
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public void b()
  {
    jdField_a_of_type_ComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter = a();
    jdField_a_of_type_AndroidMediaAudioManager.setMode(jdField_a_of_type_ComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter.jdField_a_of_type_Int);
    jdField_a_of_type_AndroidMediaAudioManager.setSpeakerphoneOn(jdField_a_of_type_ComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter.jdField_a_of_type_Boolean);
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer$AudioPlayerListener != null) {
      jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer$AudioPlayerListener.b(this, jdField_a_of_type_ComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter.b);
    }
    AudioUtil.a(jdField_a_of_type_AndroidAppApplication, true);
    jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer.a(jdField_a_of_type_ComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter.b);
    jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer.g();
    int i = jdField_a_of_type_AndroidMediaAudioManager.getStreamVolume(jdField_a_of_type_ComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter.b);
    int j = jdField_a_of_type_AndroidMediaAudioManager.getStreamMaxVolume(jdField_a_of_type_ComTencentMobileqqUtilsAudioHelper$AudioPlayerParameter.b);
    if (i / j < 0.1F)
    {
      jdField_e_of_type_Int = 0;
      jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1000, 200L);
    }
    for (;;)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer$AudioPlayerListener != null) {
        jdField_a_of_type_ComTencentMobileqqActivityAioAudioPlayer$AudioPlayerListener.c(this, jdField_e_of_type_Int);
      }
      return;
      jdField_e_of_type_Int = 1;
      jdField_a_of_type_AndroidOsHandler.removeMessages(1000);
    }
  }
  
  public void b(boolean paramBoolean)
  {
    c = paramBoolean;
    if (a()) {
      a(jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer.a());
    }
  }
  
  public boolean b()
  {
    return jdField_a_of_type_AndroidMediaAudioManager.isSpeakerphoneOn();
  }
  
  public void c()
  {
    try
    {
      jdField_a_of_type_AndroidOsHandler.removeMessages(1000);
      if (jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer != null)
      {
        if (jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer.a()) {
          jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer.c();
        }
        jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer.e();
        jdField_b_of_type_JavaLangString = null;
        jdField_a_of_type_ComTencentMobileqqPttPlayerIPttPlayer = null;
        ThreadManager.a(this, 8, null, false);
      }
      return;
    }
    finally {}
  }
  
  public void c(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = 0;; i = -1)
    {
      f = i;
      jdField_e_of_type_Boolean = false;
      return;
    }
  }
  
  public boolean c()
  {
    if (jdField_a_of_type_JavaUtilList.contains(Integer.valueOf(f))) {
      return false;
    }
    return c;
  }
  
  public void d()
  {
    if (jdField_a_of_type_AndroidMediaAudioManager.isBluetoothScoOn())
    {
      jdField_a_of_type_AndroidMediaAudioManager.setBluetoothScoOn(false);
      jdField_a_of_type_AndroidMediaAudioManager.stopBluetoothSco();
    }
  }
  
  public void d(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = -1;; i = 0)
    {
      f = i;
      jdField_e_of_type_Boolean = false;
      return;
    }
  }
  
  public void run()
  {
    jdField_a_of_type_AndroidMediaAudioManager.setMode(0);
    jdField_a_of_type_AndroidMediaAudioManager.setSpeakerphoneOn(false);
    AudioUtil.a(jdField_a_of_type_AndroidAppApplication, false);
  }
}
