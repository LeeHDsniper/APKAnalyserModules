package com.adobe.creativesdk.aviary.fragments;

import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;

public class ListFragmentAbstract
  extends Fragment
{
  static final int INTERNAL_EMPTY_ID = R.id.empty;
  static final int INTERNAL_LIST_CONTAINER_ID = R.id.list_container;
  static final int INTERNAL_PROGRESS_CONTAINER_ID = R.id.progress_container;
  ListAdapter mAdapter;
  CharSequence mEmptyText;
  View mEmptyView;
  private final Handler mHandler = new Handler();
  ListView mList;
  View mListContainer;
  boolean mListShown;
  private final AdapterView.OnItemClickListener mOnClickListener = new AdapterView.OnItemClickListener()
  {
    public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      onListItemClick((ListView)paramAnonymousAdapterView, paramAnonymousView, paramAnonymousInt, paramAnonymousLong);
    }
  };
  View mProgressContainer;
  private final Runnable mRequestFocus = new Runnable()
  {
    public void run()
    {
      mList.focusableViewAvailable(mList);
    }
  };
  TextView mStandardEmptyView;
  
  public ListFragmentAbstract() {}
  
  private void ensureList()
  {
    if (mList != null) {
      return;
    }
    Object localObject = getView();
    if (localObject == null) {
      throw new IllegalStateException("Content view not yet created");
    }
    if ((localObject instanceof ListView))
    {
      mList = ((ListView)localObject);
      mListShown = true;
      mList.setOnItemClickListener(mOnClickListener);
      if (mAdapter == null) {
        break label257;
      }
      localObject = mAdapter;
      mAdapter = null;
      setListAdapter((ListAdapter)localObject);
    }
    for (;;)
    {
      mHandler.post(mRequestFocus);
      return;
      mStandardEmptyView = ((TextView)((View)localObject).findViewById(INTERNAL_EMPTY_ID));
      if (mStandardEmptyView == null) {
        mEmptyView = ((View)localObject).findViewById(16908292);
      }
      for (;;)
      {
        mProgressContainer = ((View)localObject).findViewById(INTERNAL_PROGRESS_CONTAINER_ID);
        mListContainer = ((View)localObject).findViewById(INTERNAL_LIST_CONTAINER_ID);
        localObject = ((View)localObject).findViewById(16908298);
        if ((localObject instanceof ListView)) {
          break label196;
        }
        if (localObject != null) {
          break;
        }
        throw new RuntimeException("Your content must have a ListView whose id attribute is 'android.R.id.list'");
        mStandardEmptyView.setVisibility(8);
      }
      throw new RuntimeException("Content has view with id attribute 'android.R.id.list' that is not a ListView class");
      label196:
      mList = ((ListView)localObject);
      if (mEmptyView != null)
      {
        mList.setEmptyView(mEmptyView);
        break;
      }
      if (mEmptyText == null) {
        break;
      }
      mStandardEmptyView.setText(mEmptyText);
      mList.setEmptyView(mStandardEmptyView);
      break;
      label257:
      if (mProgressContainer != null) {
        setListShown(false, false);
      }
    }
  }
  
  private void setListShown(boolean paramBoolean1, boolean paramBoolean2)
  {
    ensureList();
    if (mProgressContainer == null) {
      throw new IllegalStateException("Can't be used with a custom content view");
    }
    if (mListShown == paramBoolean1) {
      return;
    }
    mListShown = paramBoolean1;
    if (paramBoolean1)
    {
      if (paramBoolean2)
      {
        mProgressContainer.startAnimation(AnimationUtils.loadAnimation(getActivity(), 17432577));
        mListContainer.startAnimation(AnimationUtils.loadAnimation(getActivity(), 17432576));
      }
      for (;;)
      {
        mProgressContainer.setVisibility(8);
        mListContainer.setVisibility(0);
        return;
        mProgressContainer.clearAnimation();
        mListContainer.clearAnimation();
      }
    }
    if (paramBoolean2)
    {
      mProgressContainer.startAnimation(AnimationUtils.loadAnimation(getActivity(), 17432576));
      mListContainer.startAnimation(AnimationUtils.loadAnimation(getActivity(), 17432577));
    }
    for (;;)
    {
      mProgressContainer.setVisibility(0);
      mListContainer.setVisibility(8);
      return;
      mProgressContainer.clearAnimation();
      mListContainer.clearAnimation();
    }
  }
  
  public ListView getListView()
  {
    ensureList();
    return mList;
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_listfragment, paramViewGroup, false);
  }
  
  public void onDestroyView()
  {
    mHandler.removeCallbacks(mRequestFocus);
    mList = null;
    mListShown = false;
    mEmptyView = null;
    mProgressContainer = null;
    mListContainer = null;
    mStandardEmptyView = null;
    super.onDestroyView();
  }
  
  public void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong) {}
  
  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    ensureList();
  }
  
  public void setListAdapter(ListAdapter paramListAdapter)
  {
    boolean bool = false;
    if (mAdapter != null) {}
    for (int i = 1;; i = 0)
    {
      mAdapter = paramListAdapter;
      if (mList != null)
      {
        mList.setAdapter(paramListAdapter);
        if ((!mListShown) && (i == 0))
        {
          if (getView().getWindowToken() != null) {
            bool = true;
          }
          setListShown(true, bool);
        }
      }
      return;
    }
  }
  
  public void setListShown(boolean paramBoolean)
  {
    setListShown(paramBoolean, true);
  }
}
