package com.tencent.mobileqq.app.proxy.fts;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.SQLiteDatabase;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.app.TroopManager.TroopMemberUpdateObserver;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.data.TroopMemberInfo;
import com.tencent.mobileqq.data.fts.FTSTroop;
import com.tencent.mobileqq.data.fts.FTSTroopSync;
import com.tencent.mobileqq.data.fts.FTSTroopTime;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import com.tencent.mobileqq.persistence.fts.FTSDatatbase;
import com.tencent.mobileqq.persistence.fts.FTSOptSync;
import com.tencent.mobileqq.util.Utils;
import com.tencent.mobileqq.utils.fts.SQLiteFTSUtils;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import mqq.app.MobileQQ;
import mqq.os.MqqHandler;
import nlx;
import nly;

public class FTSTroopOperator
  extends FTSIndexOperator
  implements TroopManager.TroopMemberUpdateObserver
{
  private static final int b = 500;
  public static final String t = "TroopCursor";
  private static final String u = "Q.fts.troop.operator";
  private TroopManager a;
  private int c;
  private int d;
  private boolean e;
  
  public FTSTroopOperator(QQAppInterface paramQQAppInterface, FTSSyncHandler paramFTSSyncHandler)
  {
    super(paramQQAppInterface, paramFTSSyncHandler);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    c = 0;
    e = false;
    d = 0;
    jdField_a_of_type_ComTencentMobileqqAppTroopManager = ((TroopManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51));
    jdField_a_of_type_ComTencentMobileqqAppTroopManager.a(this);
  }
  
  public static long a(QQAppInterface paramQQAppInterface, String paramString)
  {
    return paramQQAppInterface.getApplication().getSharedPreferences("fts_sp_file", 0).getLong("key_check_stamp" + paramQQAppInterface.getAccount() + "_" + paramString, 0L);
  }
  
  private FTSTroop a(int paramInt1, String paramString1, String paramString2, String paramString3, String paramString4, int paramInt2)
  {
    paramString1 = new FTSTroop(paramInt1, paramString1, paramString2, paramString3, paramString4);
    paramString1.preWrite();
    if (paramInt2 == 1) {
      paramString1.insertOpt();
    }
    do
    {
      return paramString1;
      if (paramInt2 == 16)
      {
        paramString1.deleteOpt();
        return paramString1;
      }
    } while (paramInt2 != 17);
    paramString1.upgradeOpt();
    return paramString1;
  }
  
  public static void a(QQAppInterface paramQQAppInterface, String paramString)
  {
    paramQQAppInterface.a().getSharedPreferences("fts_sp_file", 0).edit().remove("key_check_stamp" + paramQQAppInterface.getAccount() + "_" + paramString).commit();
  }
  
  public static void a(QQAppInterface paramQQAppInterface, String paramString, long paramLong)
  {
    paramQQAppInterface.a().getSharedPreferences("fts_sp_file", 0).edit().putLong("key_check_stamp" + paramQQAppInterface.getAccount() + "_" + paramString, paramLong).commit();
  }
  
  private void c(String paramString)
  {
    if (SQLiteFTSUtils.i(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface) == 0) {
      return;
    }
    ThreadManager.c().post(new nly(this, paramString));
  }
  
  public int a()
  {
    return d;
  }
  
  public ArrayList a(String paramString, Class paramClass, boolean paramBoolean1, boolean paramBoolean2, int paramInt)
  {
    if ((jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase != null) && (jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.a())) {
      if ((paramString != null) && (!TextUtils.isEmpty(paramString))) {}
    }
    while (!QLog.isColorLevel())
    {
      String str;
      do
      {
        return null;
        str = paramString.trim().toLowerCase();
        localObject = SQLiteFTSUtils.a(str);
        if (QLog.isColorLevel()) {
          QLog.i("Q.fts.troop.operator", 2, "query segments = " + Arrays.toString((Object[])localObject));
        }
        if (localObject != null)
        {
          paramString = (String)localObject;
          if (localObject.length != 0) {
            break;
          }
        }
      } while ((str == null) || (str.length() <= 0));
      paramString = new String[1];
      paramString[0] = str;
      Object localObject = SQLiteFTSUtils.a(str);
      paramString = FTSArgsFactory.a(paramClass, paramString, (String[])((ArrayList)localObject).toArray(new String[((ArrayList)localObject).size()]), paramBoolean1, paramBoolean2, paramInt);
      return jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.a(paramString);
    }
    QLog.e("Q.fts.troop.operator", 2, "ftsDatabase not init");
    return null;
  }
  
  public void a()
  {
    jdField_a_of_type_ComTencentMobileqqAppTroopManager.b(this);
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.fts.troop.operator", 2, "onGetTroopMembersFailed troopUin:" + paramString);
    }
  }
  
  public void a(String paramString1, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.fts.troop.operator", 2, "onChangeTroopMember troopUin=" + paramString1 + " memberUin=" + paramString2);
    }
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(new FTSTroopSync(3, Long.parseLong(paramString1), Long.parseLong(paramString2)));
    a(localArrayList);
  }
  
  public void a(ArrayList paramArrayList)
  {
    if (paramArrayList == null) {
      return;
    }
    long l = System.currentTimeMillis();
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    while (i < paramArrayList.size())
    {
      FTSTroopSync localFTSTroopSync = new FTSTroopSync(1, Long.parseLong((String)paramArrayList.get(i)));
      localArrayList.add(localFTSTroopSync);
      a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (String)paramArrayList.get(i), l);
      if (QLog.isColorLevel()) {
        QLog.d("Q.fts.troop.operator", 2, "onTroopMembersUpdate troopuin = " + mTroopUin);
      }
      i += 1;
    }
    a(localArrayList);
  }
  
  public boolean a(FTSDatatbase paramFTSDatatbase)
  {
    super.a(paramFTSDatatbase);
    if (!jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.a("TroopIndex", true)) {
      return false;
    }
    jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSUpgrader = new FTSTroopUpgrader(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, this);
    e = true;
    if (QLog.isColorLevel()) {
      QLog.d("Q.fts.troop.operator", 2, "init success");
    }
    d = jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.b("TroopIndex");
    return true;
  }
  
  /* Error */
  public boolean a(ArrayList paramArrayList)
  {
    // Byte code:
    //   0: aload_1
    //   1: ifnonnull +7 -> 8
    //   4: iconst_1
    //   5: istore_2
    //   6: iload_2
    //   7: ireturn
    //   8: aload_0
    //   9: getfield 40	com/tencent/mobileqq/app/proxy/fts/FTSTroopOperator:jdField_a_of_type_ComTencentMobileqqAppQQAppInterface	Lcom/tencent/mobileqq/app/QQAppInterface;
    //   12: invokevirtual 314	com/tencent/mobileqq/app/QQAppInterface:a	()Lcom/tencent/mobileqq/persistence/EntityManagerFactory;
    //   15: invokevirtual 320	com/tencent/mobileqq/persistence/EntityManagerFactory:createEntityManager	()Lcom/tencent/mobileqq/persistence/EntityManager;
    //   18: astore 4
    //   20: aload 4
    //   22: invokevirtual 325	com/tencent/mobileqq/persistence/EntityManager:a	()Lcom/tencent/mobileqq/persistence/EntityTransaction;
    //   25: astore_3
    //   26: aload_3
    //   27: invokevirtual 329	com/tencent/mobileqq/persistence/EntityTransaction:a	()V
    //   30: aload_1
    //   31: invokevirtual 333	java/util/ArrayList:iterator	()Ljava/util/Iterator;
    //   34: astore_1
    //   35: aload_1
    //   36: invokeinterface 338 1 0
    //   41: ifeq +74 -> 115
    //   44: aload 4
    //   46: aload_1
    //   47: invokeinterface 342 1 0
    //   52: checkcast 344	com/tencent/mobileqq/persistence/fts/FTSOptSync
    //   55: invokevirtual 347	com/tencent/mobileqq/persistence/EntityManager:b	(Lcom/tencent/mobileqq/persistence/Entity;)V
    //   58: goto -23 -> 35
    //   61: astore 4
    //   63: aload_3
    //   64: astore_1
    //   65: aload 4
    //   67: astore_3
    //   68: invokestatic 194	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   71: ifeq +32 -> 103
    //   74: ldc 16
    //   76: iconst_2
    //   77: new 70	java/lang/StringBuilder
    //   80: dup
    //   81: invokespecial 73	java/lang/StringBuilder:<init>	()V
    //   84: ldc_w 349
    //   87: invokevirtual 79	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   90: aload_3
    //   91: invokevirtual 352	java/lang/Exception:getMessage	()Ljava/lang/String;
    //   94: invokevirtual 79	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   97: invokevirtual 88	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   100: invokestatic 355	com/tencent/qphone/base/util/QLog:w	(Ljava/lang/String;ILjava/lang/String;)V
    //   103: iconst_0
    //   104: istore_2
    //   105: aload_1
    //   106: ifnull -100 -> 6
    //   109: aload_1
    //   110: invokevirtual 357	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   113: iconst_0
    //   114: ireturn
    //   115: aload_3
    //   116: invokevirtual 359	com/tencent/mobileqq/persistence/EntityTransaction:c	()V
    //   119: aload_3
    //   120: ifnull +7 -> 127
    //   123: aload_3
    //   124: invokevirtual 357	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   127: iconst_1
    //   128: ireturn
    //   129: astore_3
    //   130: aconst_null
    //   131: astore_1
    //   132: aload_1
    //   133: ifnull +7 -> 140
    //   136: aload_1
    //   137: invokevirtual 357	com/tencent/mobileqq/persistence/EntityTransaction:b	()V
    //   140: aload_3
    //   141: athrow
    //   142: astore 4
    //   144: aload_3
    //   145: astore_1
    //   146: aload 4
    //   148: astore_3
    //   149: goto -17 -> 132
    //   152: astore_3
    //   153: goto -21 -> 132
    //   156: astore_3
    //   157: aconst_null
    //   158: astore_1
    //   159: goto -91 -> 68
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	162	0	this	FTSTroopOperator
    //   0	162	1	paramArrayList	ArrayList
    //   5	100	2	bool	boolean
    //   25	99	3	localObject1	Object
    //   129	16	3	localObject2	Object
    //   148	1	3	localObject3	Object
    //   152	1	3	localObject4	Object
    //   156	1	3	localException1	Exception
    //   18	27	4	localEntityManager	EntityManager
    //   61	5	4	localException2	Exception
    //   142	5	4	localObject5	Object
    // Exception table:
    //   from	to	target	type
    //   26	35	61	java/lang/Exception
    //   35	58	61	java/lang/Exception
    //   115	119	61	java/lang/Exception
    //   20	26	129	finally
    //   26	35	142	finally
    //   35	58	142	finally
    //   115	119	142	finally
    //   68	103	152	finally
    //   20	26	156	java/lang/Exception
  }
  
  public void b(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.fts.troop.operator", 2, "onQuitTroop troopUin=" + paramString);
    }
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(new FTSTroopSync(4, Long.parseLong(paramString)));
    a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString);
    a(localArrayList);
  }
  
  public void b(String paramString1, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Q.fts.troop.operator", 2, "onKickoutTroopMember troopUin=" + paramString1 + " memberUin=" + paramString2);
    }
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(new FTSTroopSync(2, Long.parseLong(paramString1), Long.parseLong(paramString2)));
    a(localArrayList);
  }
  
  public boolean c()
  {
    if (!b) {
      try
      {
        bool = jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.b("TroopCursor");
        if ((!bool) && (!jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.a("TroopCursor"))) {
          return false;
        }
      }
      catch (Throwable localThrowable)
      {
        int i;
        do
        {
          for (;;)
          {
            if (QLog.isColorLevel()) {
              QLog.e("Q.fts.troop.operator", 2, "isCursorTableExist: failure ", localThrowable);
            }
            boolean bool = false;
          }
          i = jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.a("TroopCursor");
        } while (i == -1);
        jdField_a_of_type_Int = i;
        b = true;
        if (QLog.isColorLevel()) {
          QLog.d("Q.fts.troop.operator", 2, "readSyncedCursor: syncCursor = " + i);
        }
      }
    }
    return true;
  }
  
  public void e()
  {
    Object localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a();
    int i;
    if (jdField_a_of_type_Int > 0)
    {
      i = ((SQLiteDatabase)localObject1).a(FTSTroopSync.class.getSimpleName(), "_id<=?", new String[] { String.valueOf(jdField_a_of_type_Int) });
      if ((QLog.isColorLevel()) && (i > 0)) {
        QLog.d("Q.fts.troop.operator", 2, "delete " + FTSTroopSync.class.getSimpleName() + " row=" + i);
      }
    }
    EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
    localObject1 = localEntityManager.a(FTSTroopSync.class, FTSTroopSync.class.getSimpleName(), false, "_id>?", new String[] { String.valueOf(jdField_a_of_type_Int) }, null, null, null, null);
    Object localObject2;
    Iterator localIterator;
    if (QLog.isColorLevel())
    {
      localObject2 = new StringBuilder().append("transToDatabase list.size=");
      if (localObject1 != null)
      {
        i = ((List)localObject1).size();
        QLog.d("Q.fts.troop.operator", 2, i);
      }
    }
    else if (localObject1 != null)
    {
      localIterator = ((List)localObject1).iterator();
      i = 0;
    }
    label708:
    label761:
    label1129:
    for (;;)
    {
      long l1;
      FTSTroopSync localFTSTroopSync;
      ArrayList localArrayList;
      if (localIterator.hasNext())
      {
        localObject1 = (FTSOptSync)localIterator.next();
        l1 = System.currentTimeMillis();
        localFTSTroopSync = (FTSTroopSync)localObject1;
        localArrayList = new ArrayList();
        if (mOpt != 3) {
          break label761;
        }
        localArrayList.add(a(2, String.valueOf(mTroopUin), String.valueOf(mMemberUin), "", "", 16));
        localObject1 = jdField_a_of_type_ComTencentMobileqqAppTroopManager.a(String.valueOf(mTroopUin), String.valueOf(mMemberUin));
        if (localObject1 == null) {
          break label708;
        }
        localArrayList.add(a(2, troopuin, memberuin, friendnick, troopnick, 1));
      }
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.fts.troop.operator", 2, "transToDatabase start troopUin:" + mTroopUin + " entityList size:" + localArrayList.size() + " opt:" + mOpt);
        }
        int j = jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.a(localArrayList, "TroopCursor", 1);
        if (j != -1) {
          jdField_a_of_type_Int = j;
        }
        d = jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase.b("TroopIndex");
        TroopInfo localTroopInfo = jdField_a_of_type_ComTencentMobileqqAppTroopManager.b(String.valueOf(mTroopUin));
        if (localTroopInfo != null)
        {
          List localList = localEntityManager.a(FTSTroopTime.class, FTSTroopTime.class.getSimpleName(), false, "mTroopUin=? ", new String[] { String.valueOf(mTroopUin) }, null, null, null, null);
          localObject2 = new FTSTroopTime();
          localObject1 = localObject2;
          if (localList != null)
          {
            localObject1 = localObject2;
            if (localList.size() > 0) {
              localObject1 = (FTSTroopTime)localList.get(0);
            }
          }
          mTroopUin = String.valueOf(mTroopUin);
          mTimeStamp = mMemberNumSeq;
          localEntityManager.b((Entity)localObject1);
          if (QLog.isColorLevel()) {
            QLog.d("Q.fts.troop.operator", 2, "FTSTroopTime  " + ((FTSTroopTime)localObject1).toString());
          }
        }
        long l2 = System.currentTimeMillis();
        if (QLog.isColorLevel()) {
          QLog.d("Q.fts.troop.operator", 2, "transToDatabase end troopUin=" + mTroopUin + " totalTime=" + (l2 - l1));
        }
        i = localArrayList.size() + i;
        if (i <= 500) {
          break label1129;
        }
        localEntityManager.a();
        return;
        i = 0;
        break;
        if (QLog.isColorLevel())
        {
          QLog.d("Q.fts.troop.operator", 2, "transToDatabase modify member can't find memberuin:" + mMemberUin + " troopuin:" + mTroopUin);
          continue;
          if (mOpt == 4)
          {
            localArrayList.add(a(2, String.valueOf(mTroopUin), "", "", "", 16));
          }
          else if ((mOpt == 1) || (mOpt == 5))
          {
            localObject1 = jdField_a_of_type_ComTencentMobileqqAppTroopManager.b(String.valueOf(mTroopUin));
            if (localObject1 != null)
            {
              localArrayList.add(a(2, String.valueOf(mTroopUin), "", "", "", 16));
              localObject1 = ((List)localObject1).iterator();
              while (((Iterator)localObject1).hasNext())
              {
                localObject2 = (TroopMemberInfo)((Iterator)localObject1).next();
                if (Utils.c(memberuin)) {
                  if ((TextUtils.isEmpty(friendnick)) && (TextUtils.isEmpty(troopnick)))
                  {
                    if (QLog.isColorLevel()) {
                      QLog.d("Q.fts.troop.operator", 2, "transToDatabase find member without nick! troopuin|memberuin" + troopuin + "|" + memberuin);
                    }
                  }
                  else {
                    localArrayList.add(a(2, troopuin, memberuin, friendnick, troopnick, 1));
                  }
                }
              }
            }
            else if (QLog.isColorLevel())
            {
              QLog.d("Q.fts.troop.operator", 2, "transToDatabase memberList is null");
            }
          }
          else if (mOpt == 2)
          {
            localArrayList.add(a(2, String.valueOf(mTroopUin), String.valueOf(mMemberUin), "", "", 16));
          }
          else if (QLog.isColorLevel())
          {
            QLog.d("Q.fts.troop.operator", 2, "transToDatabase unknown opt:" + localFTSTroopSync.toString());
          }
        }
      }
    }
  }
  
  public void f()
  {
    jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler.post(new nlx(this));
  }
}
