import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.View;
import com.tencent.mobileqq.activity.qwallet.SendHbActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.List;

public class mdg
  extends PagerAdapter
{
  public mdg(SendHbActivity paramSendHbActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void destroyItem(View paramView, int paramInt, Object paramObject)
  {
    ((ViewPager)paramView).removeView((View)SendHbActivity.a(a).get(paramInt));
  }
  
  public int getCount()
  {
    if (SendHbActivity.a(a) != null) {
      return SendHbActivity.a(a).size();
    }
    return 0;
  }
  
  public Object instantiateItem(View paramView, int paramInt)
  {
    ((ViewPager)paramView).addView((View)SendHbActivity.a(a).get(paramInt), 0);
    return SendHbActivity.a(a).get(paramInt);
  }
  
  public boolean isViewFromObject(View paramView, Object paramObject)
  {
    return paramView == paramObject;
  }
}
