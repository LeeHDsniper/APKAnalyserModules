package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.CardHandler;
import com.tencent.mobileqq.app.ConfigHandler;
import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.nearby.NearbyRelevantHandler;
import com.tencent.mobileqq.subaccount.datamanager.SubAccountManager;
import java.util.ArrayList;
import java.util.Iterator;

public class GetSelfInfo
  extends AsyncStep
{
  public GetSelfInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    FriendListHandler localFriendListHandler = (FriendListHandler)a.b.a(1);
    if (a.b.d)
    {
      localObject = (SubAccountManager)a.b.getManager(60);
      if (localObject == null) {
        break label187;
      }
    }
    label187:
    for (Object localObject = ((SubAccountManager)localObject).a();; localObject = null)
    {
      if ((localObject != null) && (((ArrayList)localObject).size() > 0))
      {
        a.b.d = false;
        localObject = ((ArrayList)localObject).iterator();
        while (((Iterator)localObject).hasNext()) {
          localFriendListHandler.b((String)((Iterator)localObject).next());
        }
      }
      localObject = (CardHandler)a.b.a(2);
      if (localObject != null) {
        ((CardHandler)localObject).d();
      }
      ((ConfigHandler)a.b.a(4)).c();
      ((NearbyRelevantHandler)a.b.a(66)).c();
      a.b.b(a.b.getAccount());
      return 7;
    }
  }
}
