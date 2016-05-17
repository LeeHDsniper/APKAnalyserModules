import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import com.tencent.mobileqq.activity.phone.CountryActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.ChnToSpell;
import java.util.ArrayList;
import java.util.Iterator;

public class lyu
  extends BaseAdapter
{
  private static final int jdField_a_of_type_Int = 0;
  private static final int b = 1;
  private static final int c = 2;
  private static final int d = 3;
  private String jdField_a_of_type_JavaLangString;
  private ArrayList jdField_a_of_type_JavaUtilArrayList;
  
  private lyu(CountryActivity paramCountryActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilArrayList = jdField_a_of_type_ComTencentMobileqqActivityPhoneCountryActivity.jdField_a_of_type_JavaUtilArrayList;
    jdField_a_of_type_JavaLangString = "";
  }
  
  private int a(lys paramLys)
  {
    if (a) {
      return 0;
    }
    if ((jdField_a_of_type_JavaLangString == null) || (jdField_a_of_type_JavaLangString.equals(""))) {
      return 0;
    }
    String str2 = c;
    String str3 = b;
    String str1 = d;
    paramLys = str1;
    if (str1 != null) {
      paramLys = str1.toLowerCase();
    }
    str1 = ChnToSpell.a(str3, 1);
    String str4 = ChnToSpell.a(str3, 2);
    if ((str2.equals(jdField_a_of_type_JavaLangString)) || (str3.equals(jdField_a_of_type_JavaLangString)) || (str1.equals(jdField_a_of_type_JavaLangString)) || (str4.equals(jdField_a_of_type_JavaLangString)) || ((paramLys != null) && (paramLys.equals(jdField_a_of_type_JavaLangString)))) {
      return 3;
    }
    if ((str2.indexOf(jdField_a_of_type_JavaLangString) == 0) || (str3.indexOf(jdField_a_of_type_JavaLangString) == 0) || (str1.indexOf(jdField_a_of_type_JavaLangString) == 0) || (str4.indexOf(jdField_a_of_type_JavaLangString) == 0) || ((paramLys != null) && (paramLys.indexOf(jdField_a_of_type_JavaLangString) == 0))) {
      return 2;
    }
    if ((str2.indexOf(jdField_a_of_type_JavaLangString) > 0) || (str3.indexOf(jdField_a_of_type_JavaLangString) > 0) || (str1.indexOf(jdField_a_of_type_JavaLangString) > 0) || (str4.indexOf(jdField_a_of_type_JavaLangString) > 0)) {
      return 1;
    }
    return 0;
  }
  
  public void a(String paramString)
  {
    int j = 0;
    Object localObject = paramString.toLowerCase();
    paramString = (String)localObject;
    if (((String)localObject).equals("hk")) {
      paramString = "xianggang";
    }
    localObject = paramString;
    if (paramString.equals("uk")) {
      localObject = "united kingdom";
    }
    int i;
    label81:
    lys localLys;
    int k;
    if (((String)localObject).startsWith(jdField_a_of_type_JavaLangString))
    {
      paramString = jdField_a_of_type_JavaUtilArrayList;
      jdField_a_of_type_JavaLangString = ((String)localObject);
      localObject = new ArrayList(8);
      paramString = paramString.iterator();
      i = 0;
      if (!paramString.hasNext()) {
        break label181;
      }
      localLys = (lys)paramString.next();
      k = a(localLys);
      if (k != 3) {
        break label141;
      }
      ((ArrayList)localObject).add(j, localLys);
      j += 1;
    }
    for (;;)
    {
      break label81;
      paramString = jdField_a_of_type_ComTencentMobileqqActivityPhoneCountryActivity.jdField_a_of_type_JavaUtilArrayList;
      break;
      label141:
      if (k == 2)
      {
        ((ArrayList)localObject).add(i + j, localLys);
        i += 1;
      }
      else if (k == 1)
      {
        ((ArrayList)localObject).add(localLys);
      }
    }
    label181:
    jdField_a_of_type_JavaUtilArrayList = ((ArrayList)localObject);
    notifyDataSetChanged();
  }
  
  public int getCount()
  {
    return jdField_a_of_type_JavaUtilArrayList.size();
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
    View localView = paramView;
    if (paramView == null)
    {
      localView = CountryActivity.a(paramViewGroup, jdField_a_of_type_ComTencentMobileqqActivityPhoneCountryActivity.getLayoutInflater(), true);
      localView.setOnClickListener(jdField_a_of_type_ComTencentMobileqqActivityPhoneCountryActivity);
    }
    CountryActivity.a(localView, (lys)jdField_a_of_type_JavaUtilArrayList.get(paramInt));
    return localView;
  }
}
