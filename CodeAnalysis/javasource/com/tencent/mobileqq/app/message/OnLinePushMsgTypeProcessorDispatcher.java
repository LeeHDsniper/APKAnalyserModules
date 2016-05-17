package com.tencent.mobileqq.app.message;

import android.util.Pair;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.HashMap;
import java.util.Map;

public class OnLinePushMsgTypeProcessorDispatcher
  implements ProcessorDispatcherInterface
{
  private static Object jdField_a_of_type_JavaLangObject = new Object();
  private static Map jdField_a_of_type_JavaUtilMap;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public OnLinePushMsgTypeProcessorDispatcher() {}
  
  public static int a(int paramInt)
  {
    return ((Integer)jdField_a_of_type_JavaUtilMapgetvalueOfsecond).intValue();
  }
  
  public static String a(int paramInt)
  {
    return (String)jdField_a_of_type_JavaUtilMapgetvalueOffirst;
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
    jdField_a_of_type_JavaUtilMap.put(Integer.valueOf(193), Pair.create("video_processor", Integer.valueOf(9002)));
    jdField_a_of_type_JavaUtilMap.put(Integer.valueOf(734), Pair.create("video_processor", Integer.valueOf(9003)));
    jdField_a_of_type_JavaUtilMap.put(Integer.valueOf(524), Pair.create("discuss_update_processor", Integer.valueOf(9010)));
    jdField_a_of_type_JavaUtilMap.put(Integer.valueOf(736), Pair.create("info_update_processor", Integer.valueOf(9011)));
    jdField_a_of_type_JavaUtilMap.put(Integer.valueOf(526), Pair.create("slave_master_processor", Integer.valueOf(9012)));
  }
}
