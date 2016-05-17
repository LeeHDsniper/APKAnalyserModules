package com.tencent.mobileqq.activity.photo;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.MessageQueue;
import android.os.MessageQueue.IdleHandler;
import android.os.Messenger;
import android.os.RemoteException;
import com.tencent.biz.pubaccount.util.PublicAccountUtil;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pic.Logger;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.qphone.base.util.QLog;
import com.tencent.qqprotect.singleupdate.MD5FileUtil;
import com.tencent.util.BinderWarpper;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import mbx;
import mby;

public class SendPhotoActivity
  extends BaseActivity
{
  public static final int a = 1;
  public static final String a;
  public static final int b = 2;
  public static final String b = "TimeOut";
  public long a;
  public Handler a;
  MessageQueue.IdleHandler jdField_a_of_type_AndroidOsMessageQueue$IdleHandler = new mbx(this);
  Messenger jdField_a_of_type_AndroidOsMessenger;
  public SendPhotoActivity.sendPhotoTask a;
  boolean jdField_a_of_type_Boolean = false;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = SendPhotoActivity.class.getName();
  }
  
  public SendPhotoActivity()
  {
    jdField_a_of_type_AndroidOsHandler = new mby(this);
  }
  
  public static void a()
  {
    String str1 = AppConstants.bd + "photo/" + ".nomedia";
    String str2 = AppConstants.bd + "thumb/" + ".nomedia";
    String str3 = AppConstants.bd + "thumb2/" + ".nomedia";
    FileUtils.b(str1);
    FileUtils.b(str2);
    FileUtils.b(str3);
  }
  
  private static void b(BaseActivity paramBaseActivity, ArrayList paramArrayList)
  {
    Object localObject1 = paramBaseActivity.getIntent();
    ArrayList localArrayList = new ArrayList();
    Object localObject2 = paramBaseActivity.getClass().getSimpleName();
    QLog.d((String)localObject2, 2, "[report]Send Picture count=" + paramArrayList.size());
    int i = 0;
    while (i < paramArrayList.size())
    {
      localArrayList.add(MD5FileUtil.a((String)paramArrayList.get(i)));
      QLog.d((String)localObject2, 2, "[report] picture " + i + "md5=" + MD5FileUtil.a((String)paramArrayList.get(i)) + ": path=" + (String)paramArrayList.get(i));
      i += 1;
    }
    if (((Intent)localObject1).getIntExtra("uintype", 0) == 1008)
    {
      localObject2 = new Intent("com.tencent.biz.pubaccount.picResultAction");
      ((Intent)localObject2).putExtra("com.tencent.biz.pubaccount.picResultData", paramArrayList.size());
      ((Intent)localObject2).putStringArrayListExtra("com.tencent.biz.pubaccount.picResult_md5s", localArrayList);
      paramBaseActivity.sendBroadcast((Intent)localObject2, "com.tencent.msg.permission.pushnotify");
    }
    i = ((Intent)localObject1).getIntExtra("PhotoConst.SEND_SIZE_SPEC", -1);
    if (i != -1)
    {
      localArrayList = new ArrayList(Arrays.asList(new String[paramArrayList.size()]));
      Collections.copy(localArrayList, paramArrayList);
      PhotoUtils.a(app, i, localArrayList);
    }
    localObject1 = ((Intent)localObject1).getStringExtra("uin");
    if ((localObject1 != null) && (PublicAccountUtil.b(app, (String)localObject1))) {
      ReportController.b(app, "P_CliOper", "Pb_account_lifeservice", (String)localObject1, "0X8005C9D", "0X8005C9D", 0, paramArrayList.size(), 0, "", "", "", "");
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    mNeedStatusTrans = true;
    mActNeedImmersive = true;
    super.doOnCreate(paramBundle);
    ThreadManager.c(FileUtils.a);
    Object localObject = getIntent();
    paramBundle = ((Intent)localObject).getStringArrayListExtra("PhotoConst.PHOTO_PATHS");
    if (paramBundle == null)
    {
      Logger.b(jdField_a_of_type_JavaLangString, "initPicUploadInfos", "paths is null");
      finish();
      return true;
    }
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "TestPicSend start compress,currentTime = " + System.currentTimeMillis());
    }
    localObject = (BinderWarpper)((Intent)localObject).getParcelableExtra("presend_handler");
    if (localObject != null)
    {
      jdField_a_of_type_AndroidOsMessenger = new Messenger(a);
      localObject = Message.obtain(null, 1);
      replyTo = new Messenger(jdField_a_of_type_AndroidOsHandler);
    }
    try
    {
      jdField_a_of_type_AndroidOsMessenger.send((Message)localObject);
      int i = paramBundle.size();
      if (i > 0)
      {
        localObject = jdField_a_of_type_AndroidOsHandler.obtainMessage(2, "TimeOut");
        jdField_a_of_type_AndroidOsHandler.sendMessageDelayed((Message)localObject, i * 10000);
        Logger.b(jdField_a_of_type_JavaLangString, "doOnCreate", "send delayed Message:MSG_CANCLE_PROGRESS, delayTime = " + i * 5000);
      }
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.e(jdField_a_of_type_JavaLangString, 2, localRemoteException.getMessage());
        }
        localRemoteException.printStackTrace();
      }
    }
    jdField_a_of_type_Long = System.nanoTime();
    Logger.a(jdField_a_of_type_JavaLangString, "initPicUploadInfos", "  totalCount:" + paramBundle.size());
    setCanLock(false);
    return true;
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    Looper.myQueue().removeIdleHandler(jdField_a_of_type_AndroidOsMessageQueue$IdleHandler);
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "doOnDestroy ," + this);
    }
    isUnLockSuccess = true;
  }
  
  protected void doOnResume()
  {
    super.doOnResume();
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "doOnResume 1,mSend = " + jdField_a_of_type_Boolean + "," + this);
    }
    if (!jdField_a_of_type_Boolean)
    {
      Looper.myQueue().addIdleHandler(jdField_a_of_type_AndroidOsMessageQueue$IdleHandler);
      jdField_a_of_type_Boolean = true;
    }
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "doOnResume 2,mSend = " + jdField_a_of_type_Boolean + "," + this);
    }
  }
}
