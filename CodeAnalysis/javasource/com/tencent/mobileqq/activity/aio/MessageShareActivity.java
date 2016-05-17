package com.tencent.mobileqq.activity.aio;

import android.app.Dialog;
import android.app.PendingIntent;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.structmsg.AbsStructMsg;
import com.tencent.mobileqq.structmsg.CGILoader;
import com.tencent.mobileqq.structmsg.StructMsgFactory;
import com.tencent.mobileqq.structmsg.StructMsgForImageShare;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MqqWeakReferenceHandler;
import mqq.os.MqqHandler;

public class MessageShareActivity
  extends BaseActivity
  implements Handler.Callback, Runnable
{
  protected static final int a = 1;
  protected static final String a = "MessageShareActivity";
  protected static final int b = 2;
  protected static final int c = 3;
  protected Dialog a;
  protected Bundle a;
  protected final MqqHandler a;
  
  public MessageShareActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_MqqOsMqqHandler = new MqqWeakReferenceHandler(Looper.getMainLooper(), this);
    jdField_a_of_type_AndroidOsBundle = null;
  }
  
  protected void a()
  {
    if (jdField_a_of_type_AndroidOsBundle == null) {
      throw new IllegalArgumentException();
    }
  }
  
  protected void doOnDestroy()
  {
    if (jdField_a_of_type_AndroidAppDialog != null)
    {
      jdField_a_of_type_AndroidAppDialog.dismiss();
      jdField_a_of_type_AndroidAppDialog = null;
    }
    super.doOnDestroy();
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    for (;;)
    {
      return true;
      int i = jdField_a_of_type_AndroidOsBundle.getInt("forward_type", -1);
      switch (i)
      {
      default: 
        break;
      case 2: 
      case 11: 
        long l = jdField_a_of_type_AndroidOsBundle.getLong("req_share_id");
        Object localObject1 = jdField_a_of_type_AndroidOsBundle.getString("pkg_name");
        paramMessage = jdField_a_of_type_AndroidOsBundle.getString("detail_url");
        jdField_a_of_type_AndroidOsBundle.putBoolean("isBack2Root", false);
        jdField_a_of_type_AndroidOsBundle.putLong("res_share_id", l);
        jdField_a_of_type_AndroidOsBundle.putString("res_pkg_name", (String)localObject1);
        jdField_a_of_type_AndroidOsBundle.putString("res_detail_url", paramMessage);
        if (QLog.isColorLevel()) {
          QLog.d("MessageShareActivity", 2, "-->handleMessage--appid = " + l + ", pkgNmae = " + (String)localObject1);
        }
        paramMessage = new Intent(this, SplashActivity.class);
        String str = jdField_a_of_type_AndroidOsBundle.getString("uin");
        int j = jdField_a_of_type_AndroidOsBundle.getInt("uintype");
        l = jdField_a_of_type_AndroidOsBundle.getLong("req_share_id");
        if (i == 11)
        {
          Object localObject2 = new Intent();
          ((Intent)localObject2).setData(Uri.parse(String.format("tencent%1$d://tauth.qq.com/?#action=%2$s&result=complete&response={\"ret\":0}", new Object[] { Long.valueOf(l), "shareToQQ" })));
          ((Intent)localObject2).setPackage((String)localObject1);
          paramMessage.putExtra("activity_finish_run_pendingIntent", PendingIntent.getActivity(this, 0, (Intent)localObject2, 268435456));
          localObject1 = jdField_a_of_type_AndroidOsBundle.getString("video_url");
          localObject2 = jdField_a_of_type_AndroidOsBundle.getString("detail_url");
          if ((!TextUtils.isEmpty((CharSequence)localObject1)) && (!TextUtils.isEmpty((CharSequence)localObject2)))
          {
            localObject1 = CGILoader.a((String)localObject2);
            if (!TextUtils.isEmpty((CharSequence)localObject1)) {
              ReportController.b(null, "CliOper", "", "", "0X8005F53", "0X8005F53", 0, 0, CGILoader.a(j) + "", "", (String)localObject1, "");
            }
          }
        }
        localObject1 = StructMsgFactory.a(jdField_a_of_type_AndroidOsBundle);
        if (localObject1 != null)
        {
          if ((localObject1 instanceof StructMsgForImageShare)) {
            StructMsgForImageShare.sendAndUploadImageShare(app, (StructMsgForImageShare)localObject1, str, j);
          }
          paramMessage.putExtra("stuctmsg_bytes", ((AbsStructMsg)localObject1).getBytes());
          if (jdField_a_of_type_AndroidOsBundle.getBoolean("share_from_aio", false)) {
            break label506;
          }
          paramMessage = AIOUtils.a(paramMessage, new int[] { 2 });
          jdField_a_of_type_AndroidOsBundle.remove("share_from_aio");
        }
        for (;;)
        {
          paramMessage.putExtras(jdField_a_of_type_AndroidOsBundle);
          startActivity(paramMessage);
          finish();
          break;
          label506:
          paramMessage = AIOUtils.a(paramMessage, null);
          paramMessage.putExtra("share_from_aio", true);
        }
        ((TextView)jdField_a_of_type_AndroidAppDialog.findViewById(2131298581)).setText("处理失败");
        jdField_a_of_type_AndroidAppDialog.findViewById(2131298580).setVisibility(4);
        jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(3, 800L);
        continue;
        finish();
      }
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    super.setContentView(new View(this));
    jdField_a_of_type_AndroidAppDialog = new Dialog(this, 2131558942);
    jdField_a_of_type_AndroidAppDialog.setCancelable(false);
    jdField_a_of_type_AndroidAppDialog.setContentView(2130903444);
    ((TextView)jdField_a_of_type_AndroidAppDialog.findViewById(2131298581)).setText(2131369998);
    jdField_a_of_type_AndroidOsBundle = getIntent().getExtras();
    if (jdField_a_of_type_AndroidOsBundle != null)
    {
      handleMessage(jdField_a_of_type_MqqOsMqqHandler.obtainMessage(1));
      return;
    }
    QLog.d("MessageShareActivity", 2, "getExtras() is null !!!!!");
    jdField_a_of_type_AndroidAppDialog.show();
    handleMessage(jdField_a_of_type_MqqOsMqqHandler.obtainMessage(2));
  }
  
  public void run()
  {
    try
    {
      a();
      jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(1, 333L);
      return;
    }
    catch (Exception localException)
    {
      QLog.d("MessageShareActivity", 2, "doShare() cause exception !!!!!");
      jdField_a_of_type_MqqOsMqqHandler.sendEmptyMessageDelayed(2, 333L);
    }
  }
}
