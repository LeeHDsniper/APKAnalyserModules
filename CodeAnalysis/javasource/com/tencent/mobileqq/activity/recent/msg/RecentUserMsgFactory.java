package com.tencent.mobileqq.activity.recent.msg;

import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.BaseApplication;
import cooperation.troop_homework.model.TroopHomeworkSpecialMsg;

public class RecentUserMsgFactory
{
  public RecentUserMsgFactory()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static Object a(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return null;
    case 8: 
      return new TroopSpecialAttentionMsg(BaseApplication.getContext());
    case 4: 
      return new TroopNotificationMsg(BaseApplication.getContext());
    }
    return new TroopHomeworkSpecialMsg(BaseApplication.getContext());
  }
  
  public static Object a(int paramInt, byte[] paramArrayOfByte)
  {
    Object localObject = null;
    if ((paramArrayOfByte == null) || (paramArrayOfByte.length <= 0)) {
      return null;
    }
    String str;
    switch (paramInt)
    {
    case 9: 
    default: 
      str = null;
    }
    while (localObject != null)
    {
      ((IRecentUserMsg)localObject).a(paramArrayOfByte);
      return localObject;
      localObject = new TroopSpecialAttentionMsg(BaseApplication.getContext());
      str = null;
      continue;
      localObject = new TroopNotificationMsg(BaseApplication.getContext());
      str = null;
      continue;
      localObject = new TroopAtMeMsg(BaseApplication.getContext());
      str = null;
      continue;
      localObject = new TroopAtAllMsg(BaseApplication.getContext());
      str = null;
      continue;
      str = new String(paramArrayOfByte);
      continue;
      localObject = new TroopHomeworkSpecialMsg(BaseApplication.getContext());
      str = null;
      continue;
      localObject = new DingdongPluginRecentUserMsg();
      str = null;
      continue;
      localObject = new TroopReceivedFlowsersMsg(BaseApplication.getContext());
      str = null;
      continue;
      localObject = new TroopHasGiftMsg(BaseApplication.getContext());
      str = null;
      continue;
      localObject = new TroopReplyMsg(BaseApplication.getContext());
      str = null;
      continue;
      localObject = new TroopPubAccountMsg(BaseApplication.getContext());
      str = null;
      continue;
      localObject = new TroopNotificationMsg(BaseApplication.getContext());
      str = null;
      continue;
      localObject = new TroopHomeworkPraiseMsg(BaseApplication.getContext());
      str = null;
    }
    return str;
  }
  
  public static byte[] a(int paramInt, Object paramObject)
  {
    if (paramObject == null) {
      return null;
    }
    switch (paramInt)
    {
    case 11: 
    default: 
      if ((paramObject instanceof IRecentUserMsg)) {
        return ((IRecentUserMsg)paramObject).a();
      }
      break;
    case 12: 
      return ((String)paramObject).getBytes();
    }
    return ((TroopReplyMsg)paramObject).a();
  }
}
