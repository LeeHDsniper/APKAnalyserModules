import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.tencent.mobileqq.activity.contact.CircleMemberListActivity;
import com.tencent.mobileqq.data.CircleBuddy;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;

public class loz
  extends BaseAdapter
{
  private loz(CircleMemberListActivity paramCircleMemberListActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int getCount()
  {
    return a.a.size();
  }
  
  public Object getItem(int paramInt)
  {
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramViewGroup = paramView;
    if (paramView == null) {
      paramViewGroup = a.a();
    }
    a.a(paramViewGroup, (CircleBuddy)a.a.get(paramInt));
    return paramViewGroup;
  }
}
