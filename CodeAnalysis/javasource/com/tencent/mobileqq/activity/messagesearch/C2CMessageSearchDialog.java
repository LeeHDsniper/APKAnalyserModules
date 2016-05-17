package com.tencent.mobileqq.activity.messagesearch;

import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Message;
import android.text.InputFilter;
import android.text.InputFilter.LengthFilter;
import android.text.TextUtils;
import android.util.Pair;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.MessageRoamManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.data.MessageRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.msf.sdk.AppNetConnInfo;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.MqqWeakReferenceHandler;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import lvv;
import lvw;
import lvx;
import lvy;
import lvz;
import lwa;
import lwb;
import lwc;
import tencent.im.oidb.searcher.oidb_c2c_searcher.Iterator;

public class C2CMessageSearchDialog
  extends BaseMessageSearchDialog
{
  public static final String a;
  public static final int k = 0;
  public static final int l = 1;
  public static final int m = 0;
  public static final int n = 1;
  public static final int o = 2;
  public static final int p = 3;
  public static final int q = 4;
  public static final int r = 5;
  public static final int s = 15;
  public long a;
  private View.OnClickListener jdField_a_of_type_AndroidViewView$OnClickListener = new lvy(this);
  View jdField_a_of_type_AndroidViewView;
  public LinearLayout a;
  public TextView a;
  public C2CMessageResultAdapter a;
  private HashMap jdField_a_of_type_JavaUtilHashMap = new HashMap();
  private List jdField_a_of_type_JavaUtilList = new ArrayList();
  private Set jdField_a_of_type_JavaUtilSet = new HashSet();
  public View b;
  LinearLayout jdField_b_of_type_AndroidWidgetLinearLayout;
  TextView jdField_b_of_type_AndroidWidgetTextView;
  public String b;
  private List jdField_b_of_type_JavaUtilList = new ArrayList();
  public boolean b;
  public LinearLayout c;
  public TextView c;
  public String c;
  public boolean c;
  private LinearLayout d;
  public boolean d;
  boolean e = false;
  public int t = 0;
  private int u = 0;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = C2CMessageSearchDialog.class.getSimpleName();
  }
  
  public C2CMessageSearchDialog(Context paramContext, QQAppInterface paramQQAppInterface, SessionInfo paramSessionInfo, boolean paramBoolean)
  {
    super(paramContext, paramQQAppInterface, paramSessionInfo);
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = false;
    jdField_d_of_type_Boolean = false;
    jdField_b_of_type_JavaLangString = "";
    jdField_c_of_type_JavaLangString = "";
    jdField_b_of_type_Boolean = paramBoolean;
    paramContext = paramQQAppInterface.a();
    if ((!TextUtils.isEmpty(paramContext)) && ("1".equals(paramContext.substring(paramContext.length() - 1, paramContext.length())))) {
      e = true;
    }
    h();
    e();
    g();
  }
  
  private void a(int paramInt, String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "showHeaderViewByType, needShowType = " + paramInt + ",tips: " + paramString);
    }
    switch (paramInt)
    {
    default: 
      return;
    case 0: 
      jdField_a_of_type_AndroidViewView.setVisibility(8);
      jdField_b_of_type_AndroidWidgetLinearLayout.setVisibility(8);
      jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
      jdField_d_of_type_AndroidWidgetLinearLayout.setVisibility(8);
      return;
    case 1: 
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetLinearLayout.setVisibility(8);
      jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
      return;
    case 2: 
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetLinearLayout.setVisibility(8);
      jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetTextView.setClickable(true);
      jdField_b_of_type_AndroidWidgetTextView.setTextColor(jdField_a_of_type_AndroidContentContext.getResources().getColor(2131428139));
      jdField_b_of_type_AndroidWidgetTextView.setText(paramString);
      return;
    case 3: 
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetLinearLayout.setVisibility(8);
      jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
      jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetTextView.setClickable(false);
      jdField_b_of_type_AndroidWidgetTextView.setTextColor(jdField_a_of_type_AndroidContentContext.getResources().getColor(2131428212));
      jdField_b_of_type_AndroidWidgetTextView.setText(paramString);
      return;
    case 4: 
      jdField_a_of_type_AndroidViewView.setVisibility(0);
      jdField_d_of_type_AndroidWidgetLinearLayout.setVisibility(0);
      return;
    }
    jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
  }
  
  private void e()
  {
    jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131300511));
    jdField_a_of_type_AndroidWidgetEditText.setFilters(new InputFilter[] { new InputFilter.LengthFilter(15) });
    jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(new lvv(this));
    jdField_a_of_type_AndroidWidgetEditText.setImeOptions(3);
    BaseMessageSearchDialog.EnterForSearch localEnterForSearch = new BaseMessageSearchDialog.EnterForSearch(this);
    jdField_a_of_type_AndroidWidgetEditText.setOnEditorActionListener(localEnterForSearch);
    jdField_a_of_type_AndroidWidgetEditText.setOnKeyListener(localEnterForSearch);
    jdField_a_of_type_AndroidWidgetEditText.setSelection(0);
    jdField_a_of_type_AndroidWidgetEditText.requestFocus();
  }
  
  private void f()
  {
    jdField_c_of_type_Boolean = false;
    t = 0;
    jdField_a_of_type_JavaUtilList.clear();
    jdField_a_of_type_JavaUtilSet.clear();
    u = 0;
    jdField_d_of_type_Boolean = false;
  }
  
  private void g()
  {
    ((ImageButton)findViewById(2131300496)).setOnClickListener(new lvw(this));
    Button localButton = (Button)findViewById(2131300492);
    localButton.setVisibility(0);
    localButton.setOnClickListener(new lvx(this));
  }
  
  private void h()
  {
    jdField_a_of_type_ComTencentWidgetXListView = ((XListView)findViewById(2131297662));
    jdField_a_of_type_AndroidViewView = getLayoutInflater().inflate(2130903397, null);
    jdField_a_of_type_ComTencentWidgetXListView.a(jdField_a_of_type_AndroidViewView, null, false);
    jdField_b_of_type_AndroidWidgetLinearLayout = ((LinearLayout)jdField_a_of_type_AndroidViewView.findViewById(2131296916));
    jdField_b_of_type_AndroidWidgetLinearLayout.setClickable(false);
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131298386));
    jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)jdField_a_of_type_AndroidViewView.findViewById(2131298384));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131298385));
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(jdField_a_of_type_AndroidViewView$OnClickListener);
    jdField_d_of_type_AndroidWidgetLinearLayout = ((LinearLayout)jdField_a_of_type_AndroidViewView.findViewById(2131298388));
    jdField_d_of_type_AndroidWidgetLinearLayout.setClickable(false);
    jdField_b_of_type_AndroidViewView = getLayoutInflater().inflate(2130904374, null);
    jdField_a_of_type_ComTencentWidgetXListView.b(jdField_b_of_type_AndroidViewView, null, false);
    jdField_b_of_type_AndroidViewView.setClickable(false);
    jdField_c_of_type_AndroidWidgetLinearLayout = ((LinearLayout)jdField_b_of_type_AndroidViewView.findViewById(2131296916));
    jdField_c_of_type_AndroidWidgetTextView = ((TextView)jdField_b_of_type_AndroidViewView.findViewById(2131298387));
    jdField_c_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_AndroidContentContext.getString(2131367844));
    jdField_b_of_type_AndroidViewView.setVisibility(8);
    jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter = new C2CMessageResultAdapter(jdField_a_of_type_AndroidContentContext, jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler, jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface);
    jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter);
    jdField_a_of_type_ComTencentWidgetXListView.setOnScrollListener(new lvz(this));
    jdField_a_of_type_ComTencentWidgetXListView.setOnTouchListener(new lwa(this));
    jdField_a_of_type_ComTencentWidgetXListView.setOnItemClickListener(new lwb(this));
    jdField_a_of_type_ComTencentWidgetXListView.setOnItemLongClickListener(new lwc(this));
  }
  
  public void a()
  {
    String str = jdField_a_of_type_AndroidWidgetEditText.getText().toString().trim();
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "searchMessage, keyword = " + str);
    }
    if (str.length() == 0) {
      return;
    }
    jdField_a_of_type_JavaUtilHashMap.clear();
    f();
    jdField_b_of_type_JavaLangString = str;
    jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a(jdField_b_of_type_JavaLangString);
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "searchMessage, keyword: " + jdField_b_of_type_JavaLangString + ", needSearchInCloud: " + jdField_b_of_type_Boolean + ", netState: " + AppNetConnInfo.isNetSupport());
    }
    jdField_a_of_type_Long = System.currentTimeMillis();
    if ((jdField_b_of_type_Boolean) && (AppNetConnInfo.isNetSupport()))
    {
      t = 1;
      a(5, null);
      b(1);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005FCB", "0X8005FCB", 0, 0, "", "", "", "");
    }
    for (;;)
    {
      a(2131367628);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005FCA", "0X8005FCA", 0, 0, "", "", "", "");
      return;
      t = 0;
      jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a(jdField_a_of_type_Long, jdField_b_of_type_JavaLangString, 1);
      if (jdField_b_of_type_Boolean) {
        a(3, jdField_a_of_type_AndroidContentContext.getString(2131367846));
      } else {
        a(0, null);
      }
    }
  }
  
  public void b(int paramInt)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo.jdField_a_of_type_JavaLangString);
    oidb_c2c_searcher.Iterator localIterator = (oidb_c2c_searcher.Iterator)jdField_a_of_type_JavaUtilHashMap.get(jdField_b_of_type_JavaLangString);
    long l1 = NetConnInfoCenter.getServerTime();
    Object localObject2 = (MessageRoamManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(91);
    Object localObject1 = ((MessageRoamManager)localObject2).c();
    long l2;
    int j;
    int i1;
    StringBuilder localStringBuilder;
    if (localObject1 != null)
    {
      l2 = ((Long)asecond).longValue();
      localObject2 = new StringBuilder();
      int i = ((Calendar)localObject1).get(1);
      j = ((Calendar)localObject1).get(2) + 1;
      i1 = ((Calendar)localObject1).get(5);
      localStringBuilder = ((StringBuilder)localObject2).append(i).append("-");
      if (j <= 9) {
        break label281;
      }
      localObject1 = Integer.valueOf(j);
      localStringBuilder = localStringBuilder.append(localObject1).append("-");
      if (i1 <= 9) {
        break label306;
      }
    }
    label281:
    label306:
    for (localObject1 = Integer.valueOf(i1);; localObject1 = "0" + i1)
    {
      localStringBuilder.append(localObject1);
      l1 = l2;
      if (QLog.isColorLevel())
      {
        QLog.i(jdField_a_of_type_JavaLangString, 2, "showSearchDialog--> lastDay:" + ((StringBuilder)localObject2).toString());
        l1 = l2;
      }
      if (localIterator == null) {
        break label332;
      }
      localObject1 = new ArrayList();
      ((List)localObject1).add(localIterator);
      jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramInt, localArrayList, jdField_b_of_type_JavaLangString, jdField_a_of_type_Long, (List)localObject1, 0, l1);
      return;
      localObject1 = "0" + j;
      break;
    }
    label332:
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().a(paramInt, localArrayList, jdField_b_of_type_JavaLangString, jdField_a_of_type_Long, null, 0, l1);
  }
  
  public void dismiss()
  {
    ((InputMethodManager)jdField_a_of_type_AndroidContentContext.getSystemService("input_method")).hideSoftInputFromWindow(jdField_a_of_type_AndroidWidgetEditText.getWindowToken(), 0);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(0);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(1);
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(getClass());
    try
    {
      super.dismiss();
      return;
    }
    catch (Exception localException) {}
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    int i = what;
    if (QLog.isColorLevel()) {
      QLog.i(jdField_a_of_type_JavaLangString, 2, "handleMessage, msg.what = " + what + ",mSearchMode = " + t);
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
      Object localObject1 = paramMessage.getData();
      long l1 = ((Bundle)localObject1).getLong("searchSequence", 0L);
      localObject1 = ((Bundle)localObject1).getString("searchKeyword");
      Object localObject2 = (List)obj;
      String str;
      StringBuilder localStringBuilder;
      if (QLog.isColorLevel())
      {
        str = jdField_a_of_type_JavaLangString;
        localStringBuilder = new StringBuilder().append("handleMessage : ACTION_SHOW_MESSAGE searchSequence: ").append(l1).append(", keyword: ").append((String)localObject1).append(", mCurrentKeyword: ").append(jdField_b_of_type_JavaLangString).append(", searchSequence: ").append(l1).append(", mSearchSequence: ").append(jdField_a_of_type_Long).append(", loadType: ").append(arg1).append(", size: ");
        if (localObject2 != null) {
          break label330;
        }
      }
      label330:
      for (i = 0;; i = ((List)localObject2).size())
      {
        QLog.d(str, 2, i);
        if ((localObject2 != null) && (l1 == jdField_a_of_type_Long) && ((localObject1 == null) || (((String)localObject1).equals(jdField_b_of_type_JavaLangString)))) {
          break;
        }
        if (QLog.isColorLevel()) {
          QLog.d(jdField_a_of_type_JavaLangString, 2, "handleMessage : ACTION_SHOW_MESSAGE sequence or keyword not equal, no load");
        }
        return true;
      }
      if (((1 == arg1) && (((List)localObject2).size() > 0) && (((List)localObject2).size() != 20)) || ((2 == arg1) && (((List)localObject2).size() == 0)))
      {
        jdField_c_of_type_AndroidWidgetTextView.setText("已展示全部搜索结果");
        jdField_c_of_type_AndroidWidgetLinearLayout.findViewById(2131302377).setVisibility(8);
        jdField_c_of_type_AndroidWidgetLinearLayout.setVisibility(0);
        jdField_b_of_type_AndroidViewView.setVisibility(0);
        if (2 == arg1)
        {
          jdField_c_of_type_Boolean = false;
          continue;
        }
      }
      if ((obj instanceof List))
      {
        jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a((List)obj, arg1, jdField_d_of_type_Boolean, 0);
        jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.notifyDataSetChanged();
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.getCount() == 0) {
        a(4, null);
      }
      for (;;)
      {
        jdField_c_of_type_Boolean = false;
        break;
        jdField_d_of_type_AndroidWidgetLinearLayout.setVisibility(8);
        jdField_a_of_type_ComTencentWidgetXListView.setVisibility(0);
      }
      paramMessage = (HashMap)obj;
      localObject1 = (String)paramMessage.get("KEYWORD");
      l1 = ((Long)paramMessage.get("SEARCHSEQUENCE")).longValue();
      i = ((Integer)paramMessage.get("LOADTYPE")).intValue();
      if (QLog.isColorLevel()) {
        QLog.i(jdField_a_of_type_JavaLangString, 2, "handleMessage : RSP_SEARCH_TIMEOUT_OR_ERROR_IN_CLOUD ReqkeyWord = " + (String)localObject1 + ",currentKeyword: " + jdField_b_of_type_JavaLangString + ", searchSequence: " + l1 + ",mCurrentSequence: " + jdField_a_of_type_Long + ", needSearchInCloud: " + jdField_b_of_type_Boolean);
      }
      if ((!jdField_b_of_type_Boolean) || (l1 != jdField_a_of_type_Long) || (TextUtils.isEmpty((CharSequence)localObject1)) || (!((String)localObject1).equals(jdField_b_of_type_JavaLangString))) {
        return true;
      }
      if ((l1 == jdField_a_of_type_Long) && (jdField_b_of_type_JavaLangString.equals(localObject1)))
      {
        jdField_b_of_type_AndroidViewView.setVisibility(8);
        jdField_c_of_type_AndroidWidgetLinearLayout.setVisibility(8);
        jdField_d_of_type_Boolean = true;
        u = 0;
        if (i == 1)
        {
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "LOAD_REFRESH query cloud failed --->>> switch local mode");
          }
          a(0, null);
          t = 0;
          jdField_a_of_type_Long = System.currentTimeMillis();
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a(jdField_a_of_type_Long, jdField_b_of_type_JavaLangString, 1);
        }
        for (;;)
        {
          jdField_c_of_type_Boolean = false;
          jdField_a_of_type_JavaUtilList.clear();
          break;
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "LOAD_MSG_IN_CLOUD query cloud failed --->>> merge local data");
          }
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a(jdField_a_of_type_JavaUtilList, 4, jdField_d_of_type_Boolean, 0);
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.notifyDataSetChanged();
        }
        localObject2 = (HashMap)obj;
        localObject1 = (String)((HashMap)localObject2).get("KEYWORD");
        l1 = ((Long)((HashMap)localObject2).get("SEARCHSEQUENCE")).longValue();
        int j = ((Integer)((HashMap)localObject2).get("LOADTYPE")).intValue();
        paramMessage = (List)((HashMap)localObject2).get("SEARCHRESULT");
        boolean bool = ((Boolean)((HashMap)localObject2).get("SEARCHCOMPLETE")).booleanValue();
        if (((HashMap)localObject2).get("SEARCHINFO") != null)
        {
          localObject2 = (List)((HashMap)localObject2).get("SEARCHINFO");
          jdField_a_of_type_JavaUtilHashMap.put(localObject1, ((List)localObject2).get(0));
        }
        if (QLog.isColorLevel()) {
          QLog.i(jdField_a_of_type_JavaLangString, 2, "handleMessage : RSP_SEARCH_MORE_MESSAGE_IN_CLOUD reqKeyWord: " + (String)localObject1 + ", mCurrentKeyword: " + jdField_b_of_type_JavaLangString + ", searchSequence: " + l1 + ", mCurrentSequence:" + jdField_a_of_type_Long + ", searchresult size: " + paramMessage.size() + ", total cache size: " + jdField_a_of_type_JavaUtilList.size() + ", IsComplete: " + bool + ", loadType: " + j + ", needSearchInCloud: " + jdField_b_of_type_Boolean + ", retryGetMore: " + u);
        }
        if ((!jdField_b_of_type_Boolean) || (jdField_a_of_type_Long != l1) || (TextUtils.isEmpty((CharSequence)localObject1)) || (!((String)localObject1).equals(jdField_b_of_type_JavaLangString))) {
          return true;
        }
        if ((jdField_a_of_type_Long == l1) && (jdField_b_of_type_JavaLangString.equals(localObject1)))
        {
          jdField_c_of_type_Boolean = false;
          jdField_b_of_type_AndroidViewView.setVisibility(8);
          jdField_c_of_type_AndroidWidgetLinearLayout.setVisibility(8);
          jdField_d_of_type_Boolean = bool;
          if (u == 0) {
            jdField_a_of_type_JavaUtilList.clear();
          }
          i = 0;
          while (i < paramMessage.size())
          {
            localObject1 = new MessageItem(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, (MessageRecord)paramMessage.get(i));
            jdField_a_of_type_JavaUtilList.add(localObject1);
            jdField_a_of_type_JavaUtilSet.add(Long.valueOf(a.shmsgseq));
            i += 1;
          }
          if ((jdField_a_of_type_JavaUtilList.size() < 15) && (!jdField_d_of_type_Boolean) && (u < 4))
          {
            u += 1;
            jdField_a_of_type_Long = System.currentTimeMillis();
            if (QLog.isColorLevel()) {
              QLog.i(jdField_a_of_type_JavaLangString, 2, "handleMessage, retry to accumulate more messages for one-screen-display,retryGetMore = " + u + ",loadType: " + j);
            }
            b(j);
            return true;
          }
          if (!jdField_d_of_type_Boolean) {
            if (u >= 4) {
              break label1543;
            }
          }
          label1543:
          for (bool = jdField_d_of_type_Boolean;; bool = true)
          {
            jdField_d_of_type_Boolean = bool;
            u = 0;
            if (j != 1) {
              break label1651;
            }
            a(0, null);
            if (jdField_a_of_type_JavaUtilList.size() != 0) {
              break label1549;
            }
            if (QLog.isColorLevel()) {
              QLog.d(jdField_a_of_type_JavaLangString, 2, "LOAD_REFRESH, no result at cloud, load local msg, mIsComplete: " + jdField_d_of_type_Boolean);
            }
            t = 0;
            jdField_a_of_type_Long = System.currentTimeMillis();
            jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a(jdField_a_of_type_Long, jdField_b_of_type_JavaLangString, 1);
            break;
          }
          label1549:
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, "LOAD_REFRESH, has result at cloud size: " + jdField_a_of_type_JavaUtilList.size() + ", start merge local msg, mIsComplete: " + jdField_d_of_type_Boolean);
          }
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a(jdField_b_of_type_JavaLangString, jdField_a_of_type_Long);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005FC2", "0X8005FC2", 0, 0, "", "", "", "");
          continue;
          label1651:
          if (QLog.isColorLevel()) {
            QLog.d(jdField_a_of_type_JavaLangString, 2, " LOAD_MORE&LOAD_MSG_IN_CLOUD, has rsult at cloud size: " + jdField_a_of_type_JavaUtilList.size() + ", mIsComplete: " + jdField_d_of_type_Boolean);
          }
          if (e) {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005FCC", "0X8005FCC", 0, (int)(System.currentTimeMillis() - jdField_a_of_type_Long), "", "", "", "");
          }
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a(jdField_a_of_type_JavaUtilList, 4, jdField_d_of_type_Boolean, 1);
          jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.notifyDataSetChanged();
          jdField_a_of_type_JavaUtilList.clear();
          continue;
          b();
          paramMessage = (HashMap)obj;
          localObject1 = (String)paramMessage.get("keyword");
          l1 = ((Long)paramMessage.get("sequence")).longValue();
          if (QLog.isColorLevel()) {
            QLog.i(jdField_a_of_type_JavaLangString, 2, "handleMessage : MSG_TYPE_QUERY_LOCAL_DONE lastRequestKeyWord = " + (String)localObject1 + ",currentKeyword = " + jdField_b_of_type_JavaLangString + ",searchSequence = " + l1 + ",mCurrentSequence = " + jdField_a_of_type_Long + ",mIsComplete: " + jdField_d_of_type_Boolean);
          }
          if ((!jdField_b_of_type_Boolean) || (jdField_a_of_type_Long != l1) || (TextUtils.isEmpty((CharSequence)localObject1)) || (!((String)localObject1).equals(jdField_b_of_type_JavaLangString))) {
            return true;
          }
          if ((l1 == jdField_a_of_type_Long) && (jdField_b_of_type_JavaLangString.equals(localObject1)))
          {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005FC6", "0X8005FC6", 0, (int)(System.currentTimeMillis() - jdField_a_of_type_Long), "", "", "", "");
            jdField_c_of_type_Boolean = false;
            jdField_b_of_type_AndroidViewView.setVisibility(8);
            jdField_c_of_type_AndroidWidgetLinearLayout.setVisibility(8);
            jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a(jdField_a_of_type_JavaUtilList, jdField_d_of_type_Boolean);
            if ((jdField_d_of_type_Boolean) && (jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.getCount() < 20))
            {
              jdField_c_of_type_AndroidWidgetTextView.setText("已展示全部搜索结果");
              jdField_c_of_type_AndroidWidgetLinearLayout.findViewById(2131302377).setVisibility(8);
              jdField_c_of_type_AndroidWidgetLinearLayout.setVisibility(0);
              jdField_b_of_type_AndroidViewView.setVisibility(0);
            }
            jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.notifyDataSetChanged();
            jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter);
            jdField_a_of_type_ComTencentWidgetXListView.setSelection(0);
            jdField_a_of_type_JavaUtilList.clear();
            continue;
            b();
            localObject1 = (HashMap)obj;
            paramMessage = (String)((HashMap)localObject1).get("keyword");
            l1 = ((Long)((HashMap)localObject1).get("sequence")).longValue();
            localObject1 = (List)((HashMap)localObject1).get("data");
            if (QLog.isColorLevel()) {
              QLog.i(jdField_a_of_type_JavaLangString, 2, "handleMessage: MERGE_LOCAL_MESSAGES_AND_CLOUD_MESSAGES reqKeyWord = " + paramMessage + ",currentKeyword = " + jdField_b_of_type_JavaLangString + ",searchSequence = " + l1 + ",mCurrentSequence = " + jdField_a_of_type_Long + ",mIsComplete: " + jdField_d_of_type_Boolean);
            }
            if ((TextUtils.isEmpty(paramMessage)) || (!jdField_b_of_type_Boolean) || (jdField_a_of_type_Long != l1) || (!jdField_b_of_type_JavaLangString.equals(paramMessage))) {
              return true;
            }
            if ((l1 == jdField_a_of_type_Long) && (jdField_b_of_type_JavaLangString.equals(paramMessage)))
            {
              jdField_c_of_type_Boolean = false;
              jdField_b_of_type_AndroidViewView.setVisibility(8);
              jdField_c_of_type_AndroidWidgetLinearLayout.setVisibility(8);
              jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.a((List)localObject1, jdField_d_of_type_Boolean);
              jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter.notifyDataSetChanged();
              jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityMessagesearchC2CMessageResultAdapter);
              jdField_a_of_type_ComTencentWidgetXListView.setSelection(0);
              jdField_a_of_type_JavaUtilList.clear();
            }
          }
        }
      }
    }
  }
  
  public void show()
  {
    super.show();
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(getClass(), jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(0);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.removeMessages(1);
    jdField_a_of_type_ComTencentUtilMqqWeakReferenceHandler.sendEmptyMessage(0);
  }
}
