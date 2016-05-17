import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.tencent.mobileqq.activity.phone.ContactListView;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.PinnedDividerListView.DividerAdapter;
import java.util.ArrayList;

public class lyk
  extends PinnedDividerListView.DividerAdapter
{
  private static final int jdField_a_of_type_Int = 0;
  private static final int b = 1;
  private static final int c = 2;
  
  private lyk(ContactListView paramContactListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a()
  {
    return 2130903429;
  }
  
  public void a(View paramView, int paramInt)
  {
    PhoneContact localPhoneContact2 = (PhoneContact)a.a.get(paramInt);
    PhoneContact localPhoneContact1 = localPhoneContact2;
    if (localPhoneContact2 == null) {
      localPhoneContact1 = (PhoneContact)a.a.get(paramInt + 1);
    }
    ((TextView)paramView).setText(pinyinFirst);
  }
  
  public boolean a(int paramInt)
  {
    return getItemViewType(paramInt) == 1;
  }
  
  public int getCount()
  {
    return a.m;
  }
  
  public Object getItem(int paramInt)
  {
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public int getItemViewType(int paramInt)
  {
    if (a.a.get(paramInt) == null) {
      return 1;
    }
    return 0;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (getItemViewType(paramInt) == 1)
    {
      paramViewGroup = paramView;
      if (paramView == null) {
        paramViewGroup = LayoutInflater.from(a.getContext()).inflate(a(), null);
      }
      a(paramViewGroup, paramInt);
      return paramViewGroup;
    }
    paramViewGroup = paramView;
    if (paramView == null)
    {
      paramViewGroup = a.a();
      paramViewGroup.setOnClickListener(a);
    }
    paramView = (PhoneContact)a.a.get(paramInt);
    a.a(paramViewGroup, paramView, false);
    return paramViewGroup;
  }
  
  public int getViewTypeCount()
  {
    return 2;
  }
}
