import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.selectmember.RenMaiQuanMemberListInnerFrame;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.adapter.FacePreloadBaseAdapter;
import com.tencent.mobileqq.adapter.FacePreloadBaseAdapter.FaceInfo;
import com.tencent.mobileqq.app.CircleManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.CircleBuddy;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.XListView;
import java.util.ArrayList;

public class mmd
  extends FacePreloadBaseAdapter
{
  public mmd(RenMaiQuanMemberListInnerFrame paramRenMaiQuanMemberListInnerFrame, Context paramContext, QQAppInterface paramQQAppInterface, XListView paramXListView, int paramInt, boolean paramBoolean)
  {
    super(paramContext, paramQQAppInterface, paramXListView, paramInt, paramBoolean);
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected Object a(int paramInt)
  {
    CircleBuddy localCircleBuddy = (CircleBuddy)getItem(paramInt);
    FacePreloadBaseAdapter.FaceInfo localFaceInfo = new FacePreloadBaseAdapter.FaceInfo(this);
    if (localCircleBuddy != null) {
      jdField_a_of_type_JavaLangString = uin;
    }
    jdField_a_of_type_Int = 1;
    return localFaceInfo;
  }
  
  public int getCount()
  {
    return a.jdField_a_of_type_JavaUtilArrayList.size();
  }
  
  public Object getItem(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt < a.jdField_a_of_type_JavaUtilArrayList.size())) {
      return (CircleBuddy)a.jdField_a_of_type_JavaUtilArrayList.get(paramInt);
    }
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    CircleBuddy localCircleBuddy = (CircleBuddy)getItem(paramInt);
    if (localCircleBuddy == null) {
      return paramView;
    }
    View localView;
    if (paramView == null)
    {
      localView = a.jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904790, paramViewGroup, false);
      paramView = new mme(null);
      jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)localView.findViewById(2131297677));
      d = ((ImageView)localView.findViewById(2131296683));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131296718));
      localView.setTag(paramView);
      paramViewGroup = paramView;
      b = uin;
      d.setImageBitmap(a(uin, 1, (byte)1));
      jdField_a_of_type_AndroidWidgetTextView.setText(a.jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(localCircleBuddy));
      if (!a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(uin)) {
        break label303;
      }
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
      label168:
      if ((a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h == null) || (!a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h.contains(uin))) {
        break label314;
      }
      jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(false);
      label210:
      jdField_a_of_type_ComTencentMobileqqDataCircleBuddy = localCircleBuddy;
      if (AppSetting.i)
      {
        if ((!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) || (!jdField_a_of_type_AndroidWidgetCheckBox.isEnabled())) {
          break label325;
        }
        localView.setContentDescription(a.jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(localCircleBuddy) + "已选中,双击取消");
      }
    }
    for (;;)
    {
      localView.setOnClickListener(a);
      return localView;
      paramViewGroup = (mme)paramView.getTag();
      localView = paramView;
      break;
      label303:
      jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
      break label168;
      label314:
      jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(true);
      break label210;
      label325:
      localView.setContentDescription(a.jdField_a_of_type_ComTencentMobileqqAppCircleManager.a(localCircleBuddy) + "未选中,双击选中");
    }
  }
}
