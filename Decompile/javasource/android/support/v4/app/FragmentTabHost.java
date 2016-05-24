package android.support.v4.app;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.view.View.BaseSavedState;
import android.widget.TabHost;
import android.widget.TabHost.OnTabChangeListener;
import java.util.ArrayList;

public class FragmentTabHost
  extends TabHost
  implements TabHost.OnTabChangeListener
{
  private boolean mAttached;
  private int mContainerId;
  private Context mContext;
  private FragmentManager mFragmentManager;
  private TabInfo mLastTab;
  private TabHost.OnTabChangeListener mOnTabChangeListener;
  private final ArrayList<TabInfo> mTabs = new ArrayList();
  
  public FragmentTabHost(Context paramContext)
  {
    super(paramContext, null);
    initFragmentTabHost(paramContext, null);
  }
  
  public FragmentTabHost(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    initFragmentTabHost(paramContext, paramAttributeSet);
  }
  
  private FragmentTransaction doTabChanged(String paramString, FragmentTransaction paramFragmentTransaction)
  {
    Object localObject = null;
    int i = 0;
    while (i < mTabs.size())
    {
      TabInfo localTabInfo = (TabInfo)mTabs.get(i);
      if (tag.equals(paramString)) {
        localObject = localTabInfo;
      }
      i += 1;
    }
    if (localObject == null) {
      throw new IllegalStateException("No tab known for tag " + paramString);
    }
    paramString = paramFragmentTransaction;
    if (mLastTab != localObject)
    {
      paramString = paramFragmentTransaction;
      if (paramFragmentTransaction == null) {
        paramString = mFragmentManager.beginTransaction();
      }
      if ((mLastTab != null) && (mLastTab.fragment != null)) {
        paramString.detach(mLastTab.fragment);
      }
      if (localObject != null)
      {
        if (fragment != null) {
          break label204;
        }
        TabInfo.access$102(localObject, Fragment.instantiate(mContext, clss.getName(), args));
        paramString.add(mContainerId, fragment, tag);
      }
    }
    for (;;)
    {
      mLastTab = localObject;
      return paramString;
      label204:
      paramString.attach(fragment);
    }
  }
  
  private void initFragmentTabHost(Context paramContext, AttributeSet paramAttributeSet)
  {
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, new int[] { 16842995 }, 0, 0);
    mContainerId = paramContext.getResourceId(0, 0);
    paramContext.recycle();
    super.setOnTabChangedListener(this);
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    String str = getCurrentTabTag();
    Object localObject1 = null;
    int i = 0;
    if (i < mTabs.size())
    {
      TabInfo localTabInfo = (TabInfo)mTabs.get(i);
      TabInfo.access$102(localTabInfo, mFragmentManager.findFragmentByTag(tag));
      Object localObject2 = localObject1;
      if (fragment != null)
      {
        localObject2 = localObject1;
        if (!fragment.isDetached())
        {
          if (!tag.equals(str)) {
            break label109;
          }
          mLastTab = localTabInfo;
          localObject2 = localObject1;
        }
      }
      for (;;)
      {
        i += 1;
        localObject1 = localObject2;
        break;
        label109:
        localObject2 = localObject1;
        if (localObject1 == null) {
          localObject2 = mFragmentManager.beginTransaction();
        }
        ((FragmentTransaction)localObject2).detach(fragment);
      }
    }
    mAttached = true;
    localObject1 = doTabChanged(str, (FragmentTransaction)localObject1);
    if (localObject1 != null)
    {
      ((FragmentTransaction)localObject1).commit();
      mFragmentManager.executePendingTransactions();
    }
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    mAttached = false;
  }
  
  protected void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    setCurrentTabByTag(curTab);
  }
  
  protected Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    curTab = getCurrentTabTag();
    return localSavedState;
  }
  
  public void onTabChanged(String paramString)
  {
    if (mAttached)
    {
      FragmentTransaction localFragmentTransaction = doTabChanged(paramString, null);
      if (localFragmentTransaction != null) {
        localFragmentTransaction.commit();
      }
    }
    if (mOnTabChangeListener != null) {
      mOnTabChangeListener.onTabChanged(paramString);
    }
  }
  
  public void setOnTabChangedListener(TabHost.OnTabChangeListener paramOnTabChangeListener)
  {
    mOnTabChangeListener = paramOnTabChangeListener;
  }
  
  @Deprecated
  public void setup()
  {
    throw new IllegalStateException("Must call setup() that takes a Context and FragmentManager");
  }
  
  static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public FragmentTabHost.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new FragmentTabHost.SavedState(paramAnonymousParcel, null);
      }
      
      public FragmentTabHost.SavedState[] newArray(int paramAnonymousInt)
      {
        return new FragmentTabHost.SavedState[paramAnonymousInt];
      }
    };
    String curTab;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      curTab = paramParcel.readString();
    }
    
    SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public String toString()
    {
      return "FragmentTabHost.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " curTab=" + curTab + "}";
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeString(curTab);
    }
  }
  
  static final class TabInfo
  {
    private final Bundle args;
    private final Class<?> clss;
    private Fragment fragment;
    private final String tag;
  }
}
