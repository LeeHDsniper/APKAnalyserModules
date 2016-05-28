package com.behance.sdk.ui.adapters;

import android.content.Context;
import android.graphics.Bitmap;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.project.modules.EmbedModule;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.project.modules.ProjectModule;
import com.behance.sdk.project.modules.ProjectModuleTypes;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import java.util.List;

public class BehanceSDKPublishProjectPreviewAdapter
  extends ArrayAdapter<ProjectModule>
  implements ImageLoadingListener
{
  private Callbacks callbacks;
  private LayoutInflater layoutInflater;
  private int numOfModulesLoaded = 0;
  private int numOfModulesLoading = 0;
  
  public BehanceSDKPublishProjectPreviewAdapter(Context paramContext, int paramInt, List<ProjectModule> paramList)
  {
    super(paramContext, paramInt, paramList);
    layoutInflater = ((LayoutInflater)paramContext.getSystemService("layout_inflater"));
  }
  
  private void checkForLoadingComplete()
  {
    int i = numOfModulesLoaded + 1;
    numOfModulesLoaded = i;
    if (i >= numOfModulesLoading)
    {
      if (callbacks != null) {
        callbacks.onViewLoadingComplete();
      }
      numOfModulesLoading = 0;
      numOfModulesLoaded = 0;
    }
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    View localView = paramView;
    if (paramView == null) {
      localView = layoutInflater.inflate(R.layout.bsdk_adapter_publish_project_preview_project_fragment_list_item, paramViewGroup, false);
    }
    paramViewGroup = (ProjectModule)getItem(paramInt);
    Object localObject = (ImageView)localView.findViewById(R.id.add_project_preview_project_fragment_image_view);
    ((ImageView)localObject).setImageBitmap(null);
    paramView = localView.findViewById(R.id.add_project_preview_fragment_embed_view);
    ProjectModuleTypes localProjectModuleTypes = paramViewGroup.getType();
    if ((ProjectModuleTypes.IMAGE.equals(localProjectModuleTypes)) || (ProjectModuleTypes.CREATIVECLOUD_ASSET.equals(localProjectModuleTypes)))
    {
      paramView.setVisibility(8);
      ((ImageView)localObject).setVisibility(0);
      paramView = (ImageModule)paramViewGroup;
      numOfModulesLoading += 1;
      paramView.displayImage((ImageView)localObject, this);
    }
    while (!ProjectModuleTypes.EMBED.equals(localProjectModuleTypes)) {
      return localView;
    }
    paramView.setVisibility(0);
    ((ImageView)localObject).setVisibility(8);
    localObject = ((EmbedModule)paramViewGroup).getDescription();
    paramViewGroup = ((EmbedModule)paramViewGroup).getSubDescription();
    ((TextView)paramView.findViewById(R.id.bsdkPublishProjectPreviewFragmentEmbedDesc)).setText((CharSequence)localObject);
    ((TextView)paramView.findViewById(R.id.bsdkPublishProjectPreviewFragmentEmbedSubDesc)).setText(paramViewGroup);
    checkForLoadingComplete();
    return localView;
  }
  
  public void onLoadingCancelled(String paramString, View paramView)
  {
    checkForLoadingComplete();
  }
  
  public void onLoadingComplete(String paramString, View paramView, Bitmap paramBitmap)
  {
    checkForLoadingComplete();
  }
  
  public void onLoadingFailed(String paramString, View paramView, FailReason paramFailReason)
  {
    checkForLoadingComplete();
  }
  
  public void onLoadingStarted(String paramString, View paramView) {}
  
  public void setCallbacks(Callbacks paramCallbacks)
  {
    callbacks = paramCallbacks;
  }
  
  public static abstract interface Callbacks
  {
    public abstract void onViewLoadingComplete();
  }
}
