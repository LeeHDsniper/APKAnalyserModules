import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.mobileqq.activity.selectmember.RenMaiQuanTeamListInnerFrame;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.data.CircleGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;

public class mmg
  extends BaseAdapter
{
  private mmg(RenMaiQuanTeamListInnerFrame paramRenMaiQuanTeamListInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int getCount()
  {
    return a.jdField_a_of_type_JavaUtilArrayList.size();
  }
  
  public Object getItem(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt < a.jdField_a_of_type_JavaUtilArrayList.size())) {
      return (CircleGroup)a.jdField_a_of_type_JavaUtilArrayList.get(paramInt);
    }
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramViewGroup = (CircleGroup)getItem(paramInt);
    if (paramViewGroup == null) {
      return paramView;
    }
    paramView = a.jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904799, RenMaiQuanTeamListInnerFrame.a(a), false);
    ((ImageView)paramView.findViewById(2131296703)).setImageResource(a.jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(groupId));
    ((TextView)paramView.findViewById(2131298175)).setText(groupName);
    paramView.setOnClickListener(new mmh(this, paramViewGroup));
    return paramView;
  }
}
