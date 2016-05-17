import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.mobileqq.activity.selectmember.DiscussionListInnerFrame;
import com.tencent.mobileqq.app.DiscussionManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.DiscussionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.FaceDrawable;
import com.tencent.mobileqq.utils.ContactUtils;
import java.util.ArrayList;

public class mkp
  extends BaseAdapter
{
  private mkp(DiscussionListInnerFrame paramDiscussionListInnerFrame)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int getCount()
  {
    if (a.jdField_a_of_type_JavaUtilArrayList == null) {
      return 0;
    }
    return a.jdField_a_of_type_JavaUtilArrayList.size();
  }
  
  public Object getItem(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt < a.jdField_a_of_type_JavaUtilArrayList.size())) {
      return a.jdField_a_of_type_JavaUtilArrayList.get(paramInt);
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
      localObject = (mkq)paramView.getTag();
      paramViewGroup = paramView;
      paramView = (View)localObject;
    }
    for (;;)
    {
      localObject = (DiscussionInfo)getItem(paramInt);
      if (localObject != null)
      {
        String str1 = uin;
        String str2 = ContactUtils.a(a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, (DiscussionInfo)localObject);
        jdField_a_of_type_AndroidWidgetTextView.setText(str2);
        paramInt = ((DiscussionManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(52)).a(str1);
        b.setText(String.format("(%d)", new Object[] { Integer.valueOf(paramInt) }));
        b.setContentDescription(" " + paramInt + "人");
        jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(FaceDrawable.a(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, 101, str1));
        jdField_a_of_type_ComTencentMobileqqDataDiscussionInfo = ((DiscussionInfo)localObject);
        paramViewGroup.setOnClickListener(a);
      }
      return paramViewGroup;
      paramViewGroup = a.jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904785, paramViewGroup, false);
      paramView = new mkq(a, null);
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramViewGroup.findViewById(2131296703));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131304038));
      b = ((TextView)paramViewGroup.findViewById(2131297855));
      paramViewGroup.setTag(paramView);
    }
  }
}
