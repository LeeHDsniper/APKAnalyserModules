package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewGridFolderCellView;

public class AdobeAssetViewEditStaggeredGridFolderCellView
  extends AdobeAssetViewGridFolderCellView
{
  private IAdobeCCFilesEditDelegate _editDelegate;
  private View _newSelectionFrame;
  private boolean isSelected = false;
  
  public AdobeAssetViewEditStaggeredGridFolderCellView() {}
  
  private void handleAssetSelectionToggle()
  {
    if (_editDelegate.getControllerState() == true) {
      if (isSelected != true) {
        break label44;
      }
    }
    label44:
    for (isSelected = false;; isSelected = true)
    {
      setImageMarkedUnMarked();
      _editDelegate.handleAssetSelectionToggle(getPosition());
      return;
    }
  }
  
  private void setImageMarkedUnMarked()
  {
    View localView;
    if (_newSelectionFrame != null)
    {
      localView = _newSelectionFrame;
      if (!isSelected) {
        break label27;
      }
    }
    label27:
    for (int i = 0;; i = 8)
    {
      localView.setVisibility(i);
      return;
    }
  }
  
  protected void handleDisableChange() {}
  
  protected void handleOnFinishInflate()
  {
    super.handleOnFinishInflate();
    LayoutInflater localLayoutInflater = (LayoutInflater)getRootView().getContext().getSystemService("layout_inflater");
    RelativeLayout localRelativeLayout = (RelativeLayout)getRootView().findViewById(R.id.assetview_assetgrid_foldercell_imageContainer);
    _newSelectionFrame = localLayoutInflater.inflate(R.layout.adobe_assetcell_selection_fragme, localRelativeLayout, false);
    _newSelectionFrame.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
    localRelativeLayout.addView(_newSelectionFrame, 1);
  }
  
  protected void handleSelection(boolean paramBoolean)
  {
    isSelected = paramBoolean;
    setImageMarkedUnMarked();
  }
  
  protected void performOnFinishInflate()
  {
    getRootView().setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AdobeAssetViewEditStaggeredGridFolderCellView.this.handleAssetSelectionToggle();
      }
    });
    super.performOnFinishInflate();
  }
  
  public void prepareForReuse()
  {
    isSelected = false;
    super.prepareForReuse();
  }
  
  protected boolean providesSelection()
  {
    return false;
  }
  
  public void setEditDelegate(IAdobeCCFilesEditDelegate paramIAdobeCCFilesEditDelegate)
  {
    _editDelegate = paramIAdobeCCFilesEditDelegate;
  }
}
