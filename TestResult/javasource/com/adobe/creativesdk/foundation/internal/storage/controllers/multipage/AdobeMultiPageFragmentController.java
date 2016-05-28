package com.adobe.creativesdk.foundation.internal.storage.controllers.multipage;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewerController;
import com.adobe.creativesdk.foundation.internal.storage.controllers.IAssetViewerActivity;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapWorker;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import java.lang.ref.WeakReference;

public class AdobeMultiPageFragmentController
{
  protected AdobeAsset _asset;
  protected View _autofitRecyclerView;
  protected AdobeAssetAutoFitRecyclerViewController _autofitRecyclerViewController;
  protected View _fragmentView;
  protected Context _oneUpActivityContext;
  protected View _pagerRootView;
  protected AdobeMultiPageViewState _prevstate;
  protected View _recyclerView;
  protected AdobeAssetOneUpRecyclerViewController _recyclerViewController;
  private WeakReference<ReusableImageBitmapWorker> _reusableBitmapCacheWorker;
  protected AdobeMultiPageViewState _state;
  protected AdobeOneUpMultiPageViewPagerController _viewPagerController;
  
  public AdobeMultiPageFragmentController() {}
  
  public void displayGridView()
  {
    _prevstate = _state;
    _state = AdobeMultiPageViewState.AdobeMultiPageGridView;
    if (AdobeAssetViewerController.getCurrentAssetViewerActivity() != null) {
      AdobeAssetViewerController.getCurrentAssetViewerActivity().showActionsBar();
    }
    _pagerRootView.setVisibility(4);
    _recyclerView.setVisibility(4);
    _autofitRecyclerView.setVisibility(0);
    _autofitRecyclerViewController.requestRelayout();
    ((ViewGroup)_fragmentView).bringChildToFront(_autofitRecyclerView);
  }
  
  public void displayListView()
  {
    _prevstate = _state;
    _state = AdobeMultiPageViewState.AdobeMultiPageListView;
    if (AdobeAssetViewerController.getCurrentAssetViewerActivity() != null) {
      AdobeAssetViewerController.getCurrentAssetViewerActivity().showActionsBar();
    }
    _pagerRootView.setVisibility(4);
    _autofitRecyclerView.setVisibility(4);
    _recyclerView.setVisibility(0);
    _recyclerViewController.requestRelayout();
    ((ViewGroup)_fragmentView).bringChildToFront(_recyclerView);
  }
  
  public void displayViewPager(int paramInt)
  {
    _prevstate = _state;
    _state = AdobeMultiPageViewState.AdobeMultiPageViewPager;
    _autofitRecyclerView.setVisibility(4);
    _recyclerView.setVisibility(4);
    _pagerRootView.setVisibility(0);
    ((ViewGroup)_fragmentView).bringChildToFront(_pagerRootView);
    _viewPagerController.startViewPager(paramInt);
  }
  
  public AdobeMultiPageViewState getPreviousState()
  {
    return _prevstate;
  }
  
  public AdobeMultiPageViewState getState()
  {
    return _state;
  }
  
  public void handleOrientationChange()
  {
    if (_viewPagerController != null) {
      _viewPagerController.handleOrientationChange();
    }
  }
  
  public void performInitiallization(Context paramContext)
  {
    _oneUpActivityContext = paramContext;
    paramContext = (LayoutInflater)paramContext.getSystemService("layout_inflater");
    _pagerRootView = paramContext.inflate(R.layout.fragment_multipage_asset_viewpager, null, false);
    _autofitRecyclerView = paramContext.inflate(R.layout.adobe_multipage_autofit_recycler_view, null, false);
    _recyclerView = paramContext.inflate(R.layout.adobe_multipage_recycler_view, null, false);
    ((ViewGroup)_fragmentView).addView(_pagerRootView);
    ((ViewGroup)_fragmentView).addView(_autofitRecyclerView);
    ((ViewGroup)_fragmentView).addView(_recyclerView);
    _viewPagerController = new AdobeOneUpMultiPageViewPagerController();
    _autofitRecyclerViewController = new AdobeAssetAutoFitRecyclerViewController();
    _recyclerViewController = new AdobeAssetOneUpRecyclerViewController();
    _viewPagerController.setMainRootView(_pagerRootView);
    _viewPagerController.setAsset(_asset);
    _viewPagerController.performInitiallization(_oneUpActivityContext);
    _autofitRecyclerViewController.setMainRootView(_autofitRecyclerView);
    _autofitRecyclerViewController.setAsset(_asset);
    _autofitRecyclerViewController.performInitialization(_oneUpActivityContext);
    _recyclerViewController.setMainRootView(_recyclerView);
    _recyclerViewController.setAsset(_asset);
    _recyclerViewController.performInitialization(_oneUpActivityContext);
    _viewPagerController.setFragmentController(this);
    _autofitRecyclerViewController.setFragmentController(this);
    _recyclerViewController.setFragmentController(this);
  }
  
  public View provideViewToActivity()
  {
    if (_state == AdobeMultiPageViewState.AdobeMultiPageGridView) {
      displayGridView();
    }
    for (;;)
    {
      return _fragmentView;
      if (_state == AdobeMultiPageViewState.AdobeMultiPageListView) {
        displayListView();
      } else {
        displayViewPager(0);
      }
    }
  }
  
  public void setAsset(AdobeAsset paramAdobeAsset)
  {
    _asset = paramAdobeAsset;
  }
  
  public void setFragmentView(View paramView)
  {
    _fragmentView = paramView;
  }
  
  public void setReuseableBitmapCacheWorker(ReusableImageBitmapWorker paramReusableImageBitmapWorker)
  {
    if (paramReusableImageBitmapWorker == null) {
      return;
    }
    if (_autofitRecyclerViewController != null) {
      _autofitRecyclerViewController.setReuseableBitmapCacheWorker(paramReusableImageBitmapWorker);
    }
    if (_recyclerViewController != null) {
      _recyclerViewController.setReuseableBitmapCacheWorker(paramReusableImageBitmapWorker);
    }
    if (_viewPagerController != null) {
      _viewPagerController.setReuseableBitmapCacheWorker(paramReusableImageBitmapWorker);
    }
    _reusableBitmapCacheWorker = new WeakReference(paramReusableImageBitmapWorker);
  }
  
  public void setState(AdobeMultiPageViewState paramAdobeMultiPageViewState)
  {
    _state = paramAdobeMultiPageViewState;
  }
  
  public void wentOffline()
  {
    if (_autofitRecyclerViewController != null) {
      _autofitRecyclerViewController.wentOffline();
    }
    if (_recyclerViewController != null) {
      _recyclerViewController.wentOffline();
    }
    if (_viewPagerController != null) {}
  }
  
  public void wentOnline()
  {
    if (_autofitRecyclerViewController != null) {
      _autofitRecyclerViewController.wentOnline();
    }
    if (_recyclerViewController != null) {
      _recyclerViewController.wentOnline();
    }
    if (_viewPagerController != null) {}
  }
}
