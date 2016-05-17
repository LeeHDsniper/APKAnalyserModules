package com.tencent.mobileqq.app.message;

import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.DataLineHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.proxy.DataLineMsgProxy;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class DatalineMessagePcManager
  extends DatalineMessageManager
{
  public DatalineMessagePcManager(QQAppInterface paramQQAppInterface, QQMessageFacade paramQQMessageFacade)
  {
    super(paramQQAppInterface, paramQQMessageFacade);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = AppConstants.ai;
    jdField_a_of_type_Int = 6000;
  }
  
  protected DataLineMsgProxy a()
  {
    return jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(0);
  }
  
  protected void a()
  {
    ((DataLineHandler)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(8)).a(false);
  }
}
