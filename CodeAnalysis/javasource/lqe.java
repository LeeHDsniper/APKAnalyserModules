import android.content.res.Resources;
import android.text.TextUtils.TruncateAt;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.common.config.AppSetting;
import com.tencent.image.URLDrawable;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.contact.addcontact.ClassificationSearchFragment;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseFragment.ArticleItemViewHolder;
import com.tencent.mobileqq.activity.contact.addcontact.SearchBaseFragment.ItemViewHolder;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.mobileqq.utils.NetworkUtil;
import com.tencent.pb.addcontacts.AccountSearchPb.record;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.AbsListView.LayoutParams;
import java.util.List;

public class lqe
  extends BaseAdapter
{
  private List jdField_a_of_type_JavaUtilList;
  
  private lqe(ClassificationSearchFragment paramClassificationSearchFragment)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public List a()
  {
    return jdField_a_of_type_JavaUtilList;
  }
  
  public void a(List paramList)
  {
    jdField_a_of_type_JavaUtilList = paramList;
  }
  
  public int getCount()
  {
    int j = jdField_a_of_type_JavaUtilList.size();
    if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.jdField_a_of_type_Int != 0) {}
    for (int i = 1;; i = 0) {
      return i + j;
    }
  }
  
  public Object getItem(int paramInt)
  {
    return jdField_a_of_type_JavaUtilList.get(paramInt);
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public int getItemViewType(int paramInt)
  {
    if (paramInt < jdField_a_of_type_JavaUtilList.size())
    {
      if (jdField_a_of_type_JavaUtilList.get(paramInt)).account_id.has()) {
        return 2;
      }
      return 0;
    }
    return 1;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    switch (getItemViewType(paramInt))
    {
    }
    Object localObject;
    do
    {
      do
      {
        do
        {
          return paramView;
          paramViewGroup = paramView;
          if (paramView == null)
          {
            paramViewGroup = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.a().getLayoutInflater().inflate(2130903979, null);
            paramViewGroup.setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment);
            paramView = new SearchBaseFragment.ItemViewHolder();
            jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramViewGroup.findViewById(2131296835));
            jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131296838));
            jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131300798));
            jdField_c_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131299726));
            d = ((TextView)paramViewGroup.findViewById(2131296842));
            jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record = ((AccountSearchPb.record)getItem(paramInt));
            jdField_b_of_type_Int = ClassificationSearchFragment.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment);
            paramViewGroup.setTag(2131297319, Integer.valueOf(paramInt));
            paramViewGroup.setTag(paramView);
          }
          paramView = (SearchBaseFragment.ItemViewHolder)paramViewGroup.getTag();
          jdField_a_of_type_ComTencentPbAddcontactsAccountSearchPb$record = ((AccountSearchPb.record)getItem(paramInt));
          jdField_c_of_type_Int = (paramInt + 1);
          localObject = ClassificationSearchFragment.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment, paramView, (AccountSearchPb.record)jdField_a_of_type_JavaUtilList.get(paramInt));
          paramView = paramViewGroup;
        } while (!AppSetting.i);
        paramViewGroup.setContentDescription((CharSequence)localObject);
        return paramViewGroup;
        localObject = (AccountSearchPb.record)jdField_a_of_type_JavaUtilList.get(paramInt);
        paramViewGroup = paramView;
        if (paramView == null)
        {
          paramViewGroup = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.a().getLayoutInflater().inflate(2130904260, null);
          paramView = new SearchBaseFragment.ArticleItemViewHolder();
          jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramViewGroup.findViewById(2131296835));
          jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131296838));
          jdField_c_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131301988));
          d = ((TextView)paramViewGroup.findViewById(2131301987));
          jdField_b_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131301986));
          jdField_a_of_type_Long = account_id.get();
          paramViewGroup.setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment);
          paramViewGroup.setTag(paramView);
        }
        paramView = (SearchBaseFragment.ArticleItemViewHolder)paramViewGroup.getTag();
        jdField_c_of_type_AndroidWidgetTextView.setText(article_create_time.get());
        if ((article_author.has()) && (!"".equals(article_author.get()))) {
          d.setText(article_author.get());
        }
        int i = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.getResources().getDimensionPixelSize(2131493554);
        URLDrawable localURLDrawable = URLDrawable.getDrawable(title_image.get(), i, i);
        jdField_a_of_type_AndroidWidgetImageView.setImageDrawable(localURLDrawable);
        jdField_a_of_type_JavaLangString = article_short_url.get();
        if (name.has()) {
          jdField_a_of_type_AndroidWidgetTextView.setText(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.a(80000003, name.get()));
        }
        if ((brief.has()) && (!"".equals(brief.get()))) {
          if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.a(jdField_a_of_type_AndroidWidgetTextView, jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.a()) > 1)
          {
            jdField_b_of_type_AndroidWidgetTextView.setMaxLines(1);
            jdField_b_of_type_AndroidWidgetTextView.setVisibility(0);
            jdField_b_of_type_AndroidWidgetTextView.setEllipsize(TextUtils.TruncateAt.END);
            localObject = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.a(80000003, brief.get());
            if (QLog.isColorLevel()) {
              QLog.d("ClassificationSearchFragment", 2, "brief = " + localObject);
            }
            jdField_b_of_type_AndroidWidgetTextView.setText((CharSequence)localObject);
            paramViewGroup.setLayoutParams(new AbsListView.LayoutParams(new AbsListView.LayoutParams(-1, AIOUtils.a(110.0F, jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.a().getResources()))));
          }
        }
        for (;;)
        {
          jdField_a_of_type_Int = (paramInt + 1);
          return paramViewGroup;
          jdField_b_of_type_AndroidWidgetTextView.setMaxLines(2);
          break;
          if (QLog.isColorLevel()) {
            QLog.d("ClassificationSearchFragment", 2, "brief = gone");
          }
          jdField_b_of_type_AndroidWidgetTextView.setVisibility(8);
          paramViewGroup.setLayoutParams(new AbsListView.LayoutParams(new AbsListView.LayoutParams(-1, AIOUtils.a(90.0F, jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.a().getResources()))));
        }
        paramViewGroup = paramView;
        if (paramView == null)
        {
          paramViewGroup = jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.a().getLayoutInflater().inflate(2130903402, null);
          paramViewGroup.setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment);
          paramView = new lqd();
          paramViewGroup.setTag(paramView);
          jdField_a_of_type_AndroidWidgetProgressBar = ((ProgressBar)paramViewGroup.findViewById(2131296916));
          paramViewGroup.findViewById(2131298399).setVisibility(8);
          jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramViewGroup.findViewById(2131298387));
        }
        jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.b();
        localObject = (lqd)paramViewGroup.getTag();
        if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.jdField_a_of_type_Int != 3) {
          break;
        }
        if (!jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.jdField_a_of_type_Boolean)
        {
          jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.jdField_a_of_type_Boolean = true;
          jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
          jdField_a_of_type_AndroidWidgetTextView.setText("获取失败，请稍后再试");
          return paramViewGroup;
        }
        paramView = paramViewGroup;
      } while (!NetworkUtil.e(BaseApplicationImpl.getContext()));
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.jdField_a_of_type_Boolean = false;
      jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
      jdField_a_of_type_AndroidWidgetTextView.setText("载入中，请稍候...");
      jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.a(jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.d, true);
      return paramViewGroup;
      if (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.jdField_a_of_type_Int == 2)
      {
        jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(0);
        jdField_a_of_type_AndroidWidgetTextView.setText("载入中，请稍候...");
        return paramViewGroup;
      }
      paramView = paramViewGroup;
    } while (jdField_a_of_type_ComTencentMobileqqActivityContactAddcontactClassificationSearchFragment.jdField_a_of_type_Int != 4);
    jdField_a_of_type_AndroidWidgetProgressBar.setVisibility(8);
    jdField_a_of_type_AndroidWidgetTextView.setText("获取失败，请检查网络连接");
    return paramViewGroup;
  }
  
  public int getViewTypeCount()
  {
    return 3;
  }
}
