package com.tencent.mobileqq.activity.recent;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.view.PagerAdapter;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.Friends;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ContactUtils;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import mhp;

public class RecommendAdapter
  extends PagerAdapter
{
  private static final int jdField_a_of_type_Int = 50;
  public static final String a = "RecommendAdapter";
  private static final int jdField_b_of_type_Int = 7;
  View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener;
  private OnRecentUserOpsListener jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private List jdField_a_of_type_JavaUtilList;
  private final int[] jdField_a_of_type_ArrayOfInt;
  private final int[] jdField_b_of_type_ArrayOfInt;
  private final int[] c;
  
  public RecommendAdapter(QQAppInterface paramQQAppInterface)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfInt = new int[] { 2131297621, 2131297622, 2131297623, 2131297624, 2131297625, 2131297626, 2131297627 };
    b = new int[] { 2131297691, 2131297694, 2131297697, 2131297700, 2131297703, 2131297706, 2131297709 };
    c = new int[] { 2131297693, 2131297696, 2131297699, 2131297702, 2131297705, 2131297708, 2131297711 };
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
    jdField_a_of_type_JavaUtilList = null;
    jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener = null;
    jdField_a_of_type_AndroidViewView$OnClickListener = new mhp(this);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
  }
  
  public int a()
  {
    if (jdField_a_of_type_JavaUtilList != null) {
      return jdField_a_of_type_JavaUtilList.size();
    }
    return 0;
  }
  
  public List a()
  {
    if ((jdField_a_of_type_JavaUtilList != null) && (jdField_a_of_type_JavaUtilList.size() > 0)) {
      return jdField_a_of_type_JavaUtilList;
    }
    return null;
  }
  
  public void a()
  {
    a(null);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = null;
  }
  
  public void a(OnRecentUserOpsListener paramOnRecentUserOpsListener)
  {
    jdField_a_of_type_ComTencentMobileqqActivityRecentOnRecentUserOpsListener = paramOnRecentUserOpsListener;
  }
  
  public void a(QQAppInterface paramQQAppInterface)
  {
    if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != paramQQAppInterface) {
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    }
    a(null);
  }
  
  public void a(List paramList)
  {
    if (jdField_a_of_type_JavaUtilList == null) {
      jdField_a_of_type_JavaUtilList = new ArrayList(50);
    }
    jdField_a_of_type_JavaUtilList.clear();
    if ((paramList != null) && (paramList.size() > 0))
    {
      paramList = paramList.iterator();
      while (paramList.hasNext())
      {
        Object localObject = paramList.next();
        jdField_a_of_type_JavaUtilList.add(localObject);
      }
    }
    notifyDataSetChanged();
  }
  
  public boolean a(View paramView)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecommendAdapter", 2, "RecommendAdapter|updateItem");
    }
    if (paramView == null) {
      return false;
    }
    int j = 0;
    if (j < 7)
    {
      Object localObject1 = paramView.findViewById(jdField_a_of_type_ArrayOfInt[j]);
      Object localObject2;
      ImageView localImageView;
      if ((localObject1 != null) && (((View)localObject1).getVisibility() == 0))
      {
        localObject2 = (String)((View)localObject1).getTag();
        localImageView = (ImageView)((View)localObject1).findViewWithTag("head");
        localObject1 = (TextView)((View)localObject1).findViewWithTag("name");
        if ((localImageView != null) && (localObject1 != null)) {
          break label104;
        }
      }
      for (;;)
      {
        j += 1;
        break;
        label104:
        Bitmap localBitmap = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a((String)localObject2, (byte)3, true);
        label122:
        int i;
        if (localBitmap == null)
        {
          ((TextView)localObject1).setText(ContactUtils.l(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (String)localObject2));
          localObject2 = ((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).c((String)localObject2);
          if (localObject2 == null) {
            continue;
          }
          switch (netTypeIconId)
          {
          default: 
            i = 2130840283;
          }
        }
        for (;;)
        {
          if (i != 0) {
            break label365;
          }
          ((TextView)localObject1).setCompoundDrawables(null, null, null, null);
          ((TextView)localObject1).setCompoundDrawablePadding(0);
          break;
          localImageView.setImageBitmap(localBitmap);
          break label122;
          i = 2130840291;
          continue;
          i = 2130840283;
          continue;
          i = 2130840285;
          continue;
          i = 2130840287;
          continue;
          i = 2130842866;
          continue;
          i = 2130840289;
          continue;
          i = 2130842859;
          continue;
          i = 2130842862;
          continue;
          i = 2130842869;
          continue;
          i = 2130842853;
          continue;
          i = 2130842856;
        }
        try
        {
          label365:
          int k = (int)(((TextView)localObject1).getTextSize() + 0.5D);
          localObject2 = BitmapFactory.decodeResource(((TextView)localObject1).getResources(), i);
          localObject2 = new BitmapDrawable(((TextView)localObject1).getResources(), (Bitmap)localObject2);
          ((Drawable)localObject2).setBounds(0, 0, k, k);
          ((TextView)localObject1).setCompoundDrawables(null, null, (Drawable)localObject2, null);
          ((TextView)localObject1).setCompoundDrawablePadding(10);
        }
        catch (OutOfMemoryError localOutOfMemoryError) {}
      }
    }
    return true;
  }
  
  public boolean a(View paramView, String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecommendAdapter", 2, "RecommendAdapter|updateItem uin: " + paramString);
    }
    if ((paramView == null) || (TextUtils.isEmpty(paramString))) {}
    do
    {
      return false;
      localObject = paramView.findViewWithTag(paramString);
    } while (localObject == null);
    paramView = (ImageView)((View)localObject).findViewWithTag("head");
    Object localObject = (TextView)((View)localObject).findViewWithTag("name");
    Bitmap localBitmap = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(paramString, (byte)3, true);
    if ((localBitmap != null) && (paramView != null)) {
      paramView.setImageBitmap(localBitmap);
    }
    paramView = ContactUtils.l(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, paramString);
    if (localObject != null) {
      ((TextView)localObject).setText(paramView);
    }
    return true;
  }
  
  public void destroyItem(ViewGroup paramViewGroup, int paramInt, Object paramObject)
  {
    paramViewGroup.removeView((View)paramObject);
  }
  
  public int getCount()
  {
    int j = a() / 7;
    if (a() % 7 == 0) {}
    for (int i = 0;; i = 1) {
      return i + j;
    }
  }
  
  public int getItemPosition(Object paramObject)
  {
    return -2;
  }
  
  public Object instantiateItem(ViewGroup paramViewGroup, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("RecommendAdapter", 2, "RecommendAdapter|instantiateItem position: " + paramInt);
    }
    if (a() == 0)
    {
      if (QLog.isColorLevel()) {
        QLog.d("RecommendAdapter", 2, "RecommendAdapter|instantiateItem data list is empty!");
      }
      return null;
    }
    int j = a() / 7;
    int i;
    int k;
    if (a() % 7 == 0)
    {
      i = 0;
      k = j + i;
      if (a() % 7 != 0) {
        break label591;
      }
      i = 7;
      label96:
      if (k <= 1) {
        break label836;
      }
    }
    label130:
    label147:
    label164:
    label260:
    label447:
    label466:
    label591:
    label607:
    label623:
    label775:
    label793:
    label836:
    for (j = paramInt * 7;; j = 0)
    {
      if ((k == 1) || (paramInt == k - 1)) {}
      for (;;)
      {
        View localView1;
        View localView2;
        ImageView localImageView;
        TextView localTextView;
        String str;
        Object localObject1;
        Object localObject2;
        if (paramInt % 2 == 0)
        {
          paramInt = 1;
          if (paramInt == 0) {
            break label607;
          }
          localView1 = View.inflate(paramViewGroup.getContext(), 2130903217, null);
          FriendsManager localFriendsManager = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
          k = 0;
          paramInt = i;
          if (k >= i) {
            break label793;
          }
          localView2 = localView1.findViewById(jdField_a_of_type_ArrayOfInt[k]);
          localImageView = (ImageView)localView1.findViewById(b[k]);
          localTextView = (TextView)localView1.findViewById(c[k]);
          str = ((Long)jdField_a_of_type_JavaUtilList.get(j + k)).toString();
          localObject1 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(str, (byte)3, true);
          if (localObject1 != null) {
            break label623;
          }
          localObject1 = ContactUtils.l(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, str);
          localTextView.setText((CharSequence)localObject1);
          if (QLog.isColorLevel()) {
            QLog.d("RecommendAdapter", 2, "RecommendAdater|instantiateItem uin: " + str + ", name: " + (String)localObject1);
          }
          localObject2 = localFriendsManager.c(str);
          if (localObject2 == null) {
            break label775;
          }
          int m = netTypeIconId;
          switch (m)
          {
          default: 
            paramInt = 2130840283;
            if (paramInt == 0)
            {
              localTextView.setCompoundDrawables(null, null, null, null);
              localTextView.setCompoundDrawablePadding(0);
              if (QLog.isColorLevel()) {
                QLog.d("RecommendAdapter", 2, "RecommendAdater|instantiateItem networkType: " + m + ", resId: " + paramInt);
              }
            }
            break;
          }
        }
        for (;;)
        {
          localImageView.setTag("head");
          localTextView.setTag("name");
          localView2.setTag(str);
          localView2.setVisibility(0);
          localView2.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
          localView2.setContentDescription("点击向" + (String)localObject1 + "发起QQ通话");
          k += 1;
          break label164;
          i = 1;
          break;
          i = a() % 7;
          break label96;
          paramInt = 0;
          break label130;
          localView1 = View.inflate(paramViewGroup.getContext(), 2130903216, null);
          break label147;
          localImageView.setImageBitmap((Bitmap)localObject1);
          break label260;
          paramInt = 2130840291;
          break label447;
          paramInt = 2130840283;
          break label447;
          paramInt = 2130840285;
          break label447;
          paramInt = 2130840287;
          break label447;
          paramInt = 2130842866;
          break label447;
          paramInt = 2130840289;
          break label447;
          paramInt = 2130842859;
          break label447;
          paramInt = 2130842862;
          break label447;
          paramInt = 2130842869;
          break label447;
          paramInt = 2130842853;
          break label447;
          paramInt = 2130842856;
          break label447;
          int n = (int)(localTextView.getTextSize() + 0.5D);
          try
          {
            localObject2 = BitmapFactory.decodeResource(localTextView.getResources(), paramInt);
            localObject2 = new BitmapDrawable(localTextView.getResources(), (Bitmap)localObject2);
            ((Drawable)localObject2).setBounds(0, 0, n, n);
            localTextView.setCompoundDrawables(null, null, (Drawable)localObject2, null);
            localTextView.setCompoundDrawablePadding(10);
          }
          catch (OutOfMemoryError localOutOfMemoryError) {}
          break label466;
          if (QLog.isColorLevel()) {
            QLog.d("RecommendAdapter", 2, "RecommendAdater|instantiateItem cannot find friend!");
          }
        }
        while (paramInt < 7)
        {
          localView1.findViewById(jdField_a_of_type_ArrayOfInt[paramInt]).setVisibility(4);
          paramInt += 1;
        }
        paramViewGroup.addView(localView1);
        return localView1;
        i = 7;
      }
    }
  }
  
  public boolean isViewFromObject(View paramView, Object paramObject)
  {
    return paramView == paramObject;
  }
}
