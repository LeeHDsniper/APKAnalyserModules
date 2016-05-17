import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.selectmember.CreateFaceToFaceDiscussionActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.List;
import tencent.im.nearfield_discuss.nearfield_discuss.UserProfile;

public class mkm
  extends BaseAdapter
{
  LayoutInflater jdField_a_of_type_AndroidViewLayoutInflater;
  mkn jdField_a_of_type_Mkn;
  
  public mkm(CreateFaceToFaceDiscussionActivity paramCreateFaceToFaceDiscussionActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidViewLayoutInflater = LayoutInflater.from(jdField_a_of_type_AndroidContentContext);
  }
  
  public int getCount()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.jdField_a_of_type_JavaUtilList == null) {
      return 0;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.jdField_a_of_type_JavaUtilList.size() < 50) {
      return jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.jdField_a_of_type_JavaUtilList.size() + 1;
    }
    return jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.jdField_a_of_type_JavaUtilList.size();
  }
  
  public Object getItem(int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.jdField_a_of_type_JavaUtilList == null) {
      return null;
    }
    return (nearfield_discuss.UserProfile)jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.jdField_a_of_type_JavaUtilList.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (paramView == null)
    {
      paramView = jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904130, null);
      jdField_a_of_type_Mkn = new mkn(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity);
      jdField_a_of_type_Mkn.jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131296683));
      jdField_a_of_type_Mkn.jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131296718));
      paramView.setTag(jdField_a_of_type_Mkn);
      if ((paramInt != getCount() - 1) || (getCount() >= 50)) {
        break label237;
      }
      CreateFaceToFaceDiscussionActivity.a(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity, paramView);
    }
    for (;;)
    {
      if (paramInt == getCount() - 1)
      {
        if (paramInt <= 11) {
          break label264;
        }
        if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.b.getVisibility() == 0) {
          jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.c.setVisibility(0);
        }
      }
      return paramView;
      jdField_a_of_type_Mkn = ((mkn)paramView.getTag());
      if (!jdField_a_of_type_Mkn.jdField_a_of_type_Boolean) {
        break;
      }
      paramView = jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904130, null);
      jdField_a_of_type_Mkn = new mkn(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity);
      jdField_a_of_type_Mkn.jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131296683));
      jdField_a_of_type_Mkn.jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131296718));
      paramView.setTag(jdField_a_of_type_Mkn);
      jdField_a_of_type_Mkn.jdField_a_of_type_Boolean = false;
      break;
      label237:
      CreateFaceToFaceDiscussionActivity.a(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity, paramView, (nearfield_discuss.UserProfile)jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.jdField_a_of_type_JavaUtilList.get(paramInt));
    }
    label264:
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberCreateFaceToFaceDiscussionActivity.c.setVisibility(4);
    return paramView;
  }
}
