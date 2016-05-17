import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;
import com.tencent.mobileqq.activity.phone.CountryActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.memoryleak.ActivityLeakSolution;
import com.tencent.widget.ListView;

public class lyv
  extends Dialog
  implements TextWatcher, View.OnClickListener, View.OnTouchListener
{
  private View jdField_a_of_type_AndroidViewView;
  EditText jdField_a_of_type_AndroidWidgetEditText;
  ImageButton jdField_a_of_type_AndroidWidgetImageButton;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private ListView jdField_a_of_type_ComTencentWidgetListView;
  private lyu jdField_a_of_type_Lyu;
  
  public lyv(CountryActivity paramCountryActivity, Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    requestWindowFeature(1);
    getWindow().setSoftInputMode(36);
    getWindow().setBackgroundDrawable(new ColorDrawable());
    setContentView(2130903211);
    paramContext = getWindow().getAttributes();
    x = 0;
    y = 0;
    width = -1;
    windowAnimations = 16973824;
    gravity = 51;
    jdField_a_of_type_AndroidWidgetEditText = ((EditText)findViewById(2131300511));
    jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(this);
    jdField_a_of_type_AndroidWidgetEditText.setSelection(0);
    jdField_a_of_type_AndroidWidgetEditText.requestFocus();
    jdField_a_of_type_AndroidWidgetImageButton = ((ImageButton)findViewById(2131300496));
    jdField_a_of_type_AndroidWidgetImageButton.setOnClickListener(this);
    paramContext = (Button)findViewById(2131300492);
    paramContext.setVisibility(0);
    paramContext.setOnClickListener(this);
    jdField_a_of_type_AndroidViewView = findViewById(2131296985);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297663));
    jdField_a_of_type_AndroidWidgetTextView.setCompoundDrawables(null, null, null, null);
    jdField_a_of_type_AndroidWidgetTextView.setText(2131367797);
    findViewById(2131297664).setVisibility(8);
    jdField_a_of_type_ComTencentWidgetListView = ((ListView)findViewById(2131297662));
    jdField_a_of_type_Lyu = new lyu(paramCountryActivity, null);
    jdField_a_of_type_ComTencentWidgetListView.setAdapter(jdField_a_of_type_Lyu);
    jdField_a_of_type_ComTencentWidgetListView.setOnTouchListener(this);
  }
  
  void a(String paramString)
  {
    if ((paramString.equals("")) || (paramString.trim().length() == 0))
    {
      jdField_a_of_type_AndroidViewView.setVisibility(8);
      return;
    }
    jdField_a_of_type_AndroidViewView.setVisibility(0);
    jdField_a_of_type_Lyu.a(paramString);
    if (jdField_a_of_type_Lyu.getCount() == 0) {
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    }
    for (;;)
    {
      jdField_a_of_type_Lyu.notifyDataSetChanged();
      return;
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    }
  }
  
  public void afterTextChanged(Editable paramEditable)
  {
    paramEditable = jdField_a_of_type_AndroidWidgetEditText.getText().toString().trim();
    a(paramEditable);
    if (paramEditable.equals(""))
    {
      jdField_a_of_type_AndroidWidgetImageButton.setVisibility(8);
      return;
    }
    jdField_a_of_type_AndroidWidgetImageButton.setVisibility(0);
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void dismiss()
  {
    try
    {
      super.dismiss();
      ActivityLeakSolution.a(this);
      return;
    }
    catch (Exception localException)
    {
      localException = localException;
      ActivityLeakSolution.a(this);
      return;
    }
    finally
    {
      localObject = finally;
      ActivityLeakSolution.a(this);
      throw localObject;
    }
  }
  
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default: 
      return;
    case 2131300492: 
      dismiss();
      return;
    }
    jdField_a_of_type_AndroidWidgetEditText.setText("");
  }
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    ((InputMethodManager)jdField_a_of_type_ComTencentMobileqqActivityPhoneCountryActivity.getSystemService("input_method")).hideSoftInputFromWindow(paramView.getWindowToken(), 0);
    return false;
  }
}
