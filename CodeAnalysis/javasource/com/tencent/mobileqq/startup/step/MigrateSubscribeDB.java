package com.tencent.mobileqq.startup.step;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import com.tencent.biz.pubaccount.subscript.SubscriptUtil;
import com.tencent.biz.pubaccount.troopbarassit.TroopBarData;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.data.ConversationInfo;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.service.message.MessageUtils;
import com.tencent.mobileqq.utils.SecurityUtile;
import com.tencent.qphone.base.remote.SimpleAccount;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import cooperation.readinjoy.ReadInJoyHelper;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import mqq.app.AppRuntime;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import rdz;
import rea;
import reb;

public class MigrateSubscribeDB
  extends Step
{
  private static final int M = 17;
  private static final String jdField_a_of_type_JavaLangString = "MigrateSubscribeDB";
  public static boolean a = false;
  private static final int jdField_b_of_type_Int = 40000;
  private static final int jdField_c_of_type_Int = 80;
  int jdField_a_of_type_Int = -1;
  long jdField_a_of_type_Long = 0L;
  BaseApplicationImpl jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl;
  Object jdField_a_of_type_JavaLangObject = new Object();
  private List jdField_a_of_type_JavaUtilList = null;
  private List jdField_b_of_type_JavaUtilList = null;
  volatile boolean jdField_b_of_type_Boolean = true;
  private List jdField_c_of_type_JavaUtilList;
  
  static
  {
    jdField_a_of_type_Boolean = false;
  }
  
  public MigrateSubscribeDB()
  {
    c = null;
  }
  
  private int a()
  {
    return (short)Math.abs(new Random().nextInt()) & 0xFFFF;
  }
  
  private long a()
  {
    return MessageUtils.a(0x4000000000000 | Math.abs(new Random().nextInt()));
  }
  
  private String a(Object paramObject)
  {
    if (paramObject == null) {
      paramObject = null;
    }
    String str;
    do
    {
      return paramObject;
      str = paramObject.toString();
      paramObject = str;
    } while (str.length() <= 0);
    return SecurityUtile.a(str);
  }
  
  private List a(String paramString)
  {
    ArrayList localArrayList = new ArrayList();
    if (paramString == null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "getSubscribeRecentDataList fail readInJoySubDBName is null");
      }
      paramString = null;
      return paramString;
    }
    rea localRea = new rea(this, BaseApplication.getContext(), paramString, 17);
    paramString = localRea.getReadableDatabase().rawQuery("select * from RecentSubscribeData order by mLastMsgTime DESC", null);
    if (paramString != null) {}
    for (;;)
    {
      try
      {
        if (!paramString.moveToFirst()) {
          continue;
        }
        int i = paramString.getColumnIndex("mDraft");
        int j = paramString.getColumnIndex("mDraftTime");
        int k = paramString.getColumnIndex("mLastMsg");
        int m = paramString.getColumnIndex("mLastMsgID");
        int n = paramString.getColumnIndex("mLastMsgTime");
        int i1 = paramString.getColumnIndex("mLastReorderTime");
        int i2 = paramString.getColumnIndex("mSubscribeHeadUrl");
        int i3 = paramString.getColumnIndex("mSubscribeID");
        int i4 = paramString.getColumnIndex("mSubscribeName");
        int i5 = paramString.getColumnIndex("mUnreadCount");
        reb localReb = new reb(this, null);
        d = a(paramString.getString(i));
        e = a(paramString.getString(j));
        jdField_c_of_type_JavaLangString = a(paramString.getString(k));
        jdField_b_of_type_Long = paramString.getLong(m);
        jdField_a_of_type_Long = paramString.getLong(n);
        jdField_c_of_type_Long = paramString.getLong(i1);
        f = a(paramString.getString(i2));
        jdField_a_of_type_JavaLangString = a(paramString.getString(i3));
        jdField_b_of_type_JavaLangString = a(paramString.getString(i4));
        jdField_a_of_type_Int = paramString.getInt(i5);
        if (QLog.isColorLevel()) {
          QLog.d("MigrateSubscribeDB", 2, "read Subscribe RecentDataResults:(mDraft,mDraftTime,mLastMsg,mLastMsgID,mLastMsgTime,mLastReorderTime,mSubscribeHeadUrl,mSubscribeID,mSubscribeName,mUnreadCount)=(" + d + "," + e + "," + jdField_c_of_type_JavaLangString + "," + jdField_b_of_type_Long + "," + jdField_a_of_type_Long + "," + jdField_c_of_type_Long + f + "," + jdField_a_of_type_JavaLangString + "," + jdField_b_of_type_JavaLangString + "," + jdField_a_of_type_Int + ")");
        }
        localArrayList.add(localReb);
        boolean bool = paramString.moveToNext();
        if (bool) {
          continue;
        }
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.e("MigrateSubscribeDB", 2, "read Subscribe Recent Datas Exception", localException);
        paramString.close();
        continue;
      }
      finally
      {
        paramString.close();
      }
      paramString = localArrayList;
      if (localRea == null) {
        break;
      }
      localRea.close();
      return localArrayList;
      if (QLog.isColorLevel())
      {
        QLog.d("MigrateSubscribeDB", 2, "getSubscribeRecentDataList select from RecentSubscribeData no data");
        continue;
        if (QLog.isColorLevel()) {
          QLog.d("MigrateSubscribeDB", 2, "getSubscribeRecentDataList fail curSubReadInJoy is null");
        }
      }
    }
  }
  
  /* Error */
  private List a(String paramString1, String paramString2, List paramList, String paramString3)
  {
    // Byte code:
    //   0: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3: ifeq +56 -> 59
    //   6: ldc 11
    //   8: iconst_2
    //   9: new 193	java/lang/StringBuilder
    //   12: dup
    //   13: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   16: ldc -17
    //   18: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   21: aload_1
    //   22: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   25: ldc -15
    //   27: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   30: aload_2
    //   31: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   34: ldc -13
    //   36: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   39: aload_3
    //   40: invokevirtual 246	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   43: ldc -8
    //   45: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   48: aload 4
    //   50: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   53: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   56: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   59: invokestatic 253	java/lang/System:nanoTime	()J
    //   62: lstore 13
    //   64: new 88	java/util/ArrayList
    //   67: dup
    //   68: invokespecial 89	java/util/ArrayList:<init>	()V
    //   71: astore 22
    //   73: aload_2
    //   74: ifnull +7 -> 81
    //   77: aload_3
    //   78: ifnonnull +19 -> 97
    //   81: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   84: ifeq +11 -> 95
    //   87: ldc 11
    //   89: iconst_2
    //   90: ldc -1
    //   92: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   95: aconst_null
    //   96: areturn
    //   97: aload_3
    //   98: invokeinterface 258 1 0
    //   103: istore 6
    //   105: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   108: ifeq +30 -> 138
    //   111: ldc 11
    //   113: iconst_2
    //   114: new 193	java/lang/StringBuilder
    //   117: dup
    //   118: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   121: ldc_w 260
    //   124: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   127: iload 6
    //   129: invokevirtual 208	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   132: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   135: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   138: iconst_0
    //   139: istore 5
    //   141: iload 5
    //   143: iload 6
    //   145: if_icmpge +942 -> 1087
    //   148: aload_3
    //   149: iload 5
    //   151: invokeinterface 264 2 0
    //   156: checkcast 155	reb
    //   159: getfield 185	reb:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   162: aload_2
    //   163: invokevirtual 267	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   166: ifeq +681 -> 847
    //   169: aload_3
    //   170: iload 5
    //   172: invokeinterface 264 2 0
    //   177: checkcast 155	reb
    //   180: astore_3
    //   181: aload_3
    //   182: ifnull +899 -> 1081
    //   185: aload_3
    //   186: getfield 191	reb:jdField_a_of_type_Int	I
    //   189: istore 5
    //   191: ldc_w 269
    //   194: astore_3
    //   195: iload 5
    //   197: ifle +7 -> 204
    //   200: ldc_w 271
    //   203: astore_3
    //   204: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   207: ifeq +29 -> 236
    //   210: ldc 11
    //   212: iconst_2
    //   213: new 193	java/lang/StringBuilder
    //   216: dup
    //   217: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   220: ldc_w 273
    //   223: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   226: aload_3
    //   227: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   230: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   233: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   236: new 103	rea
    //   239: dup
    //   240: aload_0
    //   241: invokestatic 109	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   244: aload_1
    //   245: bipush 80
    //   247: invokespecial 112	rea:<init>	(Lcom/tencent/mobileqq/startup/step/MigrateSubscribeDB;Landroid/content/Context;Ljava/lang/String;I)V
    //   250: astore_1
    //   251: aload_1
    //   252: invokevirtual 116	rea:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   255: iconst_0
    //   256: ldc_w 275
    //   259: aconst_null
    //   260: ldc_w 277
    //   263: iconst_1
    //   264: anewarray 75	java/lang/String
    //   267: dup
    //   268: iconst_0
    //   269: aload_2
    //   270: aastore
    //   271: aconst_null
    //   272: aconst_null
    //   273: ldc_w 279
    //   276: aload_3
    //   277: invokevirtual 283	android/database/sqlite/SQLiteDatabase:query	(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   280: astore_2
    //   281: aload_2
    //   282: ifnull +734 -> 1016
    //   285: aload_2
    //   286: invokeinterface 129 1 0
    //   291: ifeq +698 -> 989
    //   294: aload_2
    //   295: ldc_w 285
    //   298: invokeinterface 135 2 0
    //   303: istore 7
    //   305: aload_2
    //   306: ldc_w 287
    //   309: invokeinterface 135 2 0
    //   314: istore 8
    //   316: aload_2
    //   317: ldc_w 289
    //   320: invokeinterface 135 2 0
    //   325: istore 9
    //   327: aload_2
    //   328: ldc_w 291
    //   331: invokeinterface 135 2 0
    //   336: istore 10
    //   338: aload_2
    //   339: ldc_w 293
    //   342: invokeinterface 135 2 0
    //   347: istore 11
    //   349: aload_2
    //   350: ldc_w 295
    //   353: invokeinterface 135 2 0
    //   358: istore 12
    //   360: aload_2
    //   361: iload 7
    //   363: invokeinterface 175 2 0
    //   368: lstore 15
    //   370: aload_2
    //   371: iload 8
    //   373: invokeinterface 162 2 0
    //   378: astore 24
    //   380: aload_2
    //   381: iload 9
    //   383: invokeinterface 162 2 0
    //   388: astore_3
    //   389: aload_2
    //   390: iload 10
    //   392: invokeinterface 162 2 0
    //   397: astore 23
    //   399: aload_2
    //   400: iload 11
    //   402: invokeinterface 175 2 0
    //   407: lstore 17
    //   409: aload_2
    //   410: iload 12
    //   412: invokeinterface 175 2 0
    //   417: lstore 19
    //   419: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   422: ifeq +84 -> 506
    //   425: ldc 11
    //   427: iconst_2
    //   428: new 193	java/lang/StringBuilder
    //   431: dup
    //   432: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   435: ldc_w 297
    //   438: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   441: lload 15
    //   443: invokevirtual 205	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   446: ldc -54
    //   448: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   451: aload 24
    //   453: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   456: ldc -54
    //   458: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   461: aload_3
    //   462: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   465: ldc -54
    //   467: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   470: aload 23
    //   472: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   475: ldc -54
    //   477: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   480: lload 17
    //   482: invokevirtual 205	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   485: ldc -54
    //   487: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   490: lload 19
    //   492: invokevirtual 205	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   495: ldc -46
    //   497: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   500: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   503: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   506: aload 24
    //   508: invokestatic 300	com/tencent/biz/pubaccount/subscript/SubscriptUtil:a	(Ljava/lang/String;)Ljava/lang/String;
    //   511: astore_3
    //   512: aload_3
    //   513: invokestatic 306	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   516: ifne +423 -> 939
    //   519: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   522: ifeq +40 -> 562
    //   525: ldc 11
    //   527: iconst_2
    //   528: new 193	java/lang/StringBuilder
    //   531: dup
    //   532: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   535: ldc_w 308
    //   538: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   541: aload 24
    //   543: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   546: ldc_w 310
    //   549: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   552: aload_3
    //   553: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   556: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   559: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   562: aload 23
    //   564: invokestatic 315	com/tencent/biz/pubaccount/util/PAMessageUtil:a	(Ljava/lang/String;)Lcom/tencent/mobileqq/data/PAMessage;
    //   567: astore 25
    //   569: aload 25
    //   571: ifnull +350 -> 921
    //   574: sipush 62530
    //   577: invokestatic 320	com/tencent/mobileqq/service/message/MessageRecordFactory:a	(I)Lcom/tencent/mobileqq/data/MessageRecord;
    //   580: checkcast 322	com/tencent/mobileqq/data/MessageForPubAccount
    //   583: astore 24
    //   585: aload 24
    //   587: sipush 62530
    //   590: putfield 325	com/tencent/mobileqq/data/MessageForPubAccount:msgtype	I
    //   593: aload 24
    //   595: sipush 1008
    //   598: putfield 328	com/tencent/mobileqq/data/MessageForPubAccount:istroop	I
    //   601: aload 24
    //   603: aload 23
    //   605: putfield 331	com/tencent/mobileqq/data/MessageForPubAccount:msg	Ljava/lang/String;
    //   608: aload 24
    //   610: aload 25
    //   612: putfield 335	com/tencent/mobileqq/data/MessageForPubAccount:mPAMessage	Lcom/tencent/mobileqq/data/PAMessage;
    //   615: aload 24
    //   617: aload 25
    //   619: invokestatic 338	com/tencent/biz/pubaccount/util/PAMessageUtil:a	(Lcom/tencent/mobileqq/data/PAMessage;)[B
    //   622: putfield 342	com/tencent/mobileqq/data/MessageForPubAccount:msgData	[B
    //   625: aload 24
    //   627: aload_3
    //   628: putfield 345	com/tencent/mobileqq/data/MessageForPubAccount:frienduin	Ljava/lang/String;
    //   631: aload 24
    //   633: aload_3
    //   634: putfield 348	com/tencent/mobileqq/data/MessageForPubAccount:senderuin	Ljava/lang/String;
    //   637: aload 24
    //   639: aload 4
    //   641: putfield 351	com/tencent/mobileqq/data/MessageForPubAccount:selfuin	Ljava/lang/String;
    //   644: aload 24
    //   646: lload 17
    //   648: putfield 354	com/tencent/mobileqq/data/MessageForPubAccount:time	J
    //   651: aload 24
    //   653: lload 17
    //   655: putfield 357	com/tencent/mobileqq/data/MessageForPubAccount:msgseq	J
    //   658: aload 24
    //   660: aload_0
    //   661: invokespecial 359	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:a	()I
    //   664: i2l
    //   665: putfield 362	com/tencent/mobileqq/data/MessageForPubAccount:shmsgseq	J
    //   668: aload 24
    //   670: aload_0
    //   671: invokespecial 364	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:a	()J
    //   674: putfield 367	com/tencent/mobileqq/data/MessageForPubAccount:msgUid	J
    //   677: iload 5
    //   679: ifle +236 -> 915
    //   682: iconst_0
    //   683: istore 21
    //   685: aload 24
    //   687: iload 21
    //   689: putfield 370	com/tencent/mobileqq/data/MessageForPubAccount:isread	Z
    //   692: aload 22
    //   694: aload 24
    //   696: invokeinterface 217 2 0
    //   701: pop
    //   702: iload 5
    //   704: iconst_1
    //   705: isub
    //   706: istore 5
    //   708: goto +384 -> 1092
    //   711: aload_2
    //   712: invokeinterface 220 1 0
    //   717: istore 21
    //   719: iload 6
    //   721: istore 5
    //   723: iload 21
    //   725: ifne -365 -> 360
    //   728: aload_2
    //   729: invokeinterface 223 1 0
    //   734: aload_1
    //   735: ifnull +7 -> 742
    //   738: aload_1
    //   739: invokevirtual 224	rea:close	()V
    //   742: aload 22
    //   744: ifnull +287 -> 1031
    //   747: aload 22
    //   749: invokeinterface 258 1 0
    //   754: ifle +277 -> 1031
    //   757: iconst_0
    //   758: istore 5
    //   760: iload 5
    //   762: aload 22
    //   764: invokeinterface 258 1 0
    //   769: iconst_1
    //   770: isub
    //   771: if_icmpge +260 -> 1031
    //   774: aload 22
    //   776: invokeinterface 258 1 0
    //   781: iconst_1
    //   782: isub
    //   783: istore 6
    //   785: iload 6
    //   787: iload 5
    //   789: if_icmple +218 -> 1007
    //   792: aload 22
    //   794: iload 6
    //   796: invokeinterface 264 2 0
    //   801: checkcast 372	com/tencent/mobileqq/data/MessageRecord
    //   804: getfield 373	com/tencent/mobileqq/data/MessageRecord:msg	Ljava/lang/String;
    //   807: aload 22
    //   809: iload 5
    //   811: invokeinterface 264 2 0
    //   816: checkcast 372	com/tencent/mobileqq/data/MessageRecord
    //   819: getfield 373	com/tencent/mobileqq/data/MessageRecord:msg	Ljava/lang/String;
    //   822: invokevirtual 267	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   825: ifeq +13 -> 838
    //   828: aload 22
    //   830: iload 6
    //   832: invokeinterface 376 2 0
    //   837: pop
    //   838: iload 6
    //   840: iconst_1
    //   841: isub
    //   842: istore 6
    //   844: goto -59 -> 785
    //   847: iload 5
    //   849: iconst_1
    //   850: iadd
    //   851: istore 5
    //   853: goto -712 -> 141
    //   856: astore 23
    //   858: aload 23
    //   860: invokevirtual 229	java/lang/Exception:printStackTrace	()V
    //   863: goto -248 -> 615
    //   866: astore_3
    //   867: aload_3
    //   868: invokevirtual 229	java/lang/Exception:printStackTrace	()V
    //   871: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   874: ifeq +13 -> 887
    //   877: ldc 11
    //   879: iconst_2
    //   880: ldc_w 378
    //   883: aload_3
    //   884: invokestatic 234	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   887: aload_2
    //   888: invokeinterface 223 1 0
    //   893: goto -159 -> 734
    //   896: astore 23
    //   898: aload 23
    //   900: invokevirtual 229	java/lang/Exception:printStackTrace	()V
    //   903: goto -278 -> 625
    //   906: astore_1
    //   907: aload_2
    //   908: invokeinterface 223 1 0
    //   913: aload_1
    //   914: athrow
    //   915: iconst_1
    //   916: istore 21
    //   918: goto -233 -> 685
    //   921: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   924: ifeq +175 -> 1099
    //   927: ldc 11
    //   929: iconst_2
    //   930: ldc_w 380
    //   933: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   936: goto +163 -> 1099
    //   939: iload 5
    //   941: istore 6
    //   943: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   946: ifeq -235 -> 711
    //   949: ldc 11
    //   951: iconst_2
    //   952: new 193	java/lang/StringBuilder
    //   955: dup
    //   956: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   959: ldc_w 382
    //   962: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   965: aload 24
    //   967: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   970: ldc_w 384
    //   973: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   976: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   979: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   982: iload 5
    //   984: istore 6
    //   986: goto -275 -> 711
    //   989: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   992: ifeq -264 -> 728
    //   995: ldc 11
    //   997: iconst_2
    //   998: ldc_w 386
    //   1001: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1004: goto -276 -> 728
    //   1007: iload 5
    //   1009: iconst_1
    //   1010: iadd
    //   1011: istore 5
    //   1013: goto -253 -> 760
    //   1016: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1019: ifeq +12 -> 1031
    //   1022: ldc 11
    //   1024: iconst_2
    //   1025: ldc_w 388
    //   1028: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1031: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1034: ifeq +44 -> 1078
    //   1037: ldc 11
    //   1039: iconst_2
    //   1040: new 193	java/lang/StringBuilder
    //   1043: dup
    //   1044: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   1047: ldc_w 390
    //   1050: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1053: invokestatic 253	java/lang/System:nanoTime	()J
    //   1056: lload 13
    //   1058: lsub
    //   1059: ldc2_w 391
    //   1062: ldiv
    //   1063: invokevirtual 205	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1066: ldc_w 394
    //   1069: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1072: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1075: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1078: aload 22
    //   1080: areturn
    //   1081: iconst_0
    //   1082: istore 5
    //   1084: goto -893 -> 191
    //   1087: aconst_null
    //   1088: astore_3
    //   1089: goto -908 -> 181
    //   1092: iload 5
    //   1094: istore 6
    //   1096: goto -385 -> 711
    //   1099: goto -7 -> 1092
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1102	0	this	MigrateSubscribeDB
    //   0	1102	1	paramString1	String
    //   0	1102	2	paramString2	String
    //   0	1102	3	paramList	List
    //   0	1102	4	paramString3	String
    //   139	954	5	i	int
    //   103	992	6	j	int
    //   303	59	7	k	int
    //   314	58	8	m	int
    //   325	57	9	n	int
    //   336	55	10	i1	int
    //   347	54	11	i2	int
    //   358	53	12	i3	int
    //   62	995	13	l1	long
    //   368	74	15	l2	long
    //   407	247	17	l3	long
    //   417	74	19	l4	long
    //   683	234	21	bool	boolean
    //   71	1008	22	localArrayList	ArrayList
    //   397	207	23	str	String
    //   856	3	23	localException1	Exception
    //   896	3	23	localException2	Exception
    //   378	588	24	localObject	Object
    //   567	51	25	localPAMessage	com.tencent.mobileqq.data.PAMessage
    // Exception table:
    //   from	to	target	type
    //   608	615	856	java/lang/Exception
    //   285	360	866	java/lang/Exception
    //   360	506	866	java/lang/Exception
    //   506	562	866	java/lang/Exception
    //   562	569	866	java/lang/Exception
    //   574	608	866	java/lang/Exception
    //   625	677	866	java/lang/Exception
    //   685	702	866	java/lang/Exception
    //   711	719	866	java/lang/Exception
    //   858	863	866	java/lang/Exception
    //   898	903	866	java/lang/Exception
    //   921	936	866	java/lang/Exception
    //   943	982	866	java/lang/Exception
    //   989	1004	866	java/lang/Exception
    //   615	625	896	java/lang/Exception
    //   285	360	906	finally
    //   360	506	906	finally
    //   506	562	906	finally
    //   562	569	906	finally
    //   574	608	906	finally
    //   608	615	906	finally
    //   615	625	906	finally
    //   625	677	906	finally
    //   685	702	906	finally
    //   711	719	906	finally
    //   858	863	906	finally
    //   867	887	906	finally
    //   898	903	906	finally
    //   921	936	906	finally
    //   943	982	906	finally
    //   989	1004	906	finally
  }
  
  private List a(List paramList, String[] paramArrayOfString)
  {
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    if (i < paramList.size())
    {
      String str = getjdField_a_of_type_JavaLangString;
      int j = 0;
      for (;;)
      {
        if (j < paramArrayOfString.length)
        {
          if (paramArrayOfString[j].equals(str)) {
            localArrayList.add(str);
          }
        }
        else
        {
          i += 1;
          break;
        }
        j += 1;
      }
    }
    return localArrayList;
  }
  
  private void a()
  {
    Object localObject3;
    HashMap localHashMap;
    Object localObject2;
    int j;
    int i;
    if ((jdField_a_of_type_JavaUtilList != null) && (!jdField_a_of_type_JavaUtilList.isEmpty()))
    {
      Object localObject1 = jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl;
      localObject1 = BaseApplicationImpl.a().getAllAccounts();
      if (localObject1 != null)
      {
        try
        {
          localObject3 = jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.a().getAccount();
          localHashMap = new HashMap(jdField_a_of_type_JavaUtilList.size());
          localObject2 = jdField_a_of_type_JavaUtilList.iterator();
          while (((Iterator)localObject2).hasNext())
          {
            File localFile = (File)((Iterator)localObject2).next();
            if (localFile != null)
            {
              localHashMap.put(localFile.getName().replace(".db", ""), localFile);
              continue;
              return;
            }
          }
        }
        catch (Exception localException)
        {
          if (QLog.isColorLevel()) {
            QLog.d("MigrateSubscribeDB", 2, "sorMainDbFiles error", localException);
          }
        }
        localObject2 = new ArrayList(jdField_a_of_type_JavaUtilList.size());
        if (QLog.isColorLevel()) {
          QLog.d("MigrateSubscribeDB", 2, "sorMainDbFiles currentUin: " + (String)localObject3);
        }
        if (!TextUtils.isEmpty((CharSequence)localObject3))
        {
          localObject3 = (File)localHashMap.remove(localObject3);
          if (localObject3 != null) {
            ((List)localObject2).add(localObject3);
          }
        }
        j = localException.size();
        i = 0;
      }
    }
    for (;;)
    {
      if (i < j)
      {
        localObject3 = (SimpleAccount)localException.get(i);
        if ((localObject3 != null) && (((SimpleAccount)localObject3).getUin() != null))
        {
          if (QLog.isColorLevel()) {
            QLog.d("MigrateSubscribeDB", 2, "sorMainDbFiles uin: " + ((SimpleAccount)localObject3).getUin());
          }
          localObject3 = (File)localHashMap.remove(((SimpleAccount)localObject3).getUin());
          if (localObject3 != null) {
            ((List)localObject2).add(localObject3);
          }
        }
      }
      else
      {
        Iterator localIterator = localHashMap.values().iterator();
        while (localIterator.hasNext()) {
          ((List)localObject2).add((File)localIterator.next());
        }
        jdField_a_of_type_JavaUtilList = ((List)localObject2);
        return;
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("MigrateSubscribeDB", 2, "sorMainDbFiles no account login");
        return;
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("MigrateSubscribeDB", 2, "sorMainDbFiles mUinMainDBFiles is empty");
        return;
      }
      i += 1;
    }
  }
  
  private void a(String paramString)
  {
    long l = System.nanoTime();
    int j = BaseApplicationImpl.a().getSharedPreferences("readinjoy_" + paramString + "_" + 1, 0).getInt("updated_msg_count", 0);
    if (j == 0)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "updateFolderUnReadCount readInJoyUnreadCount == 0");
      }
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("MigrateSubscribeDB", 2, "updateFolderUnReadCount readinjoy new unread count: " + j);
    }
    paramString = BaseApplicationImpl.a().getSharedPreferences(paramString, 0);
    Object localObject2 = paramString.getString("troopbar_assist_new_unread_list", "");
    if (ReadInJoyHelper.b()) {
      QLog.i("MigrateSubscribeDB", 2, "updateFolderUnReadCount, get troopbar new unread list ( newMsgStr ): " + (String)localObject2);
    }
    Object localObject1 = new ConcurrentHashMap();
    for (;;)
    {
      Object localObject3;
      Object localObject4;
      String str;
      try
      {
        localObject2 = new JSONArray((String)localObject2);
        if (!QLog.isColorLevel()) {
          break label634;
        }
        QLog.d("MigrateSubscribeDB", 2, "updateFolderUnReadCount jsonArray length: " + ((JSONArray)localObject2).length());
      }
      catch (Exception paramString)
      {
        paramString.printStackTrace();
        if (!QLog.isColorLevel()) {
          break label376;
        }
        QLog.e("MigrateSubscribeDB", 2, "updateFolderUnReadCount:" + paramString.toString(), paramString);
      }
      if (i < ((JSONArray)localObject2).length())
      {
        localObject3 = ((JSONArray)localObject2).getJSONObject(i);
        localObject4 = ((JSONObject)localObject3).keys();
        if (((Iterator)localObject4).hasNext())
        {
          str = (String)((Iterator)localObject4).next();
          if (QLog.isColorLevel()) {
            QLog.d("MigrateSubscribeDB", 2, "updateFolderUnReadCount newMsgMap put key: " + str + " | value: " + ((JSONObject)localObject3).getInt(str));
          }
          ((ConcurrentHashMap)localObject1).put(str, Integer.valueOf(((JSONObject)localObject3).getInt(str)));
          continue;
        }
      }
      for (;;)
      {
        label376:
        if (!QLog.isColorLevel()) {
          break label632;
        }
        QLog.d("MigrateSubscribeDB", 2, "updateFolderUnReadCount total cost = " + (System.nanoTime() - l) / 1000000L + " ms ");
        return;
        i += 1;
        break;
        ((ConcurrentHashMap)localObject1).put(AppConstants.aQ, Integer.valueOf(j));
        localObject2 = ((ConcurrentHashMap)localObject1).keySet().iterator();
        localObject3 = new JSONArray();
        while (((Iterator)localObject2).hasNext())
        {
          localObject4 = new JSONObject();
          str = (String)((Iterator)localObject2).next();
          try
          {
            ((JSONObject)localObject4).put(str, ((ConcurrentHashMap)localObject1).get(str));
            ((JSONArray)localObject3).put(localObject4);
          }
          catch (JSONException localJSONException)
          {
            localJSONException.printStackTrace();
          }
        }
        localObject1 = ((JSONArray)localObject3).toString();
        if (QLog.isColorLevel()) {
          QLog.d("MigrateSubscribeDB", 2, "updateFolderUnReadCount save newMsgStr into sp:" + (String)localObject1);
        }
        paramString = paramString.edit();
        paramString.putString("troopbar_assist_new_unread_list", (String)localObject1);
        paramString.commit();
        if (ReadInJoyHelper.b()) {
          QLog.i("MigrateSubscribeDB", 2, "updateFolderUnReadCount, put troopbar new list ( newMsgStr ): " + (String)localObject1);
        }
      }
      label632:
      break;
      label634:
      int i = 0;
    }
  }
  
  private void a(String paramString1, String paramString2, String[] paramArrayOfString, List paramList, EntityManager paramEntityManager)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MigrateSubscribeDB", 2, "MigrateAllToMessageRecord  fileName is : " + paramString1 + "uinStr : " + paramString2);
    }
    if (paramArrayOfString != null)
    {
      int j = paramArrayOfString.length;
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "Migrate subscribe subscribeMsgIDs size: " + j);
      }
      int i = 0;
      while (i < j)
      {
        List localList = a(paramString1, paramArrayOfString[i], paramList, paramString2);
        a(paramArrayOfString[i], paramList, localList);
        c(localList, paramEntityManager);
        i += 1;
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("MigrateSubscribeDB", 2, "Migrate subscribe subscribeMsgIDs is null");
    }
  }
  
  private void a(String paramString, List paramList1, List paramList2)
  {
    if ((paramString == null) || (paramList1 == null) || (paramList2 == null) || (paramList2.size() <= 0)) {
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "updateSubscribeRecentDataList subscribleID is null or subscribeRecentDataList is null or subscribeMsgList is null");
      }
    }
    for (;;)
    {
      return;
      long l = getsize1time;
      int j = paramList1.size();
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "updateSubscribeRecentDataList subscribeRecentDataList size: " + j);
      }
      int i = 0;
      while (i < j)
      {
        if (getjdField_a_of_type_JavaLangString.equals(paramString))
        {
          paramString = (reb)paramList1.get(i);
          jdField_c_of_type_Long = l;
          paramList1.set(i, paramString);
          return;
        }
        i += 1;
      }
    }
  }
  
  private void a(List paramList, EntityManager paramEntityManager)
  {
    long l = System.nanoTime();
    if (paramList == null) {
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "migrateToTroopBar fail subscribeRecentDataList is null");
      }
    }
    do
    {
      return;
      int j = paramList.size();
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "migrateToTroopBar subscribeRecentDataList list size: " + j);
      }
      int i = 0;
      if (i < j)
      {
        reb localReb = (reb)paramList.get(i);
        if (QLog.isColorLevel()) {
          QLog.d("MigrateSubscribeDB", 2, "migrateToTroopBar subscribeRecentData: " + localReb);
        }
        String str = SubscriptUtil.a(jdField_a_of_type_JavaLangString);
        if (!TextUtils.isEmpty(str))
        {
          TroopBarData localTroopBarData = new TroopBarData();
          mUin = str;
          mLastMsgTime = jdField_c_of_type_Long;
          mLastDraftTime = 0L;
          if (QLog.isColorLevel()) {
            QLog.d("MigrateSubscribeDB", 2, "migrateToTroopBar subscribeid[" + jdField_a_of_type_JavaLangString + "] create new TroopBarData: " + localTroopBarData);
          }
          paramEntityManager.b(localTroopBarData);
        }
        for (;;)
        {
          i += 1;
          break;
          if (QLog.isColorLevel()) {
            QLog.d("MigrateSubscribeDB", 2, "migrateToTroopBar we can't subscribeid[" + jdField_a_of_type_JavaLangString + "]'s uin");
          }
        }
      }
    } while (!QLog.isColorLevel());
    QLog.d("MigrateSubscribeDB", 2, "migrateToTroopBar total cost = " + (System.nanoTime() - l) / 1000000L + " ms ");
  }
  
  /* Error */
  private boolean a(File paramFile)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnonnull +24 -> 25
    //   4: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   7: ifeq +12 -> 19
    //   10: ldc 11
    //   12: iconst_2
    //   13: ldc_w 654
    //   16: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   19: iconst_0
    //   20: istore 4
    //   22: iload 4
    //   24: ireturn
    //   25: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   28: ifeq +32 -> 60
    //   31: ldc 11
    //   33: iconst_2
    //   34: new 193	java/lang/StringBuilder
    //   37: dup
    //   38: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   41: ldc_w 656
    //   44: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   47: aload_1
    //   48: invokevirtual 659	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   51: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   54: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   57: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   60: invokestatic 253	java/lang/System:nanoTime	()J
    //   63: lstore 5
    //   65: aload_1
    //   66: invokevirtual 439	java/io/File:getName	()Ljava/lang/String;
    //   69: astore 11
    //   71: aconst_null
    //   72: astore 7
    //   74: aconst_null
    //   75: astore 16
    //   77: aconst_null
    //   78: astore 10
    //   80: aconst_null
    //   81: astore 9
    //   83: aconst_null
    //   84: astore 15
    //   86: aconst_null
    //   87: astore 12
    //   89: aconst_null
    //   90: astore 8
    //   92: aconst_null
    //   93: astore 14
    //   95: aload_0
    //   96: getfield 33	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:jdField_b_of_type_JavaUtilList	Ljava/util/List;
    //   99: invokeinterface 397 1 0
    //   104: ifne +15 -> 119
    //   107: aload_0
    //   108: getfield 35	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:c	Ljava/util/List;
    //   111: invokeinterface 397 1 0
    //   116: ifeq +57 -> 173
    //   119: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   122: ifeq +12 -> 134
    //   125: ldc 11
    //   127: iconst_2
    //   128: ldc_w 661
    //   131: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   134: iconst_0
    //   135: istore 4
    //   137: iconst_0
    //   138: ifeq +11 -> 149
    //   141: new 663	java/lang/NullPointerException
    //   144: dup
    //   145: invokespecial 664	java/lang/NullPointerException:<init>	()V
    //   148: athrow
    //   149: iconst_0
    //   150: ifeq +11 -> 161
    //   153: new 663	java/lang/NullPointerException
    //   156: dup
    //   157: invokespecial 664	java/lang/NullPointerException:<init>	()V
    //   160: athrow
    //   161: iconst_0
    //   162: ifeq -140 -> 22
    //   165: new 663	java/lang/NullPointerException
    //   168: dup
    //   169: invokespecial 664	java/lang/NullPointerException:<init>	()V
    //   172: athrow
    //   173: aload 11
    //   175: ldc_w 441
    //   178: ldc_w 443
    //   181: invokevirtual 447	java/lang/String:replace	(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    //   184: invokestatic 670	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   187: invokestatic 673	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   190: astore 17
    //   192: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   195: ifeq +30 -> 225
    //   198: ldc 11
    //   200: iconst_2
    //   201: new 193	java/lang/StringBuilder
    //   204: dup
    //   205: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   208: ldc_w 675
    //   211: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   214: aload 17
    //   216: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   219: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   222: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   225: aload_0
    //   226: getfield 33	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:jdField_b_of_type_JavaUtilList	Ljava/util/List;
    //   229: invokeinterface 397 1 0
    //   234: ifne +471 -> 705
    //   237: aload_0
    //   238: getfield 33	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:jdField_b_of_type_JavaUtilList	Ljava/util/List;
    //   241: invokeinterface 425 1 0
    //   246: astore 7
    //   248: aload 7
    //   250: invokeinterface 430 1 0
    //   255: ifeq +1222 -> 1477
    //   258: aload 7
    //   260: invokeinterface 434 1 0
    //   265: checkcast 436	java/io/File
    //   268: invokevirtual 439	java/io/File:getName	()Ljava/lang/String;
    //   271: astore 11
    //   273: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   276: ifeq +30 -> 306
    //   279: ldc 11
    //   281: iconst_2
    //   282: new 193	java/lang/StringBuilder
    //   285: dup
    //   286: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   289: ldc_w 677
    //   292: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   295: aload 11
    //   297: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   300: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   303: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   306: aload 11
    //   308: aload 17
    //   310: invokevirtual 680	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   313: ifeq +241 -> 554
    //   316: aload 11
    //   318: astore 7
    //   320: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   323: ifeq +1157 -> 1480
    //   326: ldc 11
    //   328: iconst_2
    //   329: new 193	java/lang/StringBuilder
    //   332: dup
    //   333: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   336: ldc_w 682
    //   339: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   342: aload 11
    //   344: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   347: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   350: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   353: aload 11
    //   355: astore 7
    //   357: goto +1123 -> 1480
    //   360: aload_0
    //   361: getfield 35	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:c	Ljava/util/List;
    //   364: invokeinterface 397 1 0
    //   369: ifne +454 -> 823
    //   372: aload_0
    //   373: getfield 35	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:c	Ljava/util/List;
    //   376: invokeinterface 425 1 0
    //   381: astore 7
    //   383: aload 7
    //   385: invokeinterface 430 1 0
    //   390: ifeq +1081 -> 1471
    //   393: aload 7
    //   395: invokeinterface 434 1 0
    //   400: checkcast 436	java/io/File
    //   403: invokevirtual 439	java/io/File:getName	()Ljava/lang/String;
    //   406: astore 13
    //   408: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   411: ifeq +30 -> 441
    //   414: ldc 11
    //   416: iconst_2
    //   417: new 193	java/lang/StringBuilder
    //   420: dup
    //   421: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   424: ldc_w 684
    //   427: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   430: aload 13
    //   432: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   435: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   438: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   441: aload 13
    //   443: aload 17
    //   445: invokevirtual 680	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   448: ifeq +328 -> 776
    //   451: aload 13
    //   453: astore 7
    //   455: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   458: ifeq +1029 -> 1487
    //   461: ldc 11
    //   463: iconst_2
    //   464: new 193	java/lang/StringBuilder
    //   467: dup
    //   468: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   471: ldc_w 686
    //   474: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   477: aload 13
    //   479: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   482: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   485: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   488: aload 13
    //   490: astore 7
    //   492: goto +995 -> 1487
    //   495: aload 13
    //   497: ifnonnull +352 -> 849
    //   500: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   503: ifeq +12 -> 515
    //   506: ldc 11
    //   508: iconst_2
    //   509: ldc_w 688
    //   512: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   515: iconst_1
    //   516: istore 4
    //   518: iconst_0
    //   519: ifeq +11 -> 530
    //   522: new 663	java/lang/NullPointerException
    //   525: dup
    //   526: invokespecial 664	java/lang/NullPointerException:<init>	()V
    //   529: athrow
    //   530: iconst_0
    //   531: ifeq +11 -> 542
    //   534: new 663	java/lang/NullPointerException
    //   537: dup
    //   538: invokespecial 664	java/lang/NullPointerException:<init>	()V
    //   541: athrow
    //   542: iconst_0
    //   543: ifeq -521 -> 22
    //   546: new 663	java/lang/NullPointerException
    //   549: dup
    //   550: invokespecial 664	java/lang/NullPointerException:<init>	()V
    //   553: athrow
    //   554: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   557: ifeq -309 -> 248
    //   560: ldc 11
    //   562: iconst_2
    //   563: new 193	java/lang/StringBuilder
    //   566: dup
    //   567: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   570: ldc_w 690
    //   573: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   576: aload 11
    //   578: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   581: ldc_w 692
    //   584: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   587: aload 17
    //   589: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   592: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   595: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   598: goto -350 -> 248
    //   601: astore 10
    //   603: aconst_null
    //   604: astore 7
    //   606: aconst_null
    //   607: astore_1
    //   608: aload 10
    //   610: invokevirtual 229	java/lang/Exception:printStackTrace	()V
    //   613: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   616: ifeq +12 -> 628
    //   619: ldc 11
    //   621: iconst_2
    //   622: ldc_w 694
    //   625: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   628: aload 7
    //   630: ifnull +8 -> 638
    //   633: aload 7
    //   635: invokevirtual 698	com/tencent/mobileqq/app/SQLiteDatabase:d	()V
    //   638: aload 8
    //   640: ifnull +8 -> 648
    //   643: aload 8
    //   645: invokevirtual 700	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   648: aload_1
    //   649: ifnull +7 -> 656
    //   652: aload_1
    //   653: invokevirtual 703	com/tencent/mobileqq/persistence/EntityManagerFactory:close	()V
    //   656: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   659: ifeq +44 -> 703
    //   662: ldc 11
    //   664: iconst_2
    //   665: new 193	java/lang/StringBuilder
    //   668: dup
    //   669: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   672: ldc_w 705
    //   675: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   678: invokestatic 253	java/lang/System:nanoTime	()J
    //   681: lload 5
    //   683: lsub
    //   684: ldc2_w 391
    //   687: ldiv
    //   688: invokevirtual 205	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   691: ldc_w 707
    //   694: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   697: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   700: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   703: iconst_1
    //   704: ireturn
    //   705: aload 7
    //   707: astore 11
    //   709: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   712: ifeq -352 -> 360
    //   715: ldc 11
    //   717: iconst_2
    //   718: ldc_w 709
    //   721: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   724: aload 7
    //   726: astore 11
    //   728: goto -368 -> 360
    //   731: astore_1
    //   732: aload 10
    //   734: astore 7
    //   736: aload 9
    //   738: astore 8
    //   740: aload 14
    //   742: astore 9
    //   744: aload 9
    //   746: ifnull +8 -> 754
    //   749: aload 9
    //   751: invokevirtual 698	com/tencent/mobileqq/app/SQLiteDatabase:d	()V
    //   754: aload 8
    //   756: ifnull +8 -> 764
    //   759: aload 8
    //   761: invokevirtual 700	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   764: aload 7
    //   766: ifnull +8 -> 774
    //   769: aload 7
    //   771: invokevirtual 703	com/tencent/mobileqq/persistence/EntityManagerFactory:close	()V
    //   774: aload_1
    //   775: athrow
    //   776: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   779: ifeq -396 -> 383
    //   782: ldc 11
    //   784: iconst_2
    //   785: new 193	java/lang/StringBuilder
    //   788: dup
    //   789: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   792: ldc_w 711
    //   795: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   798: aload 13
    //   800: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   803: ldc_w 692
    //   806: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   809: aload 17
    //   811: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   814: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   817: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   820: goto -437 -> 383
    //   823: aload 16
    //   825: astore 13
    //   827: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   830: ifeq -335 -> 495
    //   833: ldc 11
    //   835: iconst_2
    //   836: ldc_w 713
    //   839: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   842: aload 16
    //   844: astore 13
    //   846: goto -351 -> 495
    //   849: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   852: ifeq +41 -> 893
    //   855: ldc 11
    //   857: iconst_2
    //   858: new 193	java/lang/StringBuilder
    //   861: dup
    //   862: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   865: ldc_w 715
    //   868: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   871: aload 11
    //   873: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   876: ldc_w 717
    //   879: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   882: aload 13
    //   884: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   887: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   890: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   893: new 719	com/tencent/mobileqq/data/QQEntityManagerFactory
    //   896: dup
    //   897: aload 17
    //   899: invokespecial 720	com/tencent/mobileqq/data/QQEntityManagerFactory:<init>	(Ljava/lang/String;)V
    //   902: astore 7
    //   904: aload 15
    //   906: astore 10
    //   908: aload 12
    //   910: astore 9
    //   912: aload 7
    //   914: invokevirtual 724	com/tencent/mobileqq/persistence/EntityManagerFactory:createEntityManager	()Lcom/tencent/mobileqq/persistence/EntityManager;
    //   917: astore 8
    //   919: aload 8
    //   921: astore 10
    //   923: aload 8
    //   925: astore 9
    //   927: aload 8
    //   929: invokevirtual 727	com/tencent/mobileqq/persistence/EntityManager:a	()Lcom/tencent/mobileqq/persistence/EntityTransaction;
    //   932: astore 15
    //   934: aload 8
    //   936: astore 10
    //   938: aload 8
    //   940: astore 9
    //   942: aload 7
    //   944: aload 17
    //   946: invokevirtual 731	com/tencent/mobileqq/persistence/EntityManagerFactory:build	(Ljava/lang/String;)Lcom/tencent/mobileqq/app/SQLiteOpenHelper;
    //   949: invokevirtual 736	com/tencent/mobileqq/app/SQLiteOpenHelper:a	()Lcom/tencent/mobileqq/app/SQLiteDatabase;
    //   952: astore 12
    //   954: aload_0
    //   955: getfield 39	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:jdField_b_of_type_Boolean	Z
    //   958: ifne +71 -> 1029
    //   961: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   964: ifeq +30 -> 994
    //   967: ldc 11
    //   969: iconst_2
    //   970: new 193	java/lang/StringBuilder
    //   973: dup
    //   974: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   977: ldc_w 738
    //   980: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   983: aload 17
    //   985: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   988: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   991: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   994: iconst_0
    //   995: istore 4
    //   997: aload 12
    //   999: ifnull +8 -> 1007
    //   1002: aload 12
    //   1004: invokevirtual 698	com/tencent/mobileqq/app/SQLiteDatabase:d	()V
    //   1007: aload 8
    //   1009: ifnull +8 -> 1017
    //   1012: aload 8
    //   1014: invokevirtual 700	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   1017: aload 7
    //   1019: ifnull -997 -> 22
    //   1022: aload 7
    //   1024: invokevirtual 703	com/tencent/mobileqq/persistence/EntityManagerFactory:close	()V
    //   1027: iconst_0
    //   1028: ireturn
    //   1029: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1032: ifeq +62 -> 1094
    //   1035: ldc 11
    //   1037: iconst_2
    //   1038: new 193	java/lang/StringBuilder
    //   1041: dup
    //   1042: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   1045: ldc_w 740
    //   1048: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1051: aload 17
    //   1053: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1056: ldc_w 742
    //   1059: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1062: aload_1
    //   1063: invokevirtual 246	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1066: ldc_w 744
    //   1069: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1072: aload 11
    //   1074: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1077: ldc_w 746
    //   1080: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1083: aload 13
    //   1085: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1088: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1091: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1094: aload 15
    //   1096: invokevirtual 749	com/tencent/mobileqq/persistence/EntityTransaction:a	()V
    //   1099: aload_0
    //   1100: aload 13
    //   1102: invokespecial 751	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:a	(Ljava/lang/String;)Ljava/util/List;
    //   1105: astore_1
    //   1106: aload_0
    //   1107: aload_1
    //   1108: aload 8
    //   1110: invokespecial 753	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:b	(Ljava/util/List;Lcom/tencent/mobileqq/persistence/EntityManager;)V
    //   1113: aload_0
    //   1114: aload 17
    //   1116: invokespecial 755	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:a	(Ljava/lang/String;)V
    //   1119: aload 11
    //   1121: ifnull +70 -> 1191
    //   1124: aload_0
    //   1125: aload 11
    //   1127: aload 17
    //   1129: aload_0
    //   1130: aload 11
    //   1132: invokespecial 758	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:a	(Ljava/lang/String;)[Ljava/lang/String;
    //   1135: aload_1
    //   1136: aload 8
    //   1138: invokespecial 760	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:a	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;Lcom/tencent/mobileqq/persistence/EntityManager;)V
    //   1141: aload_0
    //   1142: aload_1
    //   1143: aload 8
    //   1145: invokespecial 762	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:a	(Ljava/util/List;Lcom/tencent/mobileqq/persistence/EntityManager;)V
    //   1148: aload 15
    //   1150: invokevirtual 764	com/tencent/mobileqq/persistence/EntityTransaction:c	()V
    //   1153: aload 15
    //   1155: invokevirtual 766	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   1158: aload 12
    //   1160: ifnull +8 -> 1168
    //   1163: aload 12
    //   1165: invokevirtual 698	com/tencent/mobileqq/app/SQLiteDatabase:d	()V
    //   1168: aload 8
    //   1170: ifnull +8 -> 1178
    //   1173: aload 8
    //   1175: invokevirtual 700	com/tencent/mobileqq/persistence/EntityManager:a	()V
    //   1178: aload 7
    //   1180: ifnull -524 -> 656
    //   1183: aload 7
    //   1185: invokevirtual 703	com/tencent/mobileqq/persistence/EntityManagerFactory:close	()V
    //   1188: goto -532 -> 656
    //   1191: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1194: ifeq +12 -> 1206
    //   1197: ldc 11
    //   1199: iconst_2
    //   1200: ldc_w 768
    //   1203: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1206: aload_0
    //   1207: getfield 33	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:jdField_b_of_type_JavaUtilList	Ljava/util/List;
    //   1210: invokeinterface 397 1 0
    //   1215: ifne -74 -> 1141
    //   1218: aload_0
    //   1219: getfield 33	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:jdField_b_of_type_JavaUtilList	Ljava/util/List;
    //   1222: invokeinterface 425 1 0
    //   1227: astore 9
    //   1229: aload 9
    //   1231: invokeinterface 430 1 0
    //   1236: ifeq -95 -> 1141
    //   1239: aload 9
    //   1241: invokeinterface 434 1 0
    //   1246: checkcast 436	java/io/File
    //   1249: invokevirtual 439	java/io/File:getName	()Ljava/lang/String;
    //   1252: astore 10
    //   1254: aload_0
    //   1255: aload 10
    //   1257: invokespecial 758	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:a	(Ljava/lang/String;)[Ljava/lang/String;
    //   1260: astore 11
    //   1262: aload 11
    //   1264: ifnull -35 -> 1229
    //   1267: aload_0
    //   1268: aload_1
    //   1269: aload 11
    //   1271: invokespecial 770	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:a	(Ljava/util/List;[Ljava/lang/String;)Ljava/util/List;
    //   1274: invokeinterface 258 1 0
    //   1279: istore_3
    //   1280: iload_3
    //   1281: ifeq -52 -> 1229
    //   1284: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1287: ifeq +41 -> 1328
    //   1290: ldc 11
    //   1292: iconst_2
    //   1293: new 193	java/lang/StringBuilder
    //   1296: dup
    //   1297: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   1300: ldc_w 772
    //   1303: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1306: aload 17
    //   1308: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1311: ldc_w 774
    //   1314: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1317: aload 10
    //   1319: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1322: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1325: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1328: iload_3
    //   1329: anewarray 75	java/lang/String
    //   1332: astore 11
    //   1334: iconst_0
    //   1335: istore_2
    //   1336: iload_2
    //   1337: iload_3
    //   1338: if_icmpge +27 -> 1365
    //   1341: aload 11
    //   1343: iload_2
    //   1344: aload_1
    //   1345: iload_2
    //   1346: invokeinterface 264 2 0
    //   1351: checkcast 155	reb
    //   1354: getfield 185	reb:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   1357: aastore
    //   1358: iload_2
    //   1359: iconst_1
    //   1360: iadd
    //   1361: istore_2
    //   1362: goto -26 -> 1336
    //   1365: aload_0
    //   1366: aload 10
    //   1368: aload 17
    //   1370: aload 11
    //   1372: aload_1
    //   1373: aload 8
    //   1375: invokespecial 760	com/tencent/mobileqq/startup/step/MigrateSubscribeDB:a	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;Lcom/tencent/mobileqq/persistence/EntityManager;)V
    //   1378: goto -149 -> 1229
    //   1381: astore_1
    //   1382: aload_1
    //   1383: invokevirtual 229	java/lang/Exception:printStackTrace	()V
    //   1386: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1389: ifeq +12 -> 1401
    //   1392: ldc 11
    //   1394: iconst_2
    //   1395: ldc_w 776
    //   1398: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1401: aload 15
    //   1403: invokevirtual 766	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   1406: goto -248 -> 1158
    //   1409: astore_1
    //   1410: aload 15
    //   1412: invokevirtual 766	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   1415: aload_1
    //   1416: athrow
    //   1417: astore_1
    //   1418: aload 12
    //   1420: astore 9
    //   1422: goto -678 -> 744
    //   1425: astore_1
    //   1426: aload 14
    //   1428: astore 9
    //   1430: aload 10
    //   1432: astore 8
    //   1434: goto -690 -> 744
    //   1437: astore 10
    //   1439: aload 7
    //   1441: astore 9
    //   1443: aload_1
    //   1444: astore 7
    //   1446: aload 10
    //   1448: astore_1
    //   1449: goto -705 -> 744
    //   1452: astore 10
    //   1454: aconst_null
    //   1455: astore 8
    //   1457: aload 7
    //   1459: astore_1
    //   1460: aload 8
    //   1462: astore 7
    //   1464: aload 9
    //   1466: astore 8
    //   1468: goto -860 -> 608
    //   1471: aconst_null
    //   1472: astore 7
    //   1474: goto +13 -> 1487
    //   1477: aconst_null
    //   1478: astore 7
    //   1480: aload 7
    //   1482: astore 11
    //   1484: goto -1124 -> 360
    //   1487: aload 7
    //   1489: astore 13
    //   1491: goto -996 -> 495
    //   1494: astore 10
    //   1496: aload 7
    //   1498: astore_1
    //   1499: aload 12
    //   1501: astore 7
    //   1503: goto -895 -> 608
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1506	0	this	MigrateSubscribeDB
    //   0	1506	1	paramFile	File
    //   1335	27	2	i	int
    //   1279	60	3	j	int
    //   20	976	4	bool	boolean
    //   63	619	5	l	long
    //   72	1430	7	localObject1	Object
    //   90	1377	8	localObject2	Object
    //   81	1384	9	localObject3	Object
    //   78	1	10	localObject4	Object
    //   601	132	10	localException1	Exception
    //   906	525	10	localObject5	Object
    //   1437	10	10	localObject6	Object
    //   1452	1	10	localException2	Exception
    //   1494	1	10	localException3	Exception
    //   69	1414	11	localObject7	Object
    //   87	1413	12	localSQLiteDatabase	com.tencent.mobileqq.app.SQLiteDatabase
    //   406	1084	13	localObject8	Object
    //   93	1334	14	localObject9	Object
    //   84	1327	15	localEntityTransaction	com.tencent.mobileqq.persistence.EntityTransaction
    //   75	768	16	localObject10	Object
    //   190	1179	17	str	String
    // Exception table:
    //   from	to	target	type
    //   95	119	601	java/lang/Exception
    //   119	134	601	java/lang/Exception
    //   173	225	601	java/lang/Exception
    //   225	248	601	java/lang/Exception
    //   248	306	601	java/lang/Exception
    //   306	316	601	java/lang/Exception
    //   320	353	601	java/lang/Exception
    //   360	383	601	java/lang/Exception
    //   383	441	601	java/lang/Exception
    //   441	451	601	java/lang/Exception
    //   455	488	601	java/lang/Exception
    //   500	515	601	java/lang/Exception
    //   554	598	601	java/lang/Exception
    //   709	724	601	java/lang/Exception
    //   776	820	601	java/lang/Exception
    //   827	842	601	java/lang/Exception
    //   849	893	601	java/lang/Exception
    //   893	904	601	java/lang/Exception
    //   95	119	731	finally
    //   119	134	731	finally
    //   173	225	731	finally
    //   225	248	731	finally
    //   248	306	731	finally
    //   306	316	731	finally
    //   320	353	731	finally
    //   360	383	731	finally
    //   383	441	731	finally
    //   441	451	731	finally
    //   455	488	731	finally
    //   500	515	731	finally
    //   554	598	731	finally
    //   709	724	731	finally
    //   776	820	731	finally
    //   827	842	731	finally
    //   849	893	731	finally
    //   893	904	731	finally
    //   1099	1119	1381	java/lang/Exception
    //   1124	1141	1381	java/lang/Exception
    //   1141	1153	1381	java/lang/Exception
    //   1191	1206	1381	java/lang/Exception
    //   1206	1229	1381	java/lang/Exception
    //   1229	1262	1381	java/lang/Exception
    //   1267	1280	1381	java/lang/Exception
    //   1284	1328	1381	java/lang/Exception
    //   1328	1334	1381	java/lang/Exception
    //   1341	1358	1381	java/lang/Exception
    //   1365	1378	1381	java/lang/Exception
    //   1099	1119	1409	finally
    //   1124	1141	1409	finally
    //   1141	1153	1409	finally
    //   1191	1206	1409	finally
    //   1206	1229	1409	finally
    //   1229	1262	1409	finally
    //   1267	1280	1409	finally
    //   1284	1328	1409	finally
    //   1328	1334	1409	finally
    //   1341	1358	1409	finally
    //   1365	1378	1409	finally
    //   1382	1401	1409	finally
    //   954	994	1417	finally
    //   1029	1094	1417	finally
    //   1094	1099	1417	finally
    //   1153	1158	1417	finally
    //   1401	1406	1417	finally
    //   1410	1417	1417	finally
    //   912	919	1425	finally
    //   927	934	1425	finally
    //   942	954	1425	finally
    //   608	628	1437	finally
    //   912	919	1452	java/lang/Exception
    //   927	934	1452	java/lang/Exception
    //   942	954	1452	java/lang/Exception
    //   954	994	1494	java/lang/Exception
    //   1029	1094	1494	java/lang/Exception
    //   1094	1099	1494	java/lang/Exception
    //   1153	1158	1494	java/lang/Exception
    //   1401	1406	1494	java/lang/Exception
    //   1410	1417	1494	java/lang/Exception
  }
  
  /* Error */
  private String[] a(String paramString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 11
    //   3: aconst_null
    //   4: astore 7
    //   6: aconst_null
    //   7: astore 5
    //   9: aload_1
    //   10: ifnonnull +29 -> 39
    //   13: aload 5
    //   15: astore 4
    //   17: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   20: ifeq +16 -> 36
    //   23: ldc 11
    //   25: iconst_2
    //   26: ldc_w 778
    //   29: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   32: aload 5
    //   34: astore 4
    //   36: aload 4
    //   38: areturn
    //   39: invokestatic 109	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   42: astore 4
    //   44: new 103	rea
    //   47: dup
    //   48: aload_0
    //   49: aload 4
    //   51: aload_1
    //   52: bipush 80
    //   54: invokespecial 112	rea:<init>	(Lcom/tencent/mobileqq/startup/step/MigrateSubscribeDB;Landroid/content/Context;Ljava/lang/String;I)V
    //   57: astore 6
    //   59: aload 6
    //   61: invokevirtual 116	rea:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   64: astore 5
    //   66: aload 5
    //   68: ldc_w 780
    //   71: aconst_null
    //   72: invokevirtual 124	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   75: astore 4
    //   77: aload 4
    //   79: ifnull +364 -> 443
    //   82: aload 4
    //   84: astore 8
    //   86: aload 5
    //   88: astore 9
    //   90: aload 6
    //   92: astore 10
    //   94: aload 4
    //   96: invokeinterface 129 1 0
    //   101: ifeq +194 -> 295
    //   104: aload 4
    //   106: astore 8
    //   108: aload 5
    //   110: astore 9
    //   112: aload 6
    //   114: astore 10
    //   116: aload 4
    //   118: invokeinterface 783 1 0
    //   123: anewarray 75	java/lang/String
    //   126: astore_1
    //   127: iconst_0
    //   128: istore_2
    //   129: aload 4
    //   131: astore 8
    //   133: aload 5
    //   135: astore 9
    //   137: aload 6
    //   139: astore 10
    //   141: aload_1
    //   142: iload_2
    //   143: aload 4
    //   145: iconst_0
    //   146: invokeinterface 162 2 0
    //   151: aastore
    //   152: aload 4
    //   154: astore 8
    //   156: aload 5
    //   158: astore 9
    //   160: aload 6
    //   162: astore 10
    //   164: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   167: ifeq +59 -> 226
    //   170: aload 4
    //   172: astore 8
    //   174: aload 5
    //   176: astore 9
    //   178: aload 6
    //   180: astore 10
    //   182: ldc 11
    //   184: iconst_2
    //   185: new 193	java/lang/StringBuilder
    //   188: dup
    //   189: invokespecial 194	java/lang/StringBuilder:<init>	()V
    //   192: ldc_w 785
    //   195: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   198: iload_2
    //   199: invokevirtual 208	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   202: ldc_w 787
    //   205: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   208: aload_1
    //   209: iload_2
    //   210: aaload
    //   211: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   214: ldc_w 789
    //   217: invokevirtual 200	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   220: invokevirtual 211	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   223: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   226: iload_2
    //   227: iconst_1
    //   228: iadd
    //   229: istore_2
    //   230: aload 4
    //   232: astore 8
    //   234: aload 5
    //   236: astore 9
    //   238: aload 6
    //   240: astore 10
    //   242: aload 4
    //   244: invokeinterface 220 1 0
    //   249: istore_3
    //   250: iload_3
    //   251: ifne -122 -> 129
    //   254: aload 4
    //   256: ifnull +10 -> 266
    //   259: aload 4
    //   261: invokeinterface 223 1 0
    //   266: aload 5
    //   268: ifnull +8 -> 276
    //   271: aload 5
    //   273: invokevirtual 790	android/database/sqlite/SQLiteDatabase:close	()V
    //   276: aload_1
    //   277: astore 4
    //   279: aload 6
    //   281: ifnull -245 -> 36
    //   284: aload 6
    //   286: invokevirtual 224	rea:close	()V
    //   289: aload_1
    //   290: areturn
    //   291: astore 4
    //   293: aload_1
    //   294: areturn
    //   295: aload 11
    //   297: astore_1
    //   298: aload 4
    //   300: astore 8
    //   302: aload 5
    //   304: astore 9
    //   306: aload 6
    //   308: astore 10
    //   310: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   313: ifeq -59 -> 254
    //   316: aload 4
    //   318: astore 8
    //   320: aload 5
    //   322: astore 9
    //   324: aload 6
    //   326: astore 10
    //   328: ldc 11
    //   330: iconst_2
    //   331: ldc_w 792
    //   334: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   337: aload 11
    //   339: astore_1
    //   340: goto -86 -> 254
    //   343: astore_1
    //   344: aload 4
    //   346: astore 8
    //   348: aload 5
    //   350: astore 9
    //   352: aload 6
    //   354: astore 10
    //   356: aload_1
    //   357: invokevirtual 229	java/lang/Exception:printStackTrace	()V
    //   360: aload 4
    //   362: astore 8
    //   364: aload 5
    //   366: astore 9
    //   368: aload 6
    //   370: astore 10
    //   372: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   375: ifeq +25 -> 400
    //   378: aload 4
    //   380: astore 8
    //   382: aload 5
    //   384: astore 9
    //   386: aload 6
    //   388: astore 10
    //   390: ldc 11
    //   392: iconst_2
    //   393: ldc_w 794
    //   396: aload_1
    //   397: invokestatic 234	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   400: aload 4
    //   402: ifnull +10 -> 412
    //   405: aload 4
    //   407: invokeinterface 223 1 0
    //   412: aload 5
    //   414: ifnull +8 -> 422
    //   417: aload 5
    //   419: invokevirtual 790	android/database/sqlite/SQLiteDatabase:close	()V
    //   422: aload 7
    //   424: astore 4
    //   426: aload 6
    //   428: ifnull -392 -> 36
    //   431: aload 6
    //   433: invokevirtual 224	rea:close	()V
    //   436: aload 7
    //   438: areturn
    //   439: astore_1
    //   440: aload 7
    //   442: areturn
    //   443: aload 11
    //   445: astore_1
    //   446: aload 4
    //   448: astore 8
    //   450: aload 5
    //   452: astore 9
    //   454: aload 6
    //   456: astore 10
    //   458: invokestatic 95	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   461: ifeq -207 -> 254
    //   464: aload 4
    //   466: astore 8
    //   468: aload 5
    //   470: astore 9
    //   472: aload 6
    //   474: astore 10
    //   476: ldc 11
    //   478: iconst_2
    //   479: ldc_w 796
    //   482: invokestatic 101	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   485: aload 11
    //   487: astore_1
    //   488: goto -234 -> 254
    //   491: astore_1
    //   492: aload 10
    //   494: astore 6
    //   496: aload 9
    //   498: astore 5
    //   500: aload 8
    //   502: astore 4
    //   504: aload 4
    //   506: ifnull +10 -> 516
    //   509: aload 4
    //   511: invokeinterface 223 1 0
    //   516: aload 5
    //   518: ifnull +8 -> 526
    //   521: aload 5
    //   523: invokevirtual 790	android/database/sqlite/SQLiteDatabase:close	()V
    //   526: aload 6
    //   528: ifnull +8 -> 536
    //   531: aload 6
    //   533: invokevirtual 224	rea:close	()V
    //   536: aload_1
    //   537: athrow
    //   538: astore 4
    //   540: goto -274 -> 266
    //   543: astore 4
    //   545: goto -269 -> 276
    //   548: astore_1
    //   549: goto -137 -> 412
    //   552: astore_1
    //   553: goto -131 -> 422
    //   556: astore 4
    //   558: goto -42 -> 516
    //   561: astore 4
    //   563: goto -37 -> 526
    //   566: astore 4
    //   568: goto -32 -> 536
    //   571: astore_1
    //   572: aconst_null
    //   573: astore 4
    //   575: aconst_null
    //   576: astore 5
    //   578: aconst_null
    //   579: astore 6
    //   581: goto -77 -> 504
    //   584: astore_1
    //   585: aconst_null
    //   586: astore 4
    //   588: aconst_null
    //   589: astore 5
    //   591: goto -87 -> 504
    //   594: astore_1
    //   595: aconst_null
    //   596: astore 4
    //   598: goto -94 -> 504
    //   601: astore_1
    //   602: aconst_null
    //   603: astore 4
    //   605: aconst_null
    //   606: astore 5
    //   608: aconst_null
    //   609: astore 6
    //   611: goto -267 -> 344
    //   614: astore_1
    //   615: aconst_null
    //   616: astore 4
    //   618: aconst_null
    //   619: astore 5
    //   621: goto -277 -> 344
    //   624: astore_1
    //   625: aconst_null
    //   626: astore 4
    //   628: goto -284 -> 344
    //   631: astore 8
    //   633: aload_1
    //   634: astore 7
    //   636: aload 8
    //   638: astore_1
    //   639: goto -295 -> 344
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	642	0	this	MigrateSubscribeDB
    //   0	642	1	paramString	String
    //   128	102	2	i	int
    //   249	2	3	bool	boolean
    //   15	263	4	localObject1	Object
    //   291	115	4	localException1	Exception
    //   424	86	4	localObject2	Object
    //   538	1	4	localException2	Exception
    //   543	1	4	localException3	Exception
    //   556	1	4	localException4	Exception
    //   561	1	4	localException5	Exception
    //   566	1	4	localException6	Exception
    //   573	54	4	localObject3	Object
    //   7	613	5	localObject4	Object
    //   57	553	6	localObject5	Object
    //   4	631	7	localObject6	Object
    //   84	417	8	localObject7	Object
    //   631	6	8	localException7	Exception
    //   88	409	9	localObject8	Object
    //   92	401	10	localObject9	Object
    //   1	485	11	localObject10	Object
    // Exception table:
    //   from	to	target	type
    //   284	289	291	java/lang/Exception
    //   94	104	343	java/lang/Exception
    //   116	127	343	java/lang/Exception
    //   310	316	343	java/lang/Exception
    //   328	337	343	java/lang/Exception
    //   458	464	343	java/lang/Exception
    //   476	485	343	java/lang/Exception
    //   431	436	439	java/lang/Exception
    //   94	104	491	finally
    //   116	127	491	finally
    //   141	152	491	finally
    //   164	170	491	finally
    //   182	226	491	finally
    //   242	250	491	finally
    //   310	316	491	finally
    //   328	337	491	finally
    //   356	360	491	finally
    //   372	378	491	finally
    //   390	400	491	finally
    //   458	464	491	finally
    //   476	485	491	finally
    //   259	266	538	java/lang/Exception
    //   271	276	543	java/lang/Exception
    //   405	412	548	java/lang/Exception
    //   417	422	552	java/lang/Exception
    //   509	516	556	java/lang/Exception
    //   521	526	561	java/lang/Exception
    //   531	536	566	java/lang/Exception
    //   44	59	571	finally
    //   59	66	584	finally
    //   66	77	594	finally
    //   44	59	601	java/lang/Exception
    //   59	66	614	java/lang/Exception
    //   66	77	624	java/lang/Exception
    //   141	152	631	java/lang/Exception
    //   164	170	631	java/lang/Exception
    //   182	226	631	java/lang/Exception
    //   242	250	631	java/lang/Exception
  }
  
  private void b()
  {
    int i = 0;
    if (QLog.isColorLevel()) {
      QLog.d("MigrateSubscribeDB", 2, "begin getMigrateDBFiles.");
    }
    long l = System.nanoTime();
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_b_of_type_JavaUtilList = new ArrayList();
    c = new ArrayList();
    Pattern localPattern1 = Pattern.compile("^\\d+\\.db$");
    Pattern localPattern2 = Pattern.compile("^readinjoy_main_\\d+$");
    Pattern localPattern3 = Pattern.compile("^readinjoy_\\d+\\.db$");
    String str1 = jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getFilesDir().getPath();
    str1 = str1.substring(0, str1.lastIndexOf("/")) + "/databases";
    Object localObject1 = new File(str1);
    if (QLog.isColorLevel()) {
      QLog.d("MigrateSubscribeDB", 2, "getMigrateDBFiles we will list files in folder: " + str1);
    }
    localObject1 = ((File)localObject1).listFiles();
    if (localObject1 != null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "getMigrateDBFiles dbFiles length: " + localObject1.length);
      }
      j = localObject1.length;
      while (i < j)
      {
        localObject2 = localObject1[i];
        str2 = localObject2.getName();
        if (QLog.isColorLevel()) {
          QLog.d("MigrateSubscribeDB", 2, "getMigrateDBFiles find file[" + str2 + "] in folder[" + str1 + "]");
        }
        if (localPattern1.matcher(str2).find())
        {
          jdField_a_of_type_JavaUtilList.add(localObject2);
          if (QLog.isColorLevel()) {
            QLog.d("MigrateSubscribeDB", 2, "getMigrateDBFiles mUinMainDBFiles " + localObject2);
          }
        }
        if (localPattern2.matcher(str2).find())
        {
          jdField_b_of_type_JavaUtilList.add(localObject2);
          if (QLog.isColorLevel()) {
            QLog.d("MigrateSubscribeDB", 2, "getMigrateDBFiles mReadInJoyMainDBFiles " + localObject2);
          }
        }
        if (localPattern3.matcher(str2).find())
        {
          c.add(localObject2);
          if (QLog.isColorLevel()) {
            QLog.d("MigrateSubscribeDB", 2, "getMigrateDBFiles mReadInJoySubDBFiles " + localObject2);
          }
        }
        i += 1;
      }
      Collections.sort(jdField_a_of_type_JavaUtilList, new rdz(this));
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "doStep get Migrate db files cost = " + (System.nanoTime() - l) / 1000000L + "ms");
      }
    }
    while (!QLog.isColorLevel())
    {
      int j;
      Object localObject2;
      String str2;
      return;
    }
    QLog.d("MigrateSubscribeDB", 2, "getMigrateDBFiles dbFiles is null");
  }
  
  private void b(List paramList, EntityManager paramEntityManager)
  {
    long l = System.nanoTime();
    if (paramList == null) {
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "migrateToCoversationInfo fail subscribeRecentDataList is null");
      }
    }
    label265:
    label340:
    label359:
    do
    {
      return;
      int i = paramList.size();
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "migrateToCoversationInfo subscribeRecentDataList list size: " + i);
      }
      i = 0;
      if (i < paramList.size())
      {
        reb localReb = (reb)paramList.get(i);
        if (QLog.isColorLevel()) {
          QLog.d("MigrateSubscribeDB", 2, "migrateToCoversationInfo subscribeRecentData: " + localReb);
        }
        String str = SubscriptUtil.a(jdField_a_of_type_JavaLangString);
        ConversationInfo localConversationInfo;
        int j;
        if (!TextUtils.isEmpty(str))
        {
          if (QLog.isColorLevel()) {
            QLog.d("MigrateSubscribeDB", 2, "migrateToCoversationInfo find subscribeID[" + jdField_a_of_type_JavaLangString + "]'s uin: " + str);
          }
          localConversationInfo = new ConversationInfo();
          List localList = paramEntityManager.a(ConversationInfo.class, false, "uin=? and type=?", new String[] { str, String.valueOf(1008) }, null, null, null, null);
          if (QLog.isColorLevel())
          {
            StringBuilder localStringBuilder = new StringBuilder().append("migrateToCoversationInfo dataList size: ");
            if (localList != null)
            {
              j = localList.size();
              QLog.d("MigrateSubscribeDB", 2, j);
            }
          }
          else
          {
            if ((localList == null) || (localList.size() <= 0)) {
              break label359;
            }
            localConversationInfo = (ConversationInfo)localList.get(0);
            uin = str;
            unreadCount += jdField_a_of_type_Int;
            type = 1008;
            paramEntityManager.b(localConversationInfo);
          }
        }
        for (;;)
        {
          i += 1;
          break;
          j = 0;
          break label265;
          uin = str;
          unreadCount = jdField_a_of_type_Int;
          type = 1008;
          break label340;
          if (QLog.isColorLevel()) {
            QLog.d("MigrateSubscribeDB", 2, "migrateToCoversationInfo we can't subscribeid[" + jdField_a_of_type_JavaLangString + "]'s uin");
          }
        }
      }
    } while (!QLog.isColorLevel());
    QLog.d("MigrateSubscribeDB", 2, "migrateToCoversationInfo total cost = " + (System.nanoTime() - l) / 1000000L + " ms ");
  }
  
  public static boolean b()
  {
    boolean bool2 = false;
    boolean bool1;
    if (!jdField_a_of_type_Boolean)
    {
      String str = BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl.getSharedPreferences("contact_bind_info_global", 0).getString("phone_version_run", "");
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "isNeedUpdate oldVersion: " + str + " : curVersion: " + "6.3.3");
      }
      if (!TextUtils.isEmpty(str)) {
        if (str.startsWith("5.7")) {
          bool1 = true;
        }
      }
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "isNeedUpdate isNeed: " + bool1);
      }
      return bool1;
      bool1 = bool2;
      if (QLog.isColorLevel())
      {
        QLog.d("MigrateSubscribeDB", 2, "isNeedUpdate oldVersion isn't start with 5.7");
        bool1 = bool2;
        continue;
        bool1 = bool2;
        if (QLog.isColorLevel())
        {
          QLog.d("MigrateSubscribeDB", 2, "isNeedUpdate oldVersion is empty");
          bool1 = bool2;
          continue;
          bool1 = bool2;
          if (QLog.isColorLevel())
          {
            QLog.d("MigrateSubscribeDB", 2, "isNeedUpdate no need run again");
            bool1 = bool2;
          }
        }
      }
    }
  }
  
  private void c(List paramList, EntityManager paramEntityManager)
  {
    long l = System.nanoTime();
    if (paramList == null) {}
    do
    {
      return;
      int i = 0;
      while (i < paramList.size())
      {
        paramEntityManager.b((MessageRecord)paramList.get(i));
        i += 1;
      }
    } while (!QLog.isColorLevel());
    QLog.d("MigrateSubscribeDB", 2, "migrateToMsgRecord total cost = " + (System.nanoTime() - l) / 1000000L + " ms ");
  }
  
  protected boolean a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("MigrateSubscribeDB", 2, "begin do Step for MigrateSubscribeDB." + BaseApplicationImpl.i);
    }
    if (!b())
    {
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "No need do update action");
      }
      return super.a();
    }
    jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl = BaseApplicationImpl.jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl;
    if (jdField_a_of_type_ComTencentCommonAppBaseApplicationImpl == null)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MigrateSubscribeDB", 2, "doStep fail app is null");
      }
      return super.a();
    }
    jdField_a_of_type_Boolean = true;
    jdField_a_of_type_Int = 40000;
    long l = System.nanoTime();
    b();
    Iterator localIterator;
    if (!jdField_a_of_type_JavaUtilList.isEmpty())
    {
      a();
      localIterator = jdField_a_of_type_JavaUtilList.iterator();
    }
    for (;;)
    {
      File localFile;
      if (localIterator.hasNext())
      {
        localFile = (File)localIterator.next();
        if (jdField_b_of_type_Boolean) {
          break label250;
        }
        if (QLog.isColorLevel()) {
          QLog.d("MigrateSubscribeDB", 2, "doStep foreach mUinMainDBFiles，but timeout！");
        }
      }
      label250:
      while (!a(localFile))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MigrateSubscribeDB", 2, "doStep Migrate subscribe db total cost = " + (System.nanoTime() - l) / 1000000L + " ms " + " and Migrate " + jdField_a_of_type_Long + " times ");
        }
        return super.a();
      }
      jdField_a_of_type_Long += 1L;
    }
  }
}
