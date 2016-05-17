package com.tencent.mobileqq.app.utils;

import android.content.ContentResolver;
import android.content.Context;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;

public class SmsContent
  extends ContentObserver
{
  public static final String a = "sms.content";
  private static final String[] jdField_a_of_type_ArrayOfJavaLangString = { "_id", "address", "body", "date" };
  public static final String b = "_id";
  public static final String c = "address";
  public static final String d = "body";
  public static final String e = "date";
  private static final String f = "content://sms/";
  private static final String g = "content://sms/inbox";
  private long jdField_a_of_type_Long = 0L;
  Context jdField_a_of_type_AndroidContentContext;
  SMSBodyObserver jdField_a_of_type_ComTencentMobileqqAppUtilsSMSBodyObserver;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public SmsContent(Handler paramHandler)
  {
    super(paramHandler);
  }
  
  public SmsContent(Handler paramHandler, long paramLong)
  {
    super(paramHandler);
    jdField_a_of_type_Long = paramLong;
  }
  
  public void a()
  {
    if (jdField_a_of_type_AndroidContentContext != null)
    {
      jdField_a_of_type_AndroidContentContext.getContentResolver().unregisterContentObserver(this);
      if (QLog.isColorLevel()) {
        QLog.d("sms.content", 2, "unregister...");
      }
      jdField_a_of_type_AndroidContentContext = null;
    }
    jdField_a_of_type_ComTencentMobileqqAppUtilsSMSBodyObserver = null;
  }
  
  public void a(Context paramContext, SMSBodyObserver paramSMSBodyObserver)
  {
    if (paramContext == null) {}
    do
    {
      return;
      jdField_a_of_type_AndroidContentContext = paramContext;
      jdField_a_of_type_ComTencentMobileqqAppUtilsSMSBodyObserver = paramSMSBodyObserver;
      jdField_a_of_type_AndroidContentContext.getContentResolver().registerContentObserver(Uri.parse("content://sms/"), true, this);
    } while (!QLog.isColorLevel());
    QLog.d("sms.content", 2, "register...");
  }
  
  /* Error */
  public void onChange(boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: iload_1
    //   2: invokespecial 96	android/database/ContentObserver:onChange	(Z)V
    //   5: aload_0
    //   6: getfield 52	com/tencent/mobileqq/app/utils/SmsContent:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   9: ifnonnull +18 -> 27
    //   12: invokestatic 70	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   15: ifeq +11 -> 26
    //   18: ldc 8
    //   20: iconst_2
    //   21: ldc 98
    //   23: invokestatic 75	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   26: return
    //   27: aload_0
    //   28: getfield 52	com/tencent/mobileqq/app/utils/SmsContent:jdField_a_of_type_AndroidContentContext	Landroid/content/Context;
    //   31: invokevirtual 58	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   34: ldc 27
    //   36: invokestatic 84	android/net/Uri:parse	(Ljava/lang/String;)Landroid/net/Uri;
    //   39: getstatic 42	com/tencent/mobileqq/app/utils/SmsContent:jdField_a_of_type_ArrayOfJavaLangString	[Ljava/lang/String;
    //   42: aconst_null
    //   43: aconst_null
    //   44: ldc 100
    //   46: invokevirtual 104	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   49: astore 5
    //   51: aload 5
    //   53: ifnull +208 -> 261
    //   56: aload 5
    //   58: astore 4
    //   60: aload 5
    //   62: invokeinterface 109 1 0
    //   67: ifne +194 -> 261
    //   70: aload 5
    //   72: astore 4
    //   74: aload 5
    //   76: invokeinterface 112 1 0
    //   81: ifeq +180 -> 261
    //   84: aload 5
    //   86: astore 4
    //   88: aload 5
    //   90: aload 5
    //   92: ldc 15
    //   94: invokeinterface 116 2 0
    //   99: invokeinterface 120 2 0
    //   104: astore 6
    //   106: aload 5
    //   108: astore 4
    //   110: aload 5
    //   112: aload 5
    //   114: ldc 18
    //   116: invokeinterface 116 2 0
    //   121: invokeinterface 120 2 0
    //   126: astore 7
    //   128: aload 5
    //   130: astore 4
    //   132: aload 5
    //   134: aload 5
    //   136: ldc 21
    //   138: invokeinterface 116 2 0
    //   143: invokeinterface 124 2 0
    //   148: lstore_2
    //   149: aload 5
    //   151: astore 4
    //   153: invokestatic 70	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   156: ifeq +64 -> 220
    //   159: aload 5
    //   161: astore 4
    //   163: ldc 8
    //   165: iconst_2
    //   166: new 126	java/lang/StringBuilder
    //   169: dup
    //   170: invokespecial 128	java/lang/StringBuilder:<init>	()V
    //   173: ldc -126
    //   175: invokevirtual 134	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   178: aload 6
    //   180: invokevirtual 134	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   183: ldc -120
    //   185: invokevirtual 134	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   188: aload 7
    //   190: invokevirtual 134	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   193: ldc -118
    //   195: invokevirtual 134	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   198: lload_2
    //   199: invokevirtual 141	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   202: ldc -113
    //   204: invokevirtual 134	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   207: aload_0
    //   208: getfield 49	com/tencent/mobileqq/app/utils/SmsContent:jdField_a_of_type_Long	J
    //   211: invokevirtual 141	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   214: invokevirtual 147	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   217: invokestatic 75	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   220: aload 5
    //   222: astore 4
    //   224: lload_2
    //   225: aload_0
    //   226: getfield 49	com/tencent/mobileqq/app/utils/SmsContent:jdField_a_of_type_Long	J
    //   229: lcmp
    //   230: iflt +31 -> 261
    //   233: aload 5
    //   235: astore 4
    //   237: aload_0
    //   238: getfield 77	com/tencent/mobileqq/app/utils/SmsContent:jdField_a_of_type_ComTencentMobileqqAppUtilsSMSBodyObserver	Lcom/tencent/mobileqq/app/utils/SMSBodyObserver;
    //   241: ifnull +20 -> 261
    //   244: aload 5
    //   246: astore 4
    //   248: aload_0
    //   249: getfield 77	com/tencent/mobileqq/app/utils/SmsContent:jdField_a_of_type_ComTencentMobileqqAppUtilsSMSBodyObserver	Lcom/tencent/mobileqq/app/utils/SMSBodyObserver;
    //   252: aload 6
    //   254: aload 7
    //   256: invokeinterface 153 3 0
    //   261: aload 5
    //   263: ifnull -237 -> 26
    //   266: aload 5
    //   268: invokeinterface 156 1 0
    //   273: return
    //   274: astore 6
    //   276: aconst_null
    //   277: astore 5
    //   279: aload 5
    //   281: astore 4
    //   283: invokestatic 70	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   286: ifeq +17 -> 303
    //   289: aload 5
    //   291: astore 4
    //   293: ldc 8
    //   295: iconst_2
    //   296: ldc -99
    //   298: aload 6
    //   300: invokestatic 160	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   303: aload 5
    //   305: ifnull -279 -> 26
    //   308: aload 5
    //   310: invokeinterface 156 1 0
    //   315: return
    //   316: astore 5
    //   318: aconst_null
    //   319: astore 4
    //   321: aload 4
    //   323: ifnull +10 -> 333
    //   326: aload 4
    //   328: invokeinterface 156 1 0
    //   333: aload 5
    //   335: athrow
    //   336: astore 5
    //   338: goto -17 -> 321
    //   341: astore 6
    //   343: goto -64 -> 279
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	346	0	this	SmsContent
    //   0	346	1	paramBoolean	boolean
    //   148	77	2	l	long
    //   58	269	4	localCursor1	android.database.Cursor
    //   49	260	5	localCursor2	android.database.Cursor
    //   316	18	5	localObject1	Object
    //   336	1	5	localObject2	Object
    //   104	149	6	str1	String
    //   274	25	6	localException1	Exception
    //   341	1	6	localException2	Exception
    //   126	129	7	str2	String
    // Exception table:
    //   from	to	target	type
    //   27	51	274	java/lang/Exception
    //   27	51	316	finally
    //   60	70	336	finally
    //   74	84	336	finally
    //   88	106	336	finally
    //   110	128	336	finally
    //   132	149	336	finally
    //   153	159	336	finally
    //   163	220	336	finally
    //   224	233	336	finally
    //   237	244	336	finally
    //   248	261	336	finally
    //   283	289	336	finally
    //   293	303	336	finally
    //   60	70	341	java/lang/Exception
    //   74	84	341	java/lang/Exception
    //   88	106	341	java/lang/Exception
    //   110	128	341	java/lang/Exception
    //   132	149	341	java/lang/Exception
    //   153	159	341	java/lang/Exception
    //   163	220	341	java/lang/Exception
    //   224	233	341	java/lang/Exception
    //   237	244	341	java/lang/Exception
    //   248	261	341	java/lang/Exception
  }
}
