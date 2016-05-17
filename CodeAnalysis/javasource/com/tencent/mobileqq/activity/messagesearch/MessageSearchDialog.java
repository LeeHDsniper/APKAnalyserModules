package com.tencent.mobileqq.activity.messagesearch;

import android.content.Context;
import android.os.Message;
import android.text.InputFilter;
import android.text.InputFilter.LengthFilter;
import android.view.View.OnClickListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MqqWeakReferenceHandler;
import com.tencent.widget.XListView;
import java.util.List;
import lwe;
import lwf;
import lwg;
import lwh;
import lwi;
import lwj;
import lwk;
import lwl;

public class MessageSearchDialog
  extends BaseMessageSearchDialog
{
  public static final String a;
  private View.OnClickListener a;
  protected TextView a;
  public MessageResultAdapter a;
  public SearchHistoryAdapter a;
  public boolean b = true;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = MessageSearchDialog.class.getSimpleName();
  }
  
  public MessageSearchDialog(Context paramContext, QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo)
  {
    super(paramContext, paramQQAppInterface, paramSessionInfo);
    jdField_a_of_type_AndroidViewView$OnClickListener = new lwh(this);
    k();
    g();
    h();
    i();
  }
  
  private void g()
  {
    jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131300511));
    jdField_a_of_type_AndroidWidgetEditText.setFilters(new InputFilter[] { new InputFilter.LengthFilter(15) });
    jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(new lwe(this));
    jdField_a_of_type_AndroidWidgetEditText.setImeOptions(3);
    BaseMessageSearchDialog.EnterForSearch localEnterForSearch = new BaseMessageSearchDialog.EnterForSearch(this);
    jdField_a_of_type_AndroidWidgetEditText.setOnEditorActionListener(localEnterForSearch);
    jdField_a_of_type_AndroidWidgetEditText.setOnKeyListener(localEnterForSearch);
    jdField_a_of_type_AndroidWidgetEditText.setSelection(0);
    jdField_a_of_type_AndroidWidgetEditText.requestFocus();
    jdField_a_of_type_ComTencentMobileqqActivityMessagesearchSearchHistoryAdapter.a("");
  }
  
  private void h()
  {
    ((ImageButton)findViewById(2131300496)).setOnClickListener(new lwf(this));
  }
  
  private void i()
  {
    Button localButton = (Button)findViewById(2131300492);
    localButton.setVisibility(0);
    localButton.setOnClickListener(new lwg(this));
  }
  
  private void j()
  {
    String str = jdField_a_of_type_AndroidWidgetEditText.getText().toString().trim();
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "loadMessageMore, currentKeyword = " + str);
    }
    jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter.a(System.currentTimeMillis(), str, 2);
  }
  
  private void k()
  {
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131297662));
    jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter = new MessageResultAdapter(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    jdField_a_of_type_ComTencentMobileqqActivityMessagesearchSearchHistoryAdapter = new SearchHistoryAdapter(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchSearchHistoryAdapter);
    jdField_a_of_type_ComTencentWidgetXListView.setOnScrollListener(new lwi(this));
    jdField_a_of_type_ComTencentWidgetXListView.setOnTouchListener(new lwj(this));
    jdField_a_of_type_ComTencentWidgetXListView.setOnItemClickListener(new lwk(this));
    jdField_a_of_type_ComTencentWidgetXListView.setOnItemLongClickListener(new lwl(this));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297663));
    jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawables(null, null, null, null);
    jdField_a_of_type_AndroidWidgetTextView.setText(2131367797);
  }
  
  protected void a()
  {
    String str1 = jdField_a_of_type_AndroidWidgetEditText.getText().toString().trim();
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "searchMessage, currentKeyword = " + str1);
    }
    if (str1.length() == 0) {}
    String str2;
    do
    {
      return;
      str2 = jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter.a();
      if ((jdField_a_of_type_ComTencentWidgetXListView.a() != jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter) || (!str1.equalsIgnoreCase(str2))) {
        break;
      }
    } while (!QLog.isColorLevel());
    QLog.i(jdField_a_of_type_JavaLangString, 2, "searchMessage, skip, currentKeyword = " + str1 + ", mLastKeyword = " + str2);
    return;
    jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter.a(System.currentTimeMillis(), str1, 1);
    a(2131367628);
  }
  
  public void dismiss()
  {
    ((InputMethodManager)jdField_a_of_type_AndroidContentContext.getSystemService("input_method")).hideSoftInputFromWindow(jdField_a_of_type_AndroidWidgetEditText.getWindowToken(), 0);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(0);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(1);
    try
    {
      super.dismiss();
      return;
    }
    catch (Exception localException) {}
  }
  
  void e()
  {
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    jdField_a_of_type_ComTencentWidgetXListView.setVisibility(0);
  }
  
  void f()
  {
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    jdField_a_of_type_ComTencentWidgetXListView.setVisibility(8);
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    int i = what;
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "handleMessage, msg.what = " + what);
    }
    switch (i)
    {
    }
    for (;;)
    {
      return true;
      c();
      continue;
      d();
      continue;
      b();
      if (jdField_a_of_type_ComTencentWidgetXListView.a() != jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter) {
        jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter);
      }
      if ((obj instanceof List))
      {
        jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter.a((List)obj, arg1);
        jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter.notifyDataSetChanged();
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityMessagesearchMessageResultAdapter.getCount() == 0)
      {
        f();
      }
      else
      {
        e();
        continue;
        if (jdField_a_of_type_ComTencentWidgetXListView.a() != jdField_a_of_type_ComTencentMobileqqActivityMessagesearchSearchHistoryAdapter) {
          jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchSearchHistoryAdapter);
        }
        jdField_a_of_type_ComTencentMobileqqActivityMessagesearchSearchHistoryAdapter.notifyDataSetChanged();
        e();
      }
    }
  }
  
  public void show()
  {
    super.show();
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(0);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(1);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.sendEmptyMessage(0);
  }
}
