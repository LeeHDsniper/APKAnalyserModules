package com.tencent.mobileqq.activity.messagesearch;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.HistoryChatMsgSearchKeyUtil;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MqqWeakReferenceHandler;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import lwo;

public class SearchHistoryAdapter
  extends BaseAdapter
{
  private static final String jdField_a_of_type_JavaLangString = SearchHistoryAdapter.class.getSimpleName();
  private Context jdField_a_of_type_AndroidContentContext;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private MqqWeakReferenceHandler jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler;
  private List jdField_a_of_type_JavaUtilList = new ArrayList();
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public SearchHistoryAdapter(Context paramContext, MqqWeakReferenceHandler paramMqqWeakReferenceHandler, QQAppInterface paramQQAppInterface)
  {
    jdField_a_of_type_AndroidContentContext = paramContext;
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler = paramMqqWeakReferenceHandler;
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "loadHistory, keyword = " + paramString);
    }
    if (paramString == null) {
      return;
    }
    String[] arrayOfString = HistoryChatMsgSearchKeyUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
    jdField_a_of_type_JavaUtilList.clear();
    if (arrayOfString != null)
    {
      int j = arrayOfString.length;
      int i = 0;
      while (i < j)
      {
        String str = arrayOfString[i];
        if (a(str, paramString)) {
          jdField_a_of_type_JavaUtilList.add(new HistoryItem(str));
        }
        i += 1;
      }
    }
    notifyDataSetChanged();
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "loadHistory, keyword = " + paramString + ", histories = " + jdField_a_of_type_JavaUtilList.toString());
    }
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.sendEmptyMessage(3);
  }
  
  boolean a(String paramString1, String paramString2)
  {
    return paramString1.toLowerCase(Locale.US).contains(paramString2.toLowerCase(Locale.US));
  }
  
  public int getCount()
  {
    return jdField_a_of_type_JavaUtilList.size();
  }
  
  public Object getItem(int paramInt)
  {
    return jdField_a_of_type_JavaUtilList.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    HistoryItem localHistoryItem = (HistoryItem)getItem(paramInt);
    View localView;
    if (paramView == null)
    {
      localView = View.inflate(jdField_a_of_type_AndroidContentContext, 2130903398, null);
      paramView = new lwo(null);
      a = ((TextView)localView.findViewById(2131296686));
      localView.setTag(paramView);
      paramViewGroup = paramView;
    }
    for (;;)
    {
      a.setText(jdField_a_of_type_JavaLangString);
      return localView;
      paramViewGroup = (lwo)paramView.getTag();
      localView = paramView;
    }
  }
}
