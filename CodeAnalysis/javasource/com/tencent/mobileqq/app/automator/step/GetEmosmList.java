package com.tencent.mobileqq.app.automator.step;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.tencent.mobileqq.app.EmosmHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.data.EmoticonPackage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.model.EmoticonManager;
import com.tencent.qphone.base.util.QLog;
import java.util.Iterator;
import java.util.List;
import mqq.app.MobileQQ;

public class GetEmosmList
  extends AsyncStep
{
  public GetEmosmList()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, "getEmosmList start int QQInitHandler...");
    }
    EmoticonManager localEmoticonManager = (EmoticonManager)a.b.getManager(13);
    Object localObject = a.b.getApplication().getSharedPreferences("mobileQQ", 0);
    if (!Boolean.valueOf(((SharedPreferences)localObject).getBoolean("emosm_has_set_emosmpackage_valid_" + a.b.a(), false)).booleanValue())
    {
      List localList = localEmoticonManager.a();
      if (localList != null)
      {
        Iterator localIterator = localList.iterator();
        while (localIterator.hasNext()) {
          nextvalid = true;
        }
        localEmoticonManager.a(localList);
      }
      ((SharedPreferences)localObject).edit().putBoolean("emosm_has_set_emosmpackage_valid_" + a.b.a(), true).commit();
    }
    localObject = Boolean.valueOf(((SharedPreferences)localObject).getBoolean("emosm_has_download_emosmpackage_tag_" + a.b.a(), false));
    if (QLog.isColorLevel()) {
      QLog.d("QQInitHandler", 2, "oidbFlag oidbFlag int oidbFlag..." + localObject);
    }
    if (((Boolean)localObject).booleanValue()) {
      localEmoticonManager.a();
    }
    for (;;)
    {
      localEmoticonManager.f();
      return 7;
      ((EmosmHandler)a.b.a(12)).b();
    }
  }
}
