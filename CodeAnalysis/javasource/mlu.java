import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.selectmember.PhoneContactSelectActivity;
import com.tencent.mobileqq.activity.selectmember.PhoneContactTabView;
import com.tencent.mobileqq.activity.selectmember.ResultRecord;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity.GridViewAdapter;
import com.tencent.mobileqq.adapter.CharDividedFacePreloadBaseAdapter;
import com.tencent.mobileqq.adapter.FacePreloadBaseAdapter.ViewHolder;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.PhoneContact;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

public class mlu
  extends CharDividedFacePreloadBaseAdapter
{
  View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  private LinkedHashMap jdField_a_of_type_JavaUtilLinkedHashMap;
  private int[] jdField_a_of_type_ArrayOfInt;
  private String[] jdField_a_of_type_ArrayOfJavaLangString;
  
  public mlu(PhoneContactTabView paramPhoneContactTabView, Context paramContext, QQAppInterface paramQQAppInterface, XListView paramXListView, boolean paramBoolean)
  {
    super(paramContext, paramQQAppInterface, paramXListView, paramBoolean);
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap();
    jdField_a_of_type_ArrayOfInt = new int[0];
    jdField_a_of_type_ArrayOfJavaLangString = new String[0];
    jdField_a_of_type_AndroidViewView$OnClickListener = new mlv(this);
  }
  
  private void a(List paramList)
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity == null) || (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a == null)) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a.a(paramList);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(true);
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.o();
    jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.i();
  }
  
  private void c()
  {
    jdField_a_of_type_JavaUtilLinkedHashMap.clear();
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_JavaUtilList == null) {}
    for (;;)
    {
      return;
      Object localObject2 = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_JavaUtilList.iterator();
      label163:
      int i;
      while (((Iterator)localObject2).hasNext())
      {
        localObject3 = (PhoneContact)((Iterator)localObject2).next();
        if ((jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity.f != null) && (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity.f.contains(mobileNo)))
        {
          if (jdField_a_of_type_JavaUtilLinkedHashMap.get("@") == null) {
            jdField_a_of_type_JavaUtilLinkedHashMap.put("@", new ArrayList());
          }
          ((List)jdField_a_of_type_JavaUtilLinkedHashMap.get("@")).add(localObject3);
        }
        else
        {
          if ((pinyinFirst == null) || (pinyinFirst.length() == 0))
          {
            localObject1 = "#";
            i = ((String)localObject1).charAt(0);
            if (((65 > i) || (i > 90)) && ((97 > i) || (i > 122))) {
              break label268;
            }
          }
          label268:
          for (localObject1 = ((String)localObject1).toUpperCase();; localObject1 = "#")
          {
            if (jdField_a_of_type_JavaUtilLinkedHashMap.get(localObject1) == null) {
              jdField_a_of_type_JavaUtilLinkedHashMap.put(localObject1, new ArrayList());
            }
            ((List)jdField_a_of_type_JavaUtilLinkedHashMap.get(localObject1)).add(localObject3);
            break;
            localObject1 = pinyinFirst.substring(0, 1);
            break label163;
          }
        }
      }
      Object localObject1 = jdField_a_of_type_JavaUtilLinkedHashMap;
      jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap();
      Object localObject3 = (List)((LinkedHashMap)localObject1).get("@");
      if (localObject3 != null)
      {
        jdField_a_of_type_JavaUtilLinkedHashMap.put(PhoneContactTabView.a(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView), localObject3);
        if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity.jdField_a_of_type_Boolean)
        {
          localObject2 = new ArrayList();
          localObject3 = ((List)localObject3).iterator();
          while (((Iterator)localObject3).hasNext()) {
            ((List)localObject2).add(a((PhoneContact)((Iterator)localObject3).next()));
          }
          a((List)localObject2);
        }
      }
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
      if (jdField_a_of_type_ArrayOfInt.length != 0)
      {
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
  }
  
  public int a()
  {
    if (jdField_a_of_type_ArrayOfJavaLangString.length > 0) {
      return 2130903385;
    }
    return 0;
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
  
  public ResultRecord a(PhoneContact paramPhoneContact)
  {
    String str2 = name;
    String str1;
    if (TextUtils.isEmpty(uin)) {
      str1 = "pstn" + mobileNo;
    }
    while ((str1.startsWith("pstn")) && (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.b(str1, str2, 5, "-1")))
    {
      return jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(str1, str2, 5, "-1", mobileNo);
      if (uin.equals("0")) {
        str1 = nationCode + mobileCode;
      } else {
        str1 = uin;
      }
    }
    if (str1.startsWith("+")) {
      return jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(str1, str2, 4, "-1", mobileNo);
    }
    return jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(str1, str2, 0, "-1", mobileNo);
  }
  
  protected Object a(int paramInt)
  {
    return null;
  }
  
  public void a()
  {
    c();
    super.notifyDataSetChanged();
  }
  
  public void a(View paramView, int paramInt)
  {
    paramInt = Arrays.binarySearch(jdField_a_of_type_ArrayOfInt, paramInt);
    if (paramInt < 0) {
      paramInt = -(paramInt + 1);
    }
  }
  
  public boolean a(int paramInt)
  {
    return Arrays.binarySearch(jdField_a_of_type_ArrayOfInt, paramInt) >= 0;
  }
  
  protected boolean a(FacePreloadBaseAdapter.ViewHolder paramViewHolder)
  {
    boolean bool2 = super.a(paramViewHolder);
    boolean bool1 = bool2;
    if ((paramViewHolder instanceof mly))
    {
      paramViewHolder = (mly)paramViewHolder;
      if ((bool2) && (!jdField_a_of_type_Boolean)) {
        bool1 = true;
      }
    }
    else
    {
      return bool1;
    }
    return false;
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
    return (PhoneContact)((List)jdField_a_of_type_JavaUtilLinkedHashMap.get(jdField_a_of_type_ArrayOfJavaLangString[i])).get(paramInt - jdField_a_of_type_ArrayOfInt[i] - 1);
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
      localView = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130903214, paramViewGroup, false);
      paramView = new mly(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView, null);
      localView.setTag(paramView);
      jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)localView.findViewById(2131297676));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131297675));
      jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)localView.findViewById(2131297677));
      d = ((ImageView)localView.findViewById(2131296683));
      e = ((TextView)localView.findViewById(2131297678));
      f = ((TextView)localView.findViewById(2131297679));
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131296718));
      jdField_a_of_type_AndroidViewView = localView.findViewById(2131297680);
    }
    paramView = (mly)localView.getTag();
    if (i < 0)
    {
      i = -(i + 1) - 1;
      paramViewGroup = (PhoneContact)((List)jdField_a_of_type_JavaUtilLinkedHashMap.get(jdField_a_of_type_ArrayOfJavaLangString[i])).get(paramInt - jdField_a_of_type_ArrayOfInt[i] - 1);
      jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      if (TextUtils.isEmpty(uin))
      {
        b = ("pstn" + mobileNo);
        jdField_c_of_type_Int = 11;
        d.setImageResource(2130838859);
        e.setVisibility(0);
        e.setText(ContactUtils.a(name));
        jdField_a_of_type_Boolean = true;
        jdField_c_of_type_AndroidWidgetTextView.setText(name);
        f.setText(mobileNo);
        f.setVisibility(0);
        if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(b)) {
          break label705;
        }
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
        label380:
        ArrayList localArrayList = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h;
        if (((localArrayList == null) || ((!localArrayList.contains(uin)) && (!localArrayList.contains(mobileNo)) && (!localArrayList.contains(b)))) && ((jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity.b == null) || (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity.b.contains(mobileNo)))) {
          break label716;
        }
        jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(false);
        label474:
        if ((AppSetting.i) && (jdField_a_of_type_AndroidWidgetCheckBox.isEnabled()))
        {
          if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
            break label727;
          }
          localView.setContentDescription(name + "已选中,双击取消");
        }
        label528:
        jdField_a_of_type_ComTencentMobileqqDataPhoneContact = paramViewGroup;
        if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactSelectActivity.a()) {
          break label758;
        }
        jdField_a_of_type_AndroidViewView.setVisibility(0);
      }
      for (;;)
      {
        jdField_a_of_type_AndroidViewView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
        localView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
        return localView;
        if (!"0".equals(uin))
        {
          b = uin;
          jdField_c_of_type_Int = 1;
          d.setImageBitmap(a(b, 1, (byte)0));
          e.setVisibility(8);
          jdField_a_of_type_Boolean = false;
          break;
        }
        b = (nationCode + mobileCode);
        jdField_c_of_type_Int = 11;
        d.setImageBitmap(a(b, 11, (byte)0));
        e.setVisibility(8);
        jdField_a_of_type_Boolean = false;
        break;
        label705:
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
        break label380;
        label716:
        jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(true);
        break label474;
        label727:
        localView.setContentDescription(name + "未选中,双击选中");
        break label528;
        label758:
        jdField_a_of_type_AndroidViewView.setVisibility(8);
      }
    }
    jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    paramViewGroup = String.valueOf(jdField_a_of_type_ArrayOfJavaLangString[i]);
    jdField_a_of_type_AndroidWidgetTextView.setText(paramViewGroup);
    jdField_a_of_type_AndroidWidgetTextView.setContentDescription(String.format(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberPhoneContactTabView.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369862), new Object[] { paramViewGroup.toLowerCase() }));
    return localView;
  }
}
