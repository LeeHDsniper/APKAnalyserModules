package com.tencent.mobileqq.transfile;

import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import com.tencent.common.app.AppInterface;
import com.tencent.mobileqq.app.DeviceProfileManager;
import com.tencent.mobileqq.app.DeviceProfileManager.DpcNames;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.ptt.PttOptimizeParams;
import com.tencent.mobileqq.utils.httputils.PkgTools;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.util.QLog;
import java.nio.ByteBuffer;
import java.util.concurrent.ConcurrentHashMap;
import mqq.app.BuiltInServlet;
import mqq.app.NewIntent;
import rli;
import rlj;

public class ProtoReqManager
{
  public static final String a = "Q.richmedia.ProtoReqManager";
  public static final String b = "key_runnable_index";
  private Handler jdField_a_of_type_AndroidOsHandler;
  private AppInterface jdField_a_of_type_ComTencentCommonAppAppInterface;
  public ConcurrentHashMap a;
  private boolean jdField_a_of_type_Boolean;
  
  public ProtoReqManager(AppInterface paramAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap = new ConcurrentHashMap();
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
    jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ComTencentCommonAppAppInterface = paramAppInterface;
  }
  
  private void a()
  {
    if (DeviceProfileManager.a().a() == 4) {
      RichMediaStrategy.a(DeviceProfileManager.a().a(DeviceProfileManager.DpcNames.RichProReqCfg.name()));
    }
    DeviceProfileManager.a(new rli(this));
  }
  
  private void a(Intent paramIntent, ProtoReqManager.ProtoResp paramProtoResp)
  {
    int i = paramIntent.getIntExtra("key_runnable_index", 0);
    jdField_a_of_type_ArrayOfRlj[i].jdField_b_of_type_Boolean = true;
    jdField_a_of_type_ArrayOfRlj[i].jdField_c_of_type_Long = System.currentTimeMillis();
  }
  
  private void a(ProtoReqManager.ProtoResp paramProtoResp)
  {
    jdField_a_of_type_Boolean = true;
    int i = 0;
    while (i < jdField_a_of_type_ArrayOfRlj.length)
    {
      jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(jdField_a_of_type_ArrayOfRlj[i].jdField_a_of_type_MqqAppNewIntent);
      jdField_a_of_type_AndroidOsHandler.removeCallbacks(jdField_a_of_type_ArrayOfRlj[i]);
      i += 1;
    }
  }
  
  private boolean a(ProtoReqManager.ProtoReq paramProtoReq)
  {
    return ("PttStore.GroupPttUp".equals(jdField_a_of_type_JavaLangString)) || ("PttStore.GroupPttDown".equals(jdField_a_of_type_JavaLangString)) || ("PttCenterSvr.pb_pttCenter_CMD_REQ_APPLY_UPLOAD-500".equals(jdField_a_of_type_JavaLangString)) || ("PttCenterSvr.pb_pttCenter_CMD_REQ_APPLY_DOWNLOAD-1200".equals(jdField_a_of_type_JavaLangString));
  }
  
  private boolean a(ProtoReqManager.ProtoResp paramProtoResp)
  {
    int i = 0;
    while (i < jdField_a_of_type_ArrayOfRlj.length)
    {
      if ((!jdField_a_of_type_ArrayOfRlj[i].jdField_b_of_type_Boolean) && ((jdField_a_of_type_ArrayOfRlj[i].jdField_a_of_type_Boolean == true) || (jdField_a_of_type_ArrayOfRlj[i].jdField_c_of_type_Boolean == true))) {
        return false;
      }
      i += 1;
    }
    return true;
  }
  
  private void c(ProtoReqManager.ProtoReq paramProtoReq)
  {
    jdField_a_of_type_Int = RichMediaStrategy.c();
    jdField_b_of_type_Int = RichMediaStrategy.a();
    c = RichMediaStrategy.b();
  }
  
  private void d(ProtoReqManager.ProtoReq paramProtoReq)
  {
    if ((jdField_a_of_type_ComTencentCommonAppAppInterface instanceof QQAppInterface))
    {
      jdField_a_of_type_Int = PttOptimizeParams.a((QQAppInterface)jdField_a_of_type_ComTencentCommonAppAppInterface);
      jdField_b_of_type_Int = PttOptimizeParams.b((QQAppInterface)jdField_a_of_type_ComTencentCommonAppAppInterface);
      c = PttOptimizeParams.c((QQAppInterface)jdField_a_of_type_ComTencentCommonAppAppInterface);
      if (QLog.isColorLevel()) {
        QLog.d("Q.richmedia.ProtoReqManager", 2, "ptt config from dpc:" + jdField_a_of_type_Int + jdField_b_of_type_Int + c);
      }
    }
  }
  
  public void a(Intent paramIntent, FromServiceMsg paramFromServiceMsg)
  {
    for (;;)
    {
      ProtoReqManager.ProtoResp localProtoResp;
      ProtoReqManager.ProtoReq localProtoReq;
      int i;
      try
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.richmedia.ProtoReqManager", 2, "onRecieve." + paramFromServiceMsg);
        }
        if ((paramIntent != null) && (paramFromServiceMsg != null))
        {
          localProtoResp = (ProtoReqManager.ProtoResp)jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.get(paramIntent);
          if (localProtoResp != null)
          {
            boolean bool = jdField_a_of_type_Boolean;
            if (!bool) {
              continue;
            }
          }
        }
        return;
        a(paramIntent, localProtoResp);
        localProtoReq = jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$ProtoReq;
        jdField_a_of_type_ComTencentQphoneBaseRemoteFromServiceMsg = paramFromServiceMsg;
        jdField_a_of_type_ComTencentMobileqqAppMessageObserver$StatictisInfo.c = jdField_a_of_type_ComTencentQphoneBaseRemoteFromServiceMsg.getResultCode();
        i = paramFromServiceMsg.getResultCode();
        if (i == 1000)
        {
          a(localProtoResp);
          jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(paramIntent);
          if (jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$IProtoRespBack == null) {
            continue;
          }
          i = paramFromServiceMsg.getWupBuffer().length - 4;
          paramIntent = new byte[i];
          PkgTools.a(paramIntent, 0, paramFromServiceMsg.getWupBuffer(), 4, i);
          paramFromServiceMsg.putWupBuffer(paramIntent);
          jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$IProtoRespBack.a(localProtoResp, localProtoReq);
          continue;
        }
        if (i != 2901) {
          break label339;
        }
      }
      finally {}
      long l1 = System.currentTimeMillis() - jdField_a_of_type_Long;
      if ((l1 < e) && (jdField_a_of_type_Int < jdField_b_of_type_Int))
      {
        long l2 = jdField_a_of_type_Int;
        paramIntent = jdField_a_of_type_ArrayOfRlj[jdField_a_of_type_Int];
        jdField_a_of_type_Int += 1;
        jdField_a_of_type_Long = (l2 - l1 - 5000L);
        a(paramIntent, 0L);
      }
      else
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.richmedia.ProtoReqManager", 2, "onReceive found 2901 but do not retry : elapse:" + l1 + " index:" + jdField_a_of_type_Int);
        }
        label339:
        if (a(localProtoResp))
        {
          a(localProtoResp);
          jdField_a_of_type_JavaUtilConcurrentConcurrentHashMap.remove(paramIntent);
          if (i == 1013)
          {
            paramIntent = new NewIntent(jdField_a_of_type_ComTencentCommonAppAppInterface.getApplication(), BuiltInServlet.class);
            paramIntent.setObserver(new ProtoReqManager.CheckConErroObserverImp(this, localProtoResp, localProtoReq));
            paramIntent.putExtra("action", 2201);
            jdField_a_of_type_ComTencentCommonAppAppInterface.startServlet(paramIntent);
          }
          else if (jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$IProtoRespBack != null)
          {
            jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$IProtoRespBack.a(localProtoResp, localProtoReq);
          }
        }
      }
    }
  }
  
  public void a(ProtoReqManager.ProtoReq paramProtoReq)
  {
    for (;;)
    {
      try
      {
        if (QLog.isColorLevel()) {
          QLog.d("Q.richmedia.ProtoReqManager", 2, "req:" + jdField_a_of_type_JavaLangString);
        }
        if (!jdField_a_of_type_Boolean)
        {
          a();
          jdField_a_of_type_Boolean = true;
        }
        if (paramProtoReq != null)
        {
          if ((jdField_a_of_type_JavaLangString != null) && ((jdField_a_of_type_JavaLangString.equals("ImgStore.GroupPicUp")) || (jdField_a_of_type_JavaLangString.equals("LongConn.OffPicUp")))) {
            c(paramProtoReq);
          }
          if ((jdField_a_of_type_JavaLangString != null) && ((jdField_a_of_type_JavaLangString.equals("PttStore.GroupPttUp")) || (jdField_a_of_type_JavaLangString.equals("PttCenterSvr.pb_pttCenter_CMD_REQ_APPLY_UPLOAD-500")))) {
            d(paramProtoReq);
          }
          ProtoReqManager.ProtoResp localProtoResp = new ProtoReqManager.ProtoResp();
          jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$ProtoResp = localProtoResp;
          jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$ProtoReq = paramProtoReq;
          jdField_a_of_type_Long = System.currentTimeMillis();
          jdField_a_of_type_ArrayOfRlj = new rlj[jdField_b_of_type_Int];
          byte[] arrayOfByte = jdField_a_of_type_ArrayOfByte;
          Object localObject = ByteBuffer.allocate(arrayOfByte.length + 4);
          ((ByteBuffer)localObject).putInt(arrayOfByte.length + 4).put(arrayOfByte);
          arrayOfByte = ((ByteBuffer)localObject).array();
          i = 0;
          if (i >= jdField_b_of_type_Int) {
            break label502;
          }
          localObject = new rlj(this);
          jdField_a_of_type_ArrayOfRlj[i] = localObject;
          jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$ProtoResp = localProtoResp;
          jdField_a_of_type_MqqAppNewIntent = new NewIntent(jdField_a_of_type_ComTencentCommonAppAppInterface.a(), ProtoServlet.class);
          localObject = jdField_a_of_type_MqqAppNewIntent;
          ((NewIntent)localObject).putExtra("key_body", arrayOfByte);
          ((NewIntent)localObject).putExtra("key_cmd", jdField_a_of_type_JavaLangString);
          ((NewIntent)localObject).putExtra("key_runnable_index", i);
          ((NewIntent)localObject).putExtra("key_fastresend", jdField_a_of_type_Boolean);
          ((NewIntent)localObject).putExtra("remind_slown_network", jdField_b_of_type_Boolean);
          if ((a(paramProtoReq)) && ((jdField_a_of_type_ComTencentCommonAppAppInterface instanceof QQAppInterface)) && (PttOptimizeParams.d((QQAppInterface)jdField_a_of_type_ComTencentCommonAppAppInterface)))
          {
            ((NewIntent)localObject).putExtra("quickSendEnable", true);
            ((NewIntent)localObject).putExtra("quickSendStrategy", 1);
            if (QLog.isColorLevel())
            {
              QLog.d("http_sideway", 2, "set");
              break label495;
              if (i < c)
              {
                long l1 = jdField_a_of_type_Int * i / c;
                long l2 = jdField_a_of_type_Int;
                long l3 = d * i;
                jdField_a_of_type_ArrayOfRlj[i].jdField_a_of_type_Long = (l2 - l1 - l3);
                a(jdField_a_of_type_ArrayOfRlj[i], l1);
                i += 1;
                continue;
              }
              jdField_a_of_type_Int = c;
            }
          }
        }
        else
        {
          return;
        }
      }
      finally {}
      label495:
      i += 1;
      continue;
      label502:
      int i = 0;
    }
  }
  
  public void a(NewIntent paramNewIntent)
  {
    jdField_a_of_type_ComTencentCommonAppAppInterface.startServlet(paramNewIntent);
  }
  
  void a(rlj paramRlj, long paramLong)
  {
    jdField_c_of_type_Boolean = true;
    jdField_a_of_type_AndroidOsHandler.postDelayed(paramRlj, paramLong);
  }
  
  public void b(ProtoReqManager.ProtoReq paramProtoReq)
  {
    if (paramProtoReq != null) {}
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$ProtoResp != null) {
        a(jdField_a_of_type_ComTencentMobileqqTransfileProtoReqManager$ProtoResp);
      }
      return;
    }
    finally
    {
      paramProtoReq = finally;
      throw paramProtoReq;
    }
  }
}
