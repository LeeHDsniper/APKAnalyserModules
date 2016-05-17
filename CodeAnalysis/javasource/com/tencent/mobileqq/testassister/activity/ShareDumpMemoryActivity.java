package com.tencent.mobileqq.testassister.activity;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.TextUtils;
import android.view.Window;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.tencent.mobileqq.activity.JumpActivity;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.filemanager.data.FileInfo;
import com.tencent.mobileqq.filemanager.data.FileManagerEntity;
import com.tencent.mobileqq.filemanager.data.ForwardFileInfo;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import rix;
import riy;
import riz;

public class ShareDumpMemoryActivity
  extends BaseActivity
{
  private static final String jdField_a_of_type_JavaLangString = "LeakInspector";
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private List jdField_a_of_type_JavaUtilList;
  private boolean jdField_a_of_type_Boolean;
  private String b;
  private String c;
  
  public ShareDumpMemoryActivity()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilList = new ArrayList();
    c = "";
  }
  
  public static ProgressDialog a(Context paramContext)
  {
    Drawable localDrawable = paramContext.getResources().getDrawable(2130842371);
    paramContext = new ProgressDialog(paramContext, 2131558942);
    paramContext.show();
    paramContext.getWindow().setContentView(2130903050);
    paramContext.setContentView(2130903050);
    ((TextView)paramContext.findViewById(2131296741)).setText(2131369013);
    ((ProgressBar)paramContext.findViewById(2131296740)).setIndeterminateDrawable(localDrawable);
    paramContext.setCanceledOnTouchOutside(false);
    paramContext.setCancelable(false);
    return paramContext;
  }
  
  private String a()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    c = "";
    localStringBuffer.append("以下对象存在内存泄露：");
    String[] arrayOfString = (String[])jdField_a_of_type_JavaUtilList.toArray(new String[jdField_a_of_type_JavaUtilList.size()]);
    int j = arrayOfString.length;
    int i = 0;
    while (i < j)
    {
      String str = arrayOfString[i];
      localStringBuffer.append("\n");
      localStringBuffer.append(str);
      c += str;
      c += "|";
      i += 1;
    }
    localStringBuffer.append("\n\n发现内存泄漏，请及时反馈。\n点击发送开始dump。\n文件路径:SD卡/tencent/MobileQQ/log\n时间：");
    localStringBuffer.append(new SimpleDateFormat("yyyy年MM月dd日    HH:mm:ss").format(new Date(System.currentTimeMillis())));
    return localStringBuffer.toString();
  }
  
  private void c()
  {
    Intent localIntent = getIntent();
    jdField_a_of_type_Boolean = localIntent.getBooleanExtra("showWarningDialog", false);
    String str = localIntent.getStringExtra("suspiciousName");
    b = localIntent.getStringExtra("dumpFilePath");
    if (!TextUtils.isEmpty(str)) {
      jdField_a_of_type_JavaUtilList.add(str);
    }
  }
  
  private void d()
  {
    if (jdField_a_of_type_Boolean)
    {
      if (jdField_a_of_type_AndroidWidgetTextView == null) {
        e();
      }
    }
    else {
      return;
    }
    jdField_a_of_type_AndroidWidgetTextView.setText(a());
    jdField_a_of_type_JavaUtilList.clear();
  }
  
  private void e()
  {
    Dialog localDialog = new Dialog(this, 2131558942);
    localDialog.setContentView(2130903227);
    TextView localTextView = (TextView)localDialog.findViewById(2131297736);
    if (localTextView != null) {
      localTextView.setText("内存泄露告警(内测)");
    }
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)localDialog.findViewById(2131296741));
    if (jdField_a_of_type_AndroidWidgetTextView != null) {
      jdField_a_of_type_AndroidWidgetTextView.setText(a());
    }
    localTextView = (TextView)localDialog.findViewById(2131297739);
    if (localTextView != null)
    {
      localTextView.setText(2131366996);
      localTextView.setOnClickListener(new rix(this, localDialog));
    }
    localTextView = (TextView)localDialog.findViewById(2131297740);
    if (localTextView != null)
    {
      localTextView.setText(2131370463);
      localTextView.setOnClickListener(new riy(this, localDialog));
    }
    localDialog.show();
    jdField_a_of_type_JavaUtilList.clear();
  }
  
  public void a()
  {
    try
    {
      Object localObject2 = new FileInfo(b);
      Object localObject3 = FileManagerUtil.a((FileInfo)localObject2);
      Object localObject1 = new ForwardFileInfo();
      ((ForwardFileInfo)localObject1).b(nSessionId);
      ((ForwardFileInfo)localObject1).d(3);
      ((ForwardFileInfo)localObject1).b(10000);
      ((ForwardFileInfo)localObject1).a(((FileInfo)localObject2).d());
      ((ForwardFileInfo)localObject1).d(((FileInfo)localObject2).e());
      ((ForwardFileInfo)localObject1).d(((FileInfo)localObject2).a());
      localObject3 = new Bundle();
      ((Bundle)localObject3).putParcelable("fileinfo", (Parcelable)localObject1);
      ((Bundle)localObject3).putBoolean("not_forward", true);
      localObject2 = new Intent();
      ((Intent)localObject2).putExtras((Bundle)localObject3);
      ((Intent)localObject2).putExtra("forward_text", ((ForwardFileInfo)localObject1).d());
      ((Intent)localObject2).putExtra("forward_type", 0);
      ((Intent)localObject2).setAction("android.intent.action.SEND");
      ((Intent)localObject2).setClass(this, JumpActivity.class);
      localObject1 = Uri.fromFile(new File(b));
      ((Intent)localObject2).putExtra("android.intent.extra.STREAM", (Parcelable)localObject1);
      ((Intent)localObject2).setDataAndType((Uri)localObject1, "application/x-zip-compressed");
      startActivity((Intent)localObject2);
      return;
    }
    catch (Throwable localThrowable) {}
  }
  
  public void b()
  {
    ProgressDialog localProgressDialog = a(this);
    new Timer().schedule(new riz(this, localProgressDialog), 100L);
  }
  
  protected void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.doOnActivityResult(paramInt1, paramInt2, paramIntent);
    if (paramInt2 == -1) {
      switch (paramInt1)
      {
      }
    }
    for (;;)
    {
      finish();
      return;
      if ((paramIntent != null) && (paramIntent.getExtras() != null))
      {
        Intent localIntent = AIOUtils.a(new Intent(this, SplashActivity.class), new int[] { 2 });
        localIntent.putExtras(new Bundle(paramIntent.getExtras()));
        startActivity(localIntent);
      }
    }
  }
  
  protected boolean doOnCreate(Bundle paramBundle)
  {
    mActNeedImmersive = false;
    super.doOnCreate(paramBundle);
    setContentView(2130903414);
    c();
    if (jdField_a_of_type_Boolean)
    {
      e();
      return true;
    }
    a();
    return false;
  }
  
  protected void doOnNewIntent(Intent paramIntent)
  {
    super.doOnNewIntent(paramIntent);
    c();
    d();
  }
}
