import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.mobileqq.activity.contact.newfriend.RecommendListView;
import com.tencent.mobileqq.data.RecommendContactMsg;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.widget.MotionViewSetter;
import com.tencent.mobileqq.widget.ShaderAnimLayout;
import java.util.HashMap;
import java.util.List;

public class lsj
  extends BaseAdapter
{
  public int a;
  private LayoutInflater jdField_a_of_type_AndroidViewLayoutInflater;
  private MotionViewSetter jdField_a_of_type_ComTencentMobileqqWidgetMotionViewSetter;
  HashMap jdField_a_of_type_JavaUtilHashMap;
  HashMap b;
  
  private lsj(RecommendListView paramRecommendListView)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilHashMap = new HashMap();
    b = new HashMap();
    jdField_a_of_type_Int = -1;
    jdField_a_of_type_ComTencentMobileqqWidgetMotionViewSetter = null;
    jdField_a_of_type_AndroidViewLayoutInflater = ((LayoutInflater)jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.getContext().getSystemService("layout_inflater"));
  }
  
  public void a()
  {
    jdField_a_of_type_JavaUtilHashMap.clear();
  }
  
  public void a(String paramString, Drawable paramDrawable)
  {
    if (jdField_a_of_type_JavaUtilHashMap.containsKey(paramString))
    {
      ((ImageView)jdField_a_of_type_JavaUtilHashMap.get(paramString)).setImageDrawable(paramDrawable);
      return;
    }
    notifyDataSetChanged();
  }
  
  public boolean areAllItemsEnabled()
  {
    return true;
  }
  
  public int getCount()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_a_of_type_JavaUtilList == null) {
      return 0;
    }
    return jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_a_of_type_JavaUtilList.size();
  }
  
  public Object getItem(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt < getCount())) {
      return jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_a_of_type_JavaUtilList.get(paramInt);
    }
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    RecommendContactMsg localRecommendContactMsg;
    Object localObject;
    if (paramView == null)
    {
      paramView = jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130904732, paramViewGroup, false);
      paramViewGroup = new lsk();
      jdField_a_of_type_AndroidWidgetImageView = ((ImageView)paramView.findViewById(2131299443));
      jdField_a_of_type_AndroidWidgetTextView = ((TextView)paramView.findViewById(2131302847));
      b = ((TextView)paramView.findViewById(2131303831));
      d = ((TextView)paramView.findViewById(2131302147));
      c = ((TextView)paramView.findViewById(2131296837));
      jdField_a_of_type_ComTencentMobileqqWidgetShaderAnimLayout = ((ShaderAnimLayout)paramView.findViewById(2131296705));
      jdField_a_of_type_AndroidWidgetButton = ((Button)paramView.findViewById(2131296706));
      paramView.setTag(paramViewGroup);
      jdField_a_of_type_ComTencentMobileqqDataRecommendContactMsg = ((RecommendContactMsg)jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_a_of_type_JavaUtilList.get(paramInt));
      localRecommendContactMsg = jdField_a_of_type_ComTencentMobileqqDataRecommendContactMsg;
      if (RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView) == 0)
      {
        if (RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView) == null) {
          RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView, new lsi(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView));
        }
        paramView.setOnClickListener(RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView));
      }
      if ((source == null) || (source.length() <= 0)) {
        break label508;
      }
      RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView, paramViewGroup, uin, 0, 1);
      b.setText(source);
      jdField_a_of_type_AndroidWidgetTextView.setText(nickName);
      if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_a_of_type_JavaLangString == null) {
        jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_a_of_type_JavaLangString = uin;
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_a_of_type_Long == 0L) {
        jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_a_of_type_Long = timeStamp;
      }
      if (paramInt > jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_b_of_type_Int)
      {
        jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_b_of_type_Int = paramInt;
        jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_b_of_type_JavaLangString = uin;
        jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView.jdField_b_of_type_Long = timeStamp;
        localObject = jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView;
        jdField_a_of_type_Int += 1;
      }
      if (RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView) != 0) {
        break label703;
      }
      if (!isRead) {
        break label693;
      }
      paramView.setBackgroundResource(2130838180);
      label385:
      if (friendStatus != 2) {
        break label723;
      }
      d.setVisibility(4);
      c.setVisibility(0);
      c.setText(2131367013);
    }
    for (;;)
    {
      if (jdField_a_of_type_Int != paramInt) {
        break label801;
      }
      d.setVisibility(8);
      c.setVisibility(8);
      jdField_a_of_type_ComTencentMobileqqWidgetShaderAnimLayout.b();
      if (jdField_a_of_type_ComTencentMobileqqWidgetMotionViewSetter != null) {
        jdField_a_of_type_ComTencentMobileqqWidgetMotionViewSetter.setMotionView(paramView, paramInt);
      }
      jdField_a_of_type_AndroidWidgetButton.setOnClickListener(RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView));
      jdField_a_of_type_AndroidWidgetButton.setTag(Integer.valueOf(paramInt));
      return paramView;
      paramViewGroup = (lsk)paramView.getTag();
      break;
      label508:
      if (!jdField_a_of_type_JavaUtilHashMap.containsKey(mobileNo))
      {
        jdField_a_of_type_JavaUtilHashMap.put(mobileNo, jdField_a_of_type_AndroidWidgetImageView);
        b.put(Integer.valueOf(paramView.getId()), mobileNo);
      }
      for (;;)
      {
        localObject = nationCode + mobileCode;
        RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView, paramViewGroup, (String)localObject, 0, 11);
        b.setText("通讯录联系人");
        jdField_a_of_type_AndroidWidgetTextView.setText(contactName);
        break;
        if (b.containsKey(Integer.valueOf(paramView.getId())))
        {
          localObject = (String)b.get(Integer.valueOf(paramView.getId()));
          if ((localObject != null) && (!((String)localObject).equals(mobileNo))) {
            jdField_a_of_type_JavaUtilHashMap.remove(localObject);
          }
        }
      }
      label693:
      paramView.setBackgroundResource(2130838184);
      break label385;
      label703:
      if (RecommendListView.a(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView) != 1) {
        break label385;
      }
      paramView.setBackgroundResource(2130838180);
      break label385;
      label723:
      if (friendStatus == 1)
      {
        d.setVisibility(4);
        c.setVisibility(0);
        c.setText(2131367023);
      }
      else
      {
        d.setVisibility(0);
        d.setTag(localRecommendContactMsg);
        c.setVisibility(8);
        d.setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivityContactNewfriendRecommendListView);
      }
    }
    label801:
    jdField_a_of_type_ComTencentMobileqqWidgetShaderAnimLayout.c();
    jdField_a_of_type_AndroidWidgetButton.setOnClickListener(null);
    jdField_a_of_type_AndroidWidgetButton.setTag(null);
    return paramView;
  }
  
  public boolean isEnabled(int paramInt)
  {
    return true;
  }
}
