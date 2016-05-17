package com.tencent.mobileqq.activity.qqcard;

import QCARD.CouponMobileFolder;
import QCARD.CouponMobileItem;
import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.widget.BaseExpandableListAdapter;
import android.widget.TextView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public final class QQCardExpandableAdapter
  extends BaseExpandableListAdapter
{
  private final int jdField_a_of_type_Int;
  private Context jdField_a_of_type_AndroidContentContext;
  private View jdField_a_of_type_AndroidViewView;
  private CardItemBuilderFactory jdField_a_of_type_ComTencentMobileqqActivityQqcardCardItemBuilderFactory;
  private QQCardGroup jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardGroup;
  private QQCardItem jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardItem;
  private final String jdField_a_of_type_JavaLangString;
  private List jdField_a_of_type_JavaUtilList;
  private Map jdField_a_of_type_JavaUtilMap;
  private final int jdField_b_of_type_Int;
  private QQCardGroup jdField_b_of_type_ComTencentMobileqqActivityQqcardQQCardGroup;
  private final int c;
  
  public QQCardExpandableAdapter(Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = QQCardExpandableAdapter.class.getSimpleName();
    jdField_a_of_type_Int = 0;
    jdField_b_of_type_Int = 1;
    c = 2;
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardItem = null;
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentMobileqqActivityQqcardCardItemBuilderFactory = new CardItemBuilderFactory(jdField_a_of_type_AndroidContentContext);
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardGroup = new QQCardGroup(0, "即将过期(%d张)");
    jdField_b_of_type_ComTencentMobileqqActivityQqcardQQCardGroup = new QQCardGroup(1, "其它卡券(%d张)");
    jdField_a_of_type_JavaUtilMap = new HashMap();
    jdField_a_of_type_JavaUtilMap.put(Integer.valueOf(jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardGroup.jdField_a_of_type_Int), new ArrayList());
    jdField_a_of_type_JavaUtilMap.put(Integer.valueOf(jdField_b_of_type_ComTencentMobileqqActivityQqcardQQCardGroup.jdField_a_of_type_Int), new ArrayList());
    jdField_a_of_type_AndroidViewView = new View(jdField_a_of_type_AndroidContentContext);
    jdField_a_of_type_JavaUtilList = new ArrayList();
  }
  
  private boolean a(int paramInt)
  {
    List localList = (List)jdField_a_of_type_JavaUtilMap.get(Integer.valueOf(0));
    if ((jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardGroup.jdField_b_of_type_Int > 0) || (localList.size() > 0)) {}
    for (boolean bool = true;; bool = false)
    {
      if (paramInt == 0) {
        return bool;
      }
      if (paramInt == 1)
      {
        localList = (List)jdField_a_of_type_JavaUtilMap.get(Integer.valueOf(1));
        if ((jdField_b_of_type_ComTencentMobileqqActivityQqcardQQCardGroup.jdField_b_of_type_Int <= 0) && (localList.size() <= 0)) {
          break label101;
        }
      }
      label101:
      for (paramInt = 1;; paramInt = 0)
      {
        return (bool) && (paramInt != 0);
        return false;
      }
    }
  }
  
  public QQCardGroup a(int paramInt)
  {
    if (paramInt == 0) {
      return jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardGroup;
    }
    if (paramInt == 1) {
      return jdField_b_of_type_ComTencentMobileqqActivityQqcardQQCardGroup;
    }
    return null;
  }
  
  public QQCardItem a(int paramInt1, int paramInt2)
  {
    List localList = (List)jdField_a_of_type_JavaUtilMap.get(Integer.valueOf(paramInt1));
    if (localList != null) {
      return (QQCardItem)localList.get(paramInt2);
    }
    return null;
  }
  
  public List a(CouponMobileFolder paramCouponMobileFolder)
  {
    ArrayList localArrayList = new ArrayList();
    if ((paramCouponMobileFolder == null) || (coupon_list == null) || (coupon_list.size() < 1)) {
      return null;
    }
    for (;;)
    {
      Iterator localIterator2;
      synchronized (jdField_a_of_type_JavaUtilList)
      {
        Iterator localIterator1 = coupon_list.iterator();
        continue;
        if (!localIterator1.hasNext()) {
          break;
        }
        CouponMobileItem localCouponMobileItem = (CouponMobileItem)localIterator1.next();
        QQCardItem localQQCardItem1 = new QQCardItem(localCouponMobileItem, 0, folder_id);
        localArrayList.add(localQQCardItem1);
        localIterator2 = jdField_a_of_type_JavaUtilList.iterator();
        if (!localIterator2.hasNext()) {
          continue;
        }
        QQCardItem localQQCardItem2 = (QQCardItem)localIterator2.next();
        if (!localQQCardItem1.equals(localQQCardItem2)) {
          continue;
        }
        if (isValid == 1) {
          localQQCardItem2.setValue(localCouponMobileItem);
        }
      }
      localIterator2.remove();
    }
    a(true, jdField_a_of_type_JavaUtilList);
    return localArrayList;
  }
  
  public void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardItem != null) {
      jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardItem.isNew = false;
    }
  }
  
  public void a(QQCardFolder paramQQCardFolder)
  {
    jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardGroup.jdField_b_of_type_Int = aboutExpireNum;
    jdField_b_of_type_ComTencentMobileqqActivityQqcardQQCardGroup.jdField_b_of_type_Int = (couponsNum - aboutExpireNum);
  }
  
  public void a(QQCardFolder paramQQCardFolder, List paramList)
  {
    jdField_a_of_type_JavaUtilList = paramList;
    a(paramQQCardFolder);
    a(true, jdField_a_of_type_JavaUtilList);
  }
  
  public void a(List paramList)
  {
    jdField_a_of_type_JavaUtilList.addAll(paramList);
    a(false, paramList);
  }
  
  public void a(boolean paramBoolean, List paramList)
  {
    List localList1 = (List)jdField_a_of_type_JavaUtilMap.get(Integer.valueOf(0));
    List localList2 = (List)jdField_a_of_type_JavaUtilMap.get(Integer.valueOf(1));
    if (paramBoolean)
    {
      localList1.clear();
      localList2.clear();
    }
    long l = NetConnInfoCenter.getServerTimeMillis() / 1000L;
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "classifyQQCard curTimestamp=" + l);
    }
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      QQCardItem localQQCardItem = (QQCardItem)paramList.next();
      if (QQCardManager.a(l, expireTime) < 7) {
        localList1.add(localQQCardItem);
      } else {
        localList2.add(localQQCardItem);
      }
    }
  }
  
  public boolean a(QQCardItem paramQQCardItem, String paramString)
  {
    String str = field + "_" + cardId + "_" + code;
    int j = jdField_a_of_type_JavaUtilList.size();
    int i = 0;
    QQCardItem localQQCardItem;
    boolean bool;
    if (i < j)
    {
      localQQCardItem = (QQCardItem)jdField_a_of_type_JavaUtilList.get(i);
      if (localQQCardItem.equalsId(str))
      {
        i = -1;
        bool = true;
      }
    }
    for (;;)
    {
      label92:
      if (i > -1)
      {
        jdField_a_of_type_JavaUtilList.add(i, paramQQCardItem);
        bool = true;
      }
      for (;;)
      {
        if (bool)
        {
          jdField_a_of_type_ComTencentMobileqqActivityQqcardQQCardItem = paramQQCardItem;
          a(true, jdField_a_of_type_JavaUtilList);
        }
        return bool;
        if (localQQCardItem.equalsId(paramString))
        {
          bool = false;
          break label92;
        }
        i += 1;
        break;
        if (TextUtils.isEmpty(paramString))
        {
          jdField_a_of_type_JavaUtilList.add(paramQQCardItem);
          bool = true;
        }
      }
      i = -1;
      bool = false;
    }
  }
  
  public long getChildId(int paramInt1, int paramInt2)
  {
    return paramInt2;
  }
  
  public int getChildType(int paramInt1, int paramInt2)
  {
    QQCardItem localQQCardItem = a(paramInt1, paramInt2);
    return jdField_a_of_type_ComTencentMobileqqActivityQqcardCardItemBuilderFactory.a(localQQCardItem);
  }
  
  public int getChildTypeCount()
  {
    return 2;
  }
  
  public View getChildView(int paramInt1, int paramInt2, boolean paramBoolean, View paramView, ViewGroup paramViewGroup)
  {
    QQCardItem localQQCardItem = a(paramInt1, paramInt2);
    BaseCardItemBuilder localBaseCardItemBuilder = jdField_a_of_type_ComTencentMobileqqActivityQqcardCardItemBuilderFactory.a(localQQCardItem);
    if (localBaseCardItemBuilder == null) {
      paramView = jdField_a_of_type_AndroidViewView;
    }
    do
    {
      return paramView;
      paramViewGroup = localBaseCardItemBuilder.a(localQQCardItem, paramView, paramViewGroup);
      paramView = paramViewGroup;
    } while (!isNew);
    if (QLog.isColorLevel()) {
      QLog.d(jdField_a_of_type_JavaLangString, 2, "getChildView do anim...");
    }
    isNew = false;
    paramViewGroup.startAnimation(AnimationUtils.loadAnimation(jdField_a_of_type_AndroidContentContext, 2130968596));
    return paramViewGroup;
  }
  
  public int getChildrenCount(int paramInt)
  {
    List localList = (List)jdField_a_of_type_JavaUtilMap.get(Integer.valueOf(paramInt));
    if (localList != null) {
      return localList.size();
    }
    return 0;
  }
  
  public int getGroupCount()
  {
    return 2;
  }
  
  public long getGroupId(int paramInt)
  {
    return paramInt;
  }
  
  public View getGroupView(int paramInt, boolean paramBoolean, View paramView, ViewGroup paramViewGroup)
  {
    QQCardGroup localQQCardGroup = a(paramInt);
    if ((localQQCardGroup != null) && (a(paramInt))) {
      if ((paramView == null) || (paramView == jdField_a_of_type_AndroidViewView))
      {
        paramView = LayoutInflater.from(jdField_a_of_type_AndroidContentContext).inflate(2130904413, null);
        paramViewGroup = new QQCardExpandableAdapter.GroupViewHolder();
        jdField_a_of_type_AndroidViewView = paramView;
        jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131302590));
        paramView.setTag(paramViewGroup);
        jdField_a_of_type_AndroidWidgetTextView.setText(String.format(jdField_a_of_type_JavaLangString, new Object[] { Integer.valueOf(jdField_b_of_type_Int) }));
      }
    }
    for (;;)
    {
      paramView.setClickable(true);
      return paramView;
      paramViewGroup = (QQCardExpandableAdapter.GroupViewHolder)paramView.getTag();
      break;
      paramView = jdField_a_of_type_AndroidViewView;
    }
  }
  
  public boolean hasStableIds()
  {
    return true;
  }
  
  public boolean isChildSelectable(int paramInt1, int paramInt2)
  {
    return true;
  }
}
