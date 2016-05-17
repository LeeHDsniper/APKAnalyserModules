package com.tencent.mobileqq.app;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class ThreadPoolParams
{
  public int a;
  public String a;
  public BlockingQueue a;
  public int b;
  public int c;
  public int d;
  
  public ThreadPoolParams()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = "default_name";
    jdField_a_of_type_Int = 5;
    b = 5;
    c = 20;
    d = 1;
    jdField_a_of_type_JavaUtilConcurrentBlockingQueue = new LinkedBlockingQueue(128);
  }
}
