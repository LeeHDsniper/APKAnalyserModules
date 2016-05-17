import com.tencent.mobileqq.activity.contact.newfriend.SystemMsgItemBaseBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.systemmsg.MessageForSystemMsg;
import com.tencent.widget.SwipRightMenuBuilder.SwipRightMenuItem;
import com.tencent.widget.SwipTextViewMenuBuilder;

public class lsl
  extends SwipTextViewMenuBuilder
{
  public lsl(SystemMsgItemBaseBuilder paramSystemMsgItemBaseBuilder, int paramInt1, int paramInt2, int[] paramArrayOfInt1, int paramInt3, int[] paramArrayOfInt2, int[] paramArrayOfInt3, int[] paramArrayOfInt4)
  {
    super(paramInt1, paramInt2, paramArrayOfInt1, paramInt3, paramArrayOfInt2, paramArrayOfInt3, paramArrayOfInt4);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, Object paramObject, SwipRightMenuBuilder.SwipRightMenuItem[] paramArrayOfSwipRightMenuItem)
  {
    int j = 0;
    if ((paramArrayOfSwipRightMenuItem == null) || (paramArrayOfSwipRightMenuItem.length <= 0)) {
      return;
    }
    if ((paramObject instanceof MessageForSystemMsg)) {}
    for (int i = mSysmsgMenuFlag;; i = 0)
    {
      paramInt = j;
      if (paramArrayOfSwipRightMenuItem.length < 0)
      {
        paramInt = j;
        if ((i & 0xF) == 1)
        {
          0b = 0;
          0a = 0;
          paramInt = 1;
        }
      }
      while (paramInt < paramArrayOfSwipRightMenuItem.length)
      {
        b = -1;
        a = -1;
        paramInt += 1;
      }
      break;
    }
  }
}
