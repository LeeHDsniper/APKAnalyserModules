package com.tencent.mobileqq.activity.contact.addcontact;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.biz.pubaccount.PublicAccountBrowser;
import com.tencent.biz.pubaccount.util.PADetailReportUtil;
import com.tencent.biz.pubaccount.util.PublicAccountConfigUtil;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.ChatSettingForTroop;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.activity.TroopInfoActivity;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.soso.SosoInterface;
import com.tencent.mobileqq.app.soso.SosoInterface.OnLocationListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.search.util.SearchUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.troop.data.NearbyTroops.CustomViewHolder;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.pb.addcontacts.AccountSearchPb.record;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XListView;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import lqz;
import lra;
import lrb;
import lrc;
import lrd;

public class SearchContactsFragment
  extends SearchBaseFragment
{
  public static final int b = 0;
  private static final String e = "SearchContactsFragment";
  public static final int l = 1;
  public static final int m = 2;
  public static final int n = 3;
  public static final int o = 4;
  public static final int p = 5;
  private static final int q = 3;
  private static int r = -1;
  private double jdField_a_of_type_Double = 0.0D;
  public int a;
  private ViewFactory.GuideView jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactViewFactory$GuideView;
  protected SosoInterface.OnLocationListener a;
  ArrayList jdField_a_of_type_JavaUtilArrayList;
  public lrb a;
  private lrd jdField_a_of_type_Lrd;
  public boolean a;
  private double jdField_b_of_type_Double = 0.0D;
  private ArrayList jdField_b_of_type_JavaUtilArrayList;
  private Map jdField_b_of_type_JavaUtilMap = new ConcurrentHashMap();
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public SearchContactsFragment()
  {
    jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener = null;
    jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener = new lqz(this, 0, true, false, 60000L, false, false, "SearchContacts");
    SosoInterface.a(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener);
  }
  
  private int a(int paramInt)
  {
    switch (paramInt)
    {
    case 80000000: 
    default: 
      return 1;
    case 80000001: 
      return 2;
    }
    return 3;
  }
  
  public static SearchContactsFragment a(int paramInt)
  {
    r = paramInt;
    return new SearchContactsFragment();
  }
  
  @Deprecated
  public static SearchContactsFragment a(BaseActivity paramBaseActivity, int paramInt)
  {
    SearchContactsFragment localSearchContactsFragment = a(paramInt);
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity = paramBaseActivity;
    Bundle localBundle = new Bundle();
    localBundle.putInt("from_key", paramInt);
    localSearchContactsFragment.setArguments(localBundle);
    localSearchContactsFragment.j();
    localSearchContactsFragment.onCreateView(paramBaseActivity.getLayoutInflater(), null, null);
    return localSearchContactsFragment;
  }
  
  private SearchResult a(int paramInt)
  {
    if (jdField_b_of_type_JavaUtilArrayList == null) {
      return null;
    }
    Iterator localIterator = jdField_b_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext())
    {
      SearchResult localSearchResult = (SearchResult)localIterator.next();
      if (jdField_a_of_type_Int == paramInt) {
        return localSearchResult;
      }
    }
    return null;
  }
  
  private String a(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return "";
    case 80000000: 
      return "0X8004BEE";
    case 80000001: 
      return "0X8004BEF";
    }
    return "0X8004BF0";
  }
  
  private boolean a()
  {
    if (jdField_a_of_type_JavaUtilArrayList != null)
    {
      Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
      while (localIterator.hasNext())
      {
        lrc localLrc = (lrc)localIterator.next();
        if ((localLrc != null) && (jdField_b_of_type_Int == 80000002)) {
          return true;
        }
      }
    }
    return false;
  }
  
  private boolean b(ArrayList paramArrayList)
  {
    if ((paramArrayList != null) && (paramArrayList.size() == 1))
    {
      Object localObject = get0b;
      if ((localObject != null) && (((List)localObject).size() == 1))
      {
        localObject = (AccountSearchPb.record)((List)localObject).get(0);
        if (get0jdField_a_of_type_Int == 80000003) {
          return false;
        }
        a(get0jdField_a_of_type_Int, (AccountSearchPb.record)localObject);
        if (((SearchBaseActivity)jdField_a_of_type_ComTencentMobileqqAppBaseActivity).a() == 0) {
          a().finish();
        }
        return true;
      }
      if ((localObject != null) && (((List)localObject).size() == 2))
      {
        localObject = SearchBaseActivity.c.matcher(jdField_d_of_type_JavaLangString);
        if (QLog.isColorLevel()) {
          QLog.d("SearchContactsFragment", 2, "needJump lastKeywords = " + jdField_d_of_type_JavaLangString);
        }
        if (((Matcher)localObject).matches())
        {
          d();
          a(jdField_b_of_type_JavaUtilArrayList);
          a(get0jdField_a_of_type_Int, false);
          return true;
        }
      }
    }
    return false;
  }
  
  public String a(SearchBaseFragment.ItemViewHolder paramItemViewHolder, lrc paramLrc)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    int i = jdField_b_of_type_Int;
    jdField_a_of_type_JavaLangString = (jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.uin.get() + "");
    jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawables(null, null, null, null);
    Object localObject = new SpannableStringBuilder();
    switch (i)
    {
    default: 
      jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
      localStringBuilder.append(jdField_a_of_type_AndroidWidgetTextView.getText().toString());
      localStringBuilder.append(jdField_b_of_type_AndroidWidgetTextView.getText().toString());
      switch (i)
      {
      default: 
        i = 1;
      }
      break;
    }
    for (;;)
    {
      localObject = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(i, jdField_a_of_type_JavaLangString);
      paramLrc = (lrc)localObject;
      if (localObject == null)
      {
        localObject = ImageUtil.a();
        paramLrc = (lrc)localObject;
        if (!jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b())
        {
          jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(jdField_a_of_type_JavaLangString, i, true, (byte)1);
          paramLrc = (lrc)localObject;
        }
      }
      jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(paramLrc);
      return localStringBuilder.toString();
      jdField_a_of_type_AndroidWidgetTextView.setText(a(80000000, jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.name.get()));
      ((SpannableStringBuilder)localObject).append("(");
      ((SpannableStringBuilder)localObject).append(a(80000000, String.valueOf(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.uin.get())));
      ((SpannableStringBuilder)localObject).append(")");
      break;
      jdField_a_of_type_AndroidWidgetTextView.setText(a(80000002, String.valueOf(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.name.get())));
      break;
      jdField_a_of_type_AndroidWidgetTextView.setText(a(80000001, String.valueOf(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.name.get())));
      ((SpannableStringBuilder)localObject).append("(");
      ((SpannableStringBuilder)localObject).append(a(80000001, String.valueOf(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.code.get())));
      ((SpannableStringBuilder)localObject).append(")");
      break;
      localStringBuilder.append(a(paramItemViewHolder, jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record));
      i = 1;
      continue;
      i = 4;
      jdField_c_of_type_AndroidWidgetTextView.setVisibility(0);
      jdField_c_of_type_AndroidWidgetTextView.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
      jdField_c_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.number.get() + "人");
      jdField_c_of_type_AndroidWidgetTextView.setTextColor(a().getResources().getColor(2131428212));
      d.setText(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.brief.get());
      jdField_a_of_type_JavaLangString = String.valueOf(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.code.get());
      localStringBuilder.append(jdField_c_of_type_AndroidWidgetTextView.getText()).append(d.getText());
      continue;
      localStringBuilder.append(b(paramItemViewHolder, jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record));
      i = 1;
    }
  }
  
  ArrayList a(ArrayList paramArrayList)
  {
    int[] arrayOfInt = ViewFactory.a(b());
    ArrayList localArrayList = new ArrayList(paramArrayList.size());
    int j = arrayOfInt.length;
    int i = 0;
    while (i < j)
    {
      int k = arrayOfInt[i];
      Iterator localIterator = paramArrayList.iterator();
      while (localIterator.hasNext())
      {
        SearchResult localSearchResult = (SearchResult)localIterator.next();
        if (jdField_a_of_type_Int == k) {
          localArrayList.add(localSearchResult);
        }
      }
      i += 1;
    }
    return localArrayList;
  }
  
  protected void a()
  {
    if (jdField_a_of_type_JavaUtilArrayList == null) {
      f();
    }
    do
    {
      do
      {
        return;
        if (jdField_a_of_type_Lrd == null)
        {
          jdField_a_of_type_Lrd = new lrd(this, BaseApplicationImpl.getContext(), jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentWidgetXListView, 4, true);
          jdField_a_of_type_Lrd.a(jdField_a_of_type_JavaUtilArrayList);
          jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_Lrd);
          a = jdField_a_of_type_Lrd;
        }
        if (jdField_a_of_type_AndroidWidgetLinearLayout.getChildAt(0) != jdField_a_of_type_ComTencentWidgetXListView)
        {
          jdField_a_of_type_AndroidWidgetLinearLayout.removeAllViews();
          jdField_a_of_type_AndroidWidgetLinearLayout.addView(jdField_a_of_type_ComTencentWidgetXListView);
        }
        jdField_a_of_type_Lrd.a(jdField_a_of_type_JavaUtilArrayList);
        jdField_a_of_type_Lrd.notifyDataSetChanged();
        if (c)
        {
          c = false;
          jdField_a_of_type_ComTencentWidgetXListView.setSelection(0);
        }
      } while (!a());
      localObject1 = getActivity();
      if ((localObject1 != null) && ((localObject1 instanceof SearchContactsActivity)))
      {
        localObject1 = SearchBaseActivity.JumpSrcConstants.a(((SearchContactsActivity)localObject1).a());
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "0", "0X8005D1F", "0X8005D1F", 0, 1, 0, "", (String)localObject1, jdField_d_of_type_JavaLangString, "");
      }
    } while (jdField_a_of_type_JavaUtilArrayList == null);
    Object localObject1 = new StringBuilder();
    int i = 0;
    Object localObject2 = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (((Iterator)localObject2).hasNext())
    {
      lrc localLrc = (lrc)((Iterator)localObject2).next();
      if ((localLrc != null) && (jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record != null) && (jdField_b_of_type_Int == 80000002))
      {
        ((StringBuilder)localObject1).append(String.valueOf(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.uin.get())).append("#");
        i += 1;
      }
    }
    localObject2 = PADetailReportUtil.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), jdField_d_of_type_JavaLangString);
    PADetailReportUtil.a().a((String)localObject2, jdField_d_of_type_JavaLangString, 2, false, i, ((StringBuilder)localObject1).toString());
  }
  
  public void a(int paramInt, boolean paramBoolean)
  {
    Object localObject1 = new Intent();
    ((Intent)localObject1).putExtra("last_key_words", jdField_d_of_type_JavaLangString);
    switch (paramInt)
    {
    default: 
      paramInt = 1;
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004BF1", "0X8004BF1", paramInt, 0, "", "", "", "");
      return;
      ((Intent)localObject1).putExtra("from_key", 0);
      ((Intent)localObject1).setClass(a(), ClassificationSearchActivity.class);
      ClassificationSearchActivity.a(a(), (Intent)localObject1, a(paramInt));
      paramInt = 1;
      continue;
      long l1 = Double.valueOf(jdField_a_of_type_Double * 1000000.0D).longValue();
      long l2 = Double.valueOf(jdField_b_of_type_Double * 1000000.0D).longValue();
      Object localObject2 = "http://qqweb.qq.com/m/relativegroup/index.html?source=qun_rec&keyword=" + URLEncoder.encode(jdField_d_of_type_JavaLangString) + "&gpstype=1&sid=AWSAPtjyiVRg92WelXNMAqd0&_bid=165&lon=" + Long.valueOf(l2) + "&lat=" + Long.valueOf(l1);
      localObject1 = localObject2;
      if (paramBoolean) {
        localObject1 = (String)localObject2 + "&show_tab=hot";
      }
      if (QLog.isColorLevel()) {
        QLog.d("SearchContactsFragment", 2, "lastKeywords = " + jdField_d_of_type_JavaLangString + " jump url is : " + (String)localObject1);
      }
      localObject2 = new Intent(a(), QQBrowserActivity.class);
      ((Intent)localObject2).putExtra("url", (String)localObject1);
      ((Intent)localObject2).putExtra("uin", jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      ((Intent)localObject2).putExtra("portraitOnly", true);
      ((Intent)localObject2).putExtra("hide_more_button", true);
      ((Intent)localObject2).putExtra("hide_operation_bar", true);
      ((Intent)localObject2).putExtra("isShowAd", false);
      a().startActivity((Intent)localObject2);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_find", "", "result", "Clk_more", 0, 0, "", "", "", "");
      paramInt = 2;
      continue;
      ((Intent)localObject1).putExtra("from_key", 2);
      localObject2 = getActivity();
      if ((localObject2 != null) && ((localObject2 instanceof SearchContactsActivity))) {
        ((Intent)localObject1).putExtra("jump_src_key", ((SearchContactsActivity)localObject2).a());
      }
      ((Intent)localObject1).setClass(a(), ClassificationSearchActivity.class);
      ClassificationSearchActivity.a(a(), (Intent)localObject1, a(paramInt));
      if ((localObject2 != null) && ((localObject2 instanceof SearchBaseActivity)))
      {
        paramInt = ((SearchBaseActivity)localObject2).a();
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005D21", "0X8005D21", 0, 1, 0, "0", SearchBaseActivity.JumpSrcConstants.a(paramInt), jdField_d_of_type_JavaLangString, "");
        paramInt = 3;
        continue;
        ((Intent)localObject1).putExtra("from_key", 5);
        ((Intent)localObject1).setClass(a(), ClassificationSearchActivity.class);
        ClassificationSearchActivity.a(a(), (Intent)localObject1, a(paramInt));
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "0", "0X8005D96", "0X8005D96", 0, 0, "0", "", jdField_d_of_type_JavaLangString, "");
        paramInt = 1;
      }
      else
      {
        paramInt = 3;
      }
    }
  }
  
  public void a(String paramString, boolean paramBoolean)
  {
    jdField_b_of_type_Boolean = paramBoolean;
    if (QLog.isColorLevel()) {
      QLog.d("SearchContactsFragment", 2, "doSearch");
    }
    if (NetworkUtil.e(BaseApplicationImpl.getContext()))
    {
      h();
      jdField_d_of_type_JavaLangString = paramString;
      if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade == null)
      {
        if (QLog.isColorLevel()) {
          QLog.d("SearchContactsFragment", 2, "doSearch:should not be here | searchFacade = null");
        }
        i();
        return;
      }
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade.c();
      if (r == 12)
      {
        localContactSearchFacade = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade;
        if (jdField_a_of_type_Boolean) {}
        for (i = jdField_a_of_type_Int;; i = 80000005)
        {
          localContactSearchFacade.a(paramString, i, jdField_b_of_type_Double, jdField_a_of_type_Double, 1);
          c = true;
          if (!jdField_a_of_type_Boolean) {
            break;
          }
          paramString = a(jdField_a_of_type_Int);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", paramString, paramString, jdField_d_of_type_Int + 1, 0, "", "", "", "");
          return;
        }
      }
      ContactSearchFacade localContactSearchFacade = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade;
      if (jdField_a_of_type_Boolean) {}
      for (int i = jdField_a_of_type_Int;; i = 80000004)
      {
        localContactSearchFacade.a(paramString, i, jdField_b_of_type_Double, jdField_a_of_type_Double, 0);
        break;
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004BED", "0X8004BED", jdField_d_of_type_Int + 1, 0, "", "", "", "");
      return;
    }
    QQToast.a(BaseApplicationImpl.getContext(), 2131368714, 0).b(a());
  }
  
  protected boolean a(ArrayList paramArrayList)
  {
    if (!jdField_a_of_type_Boolean)
    {
      jdField_b_of_type_JavaUtilArrayList = paramArrayList;
      if (!b(jdField_b_of_type_JavaUtilArrayList))
      {
        jdField_a_of_type_JavaUtilArrayList = b(a(paramArrayList));
        d();
        a(jdField_b_of_type_JavaUtilArrayList);
        return true;
      }
      return false;
    }
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_JavaUtilArrayList = paramArrayList;
    d();
    a(jdField_b_of_type_JavaUtilArrayList);
    if (!b(jdField_b_of_type_JavaUtilArrayList)) {
      a(get0jdField_a_of_type_Int, false);
    }
    return false;
  }
  
  ArrayList b(ArrayList paramArrayList)
  {
    ArrayList localArrayList = new ArrayList(12);
    int k = paramArrayList.size();
    int i = 0;
    while (i < k)
    {
      SearchResult localSearchResult = (SearchResult)paramArrayList.get(i);
      if ((localSearchResult == null) || (b.size() <= 0))
      {
        i += 1;
      }
      else
      {
        Object localObject = new lrc();
        jdField_a_of_type_Int = 0;
        jdField_b_of_type_Int = jdField_a_of_type_Int;
        label114:
        int i1;
        int j;
        if (ViewFactory.a(jdField_a_of_type_Int) == 2131369396)
        {
          jdField_a_of_type_JavaLangString = PublicAccountConfigUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, BaseApplicationImpl.getContext());
          localArrayList.add(localObject);
          i1 = b.size();
          j = 0;
          label136:
          if (j < 3)
          {
            localObject = new lrc();
            jdField_a_of_type_Int = 2;
            jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record = ((AccountSearchPb.record)b.get(j));
            jdField_b_of_type_Int = jdField_a_of_type_Int;
            jdField_c_of_type_Int = jdField_c_of_type_Int;
            localArrayList.add(localObject);
            if (j < i1 - 1) {
              break label414;
            }
          }
          if (i1 > 3)
          {
            localObject = new lrc();
            jdField_a_of_type_Int = 1;
            jdField_b_of_type_Int = jdField_a_of_type_Int;
            jdField_c_of_type_Int = jdField_c_of_type_Int;
            localArrayList.add(localObject);
          }
          if (QLog.isColorLevel()) {
            QLog.d("SearchContactsFragment", 2, "search reuslt : type = " + jdField_a_of_type_Int + "count = " + b.size());
          }
          localObject = "";
          switch (jdField_a_of_type_Int)
          {
          }
        }
        for (;;)
        {
          ReportController.b(null, "CliOper", "", "", (String)localObject, (String)localObject, 0, 0, String.valueOf(Math.min(i1, 3)), "", "", "");
          break;
          jdField_a_of_type_JavaLangString = a().getString(ViewFactory.a(jdField_a_of_type_Int));
          break label114;
          label414:
          if (jdField_a_of_type_Int == 80000001) {
            ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_find", "", "result", "exp", 0, 0, "", "", "", "");
          }
          j += 1;
          break label136;
          localObject = "0X80061B8";
          continue;
          localObject = "0X80061BB";
          continue;
          localObject = "0X80061BE";
          continue;
          localObject = "0X80061C1";
        }
      }
    }
    return localArrayList;
  }
  
  void b()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactViewFactory$GuideView == null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactViewFactory$GuideView = ((ViewFactory.GuideView)ViewFactory.a().a(80000004, a(), true));
      if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactViewFactory$GuideView != null) {}
    }
    while (jdField_a_of_type_AndroidWidgetLinearLayout.getChildAt(0) == jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactViewFactory$GuideView)
    {
      return;
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactViewFactory$GuideView.setListener(new lra(this));
      a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactViewFactory$GuideView);
      return;
    }
    a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactViewFactory$GuideView);
  }
  
  void b(String paramString)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactViewFactory$GuideView != null) {
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactViewFactory$GuideView.a(b(), paramString);
    }
  }
  
  public void c(String paramString)
  {
    if (!TextUtils.isEmpty(paramString))
    {
      b();
      b(paramString);
      return;
    }
    jdField_a_of_type_AndroidWidgetLinearLayout.removeAllViews();
  }
  
  protected void f()
  {
    super.f();
    jdField_a_of_type_Boolean = false;
  }
  
  public void k()
  {
    super.k();
    d();
  }
  
  public void onClick(View paramView)
  {
    Object localObject1 = paramView.getTag();
    Object localObject3;
    if (localObject1 != null)
    {
      if (!(localObject1 instanceof SearchBaseFragment.ItemViewHolder)) {
        break label518;
      }
      localObject2 = (SearchBaseFragment.ItemViewHolder)localObject1;
      a(jdField_b_of_type_Int, jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record);
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004BF2", "0X8004BF2", a(jdField_b_of_type_Int), 0, "", "", "", "");
      localObject3 = (Integer)jdField_b_of_type_JavaUtilMap.get(Integer.valueOf(jdField_b_of_type_Int));
      localObject1 = null;
      paramView = (View)localObject1;
      if (localObject2 != null)
      {
        paramView = (View)localObject1;
        if (jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record != null)
        {
          paramView = (View)localObject1;
          if (jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.uin != null) {
            paramView = String.valueOf(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.uin.get());
          }
        }
      }
      int j = jdField_b_of_type_Int;
      if (localObject3 == null) {
        break label399;
      }
      i = ((Integer)localObject3).intValue();
      SearchUtils.a(j, i, jdField_c_of_type_Int, true, paramView, jdField_d_of_type_JavaLangString, r);
      if (jdField_b_of_type_Int == 80000002)
      {
        localObject1 = jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record;
        paramView = getActivity();
        if ((localObject1 != null) && (paramView != null) && ((paramView instanceof SearchBaseActivity)))
        {
          i = ((SearchBaseActivity)paramView).a();
          localObject3 = PADetailReportUtil.a();
          if (uin == null) {
            break label404;
          }
          paramView = uin.get() + "";
          label273:
          ((PADetailReportUtil)localObject3).a(2, paramView, jdField_c_of_type_Int, r);
          if (r != 12) {
            break label416;
          }
          localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
          localObject2 = jdField_c_of_type_Int + "";
          String str = SearchBaseActivity.JumpSrcConstants.a(i);
          if (uin == null) {
            break label410;
          }
          paramView = uin.get() + "";
          label368:
          ReportController.b((QQAppInterface)localObject3, "CliOper", "", "", "0X8006571", "0X8006571", 0, 1, 0, (String)localObject2, str, paramView, jdField_d_of_type_JavaLangString);
        }
      }
    }
    label399:
    label404:
    label410:
    label416:
    label518:
    do
    {
      do
      {
        return;
        i = 0;
        break;
        paramView = "";
        break label273;
        paramView = "";
        break label368;
        localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
        if (uin != null) {}
        for (paramView = uin.get() + "";; paramView = "")
        {
          ReportController.b((QQAppInterface)localObject3, "P_CliOper", "Pb_account_lifeservice", paramView, "0X8005D20", "0X8005D20", 0, 1, 0, jdField_c_of_type_Int + "", SearchBaseActivity.JumpSrcConstants.a(i), jdField_d_of_type_JavaLangString, "");
          return;
        }
        if ((localObject1 instanceof NearbyTroops.CustomViewHolder))
        {
          paramView = (NearbyTroops.CustomViewHolder)localObject1;
          localObject1 = TroopInfoActivity.a(b, 2);
          ((Bundle)localObject1).putInt("exposureSource", 3);
          ((Bundle)localObject1).putInt("t_s_f", 1000);
          ChatSettingForTroop.a(a(), (Bundle)localObject1, 2);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8004BF2", "0X8004BF2", a(80000001), 0, "", "", "", "");
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Grp_find", "", "result", "Clk_grpdate", 0, 0, b, "", "", "");
          localObject1 = (Integer)jdField_b_of_type_JavaUtilMap.get(Integer.valueOf(80000001));
          if (localObject1 != null) {}
          for (i = ((Integer)localObject1).intValue();; i = 0)
          {
            SearchUtils.a(80000001, i, jdField_a_of_type_Int, true, b, jdField_d_of_type_JavaLangString, r);
            return;
          }
        }
      } while (!(localObject1 instanceof SearchBaseFragment.ArticleItemViewHolder));
      paramView = getActivity();
    } while (paramView == null);
    localObject1 = (SearchBaseFragment.ArticleItemViewHolder)localObject1;
    Object localObject2 = new Intent(paramView, PublicAccountBrowser.class);
    ((Intent)localObject2).putExtra("url", jdField_a_of_type_JavaLangString);
    paramView.startActivity((Intent)localObject2);
    if (r == 12)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800658A", "0X800658A", 0, 0, "" + jdField_a_of_type_Int, "", jdField_d_of_type_JavaLangString, "" + jdField_a_of_type_Long);
      paramView = (Integer)jdField_b_of_type_JavaUtilMap.get(Integer.valueOf(80000003));
      if (paramView == null) {
        break label967;
      }
    }
    label967:
    for (int i = paramView.intValue();; i = 0)
    {
      SearchUtils.a(80000003, i, jdField_a_of_type_Int, true, null, jdField_d_of_type_JavaLangString, r);
      return;
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "0", "0X8005D95", "0X8005D95", 0, 0, "" + jdField_a_of_type_Int, "", jdField_d_of_type_JavaLangString, "" + jdField_a_of_type_Long);
      break;
    }
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    if (jdField_a_of_type_Lrd != null) {
      jdField_a_of_type_Lrd.b();
    }
    if (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener != null) {
      SosoInterface.b(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener);
    }
  }
}
