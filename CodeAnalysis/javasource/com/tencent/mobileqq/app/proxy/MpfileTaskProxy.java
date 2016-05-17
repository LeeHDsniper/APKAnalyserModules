package com.tencent.mobileqq.app.proxy;

import android.content.ContentValues;
import android.os.Handler;
import android.os.Looper;
import com.dataline.mpfile.MpfileTaskRecord;
import com.dataline.util.WaitEvent;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.persistence.EntityManager;
import com.tencent.mobileqq.persistence.EntityManagerFactory;
import java.util.ArrayList;
import java.util.List;
import nlq;
import nlr;
import nls;
import nlt;

public class MpfileTaskProxy
  extends BaseProxy
{
  private static final int jdField_a_of_type_Int = 15;
  List jdField_a_of_type_JavaUtilList;
  
  public MpfileTaskProxy(QQAppInterface paramQQAppInterface, ProxyManager paramProxyManager)
  {
    super(paramQQAppInterface, paramProxyManager);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilList = null;
  }
  
  private String a(long paramLong, int paramInt)
  {
    String str = MpfileTaskRecord.tableName();
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("select * ").append("from " + str + " ");
    if (paramLong != -1L) {
      localStringBuilder.append("where " + str + ".msgId < ? ");
    }
    localStringBuilder.append("limit " + paramInt + " ");
    return localStringBuilder.toString();
  }
  
  public long a(MpfileTaskRecord paramMpfileTaskRecord)
  {
    WaitEvent localWaitEvent = new WaitEvent(false, false);
    Looper localLooper = Looper.getMainLooper();
    if (Thread.currentThread() == localLooper.getThread())
    {
      a(paramMpfileTaskRecord, null);
      return 0L;
    }
    new Handler(localLooper).post(new nlt(this, paramMpfileTaskRecord, localWaitEvent));
    localWaitEvent.a(-1L);
    return 0L;
  }
  
  public List a()
  {
    if (jdField_a_of_type_JavaUtilList == null)
    {
      Object localObject = MpfileTaskRecord.tableName();
      EntityManager localEntityManager = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().createEntityManager();
      localEntityManager.b("create index if not exists " + (String)localObject + "_index ON " + (String)localObject + "(fileId, msgId)");
      List localList = localEntityManager.a(MpfileTaskRecord.class, a(-1L, 15), null);
      localObject = localList;
      if (localList == null) {
        localObject = new ArrayList();
      }
      jdField_a_of_type_JavaUtilList = ((List)localObject);
      localEntityManager.a();
    }
    return jdField_a_of_type_JavaUtilList;
  }
  
  protected void a() {}
  
  public void a(Entity paramEntity, ProxyListener paramProxyListener)
  {
    WaitEvent localWaitEvent = new WaitEvent(false, false);
    Looper localLooper = Looper.getMainLooper();
    if (Thread.currentThread() == localLooper.getThread())
    {
      paramEntity = ((MpfileTaskRecord)paramEntity).clone();
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(String.valueOf(0), 0, MpfileTaskRecord.tableName(), paramEntity, 0, paramProxyListener);
      return;
    }
    new Handler(localLooper).post(new nlq(this, paramEntity, paramProxyListener, localWaitEvent));
    localWaitEvent.a(-1L);
  }
  
  public void a(String paramString1, ContentValues paramContentValues, String paramString2, String[] paramArrayOfString, ProxyListener paramProxyListener)
  {
    Looper localLooper = Looper.getMainLooper();
    if (Thread.currentThread() == localLooper.getThread())
    {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(String.valueOf(0), 0, paramString1, paramContentValues, paramString2, paramArrayOfString, 1, paramProxyListener);
      return;
    }
    new Handler(localLooper).post(new nlr(this, paramString1, paramContentValues, paramString2, paramArrayOfString, paramProxyListener));
  }
  
  public void a(String paramString1, String paramString2, String[] paramArrayOfString, ProxyListener paramProxyListener)
  {
    Looper localLooper = Looper.getMainLooper();
    if (Thread.currentThread() == localLooper.getThread())
    {
      jdField_a_of_type_ComTencentMobileqqAppProxyProxyManager.a(String.valueOf(0), 0, paramString1, paramString2, paramArrayOfString, 2, paramProxyListener);
      return;
    }
    new Handler(localLooper).post(new nls(this, paramString1, paramString2, paramArrayOfString, paramProxyListener));
  }
  
  protected void b() {}
}
