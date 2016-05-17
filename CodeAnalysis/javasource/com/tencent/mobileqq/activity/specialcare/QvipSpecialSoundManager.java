package com.tencent.mobileqq.activity.specialcare;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import com.tencent.common.app.AppInterface;
import com.tencent.commonsdk.pool.ByteArrayPool;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.vip.DownloadTask;
import com.tencent.mobileqq.vip.DownloaderFactory;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import mqi;
import mqj;
import mqk;
import mql;
import org.json.JSONException;
import org.json.JSONObject;

public class QvipSpecialSoundManager
{
  public static final int a = 1000277;
  public static final String a = "http://i.gtimg.cn/club/moblie/special_sound/new_config.json";
  public static HashMap a;
  public static final String b = "specialcare_config";
  public static HashMap b = new HashMap();
  public static final String c = "key_special_sound_list";
  private static final String d = "QvipSpecialSoundManager";
  private Context jdField_a_of_type_AndroidContentContext;
  private Handler jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
  private AppInterface jdField_a_of_type_ComTencentCommonAppAppInterface;
  private ByteArrayPool jdField_a_of_type_ComTencentCommonsdkPoolByteArrayPool = new ByteArrayPool(4096);
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
  }
  
  public QvipSpecialSoundManager(Context paramContext, AppInterface paramAppInterface)
  {
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentCommonAppAppInterface = paramAppInterface;
  }
  
  private String a()
  {
    Object localObject = new File(jdField_a_of_type_AndroidContentContext.getFilesDir(), "http://i.gtimg.cn/club/moblie/special_sound/new_config.json");
    if (!((File)localObject).exists()) {}
    for (;;)
    {
      try
      {
        DownloadTask localDownloadTask = new DownloadTask(jdField_a_of_type_ComTencentCommonAppAppInterface.a().getSharedPreferences("com.tencent.mobileqq_preferences", 4).getString("specialcare_config", ""), (File)localObject);
        a = 1;
        k = true;
        i = DownloaderFactory.a(localDownloadTask, jdField_a_of_type_ComTencentCommonAppAppInterface);
        if (i != 0) {
          break label197;
        }
        if (localObject != null)
        {
          l = ((File)localObject).length();
          a(l);
          i = 1;
          if (i != 0) {
            break label138;
          }
          b("downLoad Special Sound Config failed.");
          return "";
        }
      }
      catch (Exception localException2)
      {
        localException2.printStackTrace();
        i = -1;
        continue;
        long l = 0L;
        continue;
      }
      int i = 1;
      continue;
      try
      {
        label138:
        localObject = a((File)localObject);
        return localObject;
      }
      catch (IOException localIOException)
      {
        b("decodeTextFile is IOException.");
        localIOException.printStackTrace();
        return "";
      }
      catch (OutOfMemoryError localOutOfMemoryError)
      {
        for (;;)
        {
          b("decodeTextFile is OutOfMemoryError.");
          localOutOfMemoryError.printStackTrace();
        }
      }
      catch (Exception localException1)
      {
        for (;;)
        {
          b("decodeTextFile is exception.");
          localException1.printStackTrace();
        }
      }
      label197:
      i = 0;
    }
  }
  
  /* Error */
  private String a(File paramFile)
  {
    // Byte code:
    //   0: new 162	java/io/FileInputStream
    //   3: dup
    //   4: aload_1
    //   5: invokespecial 165	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   8: astore_1
    //   9: new 167	java/io/ByteArrayOutputStream
    //   12: dup
    //   13: invokespecial 168	java/io/ByteArrayOutputStream:<init>	()V
    //   16: astore_3
    //   17: aload_0
    //   18: getfield 51	com/tencent/mobileqq/activity/specialcare/QvipSpecialSoundManager:jdField_a_of_type_ComTencentCommonsdkPoolByteArrayPool	Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   21: sipush 4096
    //   24: invokevirtual 172	com/tencent/commonsdk/pool/ByteArrayPool:getBuf	(I)[B
    //   27: astore 4
    //   29: aload_1
    //   30: aload 4
    //   32: iconst_0
    //   33: sipush 4096
    //   36: invokevirtual 178	java/io/InputStream:read	([BII)I
    //   39: istore_2
    //   40: iload_2
    //   41: iconst_m1
    //   42: if_icmpeq +57 -> 99
    //   45: aload_3
    //   46: aload 4
    //   48: iconst_0
    //   49: iload_2
    //   50: invokevirtual 182	java/io/ByteArrayOutputStream:write	([BII)V
    //   53: goto -24 -> 29
    //   56: astore 5
    //   58: aload 5
    //   60: invokevirtual 150	java/io/IOException:printStackTrace	()V
    //   63: aload_1
    //   64: ifnull +7 -> 71
    //   67: aload_1
    //   68: invokevirtual 185	java/io/InputStream:close	()V
    //   71: aload_3
    //   72: ifnull +7 -> 79
    //   75: aload_3
    //   76: invokevirtual 186	java/io/ByteArrayOutputStream:close	()V
    //   79: aload_0
    //   80: getfield 51	com/tencent/mobileqq/activity/specialcare/QvipSpecialSoundManager:jdField_a_of_type_ComTencentCommonsdkPoolByteArrayPool	Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   83: aload 4
    //   85: invokevirtual 190	com/tencent/commonsdk/pool/ByteArrayPool:returnBuf	([B)V
    //   88: ldc 109
    //   90: areturn
    //   91: astore_1
    //   92: aload_1
    //   93: invokevirtual 191	java/io/FileNotFoundException:printStackTrace	()V
    //   96: ldc 109
    //   98: areturn
    //   99: new 193	java/lang/String
    //   102: dup
    //   103: aload_3
    //   104: invokevirtual 197	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   107: ldc -57
    //   109: invokespecial 202	java/lang/String:<init>	([BLjava/lang/String;)V
    //   112: astore 5
    //   114: aload_1
    //   115: ifnull +7 -> 122
    //   118: aload_1
    //   119: invokevirtual 185	java/io/InputStream:close	()V
    //   122: aload_3
    //   123: ifnull +7 -> 130
    //   126: aload_3
    //   127: invokevirtual 186	java/io/ByteArrayOutputStream:close	()V
    //   130: aload_0
    //   131: getfield 51	com/tencent/mobileqq/activity/specialcare/QvipSpecialSoundManager:jdField_a_of_type_ComTencentCommonsdkPoolByteArrayPool	Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   134: aload 4
    //   136: invokevirtual 190	com/tencent/commonsdk/pool/ByteArrayPool:returnBuf	([B)V
    //   139: aload 5
    //   141: areturn
    //   142: astore 5
    //   144: aload 5
    //   146: invokevirtual 144	java/lang/Exception:printStackTrace	()V
    //   149: aload_1
    //   150: ifnull +7 -> 157
    //   153: aload_1
    //   154: invokevirtual 185	java/io/InputStream:close	()V
    //   157: aload_3
    //   158: ifnull +7 -> 165
    //   161: aload_3
    //   162: invokevirtual 186	java/io/ByteArrayOutputStream:close	()V
    //   165: aload_0
    //   166: getfield 51	com/tencent/mobileqq/activity/specialcare/QvipSpecialSoundManager:jdField_a_of_type_ComTencentCommonsdkPoolByteArrayPool	Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   169: aload 4
    //   171: invokevirtual 190	com/tencent/commonsdk/pool/ByteArrayPool:returnBuf	([B)V
    //   174: goto -86 -> 88
    //   177: astore 5
    //   179: aload_1
    //   180: ifnull +7 -> 187
    //   183: aload_1
    //   184: invokevirtual 185	java/io/InputStream:close	()V
    //   187: aload_3
    //   188: ifnull +7 -> 195
    //   191: aload_3
    //   192: invokevirtual 186	java/io/ByteArrayOutputStream:close	()V
    //   195: aload_0
    //   196: getfield 51	com/tencent/mobileqq/activity/specialcare/QvipSpecialSoundManager:jdField_a_of_type_ComTencentCommonsdkPoolByteArrayPool	Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   199: aload 4
    //   201: invokevirtual 190	com/tencent/commonsdk/pool/ByteArrayPool:returnBuf	([B)V
    //   204: aload 5
    //   206: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	207	0	this	QvipSpecialSoundManager
    //   0	207	1	paramFile	File
    //   39	11	2	i	int
    //   16	176	3	localByteArrayOutputStream	java.io.ByteArrayOutputStream
    //   27	173	4	arrayOfByte	byte[]
    //   56	3	5	localIOException	IOException
    //   112	28	5	str	String
    //   142	3	5	localException	Exception
    //   177	28	5	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   29	40	56	java/io/IOException
    //   45	53	56	java/io/IOException
    //   99	114	56	java/io/IOException
    //   0	9	91	java/io/FileNotFoundException
    //   29	40	142	java/lang/Exception
    //   45	53	142	java/lang/Exception
    //   99	114	142	java/lang/Exception
    //   29	40	177	finally
    //   45	53	177	finally
    //   58	63	177	finally
    //   99	114	177	finally
    //   144	149	177	finally
  }
  
  private void a(QvipSpecialSoundManager.CallBack paramCallBack, boolean paramBoolean)
  {
    jdField_a_of_type_AndroidOsHandler.post(new mql(this, paramCallBack, paramBoolean));
  }
  
  private void a(String paramString1, String paramString2)
  {
    if (paramString1 != null)
    {
      Object localObject;
      try
      {
        if ((TextUtils.isEmpty(paramString1)) || (paramString2 == null)) {
          return;
        }
        if (TextUtils.isEmpty(paramString2)) {
          return;
        }
        paramString2 = QvipSpecialSoundConfig.a(new JSONObject(paramString2));
        localObject = QvipSpecialSoundConfig.a(new JSONObject(paramString1));
        paramString1 = a;
        paramString2 = a;
        if ((paramString1 == null) || (paramString2 == null) || (paramString1.isEmpty()) || (paramString2.isEmpty()) || (paramString1.size() < paramString2.size()))
        {
          b("updateSpecialSound return.");
          return;
        }
      }
      catch (Exception paramString1)
      {
        b("updateSpecialSound exception");
        paramString1.printStackTrace();
        return;
      }
      int j = paramString2.size();
      int i = 0;
      while (i < j)
      {
        localObject = (mqi)paramString1.get(i);
        mqi localMqi = (mqi)paramString2.get(i);
        if ((jdField_a_of_type_Int == jdField_a_of_type_Int) && (!jdField_b_of_type_JavaLangString.equals(jdField_b_of_type_JavaLangString))) {
          ThreadManager.a(new mqj(this, (mqi)localObject), 5, null, true);
        }
        i += 1;
      }
    }
  }
  
  private void a(List paramList)
  {
    if ((paramList == null) || (paramList.isEmpty())) {
      b("SpecialSoundList is empty, donot need sort.");
    }
    do
    {
      return;
      ArrayList localArrayList1 = new ArrayList();
      ArrayList localArrayList2 = new ArrayList();
      ArrayList localArrayList3 = new ArrayList();
      int j = paramList.size();
      SharedPreferences.Editor localEditor = jdField_a_of_type_ComTencentCommonAppAppInterface.a().getSharedPreferences("com.tencent.mobileqq_preferences", 4).edit();
      int i = 0;
      if (i < j)
      {
        mqi localMqi = (mqi)paramList.get(i);
        if (!b.containsKey(String.valueOf(jdField_a_of_type_Int))) {
          b.put(String.valueOf(jdField_a_of_type_Int), localMqi);
        }
        localEditor.putString("special_sound_url" + jdField_a_of_type_Int, jdField_c_of_type_JavaLangString);
        if (!b(d)) {
          b("is white list.");
        }
        for (;;)
        {
          i += 1;
          break;
          if (jdField_c_of_type_Int == 1) {
            if (jdField_b_of_type_Int == 1) {
              localArrayList1.add(localMqi);
            } else if (jdField_b_of_type_Int == 2) {
              localArrayList2.add(localMqi);
            } else {
              localArrayList3.add(localMqi);
            }
          }
        }
      }
      localEditor.commit();
      paramList.clear();
      paramList.addAll(localArrayList1);
      paramList.addAll(localArrayList2);
      paramList.addAll(localArrayList3);
    } while (jdField_a_of_type_JavaUtilHashMap.containsKey("key_special_sound_list" + jdField_a_of_type_ComTencentCommonAppAppInterface.a()));
    jdField_a_of_type_JavaUtilHashMap.put("key_special_sound_list" + jdField_a_of_type_ComTencentCommonAppAppInterface.a(), paramList);
  }
  
  private boolean b(String paramString)
  {
    str = jdField_a_of_type_ComTencentCommonAppAppInterface.a();
    if ((paramString == null) || (TextUtils.isEmpty(paramString))) {}
    for (;;)
    {
      return true;
      if (paramString.contains("|")) {
        try
        {
          String[] arrayOfString = paramString.split("\\|");
          int j = arrayOfString.length;
          int i = 0;
          for (;;)
          {
            if (i >= j) {
              break label85;
            }
            boolean bool = arrayOfString[i].trim().equals(str);
            if (bool) {
              break;
            }
            i += 1;
          }
          return paramString.equals(str);
        }
        catch (Exception localException)
        {
          localException.printStackTrace();
        }
      }
    }
  }
  
  private void c()
  {
    Object localObject = jdField_a_of_type_ComTencentCommonAppAppInterface.a().getSharedPreferences("com.tencent.mobileqq_preferences", 4);
    if (((SharedPreferences)localObject).contains("defaulut_special_sound_source1")) {
      return;
    }
    localObject = ((SharedPreferences)localObject).edit();
    ((SharedPreferences.Editor)localObject).putInt("defaulut_special_sound_source1", 2131165205);
    ((SharedPreferences.Editor)localObject).commit();
  }
  
  public int a(String paramString)
  {
    Object localObject = "key_special_sound_list" + jdField_a_of_type_ComTencentCommonAppAppInterface.a();
    localObject = (List)jdField_a_of_type_JavaUtilHashMap.get(localObject);
    if (localObject == null) {
      return -1;
    }
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext())
    {
      mqi localMqi = (mqi)((Iterator)localObject).next();
      if (paramString.equals(jdField_c_of_type_JavaLangString)) {
        return jdField_a_of_type_Int;
      }
    }
    return -1;
  }
  
  public String a(int paramInt)
  {
    if ((b != null) && (!b.isEmpty()))
    {
      mqi localMqi = (mqi)b.get(String.valueOf(paramInt));
      if (localMqi != null) {
        return jdField_a_of_type_JavaLangString;
      }
    }
    return "";
  }
  
  public String a(String paramString)
  {
    Object localObject = "key_special_sound_list" + jdField_a_of_type_ComTencentCommonAppAppInterface.a();
    localObject = (List)jdField_a_of_type_JavaUtilHashMap.get(localObject);
    if (localObject == null) {
      return null;
    }
    localObject = ((List)localObject).iterator();
    while (((Iterator)localObject).hasNext())
    {
      mqi localMqi = (mqi)((Iterator)localObject).next();
      if (paramString.equals(jdField_c_of_type_JavaLangString)) {
        return jdField_a_of_type_JavaLangString;
      }
    }
    return null;
  }
  
  public void a()
  {
    Object localObject4 = null;
    Object localObject1 = jdField_a_of_type_ComTencentCommonAppAppInterface.a().getSharedPreferences("com.tencent.mobileqq_preferences", 4);
    File localFile = new File(jdField_a_of_type_AndroidContentContext.getFilesDir(), "http://i.gtimg.cn/club/moblie/special_sound/new_config.json");
    try
    {
      if (localFile.exists()) {
        String str = a(localFile);
      }
    }
    catch (Exception localException1)
    {
      try
      {
        for (;;)
        {
          localObject1 = new DownloadTask(((SharedPreferences)localObject1).getString("specialcare_config", ""), localFile);
          a = 1;
          k = true;
          i = DownloaderFactory.a((DownloadTask)localObject1, jdField_a_of_type_ComTencentCommonAppAppInterface);
          localObject1 = localObject4;
          if (i == 0) {}
          try
          {
            localObject1 = a(localFile);
            if (localFile == null) {
              break;
            }
            l = localFile.length();
            a(l);
          }
          catch (Exception localException3)
          {
            for (;;)
            {
              long l;
              b("decodeTextFile is exception.");
              localException3.printStackTrace();
              Object localObject2 = localObject4;
            }
          }
          catch (OutOfMemoryError localOutOfMemoryError)
          {
            CharSequence localCharSequence;
            Object localObject3;
            for (;;)
            {
              b("decodeTextFile is OutOfMemoryError.");
              localOutOfMemoryError.printStackTrace();
              localObject3 = localObject4;
            }
            if ((TextUtils.isEmpty(localCharSequence)) || (!localCharSequence.equals(localObject3))) {
              break label296;
            }
            b("Config is Same");
            return;
            a(localCharSequence, localObject3);
          }
          if (!TextUtils.isEmpty((CharSequence)localObject1)) {
            break label270;
          }
          b("new Config is Empty");
          return;
          localException1 = localException1;
          b("download error:" + localException1.toString());
          localException1.printStackTrace();
          localCharSequence = null;
        }
      }
      catch (Exception localException2)
      {
        for (;;)
        {
          b("download error:" + localException2.toString());
          localException2.printStackTrace();
          int i = -1;
          continue;
          l = 0L;
        }
      }
    }
    label270:
    label296:
    return;
  }
  
  public void a(long paramLong)
  {
    if (paramLong <= 0L)
    {
      b("reportFlowData is Empty flowSize = " + paramLong);
      return;
    }
    String[] arrayOfString;
    if (NetworkUtil.b(BaseApplication.getContext()) == 1)
    {
      b("reportFlowData int wifi state");
      arrayOfString = new String[3];
      arrayOfString[0] = "param_WIFISpecialCareDownloadFlow";
      arrayOfString[1] = "param_WIFIFlow";
      arrayOfString[2] = "param_Flow";
    }
    for (;;)
    {
      b("sendAppDataIncerment flowSize = " + paramLong);
      jdField_a_of_type_ComTencentCommonAppAppInterface.a(jdField_a_of_type_ComTencentCommonAppAppInterface.getAccount(), arrayOfString, paramLong);
      return;
      b("reportFlowData int 2G/3G state");
      arrayOfString = new String[3];
      arrayOfString[0] = "param_XGSpecialCareDownloadFlow";
      arrayOfString[1] = "param_XGFlow";
      arrayOfString[2] = "param_Flow";
    }
  }
  
  public void a(QvipSpecialSoundManager.CallBack paramCallBack)
  {
    ThreadManager.a(new mqk(this, paramCallBack), 5, null, true);
  }
  
  public void a(String paramString)
  {
    if ((paramString == null) || (TextUtils.isEmpty(paramString))) {}
    for (;;)
    {
      return;
      try
      {
        paramString = QvipSpecialSoundConfig.a(new JSONObject(paramString));
        if (paramString != null)
        {
          a(a);
          return;
        }
      }
      catch (JSONException paramString)
      {
        paramString.printStackTrace();
      }
    }
  }
  
  public boolean a()
  {
    String str = "key_special_sound_list" + jdField_a_of_type_ComTencentCommonAppAppInterface.a();
    return jdField_a_of_type_JavaUtilHashMap.containsKey(str);
  }
  
  public boolean a(String paramString)
  {
    boolean bool = true;
    if ((paramString == null) || (TextUtils.isEmpty(paramString))) {
      bool = false;
    }
    for (;;)
    {
      return bool;
      File localFile = new File(jdField_a_of_type_AndroidContentContext.getFilesDir(), paramString);
      try
      {
        paramString = new DownloadTask(MsfSdkUtils.insertMtype("lingyin", paramString), localFile);
        a = 1;
        i = DownloaderFactory.a(paramString, jdField_a_of_type_ComTencentCommonAppAppInterface);
        if (i == 0) {
          continue;
        }
        return false;
      }
      catch (Exception paramString)
      {
        for (;;)
        {
          paramString.printStackTrace();
          int i = -1;
        }
      }
    }
  }
  
  public void b()
  {
    c();
    a(a());
  }
  
  public void b(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.i("QvipSpecialSoundManager", 2, paramString);
    }
  }
}
