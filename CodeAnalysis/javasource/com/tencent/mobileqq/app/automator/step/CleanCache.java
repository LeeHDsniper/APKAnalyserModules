package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.AppConstants;
import com.tencent.mobileqq.app.CardHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.filemanager.util.FileManagerUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;
import java.io.File;
import java.io.IOException;
import nhj;

public class CleanCache
  extends AsyncStep
{
  private static final int j = 3000;
  private static final int k = 2500;
  
  public CleanCache()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    a.b.a().getSharedPreferences("HEAD", 0).edit().clear().commit();
    c();
    ThreadManager.a(new nhj(this), 2, null, false);
    return 7;
  }
  
  public String a()
  {
    if ((a.b.getAccount() != null) && (a.b.isLogin())) {
      return a.b.getAccount();
    }
    return "0";
  }
  
  void c()
  {
    CardHandler.c();
    File localFile = new File(AppConstants.bd + ".nomedia");
    if (!localFile.exists()) {}
    try
    {
      localFile.createNewFile();
      FileManagerUtil.a();
      return;
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        localIOException.printStackTrace();
      }
    }
  }
}
