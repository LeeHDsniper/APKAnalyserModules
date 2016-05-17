import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.tencent.mobileqq.activity.phone.ContactListView;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.List;

public class lyi
  extends BaseAdapter
{
  private lyi(ContactListView paramContactListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int getCount()
  {
    if (a.b == null) {
      return 0;
    }
    return a.b.size();
  }
  
  public Object getItem(int paramInt)
  {
    return a.b.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramViewGroup = paramView;
    if (paramView == null)
    {
      paramViewGroup = a.a();
      paramViewGroup.setOnClickListener(a);
    }
    paramView = (PhoneContact)a.b.get(paramInt);
    ContactListView.a(a, paramViewGroup, paramView);
    return paramViewGroup;
  }
}
