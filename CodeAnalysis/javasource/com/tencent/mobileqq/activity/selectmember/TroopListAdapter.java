package com.tencent.mobileqq.activity.selectmember;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.mobileqq.adapter.FacePreloadBaseAdapter;
import com.tencent.mobileqq.adapter.FacePreloadBaseAdapter.FaceInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.TroopManager;
import com.tencent.mobileqq.data.CommonlyUsedTroop;
import com.tencent.mobileqq.data.TroopInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class TroopListAdapter
  extends FacePreloadBaseAdapter
{
  public int a;
  protected Context a;
  protected LayoutInflater a;
  protected View.OnClickListener a;
  protected XListView a;
  protected List a;
  public int b;
  public int c;
  public int d;
  
  public TroopListAdapter(Context paramContext, QQAppInterface paramQQAppInterface, XListView paramXListView, int paramInt, boolean paramBoolean, View.OnClickListener paramOnClickListener)
  {
    super(paramContext, paramQQAppInterface, paramXListView, paramInt, paramBoolean);
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilList = new ArrayList();
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_AndroidViewLayoutInflater = LayoutInflater.from(paramContext);
    jdField_a_of_type_ComTencentWidgetXListView = paramXListView;
    jdField_a_of_type_AndroidViewView$OnClickListener = paramOnClickListener;
  }
  
  public int a(int paramInt)
  {
    switch (paramInt)
    {
    case 1: 
    default: 
      return 1;
    case 4: 
      return 2;
    case 2: 
      return 3;
    }
    return 4;
  }
  
  protected Object a(int paramInt)
  {
    FacePreloadBaseAdapter.FaceInfo localFaceInfo = new FacePreloadBaseAdapter.FaceInfo(this);
    jdField_a_of_type_JavaLangString = getItemtroopuin;
    jdField_a_of_type_Int = 4;
    return localFaceInfo;
  }
  
  public void a(QQAppInterface paramQQAppInterface, ArrayList paramArrayList)
  {
    jdField_a_of_type_JavaUtilList.clear();
    Object localObject1 = (TroopManager)paramQQAppInterface.getManager(51);
    ArrayList localArrayList = new ArrayList();
    Object localObject2 = ((TroopManager)localObject1).a();
    if (localObject2 != null)
    {
      Collections.sort((List)localObject2, new TroopListAdapter.CommonlyUsedTroopCompator(this));
      localObject2 = ((List)localObject2).iterator();
      while (((Iterator)localObject2).hasNext())
      {
        localObject3 = ((TroopManager)localObject1).a(nexttroopUin);
        if (localObject3 != null) {
          localArrayList.add(localObject3);
        }
      }
      d = localArrayList.size();
    }
    Object localObject3 = new ArrayList();
    localObject2 = new ArrayList();
    localObject1 = new ArrayList();
    paramArrayList = paramArrayList.iterator();
    while (paramArrayList.hasNext())
    {
      Entity localEntity = (Entity)paramArrayList.next();
      i = a(paramQQAppInterface.b(troopuin));
      if ((dwAdditionalFlag & 1L) == 1L) {
        ((List)localObject3).add(new TroopListAdapter.TroopListItemWithMask(this, i, localEntity));
      } else if ((dwCmdUinUinFlag & 1L) == 1L) {
        ((List)localObject2).add(new TroopListAdapter.TroopListItemWithMask(this, i, localEntity));
      } else {
        ((List)localObject1).add(new TroopListAdapter.TroopListItemWithMask(this, i, localEntity));
      }
    }
    paramQQAppInterface = new TroopListAdapter.TroopCompator(this);
    Collections.sort((List)localObject3, paramQQAppInterface);
    Collections.sort((List)localObject2, paramQQAppInterface);
    Collections.sort((List)localObject1, paramQQAppInterface);
    if (!localArrayList.isEmpty()) {}
    for (int i = 1; i != 0; i = 0)
    {
      jdField_a_of_type_JavaUtilList.add(new TroopListAdapter.TroopListItem(this, 0, null));
      paramQQAppInterface = localArrayList.iterator();
      while (paramQQAppInterface.hasNext())
      {
        paramArrayList = (Entity)paramQQAppInterface.next();
        jdField_a_of_type_JavaUtilList.add(new TroopListAdapter.TroopListItem(this, 1, paramArrayList));
      }
    }
    jdField_a_of_type_Int = ((List)localObject3).size();
    if (jdField_a_of_type_Int > 0)
    {
      jdField_a_of_type_JavaUtilList.add(new TroopListAdapter.TroopListItem(this, 4, null));
      paramQQAppInterface = ((List)localObject3).iterator();
      while (paramQQAppInterface.hasNext())
      {
        paramArrayList = (TroopListAdapter.TroopListItemWithMask)paramQQAppInterface.next();
        jdField_a_of_type_JavaUtilList.add(new TroopListAdapter.TroopListItem(this, 5, a));
      }
    }
    b = ((List)localObject2).size();
    if (b > 0)
    {
      jdField_a_of_type_JavaUtilList.add(new TroopListAdapter.TroopListItem(this, 6, null));
      paramQQAppInterface = ((List)localObject2).iterator();
      while (paramQQAppInterface.hasNext())
      {
        paramArrayList = (TroopListAdapter.TroopListItemWithMask)paramQQAppInterface.next();
        jdField_a_of_type_JavaUtilList.add(new TroopListAdapter.TroopListItem(this, 7, a));
      }
    }
    c = ((List)localObject1).size();
    if (c > 0)
    {
      jdField_a_of_type_JavaUtilList.add(new TroopListAdapter.TroopListItem(this, 2, null));
      paramQQAppInterface = ((List)localObject1).iterator();
      while (paramQQAppInterface.hasNext())
      {
        paramArrayList = (TroopListAdapter.TroopListItemWithMask)paramQQAppInterface.next();
        jdField_a_of_type_JavaUtilList.add(new TroopListAdapter.TroopListItem(this, 3, a));
      }
    }
  }
  
  public int getCount()
  {
    if (jdField_a_of_type_JavaUtilList == null) {
      return 0;
    }
    return jdField_a_of_type_JavaUtilList.size();
  }
  
  public Object getItem(int paramInt)
  {
    if ((jdField_a_of_type_JavaUtilList != null) && (paramInt >= 0) && (paramInt < jdField_a_of_type_JavaUtilList.size())) {
      return jdField_a_of_type_JavaUtilList.get(paramInt);
    }
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    TroopListAdapter.TroopListItem localTroopListItem = (TroopListAdapter.TroopListItem)getItem(paramInt);
    if ((paramView != null) && (paramView.getTag() != null))
    {
      localObject1 = (TroopListAdapter.TroopViewHolder)paramView.getTag();
      paramViewGroup = paramView;
      paramView = (View)localObject1;
    }
    for (;;)
    {
      localObject1 = paramViewGroup.findViewById(2131299439);
      localObject2 = (TextView)paramViewGroup.findViewById(2131299438);
      if (i != 0) {
        break;
      }
      ((View)localObject1).setVisibility(8);
      ((TextView)localObject2).setVisibility(0);
      ((TextView)localObject2).setText(jdField_a_of_type_AndroidContentContext.getString(2131364108, new Object[] { String.valueOf(d) }));
      return paramViewGroup;
      paramViewGroup = jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904800, jdField_a_of_type_ComTencentWidgetXListView, false);
      paramView = new TroopListAdapter.TroopViewHolder(this);
      d = ((ImageView)paramViewGroup.findViewById(2131296703));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131298175));
      paramViewGroup.setTag(paramView);
    }
    if (i == 2)
    {
      ((View)localObject1).setVisibility(8);
      ((TextView)localObject2).setVisibility(0);
      ((TextView)localObject2).setText(jdField_a_of_type_AndroidContentContext.getString(2131364111, new Object[] { String.valueOf(c) }));
      return paramViewGroup;
    }
    if (i == 4)
    {
      ((View)localObject1).setVisibility(8);
      ((TextView)localObject2).setVisibility(0);
      ((TextView)localObject2).setText(jdField_a_of_type_AndroidContentContext.getString(2131364109, new Object[] { String.valueOf(jdField_a_of_type_Int) }));
      return paramViewGroup;
    }
    if (i == 6)
    {
      ((View)localObject1).setVisibility(8);
      ((TextView)localObject2).setVisibility(0);
      ((TextView)localObject2).setText(jdField_a_of_type_AndroidContentContext.getString(2131364110, new Object[] { String.valueOf(b) }));
      return paramViewGroup;
    }
    ((View)localObject1).setVisibility(0);
    ((TextView)localObject2).setVisibility(8);
    Object localObject2 = jdField_a_of_type_ComTencentMobileqqDataTroopInfo;
    b = troopuin;
    TextView localTextView = jdField_a_of_type_AndroidWidgetTextView;
    if (troopname != null) {}
    for (Object localObject1 = troopname;; localObject1 = troopcode)
    {
      localTextView.setText((CharSequence)localObject1);
      d.setImageBitmap(a(4, troopuin));
      jdField_a_of_type_ComTencentMobileqqDataTroopInfo = ((TroopInfo)localObject2);
      jdField_a_of_type_Int = i;
      paramViewGroup.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
      return paramViewGroup;
    }
  }
}
