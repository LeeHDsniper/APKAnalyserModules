package com.adobe.creativesdk.foundation.internal.utils;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.text.Editable;
import android.text.SpannableString;
import android.text.TextWatcher;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.ViewGroup;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.auth.R.color;
import com.adobe.creativesdk.foundation.auth.R.drawable;
import com.adobe.creativesdk.foundation.auth.R.id;
import com.adobe.creativesdk.foundation.auth.R.layout;

public class AdobeDialogFragment
  extends DialogFragment
{
  private boolean _dialogStopped = false;
  public EditText _editText;
  private LinearLayout _errorController;
  private TextView _errorView;
  private TextView _negativeButton;
  private TextView _positiveButton;
  private boolean _positiveButtonEnabled = false;
  private String dialogTitle;
  private String editTextHint;
  private boolean isSingleLine = false;
  private String negativeButtonTitle;
  private String positiveButtonTitle;
  
  public AdobeDialogFragment() {}
  
  private void handleEditTextBackground()
  {
    if ((getEnteredText() != null) && (getEnteredText().trim().length() > 0)) {
      if (_editText != null) {
        _editText.setBackgroundResource(R.drawable.edittext_background_with_text);
      }
    }
    while (_editText == null) {
      return;
    }
    _editText.setBackgroundResource(R.drawable.edittext_background);
  }
  
  public void disableNegativeButton()
  {
    if (_negativeButton != null) {
      _negativeButton.setEnabled(false);
    }
  }
  
  public void disablePositiveButton()
  {
    _positiveButtonEnabled = false;
    if (_positiveButton != null) {
      _positiveButton.setEnabled(false);
    }
  }
  
  public void dismissKeyBoard()
  {
    if (getActivity() == null) {}
    InputMethodManager localInputMethodManager;
    do
    {
      return;
      localInputMethodManager = (InputMethodManager)getActivity().getSystemService("input_method");
    } while ((localInputMethodManager == null) || (_editText == null));
    localInputMethodManager.hideSoftInputFromWindow(_editText.getWindowToken(), 0);
  }
  
  public void enableNegativeButton()
  {
    if (_negativeButton != null) {
      _negativeButton.setEnabled(true);
    }
  }
  
  public void enablePositiveButton()
  {
    _positiveButtonEnabled = true;
    if (_positiveButton != null) {
      _positiveButton.setEnabled(true);
    }
  }
  
  public String getEnteredText()
  {
    if (_editText != null) {
      return _editText.getText().toString();
    }
    return null;
  }
  
  public void handleNegativeClick() {}
  
  public void handlePositiveClick() {}
  
  public void handleTextChanged() {}
  
  public void hideErrorDialog()
  {
    _errorController.setVisibility(8);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.adobe_common_dialog_fragment, paramViewGroup);
    _positiveButton = ((TextView)paramLayoutInflater.findViewById(R.id.adobe_generic_dialog_fragment_postive_button));
    _positiveButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        handlePositiveClick();
      }
    });
    _negativeButton = ((TextView)paramLayoutInflater.findViewById(R.id.adobe_generic_dialog_fragment_negative_button));
    _negativeButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        handleNegativeClick();
      }
    });
    _editText = ((EditText)paramLayoutInflater.findViewById(R.id.adobe_generic_dialog_fragment_edit_text));
    _errorController = ((LinearLayout)paramLayoutInflater.findViewById(R.id.adobe_generic_dialog_fragment_error_container));
    _errorView = ((TextView)paramLayoutInflater.findViewById(R.id.adobe_generic_dialog_fragment_error_text));
    _editText.addTextChangedListener(new EditTextWatcher());
    disablePositiveButton();
    _editText.setOnFocusChangeListener(new View.OnFocusChangeListener()
    {
      public void onFocusChange(View paramAnonymousView, boolean paramAnonymousBoolean)
      {
        if (paramAnonymousBoolean) {
          _editText.post(new Runnable()
          {
            public void run()
            {
              Context localContext = getActivity().getApplicationContext();
              getActivity();
              ((InputMethodManager)localContext.getSystemService("input_method")).showSoftInput(_editText, 1);
            }
          });
        }
      }
    });
    _positiveButton.setText(positiveButtonTitle);
    _negativeButton.setText(negativeButtonTitle);
    _editText.setHint(editTextHint);
    _editText.setSingleLine(isSingleLine);
    return paramLayoutInflater;
  }
  
  public void onStart()
  {
    super.onStart();
    Object localObject = new SpannableString(dialogTitle);
    ((SpannableString)localObject).setSpan(new AdobeCSDKTypefaceSpan(null, AdobeCSDKTypeFace.getTypeface(getActivity())), 0, ((SpannableString)localObject).length(), 18);
    ((SpannableString)localObject).setSpan(new ForegroundColorSpan(getResources().getColor(R.color.asset_browser_dark_text)), 0, ((SpannableString)localObject).length(), 18);
    ((SpannableString)localObject).setSpan(new StyleSpan(1), 0, ((SpannableString)localObject).length(), 18);
    getDialog().setTitle((CharSequence)localObject);
    Dialog localDialog = getDialog();
    View localView = localDialog.findViewById(localDialog.getContext().getResources().getIdentifier("android:id/titleDivider", null, null));
    localObject = localView;
    if (localView == null) {
      localObject = localDialog.findViewById(getResources().getIdentifier("titleDivider", "id", "android"));
    }
    getDialog().getWindow().setBackgroundDrawableResource(R.color.creative_sdk_actionbar_background_color);
    if (localObject != null) {
      ((View)localObject).setBackgroundColor(getResources().getColor(R.color.creative_sdk_actionbar_background_color));
    }
  }
  
  public void setDialogTitle(String paramString)
  {
    dialogTitle = paramString;
  }
  
  public void setEditTextHint(String paramString)
  {
    editTextHint = paramString;
  }
  
  public void setEditTextSingleLine()
  {
    isSingleLine = true;
  }
  
  public void setNegativeButtonTitle(String paramString)
  {
    negativeButtonTitle = paramString;
  }
  
  public void setPositiveButtonTitle(String paramString)
  {
    positiveButtonTitle = paramString;
  }
  
  public void showErrorDialog(String paramString)
  {
    disablePositiveButton();
    _errorView.setText(paramString);
    _errorController.setVisibility(0);
  }
  
  class EditTextWatcher
    implements TextWatcher
  {
    EditTextWatcher() {}
    
    public void afterTextChanged(Editable paramEditable) {}
    
    public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
    
    public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
    {
      AdobeDialogFragment.this.handleEditTextBackground();
      handleTextChanged();
    }
  }
}
