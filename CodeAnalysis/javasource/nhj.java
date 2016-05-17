import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.app.automator.step.CleanCache;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.util.SystemUtil;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;

public class nhj
  implements Runnable
{
  private int jdField_a_of_type_Int;
  
  public nhj(CleanCache paramCleanCache)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
  }
  
  private int a(File paramFile)
  {
    int m = 0;
    j = 0;
    int k = 0;
    i = k;
    if (paramFile.exists())
    {
      i = k;
      if (paramFile.isDirectory())
      {
        paramFile = paramFile.listFiles();
        if (paramFile != null) {
          break label42;
        }
        i = k;
      }
    }
    return i;
    label42:
    i = paramFile.length;
    k = i;
    int n;
    if (i > 2000)
    {
      Arrays.sort(paramFile, new nhm(this));
      n = paramFile.length;
      k = m;
      j = i;
    }
    for (;;)
    {
      i = j;
      if (k < n)
      {
        paramFile[k].delete();
        i = j - 1;
        if (i > 500) {}
      }
      else
      {
        j = i - 500;
        k = i;
        long l = System.currentTimeMillis();
        k = paramFile.length - k;
        for (;;)
        {
          i = j;
          if (k >= paramFile.length) {
            break;
          }
          Object localObject = paramFile[k];
          i = j;
          if (localObject.exists())
          {
            i = j;
            if (localObject.isFile())
            {
              i = j;
              if (l - localObject.lastModified() <= 2592000000L) {
                break;
              }
              localObject.delete();
              j += 1;
              i = j;
              if (k % 200 != 0) {}
            }
          }
          try
          {
            Thread.sleep(100L);
            i = j;
          }
          catch (InterruptedException localInterruptedException2)
          {
            for (;;)
            {
              i = j;
            }
          }
          k += 1;
          j = i;
        }
      }
      if (i % 200 == 0) {}
      try
      {
        Thread.sleep(100L);
        k += 1;
        j = i;
      }
      catch (InterruptedException localInterruptedException1)
      {
        for (;;) {}
      }
    }
  }
  
  private int a(File[] paramArrayOfFile, int paramInt)
  {
    int i = 0;
    for (;;)
    {
      int j = paramInt;
      if (i < paramArrayOfFile.length)
      {
        File localFile = paramArrayOfFile[i];
        if (localFile.exists()) {
          localFile.delete();
        }
        paramArrayOfFile[i] = null;
        paramInt += 1;
        if (QLog.isColorLevel()) {
          QLog.d("QQInitHandler", 2, "onCleanCache->delRemainQQHead. delete QQHead,filePath=" + localFile.getAbsolutePath());
        }
        if (paramInt >= jdField_a_of_type_Int) {
          j = paramInt;
        }
      }
      else
      {
        return j;
      }
      i += 1;
    }
  }
  
  private void a()
  {
    int j = 0;
    int i = 0;
    long l1 = System.currentTimeMillis();
    Object localObject1 = new File(AppConstants.bd + "shortvideo");
    int m;
    int k;
    if ((((File)localObject1).exists()) && (((File)localObject1).isDirectory()))
    {
      localObject1 = ((File)localObject1).listFiles();
      if (localObject1 != null)
      {
        int n = localObject1.length;
        m = n;
        if (n > 2000)
        {
          Arrays.sort((Object[])localObject1, new nhn(this));
          int i1 = localObject1.length;
          k = 0;
          j = i;
          m = n;
          if (k < i1)
          {
            Object localObject2 = localObject1[k];
            j = i;
            if (localObject2 == null) {
              break label323;
            }
            j = i;
            if (!localObject2.isDirectory()) {
              break label323;
            }
            j = i;
            if (localObject2.getName().equals("thumbs")) {
              break label323;
            }
            if (QLog.isColorLevel()) {
              QLog.d("QQInitHandler", 2, "delShortVideoCache ===> deleteCount=" + i + ", delete dir=" + localObject2.getAbsolutePath());
            }
            FileUtils.a(localObject2.getAbsolutePath());
            i += 1;
            if (i < n - 1000) {
              break label305;
            }
            m = n;
            j = i;
          }
        }
      }
    }
    for (;;)
    {
      long l2 = System.currentTimeMillis();
      if (QLog.isColorLevel()) {
        QLog.d("QQInitHandler", 2, "delShortVideoCache(), totalCount=" + m + ", deleteCount= " + j + ", targetDeleteCount=" + (m - 1000) + ", cost: " + (l2 - l1) + " ms");
      }
      return;
      label305:
      j = i;
      if (i % 200 == 0) {}
      try
      {
        Thread.sleep(100L);
        j = i;
      }
      catch (Exception localException)
      {
        for (;;)
        {
          label323:
          j = i;
        }
      }
      k += 1;
      i = j;
      break;
      m = 0;
    }
  }
  
  /* Error */
  private File[] a(File[] paramArrayOfFile)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 8
    //   3: aconst_null
    //   4: astore 9
    //   6: aconst_null
    //   7: astore 10
    //   9: iconst_0
    //   10: istore 5
    //   12: aload_0
    //   13: getfield 13	nhj:jdField_a_of_type_ComTencentMobileqqAppAutomatorStepCleanCache	Lcom/tencent/mobileqq/app/automator/step/CleanCache;
    //   16: invokestatic 163	com/tencent/mobileqq/app/automator/step/CleanCache:c	(Lcom/tencent/mobileqq/app/automator/step/CleanCache;)Lcom/tencent/mobileqq/app/automator/Automator;
    //   19: getfield 169	com/tencent/mobileqq/app/automator/Automator:b	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   22: invokevirtual 174	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/persistence/EntityManagerFactory;
    //   25: invokevirtual 180	com/tencent/mobileqq/persistence/EntityManagerFactory:createEntityManager	()Lcom/tencent/mobileqq/persistence/EntityManager;
    //   28: astore 7
    //   30: aload 7
    //   32: iconst_0
    //   33: ldc -74
    //   35: invokevirtual 187	java/lang/Class:getSimpleName	()Ljava/lang/String;
    //   38: iconst_2
    //   39: anewarray 128	java/lang/String
    //   42: dup
    //   43: iconst_0
    //   44: ldc -67
    //   46: aastore
    //   47: dup
    //   48: iconst_1
    //   49: ldc -65
    //   51: aastore
    //   52: ldc -63
    //   54: iconst_1
    //   55: anewarray 128	java/lang/String
    //   58: dup
    //   59: iconst_0
    //   60: ldc -61
    //   62: aastore
    //   63: aconst_null
    //   64: aconst_null
    //   65: aconst_null
    //   66: aconst_null
    //   67: invokevirtual 200	com/tencent/mobileqq/persistence/EntityManager:a	(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   70: astore 8
    //   72: aload 10
    //   74: astore 9
    //   76: aload 8
    //   78: ifnull +99 -> 177
    //   81: aload 10
    //   83: astore 9
    //   85: aload 8
    //   87: invokeinterface 205 1 0
    //   92: ifeq +85 -> 177
    //   95: new 207	java/util/HashMap
    //   98: dup
    //   99: aload 8
    //   101: invokeinterface 211 1 0
    //   106: invokespecial 214	java/util/HashMap:<init>	(I)V
    //   109: astore 9
    //   111: aload 8
    //   113: iconst_0
    //   114: invokeinterface 218 2 0
    //   119: astore 10
    //   121: aload 8
    //   123: iconst_1
    //   124: invokeinterface 222 2 0
    //   129: istore_2
    //   130: aload_0
    //   131: getfield 13	nhj:jdField_a_of_type_ComTencentMobileqqAppAutomatorStepCleanCache	Lcom/tencent/mobileqq/app/automator/step/CleanCache;
    //   134: invokestatic 224	com/tencent/mobileqq/app/automator/step/CleanCache:d	(Lcom/tencent/mobileqq/app/automator/step/CleanCache;)Lcom/tencent/mobileqq/app/automator/Automator;
    //   137: getfield 169	com/tencent/mobileqq/app/automator/Automator:b	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   140: astore 11
    //   142: iload_2
    //   143: iconst_4
    //   144: if_icmpne +408 -> 552
    //   147: iconst_1
    //   148: istore 6
    //   150: aload 9
    //   152: aload 11
    //   154: iload 6
    //   156: aload 10
    //   158: invokevirtual 227	com/tencent/mobileqq/app/QQAppInterface:a	(ZLjava/lang/String;)Ljava/lang/String;
    //   161: aload 10
    //   163: invokevirtual 231	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   166: pop
    //   167: aload 8
    //   169: invokeinterface 234 1 0
    //   174: ifne -63 -> 111
    //   177: aload 7
    //   179: new 87	java/lang/StringBuilder
    //   182: dup
    //   183: invokespecial 88	java/lang/StringBuilder:<init>	()V
    //   186: ldc -20
    //   188: invokevirtual 94	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   191: ldc -74
    //   193: invokevirtual 187	java/lang/Class:getSimpleName	()Ljava/lang/String;
    //   196: invokevirtual 94	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   199: ldc -18
    //   201: invokevirtual 94	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   204: invokevirtual 101	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   207: invokevirtual 241	com/tencent/mobileqq/persistence/EntityManager:b	(Ljava/lang/String;)Z
    //   210: pop
    //   211: aload 9
    //   213: ifnull +345 -> 558
    //   216: aload 9
    //   218: invokevirtual 244	java/util/HashMap:size	()I
    //   221: ifle +337 -> 558
    //   224: iconst_0
    //   225: istore_3
    //   226: iconst_0
    //   227: istore_2
    //   228: iload_2
    //   229: istore 4
    //   231: iload_3
    //   232: aload_1
    //   233: arraylength
    //   234: if_icmpge +99 -> 333
    //   237: aload_1
    //   238: iload_3
    //   239: aaload
    //   240: astore 10
    //   242: aload 10
    //   244: invokevirtual 98	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   247: astore 11
    //   249: iload_2
    //   250: istore 4
    //   252: aload 9
    //   254: aload 11
    //   256: invokevirtual 247	java/util/HashMap:containsKey	(Ljava/lang/Object;)Z
    //   259: ifeq +283 -> 542
    //   262: aload 10
    //   264: invokevirtual 34	java/io/File:exists	()Z
    //   267: ifeq +9 -> 276
    //   270: aload 10
    //   272: invokevirtual 55	java/io/File:delete	()Z
    //   275: pop
    //   276: aload_1
    //   277: iload_3
    //   278: aconst_null
    //   279: aastore
    //   280: invokestatic 83	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   283: ifeq +254 -> 537
    //   286: ldc 85
    //   288: iconst_2
    //   289: new 87	java/lang/StringBuilder
    //   292: dup
    //   293: invokespecial 88	java/lang/StringBuilder:<init>	()V
    //   296: ldc -7
    //   298: invokevirtual 94	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   301: aload 9
    //   303: aload 11
    //   305: invokevirtual 253	java/util/HashMap:get	(Ljava/lang/Object;)Ljava/lang/Object;
    //   308: checkcast 128	java/lang/String
    //   311: invokevirtual 94	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   314: ldc -1
    //   316: invokevirtual 94	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   319: aload 11
    //   321: invokevirtual 94	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   324: invokevirtual 101	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   327: invokestatic 105	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   330: goto +207 -> 537
    //   333: aload_1
    //   334: astore 9
    //   336: iload 4
    //   338: ifle +59 -> 397
    //   341: aload_1
    //   342: arraylength
    //   343: iload 4
    //   345: isub
    //   346: anewarray 30	java/io/File
    //   349: astore 9
    //   351: iconst_0
    //   352: istore_2
    //   353: iload 5
    //   355: istore_3
    //   356: iload_3
    //   357: aload_1
    //   358: arraylength
    //   359: if_icmpge +38 -> 397
    //   362: iload_2
    //   363: aload 9
    //   365: arraylength
    //   366: if_icmpge +31 -> 397
    //   369: aload_1
    //   370: iload_3
    //   371: aaload
    //   372: ifnull +162 -> 534
    //   375: iload_2
    //   376: iconst_1
    //   377: iadd
    //   378: istore 4
    //   380: aload 9
    //   382: iload_2
    //   383: aload_1
    //   384: iload_3
    //   385: aaload
    //   386: aastore
    //   387: iload 4
    //   389: istore_2
    //   390: iload_3
    //   391: iconst_1
    //   392: iadd
    //   393: istore_3
    //   394: goto -38 -> 356
    //   397: aload 8
    //   399: ifnull +10 -> 409
    //   402: aload 8
    //   404: invokeinterface 258 1 0
    //   409: aload 9
    //   411: astore 10
    //   413: aload 7
    //   415: ifnull +12 -> 427
    //   418: aload 7
    //   420: invokevirtual 260	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   423: aload 9
    //   425: astore 10
    //   427: aload 10
    //   429: areturn
    //   430: astore 7
    //   432: aconst_null
    //   433: astore 7
    //   435: aload 7
    //   437: ifnull +10 -> 447
    //   440: aload 7
    //   442: invokeinterface 258 1 0
    //   447: aload_1
    //   448: astore 10
    //   450: aload 8
    //   452: ifnull -25 -> 427
    //   455: aload 8
    //   457: invokevirtual 260	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   460: aload_1
    //   461: areturn
    //   462: astore_1
    //   463: aconst_null
    //   464: astore 8
    //   466: aload 9
    //   468: astore 7
    //   470: aload 8
    //   472: ifnull +10 -> 482
    //   475: aload 8
    //   477: invokeinterface 258 1 0
    //   482: aload 7
    //   484: ifnull +8 -> 492
    //   487: aload 7
    //   489: invokevirtual 260	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   492: aload_1
    //   493: athrow
    //   494: astore_1
    //   495: aconst_null
    //   496: astore 8
    //   498: goto -28 -> 470
    //   501: astore_1
    //   502: goto -32 -> 470
    //   505: astore 8
    //   507: aload 7
    //   509: astore 8
    //   511: aconst_null
    //   512: astore 7
    //   514: goto -79 -> 435
    //   517: astore 9
    //   519: aload 7
    //   521: astore 9
    //   523: aload 8
    //   525: astore 7
    //   527: aload 9
    //   529: astore 8
    //   531: goto -96 -> 435
    //   534: goto -144 -> 390
    //   537: iload_2
    //   538: iconst_1
    //   539: iadd
    //   540: istore 4
    //   542: iload_3
    //   543: iconst_1
    //   544: iadd
    //   545: istore_3
    //   546: iload 4
    //   548: istore_2
    //   549: goto -321 -> 228
    //   552: iconst_0
    //   553: istore 6
    //   555: goto -405 -> 150
    //   558: iconst_0
    //   559: istore 4
    //   561: goto -228 -> 333
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	564	0	this	nhj
    //   0	564	1	paramArrayOfFile	File[]
    //   129	420	2	i	int
    //   225	321	3	j	int
    //   229	331	4	k	int
    //   10	344	5	m	int
    //   148	406	6	bool	boolean
    //   28	391	7	localEntityManager	EntityManager
    //   430	1	7	localException1	Exception
    //   433	93	7	localObject1	Object
    //   1	496	8	localCursor	android.database.Cursor
    //   505	1	8	localException2	Exception
    //   509	21	8	localObject2	Object
    //   4	463	9	localObject3	Object
    //   517	1	9	localException3	Exception
    //   521	7	9	localObject4	Object
    //   7	442	10	localObject5	Object
    //   140	180	11	localObject6	Object
    // Exception table:
    //   from	to	target	type
    //   12	30	430	java/lang/Exception
    //   12	30	462	finally
    //   30	72	494	finally
    //   85	111	501	finally
    //   111	142	501	finally
    //   150	177	501	finally
    //   177	211	501	finally
    //   216	224	501	finally
    //   231	237	501	finally
    //   242	249	501	finally
    //   252	276	501	finally
    //   280	330	501	finally
    //   341	351	501	finally
    //   356	369	501	finally
    //   30	72	505	java/lang/Exception
    //   85	111	517	java/lang/Exception
    //   111	142	517	java/lang/Exception
    //   150	177	517	java/lang/Exception
    //   177	211	517	java/lang/Exception
    //   216	224	517	java/lang/Exception
    //   231	237	517	java/lang/Exception
    //   242	249	517	java/lang/Exception
    //   252	276	517	java/lang/Exception
    //   280	330	517	java/lang/Exception
    //   341	351	517	java/lang/Exception
    //   356	369	517	java/lang/Exception
  }
  
  private File[] a(File[] paramArrayOfFile, int paramInt)
  {
    int m = 0;
    EntityManager localEntityManager = null;
    localObject2 = localEntityManager;
    for (;;)
    {
      try
      {
        localObject3 = new LinkedList();
        localObject2 = localEntityManager;
        localEntityManager = ejdField_a_of_type_ComTencentMobileqqAppAutomatorStepCleanCache).b.a().createEntityManager();
        localObject2 = localEntityManager;
      }
      catch (Exception localException)
      {
        Object localObject4;
        Object localObject5;
        int k;
        Object localObject3 = paramArrayOfFile;
        if (localObject2 == null) {
          continue;
        }
        ((EntityManager)localObject2).a();
        return paramArrayOfFile;
      }
      finally
      {
        Object localObject1 = null;
        if (localObject1 != null) {
          localObject1.a();
        }
      }
      try
      {
        localObject4 = (ArrayList)localEntityManager.a(Friends.class, false, "groupid>=?", new String[] { "0" }, null, null, null, null);
        if (localObject4 != null)
        {
          localObject2 = localEntityManager;
          if (((ArrayList)localObject4).size() != 0)
          {
            i = 0;
            localObject2 = localEntityManager;
            if (i < ((ArrayList)localObject4).size())
            {
              localObject2 = localEntityManager;
              localObject5 = (Friends)((ArrayList)localObject4).get(i);
              localObject2 = localEntityManager;
              ((LinkedList)localObject3).add(fjdField_a_of_type_ComTencentMobileqqAppAutomatorStepCleanCache).b.a(false, uin));
              i += 1;
              continue;
            }
          }
        }
        localObject2 = localEntityManager;
        localObject4 = (ArrayList)localEntityManager.a(TroopInfo.class, false, null, null, null, null, null, null);
        if (localObject4 == null) {
          break label598;
        }
        localObject2 = localEntityManager;
        if (((ArrayList)localObject4).size() <= 0) {
          break label598;
        }
        i = 0;
        localObject2 = localEntityManager;
        if (i >= ((ArrayList)localObject4).size()) {
          break label598;
        }
        localObject2 = localEntityManager;
        localObject5 = (TroopInfo)((ArrayList)localObject4).get(i);
        localObject2 = localEntityManager;
        ((LinkedList)localObject3).add(gjdField_a_of_type_ComTencentMobileqqAppAutomatorStepCleanCache).b.a(true, troopuin));
        i += 1;
        continue;
      }
      finally
      {
        continue;
        continue;
        j = 0;
        i = 0;
        continue;
      }
      k = i;
      localObject2 = localEntityManager;
      if (j < paramArrayOfFile.length)
      {
        localObject4 = paramArrayOfFile[j];
        localObject2 = localEntityManager;
        localObject5 = ((File)localObject4).getAbsolutePath();
        k = i;
        localObject2 = localEntityManager;
        if (!((LinkedList)localObject3).contains(localObject5))
        {
          k = i;
          localObject2 = localEntityManager;
          if (((String)localObject5).indexOf("discussion_") < 0)
          {
            k = i;
            localObject2 = localEntityManager;
            if (((String)localObject5).indexOf("sys_") < 0)
            {
              localObject2 = localEntityManager;
              if (((File)localObject4).exists())
              {
                localObject2 = localEntityManager;
                ((File)localObject4).delete();
              }
              paramArrayOfFile[j] = null;
              i += 1;
              localObject2 = localEntityManager;
              if (QLog.isColorLevel())
              {
                localObject2 = localEntityManager;
                QLog.d("QQInitHandler", 2, "onCleanCache->delSecondaryQQHead. delete QQHead,filePath=" + ((File)localObject4).getAbsolutePath());
              }
              k = i;
              localObject2 = localEntityManager;
              if (paramInt + i >= jdField_a_of_type_Int) {
                k = i;
              }
            }
          }
        }
      }
      else
      {
        localObject2 = paramArrayOfFile;
        if (k <= 0) {
          continue;
        }
        localObject2 = localEntityManager;
        localObject3 = new File[paramArrayOfFile.length - k];
        paramInt = 0;
        i = m;
        localObject2 = localEntityManager;
        if (i >= paramArrayOfFile.length) {
          continue;
        }
        localObject2 = localEntityManager;
        if (paramInt >= localObject3.length) {
          continue;
        }
        if (paramArrayOfFile[i] == null) {
          break label595;
        }
        j = paramInt + 1;
        localObject3[paramInt] = paramArrayOfFile[i];
        paramInt = j;
        i += 1;
        continue;
      }
      j += 1;
      i = k;
    }
    localObject2 = localObject3;
    localObject3 = localObject2;
    if (localEntityManager != null)
    {
      localEntityManager.a();
      localObject3 = localObject2;
    }
    return localObject3;
  }
  
  public void run()
  {
    int m = 0;
    int j;
    Object localObject2;
    int k;
    int i1;
    try
    {
      SystemUtil.a(ajdField_a_of_type_ComTencentMobileqqAppAutomatorStepCleanCache).b.a());
      String[] arrayOfString = new String[2];
      arrayOfString[0] = AppConstants.bz;
      arrayOfString[1] = (SystemUtil.b + "head/_hd/");
      j = arrayOfString.length;
      i = 0;
      if (i >= j) {
        break label419;
      }
      localObject2 = new File(arrayOfString[i]);
      if ((!((File)localObject2).exists()) || (!((File)localObject2).isDirectory())) {
        break label789;
      }
      localObject2 = ((File)localObject2).listFiles();
      if ((localObject2 == null) || (localObject2.length <= 3000)) {
        break label789;
      }
      k = localObject2.length;
      n = localObject2.length;
      jdField_a_of_type_Int = (k - 2500);
      localObject2 = a((File[])localObject2);
      n = n - localObject2.length + 0;
      if (QLog.isColorLevel()) {
        QLog.d("QQInitHandler", 2, "onCleanCache. after delTemporaryQQHead. totalCount=" + k + ", currNeedDelCount=" + jdField_a_of_type_Int + ", delCount=" + n);
      }
      if (n >= jdField_a_of_type_Int) {
        break label789;
      }
      Arrays.sort((Object[])localObject2, new nhk(this));
      i1 = localObject2.length;
      localObject2 = a((File[])localObject2, n);
      n += i1 - localObject2.length;
      if (QLog.isColorLevel()) {
        QLog.d("QQInitHandler", 2, "onCleanCache. after delSecondaryQQHead. totalCount=" + k + ", currNeedDelCount=" + jdField_a_of_type_Int + ", delCount=" + n);
      }
      if (n >= jdField_a_of_type_Int) {
        break label789;
      }
      n = a((File[])localObject2, n);
      if (!QLog.isColorLevel()) {
        break label789;
      }
      QLog.d("QQInitHandler", 2, "onCleanCache. after delRemainQQHead. totalCount=" + k + ", currNeedDelCount=" + jdField_a_of_type_Int + ", delCount=" + n);
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    label403:
    CleanCache.b(jdField_a_of_type_ComTencentMobileqqAppAutomatorStepCleanCache).a(40001, true, null);
    return;
    label419:
    Object localObject1 = new String[2];
    localObject1[0] = AppConstants.bD;
    localObject1[1] = (SystemUtil.b + "head/_stranger/");
    int n = localObject1.length;
    int i = 0;
    label465:
    if (i < n)
    {
      localObject2 = new File(localObject1[i]);
      if ((!((File)localObject2).exists()) || (!((File)localObject2).isDirectory())) {
        break label817;
      }
      localObject2 = ((File)localObject2).listFiles();
      if ((localObject2 == null) || (localObject2.length <= 300)) {
        break label817;
      }
      Arrays.sort((Object[])localObject2, new nhl(this));
      i1 = localObject2.length;
      j = 0;
      k = 0;
    }
    for (;;)
    {
      if (j < i1)
      {
        Object localObject3 = localObject2[j];
        if (!localObject3.exists()) {
          break label796;
        }
        localObject3.delete();
      }
      for (;;)
      {
        if (!QLog.isColorLevel()) {
          break label817;
        }
        QLog.d("QQInitHandler", 2, "onCleanCache. delete stranger head...");
        break label817;
        localObject1 = new File[4];
        localObject1[0] = URLDrawableHelper.a;
        localObject1[1] = new File(AppConstants.bd + "photo");
        localObject1[2] = new File(AppConstants.bd + jdField_a_of_type_ComTencentMobileqqAppAutomatorStepCleanCache.a() + "/ptt/");
        localObject1[3] = new File(AppConstants.bd + "shortvideo/thumbs");
        k = localObject1.length;
        j = 0;
        i = m;
        while (i < k)
        {
          j += a(localObject1[i]);
          i += 1;
        }
        if (QLog.isColorLevel()) {
          QLog.d("QQInitHandler", 2, "onCleanCache. delete " + j + " cache file(s)");
        }
        a();
        break label403;
        label789:
        i += 1;
        break;
        label796:
        localObject2[j] = null;
        k += 1;
        if (i1 - k > 20) {
          break label824;
        }
      }
      label817:
      i += 1;
      break label465;
      label824:
      j += 1;
    }
  }
}
