package com.tencent.mobileqq.transfile;

import com.tencent.common.app.AppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.httputils.IHttpCommunicatorListener;
import com.tencent.qphone.base.util.QLog;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

public abstract class BaseTransFileController
  implements INetEngine.INetEngineListener
{
  public static final String a = "Q.richmedia.TransFileController";
  public AppInterface a;
  public BaseTransFileController.ProcHandler a;
  public ConcurrentHashMap a;
  AtomicBoolean a;
  
  public BaseTransFileController(AppInterface paramAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqTransfileBaseTransFileController$ProcHandler = null;
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean(true);
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap(20);
    if (QLog.isColorLevel()) {
      QLog.d("Q.richmedia.TransFileController", 2, "construct transfilecontroller:" + this);
    }
    jdField_a_of_type_ComTencentCommonAppAppInterface = paramAppInterface;
    jdField_a_of_type_ComTencentMobileqqTransfileBaseTransFileController$ProcHandler = new BaseTransFileController.ProcHandler(this, ThreadManager.b());
  }
  
  public abstract BaseTransProcessor a(TransferRequest paramTransferRequest);
  
  public IHttpCommunicatorListener a(String paramString, long paramLong)
  {
    if (!jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.isEmpty()) {
      return (IHttpCommunicatorListener)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramString + paramLong);
    }
    return null;
  }
  
  protected Set a(ConcurrentHashMap paramConcurrentHashMap)
  {
    HashSet localHashSet = new HashSet();
    if (paramConcurrentHashMap != null) {}
    for (paramConcurrentHashMap = paramConcurrentHashMap.keySet(); paramConcurrentHashMap != null; paramConcurrentHashMap = null)
    {
      paramConcurrentHashMap = paramConcurrentHashMap.iterator();
      while (paramConcurrentHashMap.hasNext()) {
        localHashSet.add((String)paramConcurrentHashMap.next());
      }
    }
    return localHashSet;
  }
  
  public abstract void a();
  
  public void a(NetReq paramNetReq, long paramLong1, long paramLong2) {}
  
  public void a(NetResp paramNetResp)
  {
    StringBuilder localStringBuilder;
    if (QLog.isColorLevel())
    {
      localStringBuilder = new StringBuilder().append("doPreConn req").append(a).append(" result:");
      if (e != 0) {
        break label55;
      }
    }
    label55:
    for (boolean bool = true;; bool = false)
    {
      QLog.e("Q.richmedia.TransFileController", 2, bool);
      return;
    }
  }
  
  public void a(TransProcessorHandler paramTransProcessorHandler)
  {
    BaseTransProcessor.a(paramTransProcessorHandler);
  }
  
  public boolean a(TransferRequest paramTransferRequest)
  {
    String str = paramTransferRequest.a();
    if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get())
    {
      if (!jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.containsKey(str))
      {
        paramTransferRequest = a(paramTransferRequest);
        if ((paramTransferRequest != null) && (paramTransferRequest.c() == 0))
        {
          jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.put(str, paramTransferRequest);
          paramTransferRequest.b(str);
          if (jdField_a_of_type_ComTencentMobileqqTransfileBaseTransFileController$ProcHandler != null)
          {
            jdField_a_of_type_ComTencentMobileqqTransfileBaseTransFileController$ProcHandler.a(paramTransferRequest);
            return true;
          }
        }
      }
      else
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.richmedia.TransFileController", 2, "bad bad");
        }
        ((BaseTransProcessor)a(c, a)).a();
        return false;
      }
    }
    else if (QLog.isColorLevel()) {
      QLog.e("Q.richmedia.TransFileController", 2, AbstractImageDownloader.a(new Exception("tranfilecontroller closed")));
    }
    return false;
  }
  
  public boolean a(String paramString)
  {
    if (paramString == null) {}
    while (jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(paramString) == null) {
      return false;
    }
    return true;
  }
  
  public void b()
  {
    Iterator localIterator = a(jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap).iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      Object localObject = (IHttpCommunicatorListener)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(str);
      if ((localObject instanceof BaseTransProcessor))
      {
        localObject = (BaseTransProcessor)localObject;
        ((BaseTransProcessor)localObject).j();
        ((BaseTransProcessor)localObject).b();
        ((BaseTransProcessor)localObject).d();
        jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(str);
      }
    }
  }
  
  public void b(TransProcessorHandler paramTransProcessorHandler)
  {
    BaseTransProcessor.b(paramTransProcessorHandler);
  }
}
