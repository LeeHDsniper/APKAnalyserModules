package android.support.v7.app;

import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.DialogInterface.OnKeyListener;
import android.content.DialogInterface.OnMultiChoiceClickListener;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.id;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.internal.widget.TintTypedArray;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckedTextView;
import android.widget.CursorAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.SimpleCursorAdapter;
import android.widget.TextView;
import java.lang.ref.WeakReference;

class AlertController
{
  private ListAdapter mAdapter;
  private int mAlertDialogLayout;
  private final View.OnClickListener mButtonHandler = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      if ((paramAnonymousView == mButtonPositive) && (mButtonPositiveMessage != null)) {
        paramAnonymousView = Message.obtain(mButtonPositiveMessage);
      }
      for (;;)
      {
        if (paramAnonymousView != null) {
          paramAnonymousView.sendToTarget();
        }
        mHandler.obtainMessage(1, mDialog).sendToTarget();
        return;
        if ((paramAnonymousView == mButtonNegative) && (mButtonNegativeMessage != null)) {
          paramAnonymousView = Message.obtain(mButtonNegativeMessage);
        } else if ((paramAnonymousView == mButtonNeutral) && (mButtonNeutralMessage != null)) {
          paramAnonymousView = Message.obtain(mButtonNeutralMessage);
        } else {
          paramAnonymousView = null;
        }
      }
    }
  };
  private Button mButtonNegative;
  private Message mButtonNegativeMessage;
  private CharSequence mButtonNegativeText;
  private Button mButtonNeutral;
  private Message mButtonNeutralMessage;
  private CharSequence mButtonNeutralText;
  private int mButtonPanelLayoutHint = 0;
  private int mButtonPanelSideLayout;
  private Button mButtonPositive;
  private Message mButtonPositiveMessage;
  private CharSequence mButtonPositiveText;
  private int mCheckedItem = -1;
  private final Context mContext;
  private View mCustomTitleView;
  private final AppCompatDialog mDialog;
  private Handler mHandler;
  private Drawable mIcon;
  private int mIconId = 0;
  private ImageView mIconView;
  private int mListItemLayout;
  private int mListLayout;
  private ListView mListView;
  private CharSequence mMessage;
  private TextView mMessageView;
  private int mMultiChoiceItemLayout;
  private ScrollView mScrollView;
  private int mSingleChoiceItemLayout;
  private CharSequence mTitle;
  private TextView mTitleView;
  private View mView;
  private int mViewLayoutResId;
  private int mViewSpacingBottom;
  private int mViewSpacingLeft;
  private int mViewSpacingRight;
  private boolean mViewSpacingSpecified = false;
  private int mViewSpacingTop;
  private final Window mWindow;
  
  public AlertController(Context paramContext, AppCompatDialog paramAppCompatDialog, Window paramWindow)
  {
    mContext = paramContext;
    mDialog = paramAppCompatDialog;
    mWindow = paramWindow;
    mHandler = new ButtonHandler(paramAppCompatDialog);
    paramContext = paramContext.obtainStyledAttributes(null, R.styleable.AlertDialog, R.attr.alertDialogStyle, 0);
    mAlertDialogLayout = paramContext.getResourceId(R.styleable.AlertDialog_android_layout, 0);
    mButtonPanelSideLayout = paramContext.getResourceId(R.styleable.AlertDialog_buttonPanelSideLayout, 0);
    mListLayout = paramContext.getResourceId(R.styleable.AlertDialog_listLayout, 0);
    mMultiChoiceItemLayout = paramContext.getResourceId(R.styleable.AlertDialog_multiChoiceItemLayout, 0);
    mSingleChoiceItemLayout = paramContext.getResourceId(R.styleable.AlertDialog_singleChoiceItemLayout, 0);
    mListItemLayout = paramContext.getResourceId(R.styleable.AlertDialog_listItemLayout, 0);
    paramContext.recycle();
  }
  
  static boolean canTextInput(View paramView)
  {
    if (paramView.onCheckIsTextEditor()) {
      return true;
    }
    if (!(paramView instanceof ViewGroup)) {
      return false;
    }
    paramView = (ViewGroup)paramView;
    int i = paramView.getChildCount();
    while (i > 0)
    {
      int j = i - 1;
      i = j;
      if (canTextInput(paramView.getChildAt(j))) {
        return true;
      }
    }
    return false;
  }
  
  private void centerButton(Button paramButton)
  {
    LinearLayout.LayoutParams localLayoutParams = (LinearLayout.LayoutParams)paramButton.getLayoutParams();
    gravity = 1;
    weight = 0.5F;
    paramButton.setLayoutParams(localLayoutParams);
  }
  
  private int selectContentView()
  {
    if (mButtonPanelSideLayout == 0) {
      return mAlertDialogLayout;
    }
    if (mButtonPanelLayoutHint == 1) {
      return mButtonPanelSideLayout;
    }
    return mAlertDialogLayout;
  }
  
  private boolean setupButtons()
  {
    int i = 0;
    mButtonPositive = ((Button)mWindow.findViewById(16908313));
    mButtonPositive.setOnClickListener(mButtonHandler);
    if (TextUtils.isEmpty(mButtonPositiveText))
    {
      mButtonPositive.setVisibility(8);
      mButtonNegative = ((Button)mWindow.findViewById(16908314));
      mButtonNegative.setOnClickListener(mButtonHandler);
      if (!TextUtils.isEmpty(mButtonNegativeText)) {
        break label197;
      }
      mButtonNegative.setVisibility(8);
      label95:
      mButtonNeutral = ((Button)mWindow.findViewById(16908315));
      mButtonNeutral.setOnClickListener(mButtonHandler);
      if (!TextUtils.isEmpty(mButtonNeutralText)) {
        break label223;
      }
      mButtonNeutral.setVisibility(8);
      label142:
      if (shouldCenterSingleButton(mContext))
      {
        if (i != 1) {
          break label249;
        }
        centerButton(mButtonPositive);
      }
    }
    for (;;)
    {
      if (i == 0) {
        break label281;
      }
      return true;
      mButtonPositive.setText(mButtonPositiveText);
      mButtonPositive.setVisibility(0);
      i = 0x0 | 0x1;
      break;
      label197:
      mButtonNegative.setText(mButtonNegativeText);
      mButtonNegative.setVisibility(0);
      i |= 0x2;
      break label95;
      label223:
      mButtonNeutral.setText(mButtonNeutralText);
      mButtonNeutral.setVisibility(0);
      i |= 0x4;
      break label142;
      label249:
      if (i == 2) {
        centerButton(mButtonNegative);
      } else if (i == 4) {
        centerButton(mButtonNeutral);
      }
    }
    label281:
    return false;
  }
  
  private void setupContent(ViewGroup paramViewGroup)
  {
    mScrollView = ((ScrollView)mWindow.findViewById(R.id.scrollView));
    mScrollView.setFocusable(false);
    mMessageView = ((TextView)mWindow.findViewById(16908299));
    if (mMessageView == null) {
      return;
    }
    if (mMessage != null)
    {
      mMessageView.setText(mMessage);
      return;
    }
    mMessageView.setVisibility(8);
    mScrollView.removeView(mMessageView);
    if (mListView != null)
    {
      paramViewGroup = (ViewGroup)mScrollView.getParent();
      int i = paramViewGroup.indexOfChild(mScrollView);
      paramViewGroup.removeViewAt(i);
      paramViewGroup.addView(mListView, i, new ViewGroup.LayoutParams(-1, -1));
      return;
    }
    paramViewGroup.setVisibility(8);
  }
  
  private boolean setupTitle(ViewGroup paramViewGroup)
  {
    int i = 0;
    if (mCustomTitleView != null)
    {
      ViewGroup.LayoutParams localLayoutParams = new ViewGroup.LayoutParams(-1, -2);
      paramViewGroup.addView(mCustomTitleView, 0, localLayoutParams);
      mWindow.findViewById(R.id.title_template).setVisibility(8);
      return true;
    }
    mIconView = ((ImageView)mWindow.findViewById(16908294));
    if (!TextUtils.isEmpty(mTitle)) {
      i = 1;
    }
    if (i != 0)
    {
      mTitleView = ((TextView)mWindow.findViewById(R.id.alertTitle));
      mTitleView.setText(mTitle);
      if (mIconId != 0)
      {
        mIconView.setImageResource(mIconId);
        return true;
      }
      if (mIcon != null)
      {
        mIconView.setImageDrawable(mIcon);
        return true;
      }
      mTitleView.setPadding(mIconView.getPaddingLeft(), mIconView.getPaddingTop(), mIconView.getPaddingRight(), mIconView.getPaddingBottom());
      mIconView.setVisibility(8);
      return true;
    }
    mWindow.findViewById(R.id.title_template).setVisibility(8);
    mIconView.setVisibility(8);
    paramViewGroup.setVisibility(8);
    return false;
  }
  
  private void setupView()
  {
    setupContent((ViewGroup)mWindow.findViewById(R.id.contentPanel));
    boolean bool = setupButtons();
    Object localObject = (ViewGroup)mWindow.findViewById(R.id.topPanel);
    TintTypedArray localTintTypedArray = TintTypedArray.obtainStyledAttributes(mContext, null, R.styleable.AlertDialog, R.attr.alertDialogStyle, 0);
    setupTitle((ViewGroup)localObject);
    localObject = mWindow.findViewById(R.id.buttonPanel);
    if (!bool)
    {
      ((View)localObject).setVisibility(8);
      localObject = mWindow.findViewById(R.id.textSpacerNoButtons);
      if (localObject != null) {
        ((View)localObject).setVisibility(0);
      }
    }
    FrameLayout localFrameLayout1 = (FrameLayout)mWindow.findViewById(R.id.customPanel);
    int i;
    if (mView != null)
    {
      localObject = mView;
      if (localObject == null) {
        break label322;
      }
      i = 1;
      label133:
      if ((i == 0) || (!canTextInput((View)localObject))) {
        mWindow.setFlags(131072, 131072);
      }
      if (i == 0) {
        break label327;
      }
      FrameLayout localFrameLayout2 = (FrameLayout)mWindow.findViewById(R.id.custom);
      localFrameLayout2.addView((View)localObject, new ViewGroup.LayoutParams(-1, -1));
      if (mViewSpacingSpecified) {
        localFrameLayout2.setPadding(mViewSpacingLeft, mViewSpacingTop, mViewSpacingRight, mViewSpacingBottom);
      }
      if (mListView != null) {
        getLayoutParamsweight = 0.0F;
      }
    }
    for (;;)
    {
      localObject = mListView;
      if ((localObject != null) && (mAdapter != null))
      {
        ((ListView)localObject).setAdapter(mAdapter);
        i = mCheckedItem;
        if (i > -1)
        {
          ((ListView)localObject).setItemChecked(i, true);
          ((ListView)localObject).setSelection(i);
        }
      }
      localTintTypedArray.recycle();
      return;
      if (mViewLayoutResId != 0)
      {
        localObject = LayoutInflater.from(mContext).inflate(mViewLayoutResId, localFrameLayout1, false);
        break;
      }
      localObject = null;
      break;
      label322:
      i = 0;
      break label133;
      label327:
      localFrameLayout1.setVisibility(8);
    }
  }
  
  private static boolean shouldCenterSingleButton(Context paramContext)
  {
    TypedValue localTypedValue = new TypedValue();
    paramContext.getTheme().resolveAttribute(R.attr.alertDialogCenterButtons, localTypedValue, true);
    return data != 0;
  }
  
  public int getIconAttributeResId(int paramInt)
  {
    TypedValue localTypedValue = new TypedValue();
    mContext.getTheme().resolveAttribute(paramInt, localTypedValue, true);
    return resourceId;
  }
  
  public void installContent()
  {
    mDialog.supportRequestWindowFeature(1);
    int i = selectContentView();
    mDialog.setContentView(i);
    setupView();
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    return (mScrollView != null) && (mScrollView.executeKeyEvent(paramKeyEvent));
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    return (mScrollView != null) && (mScrollView.executeKeyEvent(paramKeyEvent));
  }
  
  public void setButton(int paramInt, CharSequence paramCharSequence, DialogInterface.OnClickListener paramOnClickListener, Message paramMessage)
  {
    Message localMessage = paramMessage;
    if (paramMessage == null)
    {
      localMessage = paramMessage;
      if (paramOnClickListener != null) {
        localMessage = mHandler.obtainMessage(paramInt, paramOnClickListener);
      }
    }
    switch (paramInt)
    {
    default: 
      throw new IllegalArgumentException("Button does not exist");
    case -1: 
      mButtonPositiveText = paramCharSequence;
      mButtonPositiveMessage = localMessage;
      return;
    case -2: 
      mButtonNegativeText = paramCharSequence;
      mButtonNegativeMessage = localMessage;
      return;
    }
    mButtonNeutralText = paramCharSequence;
    mButtonNeutralMessage = localMessage;
  }
  
  public void setCustomTitle(View paramView)
  {
    mCustomTitleView = paramView;
  }
  
  public void setIcon(int paramInt)
  {
    mIcon = null;
    mIconId = paramInt;
    if (mIconView != null)
    {
      if (paramInt != 0) {
        mIconView.setImageResource(mIconId);
      }
    }
    else {
      return;
    }
    mIconView.setVisibility(8);
  }
  
  public void setIcon(Drawable paramDrawable)
  {
    mIcon = paramDrawable;
    mIconId = 0;
    if (mIconView != null)
    {
      if (paramDrawable != null) {
        mIconView.setImageDrawable(paramDrawable);
      }
    }
    else {
      return;
    }
    mIconView.setVisibility(8);
  }
  
  public void setMessage(CharSequence paramCharSequence)
  {
    mMessage = paramCharSequence;
    if (mMessageView != null) {
      mMessageView.setText(paramCharSequence);
    }
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    mTitle = paramCharSequence;
    if (mTitleView != null) {
      mTitleView.setText(paramCharSequence);
    }
  }
  
  public void setView(int paramInt)
  {
    mView = null;
    mViewLayoutResId = paramInt;
    mViewSpacingSpecified = false;
  }
  
  public void setView(View paramView)
  {
    mView = paramView;
    mViewLayoutResId = 0;
    mViewSpacingSpecified = false;
  }
  
  public void setView(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    mView = paramView;
    mViewLayoutResId = 0;
    mViewSpacingSpecified = true;
    mViewSpacingLeft = paramInt1;
    mViewSpacingTop = paramInt2;
    mViewSpacingRight = paramInt3;
    mViewSpacingBottom = paramInt4;
  }
  
  public static class AlertParams
  {
    public ListAdapter mAdapter;
    public boolean mCancelable;
    public int mCheckedItem = -1;
    public boolean[] mCheckedItems;
    public final Context mContext;
    public Cursor mCursor;
    public View mCustomTitleView;
    public Drawable mIcon;
    public int mIconAttrId = 0;
    public int mIconId = 0;
    public final LayoutInflater mInflater;
    public String mIsCheckedColumn;
    public boolean mIsMultiChoice;
    public boolean mIsSingleChoice;
    public CharSequence[] mItems;
    public String mLabelColumn;
    public CharSequence mMessage;
    public DialogInterface.OnClickListener mNegativeButtonListener;
    public CharSequence mNegativeButtonText;
    public DialogInterface.OnClickListener mNeutralButtonListener;
    public CharSequence mNeutralButtonText;
    public DialogInterface.OnCancelListener mOnCancelListener;
    public DialogInterface.OnMultiChoiceClickListener mOnCheckboxClickListener;
    public DialogInterface.OnClickListener mOnClickListener;
    public DialogInterface.OnDismissListener mOnDismissListener;
    public AdapterView.OnItemSelectedListener mOnItemSelectedListener;
    public DialogInterface.OnKeyListener mOnKeyListener;
    public OnPrepareListViewListener mOnPrepareListViewListener;
    public DialogInterface.OnClickListener mPositiveButtonListener;
    public CharSequence mPositiveButtonText;
    public boolean mRecycleOnMeasure = true;
    public CharSequence mTitle;
    public View mView;
    public int mViewLayoutResId;
    public int mViewSpacingBottom;
    public int mViewSpacingLeft;
    public int mViewSpacingRight;
    public boolean mViewSpacingSpecified = false;
    public int mViewSpacingTop;
    
    public AlertParams(Context paramContext)
    {
      mContext = paramContext;
      mCancelable = true;
      mInflater = ((LayoutInflater)paramContext.getSystemService("layout_inflater"));
    }
    
    private void createListView(final AlertController paramAlertController)
    {
      final ListView localListView = (ListView)mInflater.inflate(mListLayout, null);
      Object localObject;
      if (mIsMultiChoice) {
        if (mCursor == null)
        {
          localObject = new ArrayAdapter(mContext, mMultiChoiceItemLayout, 16908308, mItems)
          {
            public View getView(int paramAnonymousInt, View paramAnonymousView, ViewGroup paramAnonymousViewGroup)
            {
              paramAnonymousView = super.getView(paramAnonymousInt, paramAnonymousView, paramAnonymousViewGroup);
              if ((mCheckedItems != null) && (mCheckedItems[paramAnonymousInt] != 0)) {
                localListView.setItemChecked(paramAnonymousInt, true);
              }
              return paramAnonymousView;
            }
          };
          if (mOnPrepareListViewListener != null) {
            mOnPrepareListViewListener.onPrepareListView(localListView);
          }
          AlertController.access$1202(paramAlertController, (ListAdapter)localObject);
          AlertController.access$1302(paramAlertController, mCheckedItem);
          if (mOnClickListener == null) {
            break label274;
          }
          localListView.setOnItemClickListener(new AdapterView.OnItemClickListener()
          {
            public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
            {
              mOnClickListener.onClick(paramAlertControllermDialog, paramAnonymousInt);
              if (!mIsSingleChoice) {
                paramAlertControllermDialog.dismiss();
              }
            }
          });
          label110:
          if (mOnItemSelectedListener != null) {
            localListView.setOnItemSelectedListener(mOnItemSelectedListener);
          }
          if (!mIsSingleChoice) {
            break label300;
          }
          localListView.setChoiceMode(1);
        }
      }
      for (;;)
      {
        AlertController.access$1402(paramAlertController, localListView);
        return;
        localObject = new CursorAdapter(mContext, mCursor, false)
        {
          private final int mIsCheckedIndex;
          private final int mLabelIndex;
          
          public void bindView(View paramAnonymousView, Context paramAnonymousContext, Cursor paramAnonymousCursor)
          {
            boolean bool = true;
            ((CheckedTextView)paramAnonymousView.findViewById(16908308)).setText(paramAnonymousCursor.getString(mLabelIndex));
            paramAnonymousView = localListView;
            int i = paramAnonymousCursor.getPosition();
            if (paramAnonymousCursor.getInt(mIsCheckedIndex) == 1) {}
            for (;;)
            {
              paramAnonymousView.setItemChecked(i, bool);
              return;
              bool = false;
            }
          }
          
          public View newView(Context paramAnonymousContext, Cursor paramAnonymousCursor, ViewGroup paramAnonymousViewGroup)
          {
            return mInflater.inflate(paramAlertControllermMultiChoiceItemLayout, paramAnonymousViewGroup, false);
          }
        };
        break;
        int i;
        if (mIsSingleChoice)
        {
          i = mSingleChoiceItemLayout;
          label183:
          if (mCursor != null) {
            break label235;
          }
          if (mAdapter == null) {
            break label213;
          }
        }
        label213:
        for (localObject = mAdapter;; localObject = new AlertController.CheckedItemAdapter(mContext, i, 16908308, mItems))
        {
          break;
          i = mListItemLayout;
          break label183;
        }
        label235:
        localObject = new SimpleCursorAdapter(mContext, i, mCursor, new String[] { mLabelColumn }, new int[] { 16908308 });
        break;
        label274:
        if (mOnCheckboxClickListener == null) {
          break label110;
        }
        localListView.setOnItemClickListener(new AdapterView.OnItemClickListener()
        {
          public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
          {
            if (mCheckedItems != null) {
              mCheckedItems[paramAnonymousInt] = localListView.isItemChecked(paramAnonymousInt);
            }
            mOnCheckboxClickListener.onClick(paramAlertControllermDialog, paramAnonymousInt, localListView.isItemChecked(paramAnonymousInt));
          }
        });
        break label110;
        label300:
        if (mIsMultiChoice) {
          localListView.setChoiceMode(2);
        }
      }
    }
    
    public void apply(AlertController paramAlertController)
    {
      if (mCustomTitleView != null)
      {
        paramAlertController.setCustomTitle(mCustomTitleView);
        if (mMessage != null) {
          paramAlertController.setMessage(mMessage);
        }
        if (mPositiveButtonText != null) {
          paramAlertController.setButton(-1, mPositiveButtonText, mPositiveButtonListener, null);
        }
        if (mNegativeButtonText != null) {
          paramAlertController.setButton(-2, mNegativeButtonText, mNegativeButtonListener, null);
        }
        if (mNeutralButtonText != null) {
          paramAlertController.setButton(-3, mNeutralButtonText, mNeutralButtonListener, null);
        }
        if ((mItems != null) || (mCursor != null) || (mAdapter != null)) {
          createListView(paramAlertController);
        }
        if (mView == null) {
          break label236;
        }
        if (!mViewSpacingSpecified) {
          break label227;
        }
        paramAlertController.setView(mView, mViewSpacingLeft, mViewSpacingTop, mViewSpacingRight, mViewSpacingBottom);
      }
      label227:
      label236:
      while (mViewLayoutResId == 0)
      {
        return;
        if (mTitle != null) {
          paramAlertController.setTitle(mTitle);
        }
        if (mIcon != null) {
          paramAlertController.setIcon(mIcon);
        }
        if (mIconId != 0) {
          paramAlertController.setIcon(mIconId);
        }
        if (mIconAttrId == 0) {
          break;
        }
        paramAlertController.setIcon(paramAlertController.getIconAttributeResId(mIconAttrId));
        break;
        paramAlertController.setView(mView);
        return;
      }
      paramAlertController.setView(mViewLayoutResId);
    }
    
    public static abstract interface OnPrepareListViewListener
    {
      public abstract void onPrepareListView(ListView paramListView);
    }
  }
  
  private static final class ButtonHandler
    extends Handler
  {
    private WeakReference<DialogInterface> mDialog;
    
    public ButtonHandler(DialogInterface paramDialogInterface)
    {
      mDialog = new WeakReference(paramDialogInterface);
    }
    
    public void handleMessage(Message paramMessage)
    {
      switch (what)
      {
      case 0: 
      default: 
        return;
      case -3: 
      case -2: 
      case -1: 
        ((DialogInterface.OnClickListener)obj).onClick((DialogInterface)mDialog.get(), what);
        return;
      }
      ((DialogInterface)obj).dismiss();
    }
  }
  
  private static class CheckedItemAdapter
    extends ArrayAdapter<CharSequence>
  {
    public CheckedItemAdapter(Context paramContext, int paramInt1, int paramInt2, CharSequence[] paramArrayOfCharSequence)
    {
      super(paramInt1, paramInt2, paramArrayOfCharSequence);
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public boolean hasStableIds()
    {
      return true;
    }
  }
}
