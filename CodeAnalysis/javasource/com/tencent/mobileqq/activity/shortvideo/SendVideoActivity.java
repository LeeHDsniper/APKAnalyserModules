package com.tencent.mobileqq.activity.shortvideo;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler.Callback;
import android.os.Message;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.MessageObserver;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.MessageForShortVideo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.BaseTransProcessor;
import com.tencent.mobileqq.transfile.ShortVideoUploadProcessor;
import com.tencent.mobileqq.transfile.TransFileController;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MqqWeakReferenceHandler;
import java.util.ArrayList;
import mod;
import moh;
import mqq.os.MqqHandler;

public class SendVideoActivity
  extends BaseActivity
  implements Handler.Callback
{
  static final int jdField_a_of_type_Int = 1;
  private static final long jdField_a_of_type_Long = 45000L;
  private static MessageForShortVideo jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo;
  private static MqqWeakReferenceHandler jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler;
  public static final String a = "SendVideoActivity";
  static final int jdField_b_of_type_Int = 2;
  private static boolean jdField_b_of_type_Boolean = false;
  static final int c = 3;
  static final int d = 4;
  static final int e = 6;
  static final int f = 5;
  static final int g = 8;
  private static final int h = 1;
  private MessageObserver jdField_a_of_type_ComTencentMobileqqAppMessageObserver;
  boolean jdField_a_of_type_Boolean;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    b = false;
  }
  
  public SendVideoActivity() {}
  
  public static void a(Intent paramIntent)
  {
    int i = paramIntent.getIntExtra("sv_encode_max_bitrate", -1);
    if (i > 0) {
      com.tencent.mobileqq.shortvideo.mediadevice.CodecParam.t = i;
    }
    i = paramIntent.getIntExtra("sv_encode_min_bitrate", -1);
    if (i > 0) {
      com.tencent.mobileqq.shortvideo.mediadevice.CodecParam.u = i;
    }
    i = paramIntent.getIntExtra("sv_encode_qmax", -1);
    if (i > 0) {
      com.tencent.mobileqq.shortvideo.mediadevice.CodecParam.v = i;
    }
    i = paramIntent.getIntExtra("sv_encode_qmin", -1);
    if (i > 0) {
      com.tencent.mobileqq.shortvideo.mediadevice.CodecParam.w = i;
    }
    i = paramIntent.getIntExtra("sv_encode_qmaxdiff", -1);
    if (i > 0) {
      com.tencent.mobileqq.shortvideo.mediadevice.CodecParam.x = i;
    }
    i = paramIntent.getIntExtra("sv_encode_ref_frame", -1);
    if (i > 0) {
      com.tencent.mobileqq.shortvideo.mediadevice.CodecParam.y = i;
    }
    i = paramIntent.getIntExtra("sv_encode_smooth", -1);
    if (i > 0) {
      com.tencent.mobileqq.shortvideo.mediadevice.CodecParam.z = i;
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    mNeedStatusTrans = true;
    mActNeedImmersive = false;
    super.doOnCreate(paramBundle);
    int i = getIntent().getIntExtra("file_send_business_type", 0);
    if (QLog.isColorLevel()) {
      QLog.d("SendVideoActivity", 2, "doOnCreate(), ===>> busiType=" + i + ",VideoFileDir = " + getIntent().getStringExtra("file_video_source_dir"));
    }
    switch (i)
    {
    }
    for (;;)
    {
      if (QLog.isColorLevel()) {
        QLog.d("SendVideoActivity", 2, "doOnCreate(), <<===");
      }
      return true;
      new SendVideoActivity.SendVideoTask(this, null).execute(new Void[0]);
      continue;
      paramBundle = getIntent().getStringExtra("activity_before_enter_send_video");
      if ((paramBundle != null) && (ShortVideoPreviewActivity.class.getName().equals(paramBundle)))
      {
        new SendVideoActivity.SendAppShortVideoTask(this).execute(new Void[0]);
      }
      else
      {
        ThreadManager.b().post(new moh(this, null));
        continue;
        String str = getIntent().getStringExtra("uin");
        ArrayList localArrayList = getIntent().getStringArrayListExtra("bless_uin_list");
        StringBuilder localStringBuilder;
        if (QLog.isColorLevel())
        {
          localStringBuilder = new StringBuilder().append("doOnCreate, uin= ").append(str).append(" uinList= ");
          if (localArrayList == null) {
            break label372;
          }
        }
        label372:
        for (paramBundle = localArrayList.toString();; paramBundle = null)
        {
          QLog.d("SendVideoActivity", 2, paramBundle);
          if ((str == null) || (!str.equals("0")) || (localArrayList == null)) {
            break label449;
          }
          int j = getIntent().getIntExtra("uintype", -1);
          if (j == 0) {
            break label377;
          }
          if (QLog.isColorLevel()) {
            QLog.d("SendVideoActivity", 2, "doOnCreate error, uinType= " + j + " busiType= " + i);
          }
          finish();
          break;
        }
        label377:
        jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler = new MqqWeakReferenceHandler(this);
        b = false;
        jdField_a_of_type_ComTencentMobileqqAppMessageObserver = new mod(this);
        app.a(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
        new SendVideoActivity.SendBlessPTVTask(app, this).execute(new Void[0]);
        jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.sendEmptyMessageDelayed(1, 45000L);
        continue;
        label449:
        ThreadManager.b().post(new moh(this, null));
        continue;
        ThreadManager.b().post(new moh(this, null));
      }
    }
  }
  
  protected void doOnDestroy()
  {
    super.doOnDestroy();
    if (jdField_a_of_type_ComTencentMobileqqAppMessageObserver != null) {
      app.b(jdField_a_of_type_ComTencentMobileqqAppMessageObserver);
    }
    if (jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler != null) {
      jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(1);
    }
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    for (;;)
    {
      return false;
      if (jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideo != null)
      {
        paramMessage = app.a().a(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideofrienduin, jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideouniseq);
        if ((paramMessage != null) && (ShortVideoUploadProcessor.class.isInstance(paramMessage)))
        {
          boolean bool = ((BaseTransProcessor)paramMessage).c();
          int i = jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideovideoFileStatus;
          if ((bool) || (i == 1002) || (i == 1001)) {
            app.a().c(jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideofrienduin, jdField_a_of_type_ComTencentMobileqqDataMessageForShortVideouniseq);
          }
        }
      }
      b = true;
      setResult(-2);
      finish();
    }
  }
}
