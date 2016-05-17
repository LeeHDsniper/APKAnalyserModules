import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.activity.selectmember.TroopMemberListInnerFrame;
import com.tencent.mobileqq.adapter.CharDividedFacePreloadBaseAdapter;
import com.tencent.mobileqq.adapter.CharDividedFacePreloadBaseAdapter.FaceInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.data.TroopMemberInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;

public class moa
  extends CharDividedFacePreloadBaseAdapter
{
  public moa(TroopMemberListInnerFrame paramTroopMemberListInnerFrame)
  {
    super(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView, true);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int a()
  {
    if (a.jdField_a_of_type_ArrayOfJavaLangString.length > 0) {
      return 2130903385;
    }
    return 0;
  }
  
  public int a(String paramString)
  {
    int i;
    if (a.jdField_a_of_type_ArrayOfJavaLangString != null)
    {
      i = 0;
      if (i >= a.jdField_a_of_type_ArrayOfJavaLangString.length) {
        break label65;
      }
      if (!a.jdField_a_of_type_ArrayOfJavaLangString[i].equals(paramString)) {}
    }
    for (;;)
    {
      if (i >= 0)
      {
        return a.jdField_a_of_type_ArrayOfInt[i];
        i += 1;
        break;
      }
      return -1;
      return -1;
      label65:
      i = -1;
    }
  }
  
  protected Object a(int paramInt)
  {
    TroopMemberInfo localTroopMemberInfo = (TroopMemberInfo)getItem(paramInt);
    CharDividedFacePreloadBaseAdapter.FaceInfo localFaceInfo = new CharDividedFacePreloadBaseAdapter.FaceInfo(this);
    if (localTroopMemberInfo != null) {
      a = memberuin;
    }
    return localFaceInfo;
  }
  
  public void a(View paramView, int paramInt)
  {
    Arrays.binarySearch(a.jdField_a_of_type_ArrayOfInt, paramInt);
  }
  
  public boolean a(int paramInt)
  {
    return Arrays.binarySearch(a.jdField_a_of_type_ArrayOfInt, paramInt) >= 0;
  }
  
  public int getCount()
  {
    if (a.jdField_a_of_type_ArrayOfInt.length == 0) {
      return 0;
    }
    int i = a.jdField_a_of_type_ArrayOfInt[(a.jdField_a_of_type_ArrayOfInt.length - 1)];
    return ((List)a.jdField_a_of_type_JavaUtilLinkedHashMap.get(a.jdField_a_of_type_ArrayOfJavaLangString[(a.jdField_a_of_type_ArrayOfJavaLangString.length - 1)])).size() + i + 1;
  }
  
  public Object getItem(int paramInt)
  {
    int i = Arrays.binarySearch(a.jdField_a_of_type_ArrayOfInt, paramInt);
    if (i >= 0) {
      return null;
    }
    i = -(i + 1) - 1;
    return (TroopMemberInfo)((List)a.jdField_a_of_type_JavaUtilLinkedHashMap.get(a.jdField_a_of_type_ArrayOfJavaLangString[i])).get(paramInt - a.jdField_a_of_type_ArrayOfInt[i] - 1);
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    int i = Arrays.binarySearch(a.jdField_a_of_type_ArrayOfInt, paramInt);
    View localView = paramView;
    if (paramView == null)
    {
      localView = a.jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904790, paramViewGroup, false);
      paramView = new mob(a, null);
      localView.setTag(paramView);
      jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)localView.findViewById(2131297676));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131297675));
      jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)localView.findViewById(2131297677));
      d = ((ImageView)localView.findViewById(2131296683));
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131296718));
    }
    paramView = (mob)localView.getTag();
    if (i < 0)
    {
      i = -(i + 1) - 1;
      paramViewGroup = (TroopMemberInfo)((List)a.jdField_a_of_type_JavaUtilLinkedHashMap.get(a.jdField_a_of_type_ArrayOfJavaLangString[i])).get(paramInt - a.jdField_a_of_type_ArrayOfInt[i] - 1);
      if (a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(memberuin))
      {
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
        jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(0);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
        TroopInfo localTroopInfo = ((TroopManager)a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(51)).a(a.b);
        if ((localTroopInfo == null) || (!localTroopInfo.hasOrgs()) || (a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.L != 14)) {
          break label537;
        }
        d.setImageBitmap(a(a.b + "_" + memberuin, 109, (byte)0));
        jdField_c_of_type_Int = 109;
        b = (a.b + "_" + memberuin);
        label379:
        jdField_c_of_type_AndroidWidgetTextView.setText(ContactUtils.f(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, troopuin, memberuin));
        b = memberuin;
        if ((a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h == null) || (!a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h.contains(memberuin))) {
          break label555;
        }
        jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(false);
        label453:
        if ((AppSetting.i) && (jdField_a_of_type_AndroidWidgetCheckBox.isEnabled()))
        {
          if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
            break label566;
          }
          localView.setContentDescription(a.jdField_a_of_type_ComTencentMobileqqAppTroopManager.a(paramViewGroup) + "已选中");
        }
      }
      for (;;)
      {
        localView.setOnClickListener(a);
        return localView;
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
        break;
        label537:
        d.setImageBitmap(a(memberuin));
        break label379;
        label555:
        jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(true);
        break label453;
        label566:
        localView.setContentDescription(a.jdField_a_of_type_ComTencentMobileqqAppTroopManager.a(paramViewGroup) + "未选中");
      }
    }
    jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    paramViewGroup = String.valueOf(a.jdField_a_of_type_ArrayOfJavaLangString[i]);
    jdField_a_of_type_AndroidWidgetTextView.setText(paramViewGroup);
    jdField_a_of_type_AndroidWidgetTextView.setContentDescription(String.format(a.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369862), new Object[] { paramViewGroup.toLowerCase() }));
    return localView;
  }
}
