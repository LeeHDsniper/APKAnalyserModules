import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.discussion.LinkShareActionSheetBuilder;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class luj
  extends BaseAdapter
{
  private luj(LinkShareActionSheetBuilder paramLinkShareActionSheetBuilder)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int getCount()
  {
    return 5;
  }
  
  public Object getItem(int paramInt)
  {
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramViewGroup = paramView;
    if (paramView == null) {
      paramViewGroup = LayoutInflater.from(LinkShareActionSheetBuilder.a(a)).inflate(2130904871, null);
    }
    int i;
    int j;
    switch (paramInt)
    {
    default: 
      i = 2131369221;
      j = 2130838038;
      paramInt = 2131369245;
    }
    for (;;)
    {
      paramView = (ImageView)paramViewGroup.findViewById(2131299633);
      TextView localTextView = (TextView)paramViewGroup.findViewById(2131298010);
      paramView.setImageResource(j);
      localTextView.setText(i);
      if (AppSetting.i) {
        paramViewGroup.setContentDescription(LinkShareActionSheetBuilder.a(a).getString(paramInt));
      }
      return paramViewGroup;
      i = 2131369217;
      j = 2130838041;
      paramInt = 2131369243;
      continue;
      i = 2131369220;
      j = 2130838042;
      paramInt = 2131369244;
      continue;
      i = 2131369215;
      j = 2130838043;
      paramInt = 2131369242;
      continue;
      i = 2131369214;
      j = 2130838039;
      paramInt = 2131369241;
    }
  }
}
