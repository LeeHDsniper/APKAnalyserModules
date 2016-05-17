package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.servlet.VipGifServlet;
import com.tencent.mobileqq.vipgift.VipGiftDownloadInfo;
import com.tencent.mobileqq.vipgift.VipGiftManager;
import mqq.app.NewIntent;

public class VipCheckGift
  extends AsyncStep
{
  public VipCheckGift()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    Object localObject = (VipGiftManager)a.b.getManager(75);
    VipGiftDownloadInfo localVipGiftDownloadInfo = ((VipGiftManager)localObject).a();
    if (localVipGiftDownloadInfo != null)
    {
      if ((d != 0L) || (a == 0L)) {
        break label54;
      }
      ((VipGiftManager)localObject).a(a);
    }
    for (;;)
    {
      return 7;
      label54:
      if (d == 2L)
      {
        localObject = new NewIntent(a.b.getApplication(), VipGifServlet.class);
        ((NewIntent)localObject).setAction("gif_ui_show");
        ((NewIntent)localObject).putExtra("gif_ui_show_bid", 0);
        ((NewIntent)localObject).putExtra("gif_ui_show_seq", a);
        a.b.startServlet((NewIntent)localObject);
      }
    }
  }
}
