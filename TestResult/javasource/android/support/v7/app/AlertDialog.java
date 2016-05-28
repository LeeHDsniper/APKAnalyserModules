package android.support.v7.app;

import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnKeyListener;
import android.content.res.Resources.Theme;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v7.appcompat.R.attr;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.KeyEvent;
import android.view.View;
import android.widget.ListAdapter;

public class AlertDialog
  extends AppCompatDialog
  implements DialogInterface
{
  private AlertController mAlert = new AlertController(getContext(), this, getWindow());
  
  AlertDialog(Context paramContext, int paramInt, boolean paramBoolean)
  {
    super(paramContext, resolveDialogTheme(paramContext, paramInt));
  }
  
  static int resolveDialogTheme(Context paramContext, int paramInt)
  {
    if (paramInt >= 16777216) {
      return paramInt;
    }
    TypedValue localTypedValue = new TypedValue();
    paramContext.getTheme().resolveAttribute(R.attr.alertDialogTheme, localTypedValue, true);
    return resourceId;
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    mAlert.installContent();
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (mAlert.onKeyDown(paramInt, paramKeyEvent)) {
      return true;
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    if (mAlert.onKeyUp(paramInt, paramKeyEvent)) {
      return true;
    }
    return super.onKeyUp(paramInt, paramKeyEvent);
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    super.setTitle(paramCharSequence);
    mAlert.setTitle(paramCharSequence);
  }
  
  public static class Builder
  {
    private final AlertController.AlertParams P;
    private int mTheme;
    
    public Builder(Context paramContext)
    {
      this(paramContext, AlertDialog.resolveDialogTheme(paramContext, 0));
    }
    
    public Builder(Context paramContext, int paramInt)
    {
      P = new AlertController.AlertParams(new ContextThemeWrapper(paramContext, AlertDialog.resolveDialogTheme(paramContext, paramInt)));
      mTheme = paramInt;
    }
    
    public AlertDialog create()
    {
      AlertDialog localAlertDialog = new AlertDialog(P.mContext, mTheme, false);
      P.apply(mAlert);
      localAlertDialog.setCancelable(P.mCancelable);
      if (P.mCancelable) {
        localAlertDialog.setCanceledOnTouchOutside(true);
      }
      localAlertDialog.setOnCancelListener(P.mOnCancelListener);
      localAlertDialog.setOnDismissListener(P.mOnDismissListener);
      if (P.mOnKeyListener != null) {
        localAlertDialog.setOnKeyListener(P.mOnKeyListener);
      }
      return localAlertDialog;
    }
    
    public Context getContext()
    {
      return P.mContext;
    }
    
    public Builder setAdapter(ListAdapter paramListAdapter, DialogInterface.OnClickListener paramOnClickListener)
    {
      P.mAdapter = paramListAdapter;
      P.mOnClickListener = paramOnClickListener;
      return this;
    }
    
    public Builder setCustomTitle(View paramView)
    {
      P.mCustomTitleView = paramView;
      return this;
    }
    
    public Builder setIcon(Drawable paramDrawable)
    {
      P.mIcon = paramDrawable;
      return this;
    }
    
    public Builder setOnKeyListener(DialogInterface.OnKeyListener paramOnKeyListener)
    {
      P.mOnKeyListener = paramOnKeyListener;
      return this;
    }
    
    public Builder setTitle(CharSequence paramCharSequence)
    {
      P.mTitle = paramCharSequence;
      return this;
    }
  }
}
