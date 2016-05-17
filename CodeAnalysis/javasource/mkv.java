import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.selectmember.FriendListInnerFrame;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.adapter.CharDividedFacePreloadBaseAdapter;
import com.tencent.mobileqq.adapter.CharDividedFacePreloadBaseAdapter.FaceInfo;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

public class mkv
  extends CharDividedFacePreloadBaseAdapter
{
  private LinkedHashMap jdField_a_of_type_JavaUtilLinkedHashMap;
  private int[] jdField_a_of_type_ArrayOfInt;
  private String[] jdField_a_of_type_ArrayOfJavaLangString;
  
  public mkv(FriendListInnerFrame paramFriendListInnerFrame)
  {
    super(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqWidgetPinnedDividerListView, true);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap();
    jdField_a_of_type_ArrayOfJavaLangString = new String[0];
    jdField_a_of_type_ArrayOfInt = new int[0];
    c();
  }
  
  private void c()
  {
    jdField_a_of_type_JavaUtilLinkedHashMap.clear();
    Object localObject2 = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberFriendListInnerFrame.jdField_a_of_type_JavaUtilList.iterator();
    label66:
    int i;
    if (((Iterator)localObject2).hasNext())
    {
      Friends localFriends = (Friends)((Iterator)localObject2).next();
      if ((mCompareSpell == null) || (mCompareSpell.length() == 0))
      {
        localObject1 = "#";
        i = ((String)localObject1).charAt(0);
        if (((65 > i) || (i > 90)) && ((97 > i) || (i > 122))) {
          break label171;
        }
      }
      label171:
      for (localObject1 = ((String)localObject1).toUpperCase();; localObject1 = "#")
      {
        if (jdField_a_of_type_JavaUtilLinkedHashMap.get(localObject1) == null) {
          jdField_a_of_type_JavaUtilLinkedHashMap.put(localObject1, new ArrayList());
        }
        ((List)jdField_a_of_type_JavaUtilLinkedHashMap.get(localObject1)).add(localFriends);
        break;
        localObject1 = mCompareSpell.substring(0, 1);
        break label66;
      }
    }
    Object localObject1 = jdField_a_of_type_JavaUtilLinkedHashMap;
    jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap();
    for (char c = 'A'; c <= 'Z'; c = (char)(c + '\001')) {
      if (((LinkedHashMap)localObject1).get(String.valueOf(c)) != null) {
        jdField_a_of_type_JavaUtilLinkedHashMap.put(String.valueOf(c), ((LinkedHashMap)localObject1).get(String.valueOf(c)));
      }
    }
    if (((LinkedHashMap)localObject1).get("#") != null) {
      jdField_a_of_type_JavaUtilLinkedHashMap.put("#", ((LinkedHashMap)localObject1).get("#"));
    }
    ((LinkedHashMap)localObject1).clear();
    jdField_a_of_type_ArrayOfInt = new int[jdField_a_of_type_JavaUtilLinkedHashMap.keySet().size()];
    jdField_a_of_type_ArrayOfJavaLangString = new String[jdField_a_of_type_ArrayOfInt.length];
    localObject1 = jdField_a_of_type_JavaUtilLinkedHashMap.keySet().iterator();
    if (jdField_a_of_type_ArrayOfInt.length == 0) {}
    for (;;)
    {
      return;
      jdField_a_of_type_ArrayOfInt[0] = 0;
      i = 1;
      while (i < jdField_a_of_type_ArrayOfInt.length)
      {
        localObject2 = jdField_a_of_type_ArrayOfInt;
        int j = localObject2[i];
        int k = jdField_a_of_type_ArrayOfInt[(i - 1)];
        localObject2[i] = (((List)jdField_a_of_type_JavaUtilLinkedHashMap.get(((Iterator)localObject1).next())).size() + k + 1 + j);
        i += 1;
      }
      localObject1 = jdField_a_of_type_JavaUtilLinkedHashMap.keySet().iterator();
      i = 0;
      while (((Iterator)localObject1).hasNext())
      {
        jdField_a_of_type_ArrayOfJavaLangString[i] = ((String)((Iterator)localObject1).next());
        i += 1;
      }
    }
  }
  
  public int a()
  {
    return 2130903385;
  }
  
  public int a(String paramString)
  {
    int i;
    if (jdField_a_of_type_ArrayOfJavaLangString != null)
    {
      i = 0;
      if (i >= jdField_a_of_type_ArrayOfJavaLangString.length) {
        break label53;
      }
      if (!jdField_a_of_type_ArrayOfJavaLangString[i].equals(paramString)) {}
    }
    for (;;)
    {
      if (i >= 0)
      {
        return jdField_a_of_type_ArrayOfInt[i];
        i += 1;
        break;
      }
      return -1;
      return -1;
      label53:
      i = -1;
    }
  }
  
  protected Object a(int paramInt)
  {
    Friends localFriends = (Friends)getItem(paramInt);
    CharDividedFacePreloadBaseAdapter.FaceInfo localFaceInfo = new CharDividedFacePreloadBaseAdapter.FaceInfo(this);
    if (localFriends != null) {
      a = uin;
    }
    return localFaceInfo;
  }
  
  public void a()
  {
    c();
    super.notifyDataSetChanged();
  }
  
  public void a(View paramView, int paramInt)
  {
    int i = Arrays.binarySearch(jdField_a_of_type_ArrayOfInt, paramInt);
    paramInt = i;
    if (i < 0) {
      paramInt = -(i + 1) - 1;
    }
    ((TextView)paramView).setText(jdField_a_of_type_ArrayOfJavaLangString[paramInt]);
  }
  
  public boolean a(int paramInt)
  {
    return Arrays.binarySearch(jdField_a_of_type_ArrayOfInt, paramInt) >= 0;
  }
  
  public int getCount()
  {
    if (jdField_a_of_type_ArrayOfInt.length == 0) {
      return 0;
    }
    int i = jdField_a_of_type_ArrayOfInt[(jdField_a_of_type_ArrayOfInt.length - 1)];
    return ((List)jdField_a_of_type_JavaUtilLinkedHashMap.get(jdField_a_of_type_ArrayOfJavaLangString[(jdField_a_of_type_ArrayOfJavaLangString.length - 1)])).size() + i + 1;
  }
  
  public Object getItem(int paramInt)
  {
    int i = Arrays.binarySearch(jdField_a_of_type_ArrayOfInt, paramInt);
    if (i >= 0) {
      return null;
    }
    i = -(i + 1) - 1;
    List localList = (List)jdField_a_of_type_JavaUtilLinkedHashMap.get(jdField_a_of_type_ArrayOfJavaLangString[i]);
    paramInt = paramInt - jdField_a_of_type_ArrayOfInt[i] - 1;
    if ((paramInt >= 0) && (paramInt < localList.size())) {
      return localList.get(paramInt);
    }
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    int i = Arrays.binarySearch(jdField_a_of_type_ArrayOfInt, paramInt);
    View localView = paramView;
    if (paramView == null)
    {
      localView = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberFriendListInnerFrame.jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904790, paramViewGroup, false);
      paramView = new mkw(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberFriendListInnerFrame, null);
      localView.setTag(paramView);
      jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)localView.findViewById(2131297676));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131297675));
      jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)localView.findViewById(2131297677));
      d = ((ImageView)localView.findViewById(2131296683));
      c = ((TextView)localView.findViewById(2131296718));
    }
    paramView = (mkw)localView.getTag();
    if (i < 0)
    {
      i = -(i + 1) - 1;
      paramViewGroup = (Friends)((List)jdField_a_of_type_JavaUtilLinkedHashMap.get(jdField_a_of_type_ArrayOfJavaLangString[i])).get(paramInt - jdField_a_of_type_ArrayOfInt[i] - 1);
      if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberFriendListInnerFrame.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(uin))
      {
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
        jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(0);
        jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
        d.setImageBitmap(a(uin));
        c.setText(paramViewGroup.getFriendNick());
        b = uin;
        if ((jdField_a_of_type_ComTencentMobileqqActivitySelectmemberFriendListInnerFrame.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h == null) || (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberFriendListInnerFrame.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h.contains(uin))) {
          break label376;
        }
        jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(false);
        label299:
        if ((AppSetting.i) && (jdField_a_of_type_AndroidWidgetCheckBox.isEnabled()))
        {
          if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
            break label387;
          }
          localView.setContentDescription(paramViewGroup.getFriendNick() + "已选中");
        }
      }
      for (;;)
      {
        localView.setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberFriendListInnerFrame);
        return localView;
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
        break;
        label376:
        jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(true);
        break label299;
        label387:
        localView.setContentDescription(paramViewGroup.getFriendNick() + "未选中");
      }
    }
    jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    paramViewGroup = String.valueOf(jdField_a_of_type_ArrayOfJavaLangString[i]);
    jdField_a_of_type_AndroidWidgetTextView.setText(paramViewGroup);
    jdField_a_of_type_AndroidWidgetTextView.setContentDescription(String.format(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberFriendListInnerFrame.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369862), new Object[] { paramViewGroup.toLowerCase() }));
    return localView;
  }
}
