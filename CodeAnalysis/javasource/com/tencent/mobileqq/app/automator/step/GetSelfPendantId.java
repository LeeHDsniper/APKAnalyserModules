package com.tencent.mobileqq.app.automator.step;

import com.tencent.mobileqq.app.FriendListHandler;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.automator.AsyncStep;
import com.tencent.mobileqq.app.automator.Automator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.vas.ClubContentJsonTask;

public class GetSelfPendantId
  extends AsyncStep
{
  public GetSelfPendantId()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private String a()
  {
    if ((a.b.getAccount() != null) && (a.b.isLogin())) {
      return a.b.getAccount();
    }
    return "0";
  }
  
  protected int a()
  {
    ((FriendListHandler)a.b.a(1)).a(new String[] { a() }, new int[] { 27025, 20059, 27032, 27041 });
    ((FriendsManager)a.b.getManager(50)).b();
    a.b.getManager(43);
    ClubContentJsonTask.a();
    return 7;
  }
}
