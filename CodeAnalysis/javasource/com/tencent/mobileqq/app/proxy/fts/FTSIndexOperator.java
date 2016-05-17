package com.tencent.mobileqq.app.proxy.fts;

import android.os.Message;
import com.tencent.mobileqq.app.FTSConstants;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.fts.FTSDatatbase;
import com.tencent.mobileqq.persistence.fts.FTSEntity;
import com.tencent.mobileqq.utils.fts.SQLiteFTSUtils;
import java.util.ArrayList;
import java.util.Observable;
import java.util.Observer;

public abstract class FTSIndexOperator
  extends Observable
  implements FTSConstants
{
  protected int a;
  public QQAppInterface a;
  public FTSSyncHandler a;
  protected FTSUpgrader a;
  public FTSDatatbase a;
  protected volatile boolean a;
  protected boolean b;
  protected boolean c;
  protected boolean d;
  
  public FTSIndexOperator(QQAppInterface paramQQAppInterface, FTSSyncHandler paramFTSSyncHandler)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = -1;
    b = false;
    c = false;
    d = false;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler = paramFTSSyncHandler;
  }
  
  public ArrayList a(String paramString, Class paramClass, boolean paramBoolean)
  {
    return null;
  }
  
  public ArrayList a(String paramString, Class paramClass, boolean paramBoolean1, boolean paramBoolean2)
  {
    return null;
  }
  
  public ArrayList a(String paramString, Class paramClass, boolean paramBoolean1, boolean paramBoolean2, int paramInt)
  {
    return null;
  }
  
  public void a()
  {
    d = true;
    if (jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSUpgrader != null) {
      jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSUpgrader.a();
    }
  }
  
  public void a(FTSEntity paramFTSEntity) {}
  
  public void a(Observer paramObserver)
  {
    if (paramObserver != null) {
      addObserver(paramObserver);
    }
  }
  
  public boolean a()
  {
    if (SQLiteFTSUtils.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface) != 1) {}
    while (jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSUpgrader == null) {
      return false;
    }
    return jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSUpgrader.a();
  }
  
  public boolean a(FTSDatatbase paramFTSDatatbase)
  {
    jdField_a_of_type_ComTencentMobileqqPersistenceFtsFTSDatatbase = paramFTSDatatbase;
    return true;
  }
  
  public boolean a(FTSEntity paramFTSEntity)
  {
    return false;
  }
  
  public void b()
  {
    if (a()) {
      b();
    }
  }
  
  public void b(FTSEntity paramFTSEntity) {}
  
  public void b(Observer paramObserver)
  {
    if (paramObserver != null) {
      deleteObserver(paramObserver);
    }
  }
  
  public boolean b()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSUpgrader != null) {
      return jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSUpgrader.b();
    }
    return true;
  }
  
  public void c()
  {
    setChanged();
    notifyObservers();
  }
  
  public boolean c()
  {
    return true;
  }
  
  public void d()
  {
    jdField_a_of_type_ComTencentMobileqqAppProxyFtsFTSSyncHandler.obtainMessage(2, this).sendToTarget();
  }
  
  public abstract void e();
}
