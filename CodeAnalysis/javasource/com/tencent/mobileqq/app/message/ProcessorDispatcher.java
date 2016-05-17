package com.tencent.mobileqq.app.message;

import android.util.Pair;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.HashMap;
import java.util.Map;

public class ProcessorDispatcher
  implements ProcessorDispatcherInterface
{
  private static Object jdField_a_of_type_JavaLangObject = new Object();
  private static Map jdField_a_of_type_JavaUtilMap;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ProcessorDispatcher() {}
  
  public static int a(String paramString)
  {
    return ((Integer)jdField_a_of_type_JavaUtilMapgetsecond).intValue();
  }
  
  public static String a(String paramString)
  {
    return (String)jdField_a_of_type_JavaUtilMapgetfirst;
  }
  
  public static Map a()
  {
    if (jdField_a_of_type_JavaUtilMap == null) {}
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      if (jdField_a_of_type_JavaUtilMap == null) {
        a();
      }
      return jdField_a_of_type_JavaUtilMap;
    }
  }
  
  private static void a()
  {
    jdField_a_of_type_JavaUtilMap = new HashMap();
    jdField_a_of_type_JavaUtilMap.put("MessageSvc.GetMsgV4", Pair.create("accost_processor", Integer.valueOf(5002)));
    jdField_a_of_type_JavaUtilMap.put("RegPrxySvc.GetMsgV2", Pair.create("accost_processor", Integer.valueOf(5002)));
    jdField_a_of_type_JavaUtilMap.put("AccostSvc.SvrMsg", Pair.create("accost_processor", Integer.valueOf(5001)));
    jdField_a_of_type_JavaUtilMap.put("ProfileService.Pb.ReqSystemMsg", Pair.create("system_processor", Integer.valueOf(6005)));
    jdField_a_of_type_JavaUtilMap.put("ProfileService.Pb.ReqSystemMsgNew", Pair.create("system_processor", Integer.valueOf(6002)));
    jdField_a_of_type_JavaUtilMap.put("ProfileService.Pb.ReqSystemMsgNew.Friend", Pair.create("system_processor", Integer.valueOf(6001)));
    jdField_a_of_type_JavaUtilMap.put("ProfileService.Pb.ReqSystemMsgNew.Group", Pair.create("system_processor", Integer.valueOf(6003)));
    jdField_a_of_type_JavaUtilMap.put("ProfileService.Pb.ReqNextSystemMsg", Pair.create("system_processor", Integer.valueOf(6004)));
    jdField_a_of_type_JavaUtilMap.put("ProfileService.Pb.ReqSystemMsgRead", Pair.create("system_processor", Integer.valueOf(6006)));
    jdField_a_of_type_JavaUtilMap.put("ProfileService.Pb.ReqSystemMsgAction", Pair.create("system_processor", Integer.valueOf(6007)));
    jdField_a_of_type_JavaUtilMap.put("OidbSvc.0x5cf_0", Pair.create("system_processor", Integer.valueOf(6008)));
    jdField_a_of_type_JavaUtilMap.put("MessageSvc.PbGetOneDayRoamMsg", Pair.create("c2c_processor", Integer.valueOf(1003)));
    jdField_a_of_type_JavaUtilMap.put("MessageSvc.PbGetRoamMsg", Pair.create("c2c_processor", Integer.valueOf(2001)));
    jdField_a_of_type_JavaUtilMap.put("PbMessageSvc.PbSearchRoamMsgInCloud", Pair.create("c2c_processor", Integer.valueOf(2005)));
    jdField_a_of_type_JavaUtilMap.put("TransService.ReqOffFilePack", Pair.create("offlinefile_processor", Integer.valueOf(7001)));
    jdField_a_of_type_JavaUtilMap.put("OnlinePush.ReqPush", Pair.create("businessbase_processor", Integer.valueOf(3001)));
    jdField_a_of_type_JavaUtilMap.put("MessageSvc.PbBindUinGetMsg", Pair.create("sub_account_processor", Integer.valueOf(4001)));
    jdField_a_of_type_JavaUtilMap.put("PbMessageSvc.PbBindUinMsgReadedConfirm", Pair.create("sub_account_processor", Integer.valueOf(4002)));
    jdField_a_of_type_JavaUtilMap.put("MessageSvc.PbMultiMsgSend", Pair.create("uncommon_msg_processor", Integer.valueOf(8001)));
    jdField_a_of_type_JavaUtilMap.put("PbMessageSvc.PbMsgWithDraw", Pair.create("uncommon_msg_processor", Integer.valueOf(8002)));
    jdField_a_of_type_JavaUtilMap.put("PbMessageSvc.PbDelOneRoamMsg", Pair.create("uncommon_msg_processor", Integer.valueOf(8003)));
    jdField_a_of_type_JavaUtilMap.put("SecSvcBlessingHelper.blessing_helper", Pair.create("uncommon_msg_processor", Integer.valueOf(8004)));
  }
}
