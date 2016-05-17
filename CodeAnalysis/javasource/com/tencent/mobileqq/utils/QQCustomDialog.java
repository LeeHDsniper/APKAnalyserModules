package com.tencent.mobileqq.utils;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import android.text.method.LinkMovementMethod;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewTreeObserver;
import android.view.accessibility.AccessibilityEvent;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.memoryleak.ActivityLeakSolution;
import com.tencent.mobileqq.text.QQText;
import java.util.List;
import smj;
import smk;
import sml;
import smm;
import smn;
import smo;
import smp;
import smq;

public class QQCustomDialog
  extends Dialog
{
  public static final int WHICH_NEGATIVE = 0;
  public static final int WHICH_POSITIVE = 1;
  private BaseAdapter adapter;
  protected LinearLayout bodyLayout;
  CheckBox checkBox;
  TextView checkTxt;
  protected TextView countText;
  TextView dummyFirstPreviewImage;
  TextView editPicTag;
  View framePreview;
  ImageView framePreviewImage;
  public LayoutInflater inflater;
  public String[] items;
  protected TextView lBtn;
  ListView list;
  public DialogInterface.OnClickListener onArrayItemClick;
  TextView previewImage;
  ProgressBar progressBar;
  protected TextView rBtn;
  Object tag;
  public TextView text;
  protected TextView title;
  
  public QQCustomDialog(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    adapter = new smj(this);
  }
  
  public QQCustomDialog(Context paramContext, int paramInt)
  {
    super(paramContext, paramInt);
    adapter = new smj(this);
  }
  
  public QQCustomDialog(Context paramContext, boolean paramBoolean, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    super(paramContext, paramBoolean, paramOnCancelListener);
    adapter = new smj(this);
  }
  
  public QQCustomDialog addView(View paramView)
  {
    text.setVisibility(8);
    LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-1, -2);
    countText.setVisibility(8);
    bodyLayout.addView(paramView, localLayoutParams);
    return this;
  }
  
  public QQCustomDialog addView(View paramView, LinearLayout.LayoutParams paramLayoutParams)
  {
    text.setVisibility(8);
    countText.setVisibility(8);
    bodyLayout.addView(paramView, paramLayoutParams);
    return this;
  }
  
  public void adjustTitle()
  {
    title.setGravity(3);
  }
  
  public int customWhichToCallBack(int paramInt)
  {
    return paramInt;
  }
  
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
  
  public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    if (paramAccessibilityEvent.getEventType() == 32) {
      paramAccessibilityEvent.getText().add(getContext().getString(2131362078));
    }
    return super.dispatchPopulateAccessibilityEvent(paramAccessibilityEvent);
  }
  
  public TextView getBtnLeft()
  {
    return lBtn;
  }
  
  public TextView getBtnight()
  {
    return rBtn;
  }
  
  public boolean getCheckBoxState()
  {
    if ((checkBox != null) && (checkBox.getVisibility() == 0)) {
      return checkBox.isChecked();
    }
    return false;
  }
  
  public int getDialogListItemLayout()
  {
    return 2130903229;
  }
  
  public EditText getEditText()
  {
    return null;
  }
  
  public String getInputValue()
  {
    return null;
  }
  
  public TextView getMessageTextView()
  {
    return text;
  }
  
  public TextView getMessageTextView_Plain_Text()
  {
    return (TextView)findViewById(2131297751);
  }
  
  public Object getTag()
  {
    return tag;
  }
  
  public TextView getTitleTextView()
  {
    return title;
  }
  
  public QQCustomDialog setCheckBox(String paramString, DialogInterface.OnClickListener paramOnClickListener)
  {
    findViewById(2131297754).setVisibility(0);
    checkTxt.setText(paramString);
    checkBox.setOnCheckedChangeListener(new sml(this, paramOnClickListener));
    setSeperatorState();
    return this;
  }
  
  public void setContentView(int paramInt)
  {
    super.setContentView(paramInt);
    title = ((TextView)findViewById(2131297736));
    text = ((TextView)findViewById(2131296741));
    countText = ((TextView)findViewById(2131297747));
    dummyFirstPreviewImage = ((TextView)findViewById(2131297743));
    previewImage = ((TextView)findViewById(2131297744));
    framePreviewImage = ((ImageView)findViewById(2131297746));
    framePreview = findViewById(2131297745);
    lBtn = ((TextView)findViewById(2131297739));
    rBtn = ((TextView)findViewById(2131297740));
    editPicTag = ((TextView)findViewById(2131297753));
    progressBar = ((ProgressBar)findViewById(2131297752));
    lBtn.setVisibility(8);
    rBtn.setVisibility(8);
    bodyLayout = ((LinearLayout)findViewById(2131297573));
    checkBox = ((CheckBox)findViewById(2131297755));
    checkTxt = ((TextView)findViewById(2131297756));
    list = ((ListView)findViewById(2131297741));
    if ((list != null) && (Build.VERSION.SDK_INT >= 9)) {
      list.setOverScrollMode(2);
    }
  }
  
  public QQCustomDialog setFirstDummyPreviewImage(Drawable paramDrawable)
  {
    dummyFirstPreviewImage.setPadding(0, 0, 0, 0);
    dummyFirstPreviewImage.setCompoundDrawablePadding(0);
    dummyFirstPreviewImage.setCompoundDrawables(null, null, null, paramDrawable);
    if (paramDrawable != null)
    {
      dummyFirstPreviewImage.setVisibility(0);
      return this;
    }
    dummyFirstPreviewImage.setVisibility(8);
    return this;
  }
  
  public QQCustomDialog setImageOnClickListener(View.OnClickListener paramOnClickListener)
  {
    if ((paramOnClickListener != null) && (framePreviewImage != null))
    {
      framePreviewImage.setOnClickListener(paramOnClickListener);
      editPicTag.setVisibility(0);
      countText.setVisibility(8);
    }
    return this;
  }
  
  public QQCustomDialog setItems(int paramInt, DialogInterface.OnClickListener paramOnClickListener)
  {
    Object localObject = null;
    try
    {
      String[] arrayOfString = getContext().getResources().getStringArray(paramInt);
      localObject = arrayOfString;
    }
    catch (Resources.NotFoundException localNotFoundException)
    {
      for (;;)
      {
        localNotFoundException.printStackTrace();
      }
    }
    return setItems(localObject, paramOnClickListener);
  }
  
  public QQCustomDialog setItems(String[] paramArrayOfString, DialogInterface.OnClickListener paramOnClickListener)
  {
    items = paramArrayOfString;
    text.setVisibility(8);
    countText.setVisibility(8);
    lBtn.setVisibility(8);
    rBtn.setVisibility(8);
    bodyLayout.setVisibility(8);
    onArrayItemClick = paramOnClickListener;
    list.setVisibility(0);
    list.setAdapter(adapter);
    list.setDivider(null);
    list.setDividerHeight(0);
    return this;
  }
  
  public QQCustomDialog setMessage(int paramInt)
  {
    text.setText(paramInt);
    text.setContentDescription(getContext().getString(paramInt));
    text.setVisibility(0);
    return this;
  }
  
  public QQCustomDialog setMessage(CharSequence paramCharSequence)
  {
    if (!TextUtils.isEmpty(paramCharSequence))
    {
      text.setText(paramCharSequence);
      text.setContentDescription(paramCharSequence);
      text.setVisibility(0);
      return this;
    }
    text.setVisibility(8);
    return this;
  }
  
  public QQCustomDialog setMessageCount(String paramString)
  {
    if (paramString != null)
    {
      countText.setText(paramString);
      countText.setContentDescription(paramString);
      countText.setVisibility(0);
      return this;
    }
    countText.setVisibility(8);
    return this;
  }
  
  public QQCustomDialog setMessageMaxLine(int paramInt)
  {
    if (text != null)
    {
      text.setMaxLines(paramInt);
      text.setEllipsize(TextUtils.TruncateAt.END);
    }
    return this;
  }
  
  public QQCustomDialog setMessageWithEmo(String paramString, float paramFloat)
  {
    if (!TextUtils.isEmpty(paramString))
    {
      text.setText(new QQText(paramString, 3));
      text.setContentDescription(paramString);
      text.setVisibility(0);
      return this;
    }
    text.setVisibility(8);
    return this;
  }
  
  public QQCustomDialog setMessageWithUrl(String paramString)
  {
    if (!TextUtils.isEmpty(paramString))
    {
      text.setAutoLinkMask(1);
      text.setMovementMethod(LinkMovementMethod.getInstance());
      text.setText(paramString);
      text.setContentDescription(paramString);
      text.setLinkTextColor(getContext().getResources().getColor(2131427479));
      text.setVisibility(0);
      return this;
    }
    text.setVisibility(8);
    return this;
  }
  
  public QQCustomDialog setMsgMaxLineWithEnd(String paramString, int paramInt)
  {
    if (text != null)
    {
      text.setMaxLines(paramInt);
      text.getViewTreeObserver().addOnGlobalLayoutListener(new smk(this, paramInt, paramString));
    }
    return this;
  }
  
  public QQCustomDialog setNegativeButton(int paramInt, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramOnClickListener == null)
    {
      lBtn.setVisibility(8);
      return this;
    }
    lBtn.setText(paramInt);
    lBtn.setContentDescription(getContext().getString(paramInt) + getContext().getString(2131362075));
    lBtn.setVisibility(0);
    lBtn.setOnClickListener(new smp(this, paramOnClickListener));
    setSeperatorState();
    return this;
  }
  
  public QQCustomDialog setNegativeButton(String paramString, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramOnClickListener == null)
    {
      lBtn.setVisibility(8);
      return this;
    }
    lBtn.setText(paramString);
    lBtn.setContentDescription(paramString + getContext().getString(2131362075));
    lBtn.setVisibility(0);
    lBtn.setOnClickListener(new smm(this, paramOnClickListener));
    setSeperatorState();
    return this;
  }
  
  public void setNegativeButtonContentDescription(String paramString)
  {
    lBtn.setContentDescription(paramString);
  }
  
  public QQCustomDialog setPositiveButton(int paramInt, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramOnClickListener == null)
    {
      rBtn.setVisibility(8);
      return this;
    }
    rBtn.setText(paramInt);
    rBtn.setContentDescription(getContext().getString(paramInt));
    rBtn.setVisibility(0);
    rBtn.setOnClickListener(new smq(this, paramOnClickListener));
    setSeperatorState();
    return this;
  }
  
  public QQCustomDialog setPositiveButton(int paramInt, DialogInterface.OnClickListener paramOnClickListener, boolean paramBoolean)
  {
    if (paramOnClickListener == null)
    {
      rBtn.setVisibility(8);
      return this;
    }
    rBtn.setText(paramInt);
    rBtn.setContentDescription(getContext().getString(paramInt) + getContext().getString(2131362075));
    rBtn.setVisibility(0);
    rBtn.setOnClickListener(new smo(this, paramOnClickListener, paramBoolean));
    setSeperatorState();
    return this;
  }
  
  public QQCustomDialog setPositiveButton(String paramString, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramOnClickListener == null)
    {
      rBtn.setVisibility(8);
      return this;
    }
    rBtn.setText(paramString);
    rBtn.setContentDescription(paramString + getContext().getString(2131362075));
    rBtn.setVisibility(0);
    rBtn.setOnClickListener(new smn(this, paramOnClickListener));
    setSeperatorState();
    return this;
  }
  
  public void setPositiveButtonContentDescription(String paramString)
  {
    rBtn.setContentDescription(paramString);
  }
  
  public QQCustomDialog setPreviewImage(Drawable paramDrawable)
  {
    return setPreviewImage(paramDrawable, false, 0);
  }
  
  public QQCustomDialog setPreviewImage(Drawable paramDrawable, boolean paramBoolean, int paramInt)
  {
    if (paramDrawable == null) {
      return this;
    }
    if (paramBoolean)
    {
      framePreview.setVisibility(0);
      previewImage.setVisibility(8);
      framePreviewImage.setImageDrawable(paramDrawable);
      if (paramInt < 2)
      {
        framePreview.setBackgroundDrawable(null);
        return this;
      }
      if (paramInt == 2)
      {
        framePreview.setBackgroundResource(2130838426);
        return this;
      }
      framePreview.setBackgroundResource(2130838427);
      return this;
    }
    framePreview.setVisibility(8);
    previewImage.setVisibility(0);
    previewImage.setCompoundDrawablePadding(0);
    previewImage.setCompoundDrawables(paramDrawable, null, null, null);
    if (paramDrawable != null)
    {
      previewImage.setVisibility(0);
      return this;
    }
    previewImage.setVisibility(8);
    return this;
  }
  
  public void setProgressBarVisibility(int paramInt)
  {
    if (progressBar != null) {
      progressBar.setVisibility(paramInt);
    }
  }
  
  protected void setSeperatorState() {}
  
  public void setTag(Object paramObject)
  {
    tag = paramObject;
  }
  
  public QQCustomDialog setText(String paramString, int paramInt)
  {
    if ((findViewById(paramInt) instanceof TextView))
    {
      TextView localTextView = (TextView)findViewById(paramInt);
      if (localTextView != null)
      {
        localTextView.setText(paramString);
        localTextView.setContentDescription(paramString);
      }
    }
    return this;
  }
  
  public void setTextContentDescription(String paramString)
  {
    text.setContentDescription(paramString);
  }
  
  public QQCustomDialog setTitle(String paramString)
  {
    if (paramString != null)
    {
      title.setText(paramString);
      text.setContentDescription(paramString);
      title.setVisibility(0);
      if (items == null) {}
      return this;
    }
    title.setVisibility(8);
    return this;
  }
  
  public void setTitle(int paramInt)
  {
    title.setText(paramInt);
    text.setContentDescription(getContext().getString(paramInt));
    title.setVisibility(0);
  }
  
  public QQCustomDialog setView(View paramView)
  {
    LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-1, -2);
    bodyLayout.addView(paramView, localLayoutParams);
    return this;
  }
}
