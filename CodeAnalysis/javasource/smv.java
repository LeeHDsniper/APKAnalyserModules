import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQCustomDialogThreeBtns;

public class smv
  extends BaseAdapter
{
  public smv(QQCustomDialogThreeBtns paramQQCustomDialogThreeBtns)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public int getCount()
  {
    if (a.jdField_a_of_type_ArrayOfJavaLangString != null) {
      return a.jdField_a_of_type_ArrayOfJavaLangString.length;
    }
    return 0;
  }
  
  public Object getItem(int paramInt)
  {
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return 0L;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (a.jdField_a_of_type_AndroidViewLayoutInflater == null) {
      a.jdField_a_of_type_AndroidViewLayoutInflater = ((LayoutInflater)a.getContext().getSystemService("layout_inflater"));
    }
    paramViewGroup = paramView;
    if (paramView == null)
    {
      paramViewGroup = a.jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130903229, null);
      paramView = new snd(a, null);
      a = ((TextView)paramViewGroup.findViewById(2131297749));
      paramViewGroup.setTag(paramView);
    }
    paramView = (snd)paramViewGroup.getTag();
    int i;
    int j;
    int k;
    int m;
    if (a != null)
    {
      a.setText(a.jdField_a_of_type_ArrayOfJavaLangString[paramInt]);
      a.setOnClickListener(new snc(a, paramInt));
      i = a.getPaddingTop();
      j = a.getPaddingLeft();
      k = a.getPaddingRight();
      m = a.getPaddingBottom();
      if (a.jdField_a_of_type_ArrayOfJavaLangString.length != 1) {
        break label207;
      }
      a.setBackgroundResource(2130838290);
    }
    for (;;)
    {
      a.setPadding(j, i, k, m);
      return paramViewGroup;
      label207:
      if (paramInt == 0) {
        a.setBackgroundResource(2130838291);
      } else if (paramInt == a.jdField_a_of_type_ArrayOfJavaLangString.length - 1) {
        a.setBackgroundResource(2130838289);
      }
    }
  }
}
