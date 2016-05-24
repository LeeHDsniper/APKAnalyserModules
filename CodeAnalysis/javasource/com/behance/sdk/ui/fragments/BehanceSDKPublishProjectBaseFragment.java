package com.behance.sdk.ui.fragments;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.TextView;
import com.behance.sdk.R.id;
import com.behance.sdk.R.string;
import com.behance.sdk.listeners.IPublishProjectNavigationListener;

public abstract class BehanceSDKPublishProjectBaseFragment
  extends Fragment
{
  private View actionBarBackButton;
  protected TextView actionBarForwardButton;
  private TextView actionBarTitle;
  private IPublishProjectNavigationListener navigationListener;
  protected View rootView;
  
  public BehanceSDKPublishProjectBaseFragment() {}
  
  private View.OnClickListener getLeftNavigationHandler()
  {
    new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        backButtonPressed();
      }
    };
  }
  
  private View.OnClickListener getRightNavigationHandler()
  {
    new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        nextButtonPressed();
      }
    };
  }
  
  protected void backButtonPressed()
  {
    navigationListener.showPrevious();
  }
  
  protected void createActionBar()
  {
    updateNavigationControls();
  }
  
  protected void disableActionBarRightNav()
  {
    if (actionBarForwardButton != null) {
      actionBarForwardButton.setEnabled(false);
    }
  }
  
  protected void enableActionBarRightNav()
  {
    if (actionBarForwardButton != null) {
      actionBarForwardButton.setEnabled(true);
    }
  }
  
  protected int getBackButtonID()
  {
    return R.id.bsdkPublishProjectTitlebarBackBtnLayout;
  }
  
  protected int getForwardButtonID()
  {
    return R.id.bsdkPublishProjectTitlebarActionBtnTxtView;
  }
  
  protected int getForwardButtonText()
  {
    return R.string.bsdk_addproject_custom_actionbar_forward_nav_default_txt;
  }
  
  protected abstract int getLayout();
  
  protected abstract int getTitle();
  
  protected int getTitleViewID()
  {
    return R.id.bsdkPublishProjectTitlebarTitleTxtView;
  }
  
  protected void hideSoftKeyBoardIfActive(View paramView)
  {
    ((InputMethodManager)getActivity().getSystemService("input_method")).hideSoftInputFromWindow(paramView.getWindowToken(), 0);
  }
  
  protected void nextButtonPressed()
  {
    navigationListener.showNext();
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    navigationListener = ((IPublishProjectNavigationListener)paramActivity);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    setHasOptionsMenu(true);
    rootView = paramLayoutInflater.inflate(getLayout(), paramViewGroup, false);
    createActionBar();
    return rootView;
  }
  
  public void onDetach()
  {
    super.onDetach();
    navigationListener = null;
  }
  
  protected void updateNavigationControls()
  {
    actionBarTitle = ((TextView)rootView.findViewById(getTitleViewID()));
    actionBarTitle.setText(getTitle());
    actionBarBackButton = rootView.findViewById(getBackButtonID());
    actionBarBackButton.setVisibility(0);
    actionBarBackButton.setOnClickListener(getLeftNavigationHandler());
    actionBarForwardButton = ((TextView)rootView.findViewById(getForwardButtonID()));
    actionBarForwardButton.setText(getForwardButtonText());
    actionBarForwardButton.setOnClickListener(getRightNavigationHandler());
  }
}
