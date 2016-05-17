package com.tencent.mobileqq.activity.contact.addcontact;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.text.SpannableStringBuilder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.tencent.biz.pubaccount.util.PADetailReportUtil;
import com.tencent.biz.pubaccount.util.PublicAccountConfigUtil;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.QQBrowserActivity;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.search.activity.GroupSearchActivity;
import com.tencent.mobileqq.search.util.SearchUtils;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.FaceDecoder;
import com.tencent.mobileqq.utils.ImageUtil;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.pb.addcontacts.AccountSearchPb.record;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XListView;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import lqc;
import lqd;
import lqe;

public class ClassificationSearchFragment
  extends SearchBaseFragment
{
  private static SearchResult jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResult;
  private static final String e = "ClassificationSearchFragment";
  private static final int l = 0;
  private static final int m = 1;
  private static final int n = 2;
  private static final int o = 3;
  private static final int p = 4;
  private static final int r = 0;
  private static final int s = 1;
  private static final int t = 2;
  private static final int u = 3;
  public int a;
  private View jdField_a_of_type_AndroidViewView;
  private List jdField_a_of_type_JavaUtilList;
  private lqe jdField_a_of_type_Lqe;
  public boolean a;
  int b;
  private boolean d;
  private int q;
  
  public ClassificationSearchFragment()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = 0;
    jdField_b_of_type_Int = 0;
    jdField_a_of_type_JavaUtilList = new ArrayList(20);
  }
  
  public static ClassificationSearchFragment a(SearchResult paramSearchResult)
  {
    jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResult = paramSearchResult;
    return new ClassificationSearchFragment();
  }
  
  private void a(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
    if (jdField_a_of_type_Lqe != null) {
      jdField_a_of_type_Lqe.notifyDataSetChanged();
    }
  }
  
  private boolean b(ArrayList paramArrayList)
  {
    if ((!jdField_b_of_type_Boolean) && (paramArrayList != null) && (paramArrayList.size() == 1))
    {
      Object localObject = get0jdField_b_of_type_JavaUtilList;
      if ((localObject != null) && (((List)localObject).size() == 1))
      {
        localObject = (AccountSearchPb.record)((List)localObject).get(0);
        a(get0jdField_a_of_type_Int, (AccountSearchPb.record)localObject);
        return true;
      }
    }
    return false;
  }
  
  private String c(SearchBaseFragment.ItemViewHolder paramItemViewHolder, AccountSearchPb.record paramRecord)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    jdField_a_of_type_JavaLangString = (uin.get() + "");
    jdField_a_of_type_AndroidWidgetTextView.setText(a(jdField_b_of_type_Int, name.get()));
    localStringBuilder.append(jdField_a_of_type_AndroidWidgetTextView.getText());
    Object localObject;
    if (jdField_b_of_type_Int == 80000000)
    {
      localObject = new SpannableStringBuilder();
      ((SpannableStringBuilder)localObject).append("(");
      ((SpannableStringBuilder)localObject).append(a(80000000, String.valueOf(uin.get())));
      ((SpannableStringBuilder)localObject).append(")");
      jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
      localStringBuilder.append(jdField_b_of_type_AndroidWidgetTextView.getText());
    }
    switch (jdField_d_of_type_Int)
    {
    }
    for (;;)
    {
      localObject = jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(1, jdField_a_of_type_JavaLangString);
      paramRecord = (AccountSearchPb.record)localObject;
      if (localObject == null)
      {
        localObject = ImageUtil.a();
        paramRecord = (AccountSearchPb.record)localObject;
        if (!jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.b())
        {
          jdField_a_of_type_ComTencentMobileqqUtilFaceDecoder.a(jdField_a_of_type_JavaLangString, 1, true, (byte)1);
          paramRecord = (AccountSearchPb.record)localObject;
        }
      }
      jdField_a_of_type_AndroidWidgetImageView.setImageBitmap(paramRecord);
      return localStringBuilder.toString();
      localStringBuilder.append(a(paramItemViewHolder, paramRecord));
      continue;
      localStringBuilder.append(b(paramItemViewHolder, paramRecord));
    }
  }
  
  protected void a()
  {
    Object localObject1;
    if (QLog.isColorLevel())
    {
      localObject1 = new StringBuilder().append("isGetMore = ").append(jdField_b_of_type_Boolean).append(" mListData is null = ");
      if (jdField_a_of_type_JavaUtilList != null) {
        break label73;
      }
    }
    label73:
    for (boolean bool = true;; bool = false)
    {
      QLog.d("ClassificationSearchFragment", 2, bool);
      if ((jdField_b_of_type_Boolean) || (jdField_a_of_type_JavaUtilList != null)) {
        break;
      }
      f();
      return;
    }
    if (jdField_a_of_type_Lqe == null)
    {
      jdField_a_of_type_Lqe = new lqe(this, null);
      jdField_a_of_type_Lqe.a(jdField_a_of_type_JavaUtilList);
      localObject2 = jdField_a_of_type_AndroidViewView;
      StringBuilder localStringBuilder = new StringBuilder();
      if (jdField_d_of_type_Int == 0)
      {
        localObject1 = "好友";
        label134:
        ((View)localObject2).setContentDescription((String)localObject1 + "搜索结果");
        jdField_a_of_type_ComTencentWidgetXListView.a(jdField_a_of_type_AndroidViewView);
        jdField_a_of_type_ComTencentWidgetXListView.setAdapter(jdField_a_of_type_Lqe);
        a = jdField_a_of_type_Lqe;
      }
    }
    else
    {
      if (jdField_a_of_type_AndroidWidgetLinearLayout.getChildAt(0) != jdField_a_of_type_ComTencentWidgetXListView)
      {
        jdField_a_of_type_AndroidWidgetLinearLayout.removeAllViews();
        jdField_a_of_type_AndroidWidgetLinearLayout.addView(jdField_a_of_type_ComTencentWidgetXListView);
      }
      if (!jdField_b_of_type_Boolean) {
        break label357;
      }
      jdField_a_of_type_Lqe.a().addAll(jdField_a_of_type_JavaUtilList);
    }
    int i;
    for (;;)
    {
      jdField_a_of_type_Lqe.notifyDataSetChanged();
      if (c)
      {
        c = false;
        jdField_a_of_type_ComTencentWidgetXListView.setSelection(0);
      }
      if ((jdField_d_of_type_Int != 2) || (jdField_a_of_type_JavaUtilList == null)) {
        break;
      }
      localObject1 = new StringBuilder();
      localObject2 = jdField_a_of_type_JavaUtilList.iterator();
      i = 0;
      while (((Iterator)localObject2).hasNext())
      {
        ((StringBuilder)localObject1).append(String.valueOf(nextuin.get())).append("#");
        i += 1;
      }
      localObject1 = "公共号";
      break label134;
      label357:
      jdField_a_of_type_Lqe.a(jdField_a_of_type_JavaUtilList);
    }
    Object localObject2 = PADetailReportUtil.a().a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), jdField_d_of_type_JavaLangString);
    PADetailReportUtil.a().a((String)localObject2, jdField_d_of_type_JavaLangString, 3, true, i, ((StringBuilder)localObject1).toString());
  }
  
  protected void a(String paramString)
  {
    super.a(paramString);
    a(3);
  }
  
  public void a(String paramString, boolean paramBoolean)
  {
    jdField_b_of_type_Boolean = paramBoolean;
    if (jdField_b_of_type_Boolean) {
      if (GroupSearchActivity.e == 12) {
        jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade.a(jdField_d_of_type_JavaLangString, q, 0.0D, 0.0D, 1);
      }
    }
    for (;;)
    {
      if (jdField_d_of_type_Int == 2)
      {
        paramString = getActivity();
        if ((paramString != null) && ((paramString instanceof SearchBaseActivity)))
        {
          int i = ((SearchBaseActivity)paramString).a();
          int j = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade.a();
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005D21", "0X8005D21", 0, 1, 0, "" + (j + 1), SearchBaseActivity.JumpSrcConstants.a(i), jdField_d_of_type_JavaLangString, "");
        }
      }
      return;
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade.a(jdField_d_of_type_JavaLangString, q, 0.0D, 0.0D, 0);
      continue;
      if (NetworkUtil.e(BaseApplicationImpl.getContext()))
      {
        h();
        jdField_d_of_type_JavaLangString = paramString;
        jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade.c();
        if (GroupSearchActivity.e == 12) {
          jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade.a(jdField_d_of_type_JavaLangString, q, 0.0D, 0.0D, 1);
        }
        for (;;)
        {
          c = true;
          break;
          jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade.a(jdField_d_of_type_JavaLangString, q, 0.0D, 0.0D, 0);
        }
      }
      QQToast.a(BaseApplicationImpl.getContext(), 2131368714, 0).b(a());
      a(4);
    }
  }
  
  public void a(boolean paramBoolean)
  {
    jdField_d_of_type_Boolean = paramBoolean;
  }
  
  public boolean a()
  {
    return jdField_d_of_type_Boolean;
  }
  
  protected boolean a(ArrayList paramArrayList)
  {
    SearchResult localSearchResult = (SearchResult)paramArrayList.get(0);
    if (b(paramArrayList))
    {
      jdField_d_of_type_Boolean = true;
      return false;
    }
    if (jdField_a_of_type_AndroidOsHandler != null) {
      jdField_a_of_type_AndroidOsHandler.post(new lqc(this, localSearchResult));
    }
    if (QLog.isColorLevel()) {
      QLog.d("ClassificationSearchFragment", 2, "is no more page  = " + jdField_a_of_type_Boolean);
    }
    jdField_a_of_type_JavaUtilList = jdField_b_of_type_JavaUtilList;
    if (!jdField_b_of_type_Boolean) {
      d();
    }
    a(paramArrayList);
    return true;
  }
  
  public void b()
  {
    if (jdField_a_of_type_Int == 1)
    {
      a(2);
      a(jdField_d_of_type_JavaLangString, true);
    }
  }
  
  protected void c()
  {
    if (jdField_a_of_type_Int == 2) {
      a(0);
    }
  }
  
  public void onClick(View paramView)
  {
    Object localObject1 = paramView.getTag();
    Object localObject2;
    AccountSearchPb.record localRecord;
    Object localObject3;
    if (localObject1 != null)
    {
      if (!(localObject1 instanceof SearchBaseFragment.ItemViewHolder)) {
        break label480;
      }
      localObject2 = (SearchBaseFragment.ItemViewHolder)localObject1;
      a(jdField_b_of_type_Int, jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record);
      int i = c;
      int j = jdField_b_of_type_Int;
      int k = c;
      if (jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.uin == null) {
        break label362;
      }
      localObject1 = jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.uin.get() + "";
      SearchUtils.a(j, 0, k, false, (String)localObject1, jdField_d_of_type_JavaLangString, GroupSearchActivity.e);
      if (jdField_b_of_type_Int == 80000002)
      {
        localRecord = jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record;
        localObject1 = getActivity();
        if ((localRecord != null) && (localObject1 != null) && ((localObject1 instanceof ClassificationSearchActivity)))
        {
          localObject1 = SearchBaseActivity.JumpSrcConstants.a(((SearchBaseActivity)localObject1).a());
          paramView = paramView.getTag(2131297319);
          if ((paramView != null) && ((paramView instanceof Integer))) {
            c = (((Integer)paramView).intValue() + 1);
          }
          localObject3 = PADetailReportUtil.a();
          if (uin == null) {
            break label368;
          }
          paramView = uin.get() + "";
          label246:
          ((PADetailReportUtil)localObject3).a(3, paramView, i, GroupSearchActivity.e);
          if (GroupSearchActivity.e != 12) {
            break label380;
          }
          localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
          localObject2 = c + "";
          if (uin == null) {
            break label374;
          }
          paramView = uin.get() + "";
          label331:
          ReportController.b((QQAppInterface)localObject3, "CliOper", "", "", "0X800658B", "0X800658B", 0, 1, 0, (String)localObject2, (String)localObject1, paramView, jdField_d_of_type_JavaLangString);
        }
      }
    }
    label362:
    label368:
    label374:
    label380:
    label480:
    label543:
    do
    {
      do
      {
        return;
        localObject1 = null;
        break;
        paramView = "";
        break label246;
        paramView = "";
        break label331;
        localObject3 = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
        if (uin != null) {}
        for (paramView = uin.get() + "";; paramView = "")
        {
          ReportController.b((QQAppInterface)localObject3, "P_CliOper", "Pb_account_lifeservice", paramView, "0X8005D22", "0X8005D22", 0, 1, 0, c + "", (String)localObject1, jdField_d_of_type_JavaLangString, "");
          return;
        }
        if (!(localObject1 instanceof lqd)) {
          break label543;
        }
      } while ((jdField_a_of_type_Int != 3) && (jdField_a_of_type_Int != 4));
      if (NetworkUtil.e(BaseApplicationImpl.getContext()))
      {
        a(1);
        return;
      }
      QQToast.a(BaseApplicationImpl.getContext(), 2131368714, 0).b(a());
      a(4);
      return;
    } while (!(localObject1 instanceof SearchBaseFragment.ArticleItemViewHolder));
    paramView = (SearchBaseFragment.ArticleItemViewHolder)localObject1;
    localObject1 = new Intent(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, QQBrowserActivity.class);
    ((Intent)localObject1).putExtra("url", jdField_a_of_type_JavaLangString);
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity.startActivity((Intent)localObject1);
    if (GroupSearchActivity.e == 12)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800658C", "0X800658C", 0, 0, "" + jdField_a_of_type_Int, "", jdField_d_of_type_JavaLangString, "" + jdField_a_of_type_Long);
      return;
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "0", "0X8005D97", "0X8005D97", 0, 0, "" + jdField_a_of_type_Int, "", jdField_d_of_type_JavaLangString, "" + jdField_a_of_type_Long);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
    if (jdField_a_of_type_AndroidViewView == null)
    {
      jdField_a_of_type_AndroidViewView = a().getLayoutInflater().inflate(2130903365, jdField_a_of_type_ComTencentWidgetXListView, false);
      jdField_a_of_type_AndroidViewView.setClickable(false);
      jdField_a_of_type_AndroidViewView.setFocusable(true);
    }
    return paramLayoutInflater;
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    PADetailReportUtil.a().b();
  }
  
  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    int i;
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResult != null) {
      if (!jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResultjdField_a_of_type_Boolean)
      {
        i = 1;
        a(i);
        jdField_a_of_type_JavaUtilList.addAll(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResultjdField_b_of_type_JavaUtilList);
        jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactContactSearchFacade.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResultjdField_b_of_type_Int);
        if (ViewFactory.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResultjdField_a_of_type_Int) != 2131369396) {
          break label165;
        }
        ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131297018)).setText(PublicAccountConfigUtil.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, BaseApplicationImpl.getContext()));
        label98:
        if ((jdField_a_of_type_JavaUtilMap.size() == 0) && (jdField_a_of_type_JavaUtilList.size() > 0))
        {
          paramView = new ArrayList();
          paramView.add(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResult);
          a(paramView);
        }
        jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResult = null;
        a();
      }
    }
    for (;;)
    {
      q = b();
      return;
      i = 0;
      break;
      label165:
      ((TextView)jdField_a_of_type_AndroidViewView.findViewById(2131297018)).setText(ViewFactory.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchResultjdField_a_of_type_Int));
      break label98;
      if (QLog.isColorLevel()) {
        QLog.d("ClassificationSearchFragment", 2, "searchResult is null");
      }
      f();
    }
  }
}
