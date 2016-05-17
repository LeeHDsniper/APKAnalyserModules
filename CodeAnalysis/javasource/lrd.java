import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.biz.addContactTroopView.GroupViewAdapter;
import com.tencent.biz.pubaccount.util.PublicAccountConfigUtil;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseFragment.ArticleItemViewHolder;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseFragment.ItemViewHolder;
import com.tencent.mobileqq.activity.contact.addcontact.SearchContactsFragment;
import com.tencent.mobileqq.adapter.FacePreloadBaseAdapter;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.search.activity.GroupSearchActivity;
import com.tencent.mobileqq.troop.data.NearbyTroops.CustomViewHolder;
import com.tencent.pb.addcontacts.AccountSearchPb.record;
import com.tencent.widget.AbsListView.LayoutParams;
import com.tencent.widget.ListView;
import java.util.ArrayList;
import java.util.Map;

public class lrd
  extends FacePreloadBaseAdapter
{
  private String jdField_a_of_type_JavaLangString;
  private ArrayList jdField_a_of_type_JavaUtilArrayList;
  private boolean jdField_a_of_type_Boolean;
  
  public lrd(SearchContactsFragment paramSearchContactsFragment, Context paramContext, QQAppInterface paramQQAppInterface, ListView paramListView, int paramInt, boolean paramBoolean)
  {
    super(paramContext, paramQQAppInterface, paramListView, paramInt, paramBoolean);
    paramBoolean = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = "";
    jdField_a_of_type_Boolean = false;
  }
  
  private int a(int paramInt)
  {
    if (paramInt >= 1)
    {
      if (getItemViewType(paramInt - 1) == 0) {
        return 1;
      }
      if ((paramInt >= 2) && (getItemViewType(paramInt - 2) == 0)) {
        return 2;
      }
    }
    return 3;
  }
  
  protected Object a(int paramInt)
  {
    return null;
  }
  
  public void a(ArrayList paramArrayList)
  {
    jdField_a_of_type_JavaUtilArrayList = paramArrayList;
    SearchContactsFragment.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment).clear();
    int i = 0;
    int k;
    for (int j = 0; i < jdField_a_of_type_JavaUtilArrayList.size(); j = k)
    {
      k = j;
      if (jdField_a_of_type_JavaUtilArrayList.get(i)).jdField_a_of_type_Int == 0)
      {
        paramArrayList = SearchContactsFragment.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment);
        int m = jdField_a_of_type_JavaUtilArrayList.get(i)).jdField_b_of_type_Int;
        k = j + 1;
        paramArrayList.put(Integer.valueOf(m), Integer.valueOf(k));
      }
      i += 1;
    }
  }
  
  public int getCount()
  {
    return jdField_a_of_type_JavaUtilArrayList.size();
  }
  
  public Object getItem(int paramInt)
  {
    return jdField_a_of_type_JavaUtilArrayList.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public int getItemViewType(int paramInt)
  {
    if (jdField_a_of_type_JavaUtilArrayList.get(paramInt)).jdField_a_of_type_Int == 2) {}
    switch (jdField_a_of_type_JavaUtilArrayList.get(paramInt)).jdField_b_of_type_Int)
    {
    case 80000002: 
    default: 
      return jdField_a_of_type_JavaUtilArrayList.get(paramInt)).jdField_a_of_type_Int;
    case 80000001: 
      return 3;
    }
    return 4;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    switch (getItemViewType(paramInt))
    {
    }
    for (;;)
    {
      return paramView;
      Object localObject1 = paramView;
      if (paramView == null) {
        localObject1 = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a().getLayoutInflater().inflate(2130903365, paramViewGroup, false);
      }
      paramView = (TextView)((View)localObject1).findViewById(2131297018);
      if (GroupSearchActivity.e == 12) {
        if (jdField_a_of_type_JavaUtilArrayList.get(paramInt)).jdField_a_of_type_JavaLangString.equals("公众号")) {
          paramView.setText(PublicAccountConfigUtil.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, BaseApplicationImpl.a().getApplicationContext()));
        }
      }
      for (;;)
      {
        jdField_a_of_type_JavaLangString = jdField_a_of_type_JavaUtilArrayList.get(paramInt)).jdField_a_of_type_JavaLangString;
        if (AppSetting.i)
        {
          ((View)localObject1).setFocusable(true);
          ((View)localObject1).setContentDescription(paramView.getText() + "搜索结果");
        }
        paramViewGroup = ((View)localObject1).findViewById(2131298257);
        if (paramInt <= 0) {
          break;
        }
        paramViewGroup.setVisibility(0);
        return localObject1;
        paramView.setText(jdField_a_of_type_JavaUtilArrayList.get(paramInt)).jdField_a_of_type_JavaLangString);
        continue;
        paramView.setText(jdField_a_of_type_JavaUtilArrayList.get(paramInt)).jdField_a_of_type_JavaLangString);
      }
      paramView = (View)localObject1;
      if (paramInt != 0) {
        continue;
      }
      paramViewGroup.setVisibility(8);
      return localObject1;
      Object localObject2 = (lrc)getItem(paramInt);
      localObject1 = paramView;
      if (paramView == null) {
        localObject1 = GroupViewAdapter.b(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a(), paramViewGroup, 5, false, 1);
      }
      paramView = getItemjdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record;
      GroupViewAdapter.a((View)localObject1, jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a(), jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record);
      paramViewGroup = (NearbyTroops.CustomViewHolder)((View)localObject1).getTag();
      f.setTextColor(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a().getResources().getColor(2131428176));
      f.setText(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a(80000001, String.valueOf(name.get())));
      SpannableStringBuilder localSpannableStringBuilder = new SpannableStringBuilder();
      localSpannableStringBuilder.append("(");
      localSpannableStringBuilder.append(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a(80000001, String.valueOf(code.get())));
      localSpannableStringBuilder.append(")");
      g.setVisibility(0);
      g.setText(localSpannableStringBuilder);
      b = Long.toString(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.code.get());
      jdField_c_of_type_Int = 4;
      d.setImageBitmap(a(4, b));
      jdField_a_of_type_Int = a(paramInt);
      ((View)localObject1).setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment);
      return localObject1;
      paramViewGroup = paramView;
      if (paramView == null)
      {
        paramViewGroup = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a().getLayoutInflater().inflate(2130904260, null);
        paramView = new SearchBaseFragment.ArticleItemViewHolder();
        jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramViewGroup.findViewById(2131296835));
        jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131296838));
        jdField_c_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131301988));
        d = ((TextView)paramViewGroup.findViewById(2131301987));
        jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131301986));
        paramViewGroup.setTag(paramView);
      }
      paramView = (SearchBaseFragment.ArticleItemViewHolder)paramViewGroup.getTag();
      paramViewGroup.setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment);
      localObject1 = (lrc)getItem(paramInt);
      jdField_c_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.article_create_time.get());
      d.setText(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.article_author.get());
      paramInt = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.getResources().getDimensionPixelSize(2131493554);
      if (!TextUtils.isEmpty(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.title_image.get())) {}
      try
      {
        localObject2 = URLDrawable.getDrawable(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.title_image.get(), paramInt, paramInt);
        jdField_a_of_type_AndroidWidgetImageView.setImageDrawable((Drawable)localObject2);
        jdField_a_of_type_JavaLangString = jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.article_short_url.get();
        if ((jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.article_author.has()) && (!"".equals(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.article_author.get()))) {
          d.setText(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.article_author.get());
        }
        jdField_a_of_type_Long = jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.account_id.get();
        jdField_a_of_type_Int = jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.number.get();
        paramViewGroup.setTag(paramView);
        if (jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.name.has()) {
          jdField_a_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a(80000003, jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.name.get()));
        }
        if ((jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.brief.has()) && (!"".equals(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.brief.get())))
        {
          if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a(jdField_a_of_type_AndroidWidgetTextView, jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a()) > 1) {
            jdField_b_of_type_AndroidWidgetTextView.setMaxLines(1);
          }
          for (;;)
          {
            jdField_b_of_type_AndroidWidgetTextView.setEllipsize(TextUtils.TruncateAt.END);
            jdField_b_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a(80000003, String.valueOf(jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record.brief.get())));
            paramViewGroup.setLayoutParams(new AbsListView.LayoutParams(new AbsListView.LayoutParams(-1, AIOUtils.a(110.0F, jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a().getResources()))));
            return paramViewGroup;
            jdField_b_of_type_AndroidWidgetTextView.setMaxLines(2);
          }
        }
        jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
        paramViewGroup.setLayoutParams(new AbsListView.LayoutParams(new AbsListView.LayoutParams(-1, AIOUtils.a(80.0F, jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a().getResources()))));
        return paramViewGroup;
        paramViewGroup = paramView;
        if (paramView == null) {
          paramViewGroup = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a().getLayoutInflater().inflate(2130903979, null);
        }
        paramViewGroup.setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment);
        paramView = new SearchBaseFragment.ItemViewHolder();
        jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramViewGroup.findViewById(2131296835));
        jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131296838));
        jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131300798));
        jdField_c_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131299726));
        d = ((TextView)paramViewGroup.findViewById(2131296842));
        jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record = getItemjdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record;
        jdField_b_of_type_Int = getItemjdField_b_of_type_Int;
        paramViewGroup.setTag(paramView);
        paramView = (SearchBaseFragment.ItemViewHolder)paramViewGroup.getTag();
        jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record = getItemjdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record;
        jdField_b_of_type_Int = getItemjdField_b_of_type_Int;
        jdField_c_of_type_Int = a(paramInt);
        localObject1 = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a(paramView, (lrc)jdField_a_of_type_JavaUtilArrayList.get(paramInt));
        paramView = paramViewGroup;
        if (!AppSetting.i) {
          continue;
        }
        paramViewGroup.setContentDescription((CharSequence)localObject1);
        return paramViewGroup;
        localObject1 = paramView;
        if (paramView == null) {
          localObject1 = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.a().getLayoutInflater().inflate(2130903980, paramViewGroup, false);
        }
        if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.jdField_a_of_type_Lrb == null) {
          jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.jdField_a_of_type_Lrb = new lrb(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment);
        }
        ((View)localObject1).setTag(jdField_a_of_type_JavaUtilArrayList.get(paramInt));
        ((View)localObject1).setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactSearchContactsFragment.jdField_a_of_type_Lrb);
        paramView = (View)localObject1;
        if (!AppSetting.i) {
          continue;
        }
        ((View)localObject1).setContentDescription("查看更多" + jdField_a_of_type_JavaLangString + "搜索结果按钮");
        return localObject1;
      }
      catch (Exception localException)
      {
        for (;;) {}
      }
    }
  }
  
  public int getViewTypeCount()
  {
    return 5;
  }
}
