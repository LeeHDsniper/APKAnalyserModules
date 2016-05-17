import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.PanelAdapter;
import com.tencent.mobileqq.activity.aio.PanelAdapter.ViewHolder;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.XPanelContainer;

public class kqq
  extends LinearLayout
{
  public int a;
  private LayoutInflater jdField_a_of_type_AndroidViewLayoutInflater;
  
  public kqq(PanelAdapter paramPanelAdapter, Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidViewLayoutInflater = null;
    setOrientation(1);
    jdField_a_of_type_AndroidViewLayoutInflater = LayoutInflater.from(paramContext);
    int k = paramPanelAdapter.a();
    int m = paramPanelAdapter.b();
    int i = 0;
    while (i < m)
    {
      paramPanelAdapter = new LinearLayout(paramContext);
      paramAttributeSet = new LinearLayout.LayoutParams(-1, -1);
      leftMargin = AIOUtils.a(20.0F, getContext().getResources());
      rightMargin = AIOUtils.a(20.0F, getContext().getResources());
      weight = 1.0F;
      paramPanelAdapter.setOrientation(0);
      if (i == 0) {}
      for (topMargin = (XPanelContainer.e / (m + 1));; topMargin = (XPanelContainer.e / (m + 1) / 2))
      {
        int j = 0;
        while (j < k)
        {
          Object localObject = new LinearLayout.LayoutParams(-1, -1);
          weight = 1.0F;
          if (jdField_a_of_type_AndroidViewLayoutInflater == null) {
            jdField_a_of_type_AndroidViewLayoutInflater = LayoutInflater.from(paramContext);
          }
          View localView = LayoutInflater.from(paramContext).inflate(2130903178, null);
          paramPanelAdapter.addView(localView, (ViewGroup.LayoutParams)localObject);
          localObject = new PanelAdapter.ViewHolder();
          jdField_a_of_type_AndroidWidgetImageView = ((ImageView)localView.findViewById(2131297496));
          b = ((ImageView)localView.findViewById(2131297498));
          jdField_a_of_type_AndroidWidgetTextView = ((TextView)localView.findViewById(2131297497));
          localView.setTag(localObject);
          j += 1;
        }
      }
      addView(paramPanelAdapter, paramAttributeSet);
      i += 1;
    }
    setTag(Integer.valueOf(XPanelContainer.e));
  }
  
  public void a()
  {
    int i = 0;
    while (i < getChildCount())
    {
      Object localObject = getChildAt(i);
      if (localObject != null)
      {
        localObject = (PanelAdapter.ViewHolder)((View)localObject).getTag();
        if ((localObject != null) && (jdField_a_of_type_AndroidWidgetImageView != null)) {
          jdField_a_of_type_AndroidWidgetImageView.setBackgroundDrawable(null);
        }
      }
      i += 1;
    }
    jdField_a_of_type_Int = -1;
  }
}
