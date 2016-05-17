import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.tencent.mobileqq.activity.phone.CountryActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.PinnedDividerListView.DividerAdapter;
import java.util.ArrayList;
import java.util.LinkedHashMap;

public class lyr
  extends PinnedDividerListView.DividerAdapter
{
  private static final int jdField_a_of_type_Int = 0;
  private static final int b = 1;
  private static final int c = 2;
  
  private lyr(CountryActivity paramCountryActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a()
  {
    return 2130903429;
  }
  
  public void a(View paramView, int paramInt)
  {
    paramInt = ((Integer)a.jdField_a_of_type_JavaUtilLinkedHashMap.get(a.jdField_a_of_type_JavaUtilArrayList.get(paramInt)).jdField_a_of_type_JavaLangString)).intValue();
    ((TextView)paramView).setText(a.jdField_a_of_type_JavaUtilArrayList.get(paramInt)).jdField_a_of_type_JavaLangString);
  }
  
  public boolean a(int paramInt)
  {
    return a.jdField_a_of_type_JavaUtilArrayList.get(paramInt)).jdField_a_of_type_Boolean;
  }
  
  public int getCount()
  {
    return a.jdField_a_of_type_JavaUtilArrayList.size();
  }
  
  public Object getItem(int paramInt)
  {
    return a.jdField_a_of_type_JavaUtilArrayList.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public int getItemViewType(int paramInt)
  {
    if (a.jdField_a_of_type_JavaUtilArrayList.get(paramInt)).jdField_a_of_type_Boolean) {
      return 0;
    }
    return 1;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    lys localLys = (lys)a.jdField_a_of_type_JavaUtilArrayList.get(paramInt);
    if (getItemViewType(paramInt) == 0)
    {
      if (paramView != null) {
        break label107;
      }
      paramView = a.getLayoutInflater().inflate(a(), paramViewGroup, false);
    }
    label107:
    for (;;)
    {
      ((TextView)paramView).setText(jdField_a_of_type_JavaLangString);
      for (;;)
      {
        paramView.setVisibility(0);
        return paramView;
        View localView = paramView;
        if (paramView == null)
        {
          localView = CountryActivity.a(paramViewGroup, a.getLayoutInflater(), false);
          localView.setOnClickListener(a);
        }
        CountryActivity.a(localView, localLys);
        paramView = localView;
      }
    }
  }
  
  public int getViewTypeCount()
  {
    return 2;
  }
}
