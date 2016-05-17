import com.tencent.mobileqq.activity.recent.RecentBaseData;
import com.tencent.mobileqq.activity.recent.RecentItemBaseBuilder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.SwipRightMenuBuilder.SwipRightMenuItem;
import com.tencent.widget.SwipTextViewMenuBuilder;

public class mgz
  extends SwipTextViewMenuBuilder
{
  public mgz(RecentItemBaseBuilder paramRecentItemBaseBuilder, int paramInt1, int paramInt2, int[] paramArrayOfInt1, int paramInt3, int[] paramArrayOfInt2, int[] paramArrayOfInt3, int[] paramArrayOfInt4)
  {
    super(paramInt1, paramInt2, paramArrayOfInt1, paramInt3, paramArrayOfInt2, paramArrayOfInt3, paramArrayOfInt4);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void a(int paramInt, Object paramObject, SwipRightMenuBuilder.SwipRightMenuItem[] paramArrayOfSwipRightMenuItem)
  {
    if ((paramArrayOfSwipRightMenuItem == null) || (paramArrayOfSwipRightMenuItem.length <= 0)) {
      return;
    }
    if ((paramObject instanceof RecentBaseData)) {}
    for (int j = M;; j = 0)
    {
      int i;
      if (paramArrayOfSwipRightMenuItem.length < 0)
      {
        paramInt = j & 0xF0;
        if (paramInt == 32)
        {
          0b = 2;
          0a = 1;
          i = 1;
        }
      }
      for (;;)
      {
        label61:
        paramInt = i;
        int k;
        if (i < paramArrayOfSwipRightMenuItem.length)
        {
          paramInt = i;
          if ((paramObject instanceof RecentBaseData))
          {
            paramInt = i;
            if (((RecentBaseData)paramObject).a())
            {
              k = 0xF0000 & j;
              if (k != 65536) {
                break label267;
              }
              b = 4;
              a = 1;
              paramInt = i + 1;
            }
          }
        }
        for (;;)
        {
          i = paramInt;
          if (paramInt < paramArrayOfSwipRightMenuItem.length)
          {
            i = paramInt;
            if ((0x300000 & j) == 2097152)
            {
              b = 6;
              a = 1;
              i = paramInt + 1;
            }
          }
          paramInt = i;
          if (i < paramArrayOfSwipRightMenuItem.length)
          {
            paramInt = i;
            if ((j & 0xF) == 1)
            {
              b = 0;
              a = 0;
              paramInt = i + 1;
            }
          }
          while (paramInt < paramArrayOfSwipRightMenuItem.length)
          {
            b = -1;
            a = -1;
            paramInt += 1;
          }
          break;
          if (paramInt != 16) {
            break label301;
          }
          0b = 3;
          0a = 0;
          i = 1;
          break label61;
          label267:
          paramInt = i;
          if (k == 131072)
          {
            b = 5;
            a = 1;
            paramInt = i + 1;
          }
        }
        label301:
        i = 0;
      }
    }
  }
}
