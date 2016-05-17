import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.UnifiedMonitor;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Arrays;

public class rfb
  implements Runnable
{
  private int jdField_a_of_type_Int;
  private final String jdField_a_of_type_JavaLangString;
  private StringBuilder jdField_a_of_type_JavaLangStringBuilder;
  private Thread jdField_a_of_type_JavaLangThread;
  private ArrayList jdField_a_of_type_JavaUtilArrayList;
  private final String[] jdField_a_of_type_ArrayOfJavaLangString;
  private int b;
  private final int c;
  private final int d;
  private int e;
  
  public rfb(UnifiedMonitor paramUnifiedMonitor, int paramInt, Thread paramThread)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    c = 100000;
    d = 10;
    jdField_a_of_type_JavaLangStringBuilder = new StringBuilder(1024);
    jdField_a_of_type_ArrayOfJavaLangString = new String[] { "java.", "android.", "com.android.", "dalvik.", "com.google", "libcore.", "sun.", "com.qihoo360.", "com.lbe." };
    jdField_a_of_type_JavaLangString = "android.support.v4.";
    jdField_a_of_type_Int = paramInt;
    jdField_b_of_type_Int = ajdField_a_of_type_Int;
    e = (ad - ajdField_a_of_type_Int);
    if (e > 0) {}
    for (int i = e;; i = jdField_b_of_type_Int * 4)
    {
      e = i;
      jdField_a_of_type_JavaUtilArrayList = new ArrayList(ac);
      jdField_a_of_type_JavaLangThread = paramThread;
      return;
    }
  }
  
  private String a(boolean paramBoolean)
  {
    for (;;)
    {
      try
      {
        jdField_a_of_type_JavaUtilArrayList.clear();
        localObject = jdField_a_of_type_JavaLangThread.getStackTrace();
        if (localObject == null) {
          return null;
        }
        if (!paramBoolean) {
          break label266;
        }
        return Arrays.toString((Object[])localObject);
      }
      catch (Throwable localThrowable)
      {
        Object localObject;
        String str;
        String[] arrayOfString;
        int m;
        if (!QLog.isDevelopLevel()) {
          break label259;
        }
        localThrowable.printStackTrace();
      }
      if (k < localObject.length)
      {
        str = localObject[k].toString();
        arrayOfString = jdField_a_of_type_ArrayOfJavaLangString;
        m = arrayOfString.length;
        j = 0;
        if (j < m)
        {
          if (!str.startsWith(arrayOfString[j])) {
            break label292;
          }
          if (!str.startsWith("android.support.v4.")) {
            break label287;
          }
          j = 0;
          break label274;
        }
      }
      else
      {
        if (jdField_a_of_type_JavaUtilArrayList.size() > 0)
        {
          jdField_a_of_type_JavaLangStringBuilder.setLength(0);
          j = ajdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor)[jdField_a_of_type_Int].i;
          i = jdField_a_of_type_JavaUtilArrayList.size() - 1 - j;
          if ((i >= 0) && (i > jdField_a_of_type_JavaUtilArrayList.size() - 1 - j - ajdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor)[jdField_a_of_type_Int].c))
          {
            jdField_a_of_type_JavaLangStringBuilder.append((String)jdField_a_of_type_JavaUtilArrayList.get(i)).append(",");
            i -= 1;
            continue;
            jdField_a_of_type_JavaUtilArrayList.add(str);
            break label310;
          }
          if (jdField_a_of_type_JavaLangStringBuilder.length() > 0)
          {
            localObject = jdField_a_of_type_JavaLangStringBuilder.toString();
            return localObject;
          }
          return null;
        }
        label259:
        return null;
      }
      int j = 0;
      break label274;
      label266:
      int k = 0;
      int i = 0;
      continue;
      for (;;)
      {
        label274:
        if (j == 0) {
          break label299;
        }
        j = i;
        if (i == 0) {
          break label310;
        }
        break;
        label287:
        j = 1;
      }
      label292:
      j += 1;
      continue;
      label299:
      j = i;
      if (i == 0)
      {
        j = 1;
        continue;
        label310:
        k += 1;
        i = j;
      }
    }
  }
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: new 162	java/util/Random
    //   3: dup
    //   4: invokespecial 163	java/util/Random:<init>	()V
    //   7: astore 6
    //   9: aload_0
    //   10: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   13: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   16: aload_0
    //   17: getfield 71	rfb:jdField_a_of_type_Int	I
    //   20: aaload
    //   21: getfield 166	rez:g	I
    //   24: aload_0
    //   25: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   28: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   31: aload_0
    //   32: getfield 71	rfb:jdField_a_of_type_Int	I
    //   35: aaload
    //   36: getfield 167	rez:jdField_b_of_type_Int	I
    //   39: if_icmplt +15 -> 54
    //   42: aload_0
    //   43: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   46: aload_0
    //   47: getfield 71	rfb:jdField_a_of_type_Int	I
    //   50: invokestatic 170	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;I)V
    //   53: return
    //   54: aload_0
    //   55: getfield 81	rfb:jdField_b_of_type_Int	I
    //   58: i2l
    //   59: invokestatic 174	java/lang/Thread:sleep	(J)V
    //   62: aload_0
    //   63: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   66: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   69: aload_0
    //   70: getfield 71	rfb:jdField_a_of_type_Int	I
    //   73: aaload
    //   74: getfield 177	rez:jdField_b_of_type_Long	J
    //   77: lconst_0
    //   78: lcmp
    //   79: ifeq -70 -> 9
    //   82: aload_0
    //   83: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   86: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   89: aload_0
    //   90: getfield 71	rfb:jdField_a_of_type_Int	I
    //   93: aaload
    //   94: getfield 177	rez:jdField_b_of_type_Long	J
    //   97: lstore_1
    //   98: invokestatic 183	android/os/SystemClock:uptimeMillis	()J
    //   101: aload_0
    //   102: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   105: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   108: aload_0
    //   109: getfield 71	rfb:jdField_a_of_type_Int	I
    //   112: aaload
    //   113: getfield 177	rez:jdField_b_of_type_Long	J
    //   116: lsub
    //   117: aload_0
    //   118: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   121: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   124: aload_0
    //   125: getfield 71	rfb:jdField_a_of_type_Int	I
    //   128: aaload
    //   129: getfield 79	rez:jdField_a_of_type_Int	I
    //   132: i2l
    //   133: lsub
    //   134: lstore_3
    //   135: lload_3
    //   136: ldc2_w 184
    //   139: lcmp
    //   140: ifgt -131 -> 9
    //   143: lload_3
    //   144: ldc2_w 186
    //   147: lcmp
    //   148: ifge +62 -> 210
    //   151: lload_3
    //   152: lneg
    //   153: lstore_3
    //   154: lload_3
    //   155: invokestatic 174	java/lang/Thread:sleep	(J)V
    //   158: invokestatic 183	android/os/SystemClock:uptimeMillis	()J
    //   161: aload_0
    //   162: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   165: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   168: aload_0
    //   169: getfield 71	rfb:jdField_a_of_type_Int	I
    //   172: aaload
    //   173: getfield 177	rez:jdField_b_of_type_Long	J
    //   176: lsub
    //   177: lstore_3
    //   178: lload_3
    //   179: aload_0
    //   180: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   183: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   186: aload_0
    //   187: getfield 71	rfb:jdField_a_of_type_Int	I
    //   190: aaload
    //   191: getfield 79	rez:jdField_a_of_type_Int	I
    //   194: bipush 10
    //   196: isub
    //   197: i2l
    //   198: lcmp
    //   199: iflt -190 -> 9
    //   202: lload_3
    //   203: ldc2_w 184
    //   206: lcmp
    //   207: ifgt -198 -> 9
    //   210: aload_0
    //   211: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   214: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   217: aload_0
    //   218: getfield 71	rfb:jdField_a_of_type_Int	I
    //   221: aaload
    //   222: aload_0
    //   223: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   226: aload_0
    //   227: getfield 71	rfb:jdField_a_of_type_Int	I
    //   230: iconst_0
    //   231: invokestatic 190	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;IZ)Z
    //   234: putfield 192	rez:jdField_b_of_type_Boolean	Z
    //   237: aload_0
    //   238: getfield 71	rfb:jdField_a_of_type_Int	I
    //   241: ifeq +12 -> 253
    //   244: aload_0
    //   245: getfield 71	rfb:jdField_a_of_type_Int	I
    //   248: bipush 10
    //   250: if_icmpne +176 -> 426
    //   253: invokestatic 195	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   256: ifeq +170 -> 426
    //   259: ldc2_w 196
    //   262: invokestatic 174	java/lang/Thread:sleep	(J)V
    //   265: invokestatic 183	android/os/SystemClock:uptimeMillis	()J
    //   268: aload_0
    //   269: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   272: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   275: aload_0
    //   276: getfield 71	rfb:jdField_a_of_type_Int	I
    //   279: aaload
    //   280: getfield 177	rez:jdField_b_of_type_Long	J
    //   283: lsub
    //   284: lstore_3
    //   285: lload_1
    //   286: aload_0
    //   287: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   290: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   293: aload_0
    //   294: getfield 71	rfb:jdField_a_of_type_Int	I
    //   297: aaload
    //   298: getfield 177	rez:jdField_b_of_type_Long	J
    //   301: lcmp
    //   302: ifne +105 -> 407
    //   305: lload_3
    //   306: aload_0
    //   307: getfield 81	rfb:jdField_b_of_type_Int	I
    //   310: sipush 200
    //   313: iadd
    //   314: bipush 10
    //   316: isub
    //   317: i2l
    //   318: lcmp
    //   319: iflt +88 -> 407
    //   322: lload_3
    //   323: ldc2_w 184
    //   326: lcmp
    //   327: ifge +80 -> 407
    //   330: aload_0
    //   331: iconst_1
    //   332: invokespecial 199	rfb:a	(Z)Ljava/lang/String;
    //   335: astore 7
    //   337: ldc -55
    //   339: iconst_2
    //   340: aload 7
    //   342: invokestatic 205	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   345: aload_0
    //   346: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   349: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   352: aload_0
    //   353: getfield 71	rfb:jdField_a_of_type_Int	I
    //   356: aaload
    //   357: aload 7
    //   359: putfield 206	rez:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   362: aload_0
    //   363: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   366: invokestatic 209	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)Landroid/os/Handler;
    //   369: iconst_2
    //   370: invokestatic 215	android/os/Message:obtain	(Landroid/os/Handler;I)Landroid/os/Message;
    //   373: astore 7
    //   375: aload 7
    //   377: aload_0
    //   378: getfield 71	rfb:jdField_a_of_type_Int	I
    //   381: putfield 218	android/os/Message:arg1	I
    //   384: aload_0
    //   385: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   388: invokestatic 209	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)Landroid/os/Handler;
    //   391: aload 7
    //   393: lload_1
    //   394: invokestatic 183	android/os/SystemClock:uptimeMillis	()J
    //   397: lneg
    //   398: ladd
    //   399: ldc2_w 219
    //   402: ladd
    //   403: invokevirtual 226	android/os/Handler:sendMessageDelayed	(Landroid/os/Message;J)Z
    //   406: pop
    //   407: aload_0
    //   408: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   411: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   414: aload_0
    //   415: getfield 71	rfb:jdField_a_of_type_Int	I
    //   418: aaload
    //   419: lconst_0
    //   420: putfield 177	rez:jdField_b_of_type_Long	J
    //   423: goto -414 -> 9
    //   426: invokestatic 195	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   429: ifne -22 -> 407
    //   432: aload_0
    //   433: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   436: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   439: aload_0
    //   440: getfield 71	rfb:jdField_a_of_type_Int	I
    //   443: aaload
    //   444: getfield 192	rez:jdField_b_of_type_Boolean	Z
    //   447: ifeq -40 -> 407
    //   450: aload 6
    //   452: aload_0
    //   453: getfield 84	rfb:e	I
    //   456: invokevirtual 230	java/util/Random:nextInt	(I)I
    //   459: i2l
    //   460: lstore_3
    //   461: lload_3
    //   462: invokestatic 174	java/lang/Thread:sleep	(J)V
    //   465: lload_1
    //   466: aload_0
    //   467: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   470: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   473: aload_0
    //   474: getfield 71	rfb:jdField_a_of_type_Int	I
    //   477: aaload
    //   478: getfield 177	rez:jdField_b_of_type_Long	J
    //   481: lcmp
    //   482: ifne -75 -> 407
    //   485: aload_0
    //   486: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   489: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   492: aload_0
    //   493: getfield 71	rfb:jdField_a_of_type_Int	I
    //   496: aaload
    //   497: getfield 192	rez:jdField_b_of_type_Boolean	Z
    //   500: ifeq -93 -> 407
    //   503: aload_0
    //   504: getfield 22	rfb:jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor	Lcom/tencent/mobileqq/statistics/UnifiedMonitor;
    //   507: invokestatic 76	com/tencent/mobileqq/statistics/UnifiedMonitor:a	(Lcom/tencent/mobileqq/statistics/UnifiedMonitor;)[Lrez;
    //   510: aload_0
    //   511: getfield 71	rfb:jdField_a_of_type_Int	I
    //   514: aaload
    //   515: astore 7
    //   517: aload_0
    //   518: getfield 71	rfb:jdField_a_of_type_Int	I
    //   521: ifeq +12 -> 533
    //   524: aload_0
    //   525: getfield 71	rfb:jdField_a_of_type_Int	I
    //   528: bipush 10
    //   530: if_icmpne +20 -> 550
    //   533: iconst_1
    //   534: istore 5
    //   536: aload 7
    //   538: aload_0
    //   539: iload 5
    //   541: invokespecial 199	rfb:a	(Z)Ljava/lang/String;
    //   544: putfield 206	rez:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   547: goto -140 -> 407
    //   550: iconst_0
    //   551: istore 5
    //   553: goto -17 -> 536
    //   556: astore 7
    //   558: goto -549 -> 9
    //   561: astore 7
    //   563: goto -554 -> 9
    //   566: astore 7
    //   568: goto -559 -> 9
    //   571: astore 7
    //   573: goto -511 -> 62
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	576	0	this	rfb
    //   97	369	1	l1	long
    //   134	328	3	l2	long
    //   534	18	5	bool	boolean
    //   7	444	6	localRandom	java.util.Random
    //   335	202	7	localObject	Object
    //   556	1	7	localInterruptedException1	InterruptedException
    //   561	1	7	localInterruptedException2	InterruptedException
    //   566	1	7	localInterruptedException3	InterruptedException
    //   571	1	7	localInterruptedException4	InterruptedException
    // Exception table:
    //   from	to	target	type
    //   154	158	556	java/lang/InterruptedException
    //   259	265	561	java/lang/InterruptedException
    //   461	465	566	java/lang/InterruptedException
    //   54	62	571	java/lang/InterruptedException
  }
}
