import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.selectmember.ContactsInnerFrame;
import com.tencent.mobileqq.activity.selectmember.SelectMemberActivity;
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

public class mkb
  extends CharDividedFacePreloadBaseAdapter
{
  private LinkedHashMap jdField_a_of_type_JavaUtilLinkedHashMap;
  private int[] jdField_a_of_type_ArrayOfInt;
  private String[] jdField_a_of_type_ArrayOfJavaLangString;
  
  public mkb(ContactsInnerFrame paramContactsInnerFrame, Context paramContext, QQAppInterface paramQQAppInterface, XListView paramXListView, boolean paramBoolean)
  {
    super(paramContext, paramQQAppInterface, paramXListView, paramBoolean);
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilLinkedHashMap = new LinkedHashMap();
    jdField_a_of_type_ArrayOfInt = new int[0];
    jdField_a_of_type_ArrayOfJavaLangString = new String[0];
  }
  
  private void c()
  {
    jdField_a_of_type_JavaUtilLinkedHashMap.clear();
    if (jdField_a_of_type_ComTencentMobileqqActivitySelectmemberContactsInnerFrame.jdField_a_of_type_JavaUtilList == null) {}
    for (;;)
    {
      return;
      Object localObject2 = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberContactsInnerFrame.jdField_a_of_type_JavaUtilList.iterator();
      label77:
      int i;
      if (((Iterator)localObject2).hasNext())
      {
        PhoneContact localPhoneContact = (PhoneContact)((Iterator)localObject2).next();
        if ((pinyinFirst == null) || (pinyinFirst.length() == 0))
        {
          localObject1 = "#";
          i = ((String)localObject1).charAt(0);
          if (((65 > i) || (i > 90)) && ((97 > i) || (i > 122))) {
            break label182;
          }
        }
        label182:
        for (localObject1 = ((String)localObject1).toUpperCase();; localObject1 = "#")
        {
          if (jdField_a_of_type_JavaUtilLinkedHashMap.get(localObject1) == null) {
            jdField_a_of_type_JavaUtilLinkedHashMap.put(localObject1, new ArrayList());
          }
          ((List)jdField_a_of_type_JavaUtilLinkedHashMap.get(localObject1)).add(localPhoneContact);
          break;
          localObject1 = pinyinFirst.substring(0, 1);
          break label77;
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
    if ((paramViewHolder instanceof mkc))
    {
      paramViewHolder = (mkc)paramViewHolder;
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
    Object localObject = null;
    int i = Arrays.binarySearch(jdField_a_of_type_ArrayOfInt, paramInt);
    View localView = paramView;
    if (paramView == null)
    {
      localView = jdField_a_of_type_ComTencentMobileqqActivitySelectmemberContactsInnerFrame.jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904790, paramViewGroup, false);
      paramView = new mkc(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberContactsInnerFrame, null);
      localView.setTag(paramView);
      jdField_a_of_type_AndroidWidgetRelativeLayout = ((RelativeLayout)localView.findViewById(2131297676));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131297675));
      jdField_a_of_type_AndroidWidgetCheckBox = ((CheckBox)localView.findViewById(2131297677));
      d = ((ImageView)localView.findViewById(2131296683));
      e = ((TextView)localView.findViewById(2131297678));
      f = ((TextView)localView.findViewById(2131297679));
      jdField_c_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131296718));
    }
    mkc localMkc = (mkc)localView.getTag();
    if (i < 0)
    {
      i = -(i + 1) - 1;
      paramViewGroup = (List)jdField_a_of_type_JavaUtilLinkedHashMap.get(jdField_a_of_type_ArrayOfJavaLangString[i]);
      paramInt = paramInt - jdField_a_of_type_ArrayOfInt[i] - 1;
      PhoneContact localPhoneContact = (PhoneContact)paramViewGroup.get(paramInt);
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
        if (paramInt - 1 >= 0) {
          break label708;
        }
        paramView = null;
        label333:
        if (paramInt + 1 <= paramViewGroup.size() - 1) {
          break label724;
        }
        paramViewGroup = localObject;
        label350:
        if (((paramView == null) || (contactID != contactID)) && ((paramViewGroup == null) || (contactID != contactID))) {
          break label740;
        }
        f.setVisibility(0);
        f.setText(mobileNo);
        label404:
        jdField_c_of_type_AndroidWidgetTextView.setText(name);
        if (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberContactsInnerFrame.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.a(b)) {
          break label753;
        }
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(true);
        label444:
        if ((jdField_a_of_type_ComTencentMobileqqActivitySelectmemberContactsInnerFrame.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h == null) || (!jdField_a_of_type_ComTencentMobileqqActivitySelectmemberContactsInnerFrame.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.h.contains(uin))) {
          break label765;
        }
        jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(false);
        label487:
        if ((AppSetting.i) && (jdField_a_of_type_AndroidWidgetCheckBox.isEnabled()))
        {
          if (!jdField_a_of_type_AndroidWidgetCheckBox.isChecked()) {
            break label777;
          }
          localView.setContentDescription(name + "已选中,双击取消");
        }
      }
      for (;;)
      {
        jdField_a_of_type_ComTencentMobileqqDataPhoneContact = localPhoneContact;
        localView.setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberContactsInnerFrame);
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
        label708:
        paramView = (PhoneContact)paramViewGroup.get(paramInt - 1);
        break label333;
        label724:
        paramViewGroup = (PhoneContact)paramViewGroup.get(paramInt + 1);
        break label350;
        label740:
        f.setVisibility(8);
        break label404;
        label753:
        jdField_a_of_type_AndroidWidgetCheckBox.setChecked(false);
        break label444;
        label765:
        jdField_a_of_type_AndroidWidgetCheckBox.setEnabled(true);
        break label487;
        label777:
        localView.setContentDescription(name + "未选中,双击选中");
      }
    }
    jdField_a_of_type_AndroidWidgetRelativeLayout.setVisibility(8);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    paramView = String.valueOf(jdField_a_of_type_ArrayOfJavaLangString[i]);
    jdField_a_of_type_AndroidWidgetTextView.setText(paramView);
    jdField_a_of_type_AndroidWidgetTextView.setContentDescription(String.format(jdField_a_of_type_ComTencentMobileqqActivitySelectmemberContactsInnerFrame.jdField_a_of_type_ComTencentMobileqqActivitySelectmemberSelectMemberActivity.getString(2131369862), new Object[] { paramView.toLowerCase() }));
    return localView;
  }
}
