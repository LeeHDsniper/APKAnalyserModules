import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.selectmember.RecentMemberInnerFrame;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.adapter.FacePreloadBaseAdapter;
import com.tencent.mobileqq.adapter.FacePreloadBaseAdapter.FaceInfo;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.data.RecentUser;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import java.util.ArrayList;
import java.util.List;

public class mma
  extends FacePreloadBaseAdapter
{
  public mma(RecentMemberInnerFrame paramRecentMemberInnerFrame)
  {
    super(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, RecentMemberInnerFrame.a(paramRecentMemberInnerFrame), 1, true);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected Object a(int paramInt)
  {
    RecentUser localRecentUser = (RecentUser)getItem(paramInt);
    FacePreloadBaseAdapter.FaceInfo localFaceInfo = new FacePreloadBaseAdapter.FaceInfo(this);
    if (localRecentUser != null)
    {
      jdField_a_of_type_JavaLangString = uin;
      jdField_a_of_type_Int = 1;
    }
    return localFaceInfo;
  }
  
  public int getCount()
  {
    if (RecentMemberInnerFrame.a(a) == null) {
      return 0;
    }
    return RecentMemberInnerFrame.a(a).size();
  }
  
  public Object getItem(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt < RecentMemberInnerFrame.a(a).size())) {
      return RecentMemberInnerFrame.a(a).get(paramInt);
    }
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    Object localObject;
    if ((paramView != null) && (paramView.getTag() != null))
    {
      localObject = (mmb)paramView.getTag();
      paramViewGroup = paramView;
      paramView = (View)localObject;
    }
    RecentUser localRecentUser;
    for (;;)
    {
      localRecentUser = (RecentUser)getItem(paramInt);
      if (localRecentUser != null) {
        break;
      }
      return paramViewGroup;
      paramView = new mmb(a, null);
      paramViewGroup = a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getLayoutInflater().inflate(2130904790, paramViewGroup, false);
      jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)paramViewGroup.findViewById(2131297677));
      d = ((ImageView)paramViewGroup.findViewById(2131296683));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131296718));
      paramViewGroup.setTag(paramView);
    }
    if (a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(uin))
    {
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
      d.setImageBitmap(a(1, uin));
      localObject = RecentMemberInnerFrame.a(a).a(uin);
      if (localObject != null) {
        break label320;
      }
      localObject = "";
      label189:
      jdField_a_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
      b = uin;
      if ((a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h == null) || (!a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h.contains(uin))) {
        break label330;
      }
      jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(false);
      label249:
      if (AppSetting.i)
      {
        if ((!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) || (!jdField_a_of_type_AndroidWidgetCheckBox.isEnabled())) {
          break label341;
        }
        paramViewGroup.setContentDescription((String)localObject + "已选中,双击取消");
      }
    }
    for (;;)
    {
      paramViewGroup.setOnClickListener(a);
      return paramViewGroup;
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
      break;
      label320:
      localObject = ContactUtils.a((Friends)localObject);
      break label189;
      label330:
      jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(true);
      break label249;
      label341:
      paramViewGroup.setContentDescription((String)localObject + "未选中,双击选中");
    }
  }
}
