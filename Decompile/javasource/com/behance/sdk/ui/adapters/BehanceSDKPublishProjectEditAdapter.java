package com.behance.sdk.ui.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationUtils;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.behance.sdk.R.anim;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.project.modules.EmbedModule;
import com.behance.sdk.project.modules.ImageModule;
import com.behance.sdk.project.modules.ProjectModule;
import com.behance.sdk.project.modules.ProjectModuleTypes;
import java.util.List;

public class BehanceSDKPublishProjectEditAdapter
  extends ArrayAdapter<ProjectModule>
{
  private Callbacks callback;
  private LayoutInflater layoutInflater;
  
  public BehanceSDKPublishProjectEditAdapter(Context paramContext, int paramInt, List<ProjectModule> paramList)
  {
    super(paramContext, paramInt, paramList);
    layoutInflater = ((LayoutInflater)paramContext.getSystemService("layout_inflater"));
  }
  
  public View getView(final int paramInt, View paramView, final ViewGroup paramViewGroup)
  {
    Object localObject1 = (ProjectModule)getItem(paramInt);
    View localView1 = paramView;
    if (paramView == null) {
      localView1 = layoutInflater.inflate(R.layout.bsdk_adapter_publish_project_edit_fragment_grid_item, paramViewGroup, false);
    }
    paramViewGroup = (ImageView)localView1.findViewById(R.id.add_project_edit_fragment_image_view);
    final ImageView localImageView = (ImageView)localView1.findViewById(R.id.add_project_edit_fragment_image_view_duplicate);
    paramView = localView1.findViewById(R.id.add_project_edit_fragment_embed_view);
    final View localView2 = localView1.findViewById(R.id.add_project_edit_fragment_rotate_icon);
    Object localObject2 = ((ProjectModule)localObject1).getType();
    if ((ProjectModuleTypes.IMAGE.equals(localObject2)) || (ProjectModuleTypes.CREATIVECLOUD_ASSET.equals(localObject2)))
    {
      localObject1 = (ImageModule)localObject1;
      localObject2 = getContext();
      paramView.setVisibility(8);
      paramViewGroup.setVisibility(0);
      localView2.setVisibility(0);
      paramViewGroup.setImageBitmap(((ImageModule)localObject1).getThumbNail((Context)localObject2));
      localView2.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          paramAnonymousView = AnimationUtils.loadAnimation(val$context, R.anim.bsdk_fade_in);
          localView2.startAnimation(paramAnonymousView);
          localImageView.setImageBitmap(val$image.getThumbNail(val$context));
          localImageView.setVisibility(0);
          paramViewGroup.setVisibility(4);
          paramAnonymousView = AnimationUtils.loadAnimation(val$context, R.anim.bsdk_thumbail_rotate);
          paramAnonymousView.setAnimationListener(new Animation.AnimationListener()
          {
            public void onAnimationEnd(Animation paramAnonymous2Animation)
            {
              if (callback != null)
              {
                paramAnonymous2Animation = (ImageModule)getItem(val$itemPosition);
                callback.onRotate(paramAnonymous2Animation);
                val$imageView.setImageBitmap(val$image.getThumbNail(val$context));
                val$imageView.setVisibility(0);
                val$imageViewDuplicate.setVisibility(4);
                val$imageViewDuplicate.setImageBitmap(null);
              }
            }
            
            public void onAnimationRepeat(Animation paramAnonymous2Animation) {}
            
            public void onAnimationStart(Animation paramAnonymous2Animation) {}
          });
          localImageView.startAnimation(paramAnonymousView);
        }
      });
    }
    while (!ProjectModuleTypes.EMBED.equals(localObject2)) {
      return localView1;
    }
    paramViewGroup.setVisibility(8);
    paramView.setVisibility(0);
    localView2.setVisibility(8);
    paramViewGroup = ((EmbedModule)localObject1).getDescription();
    ((TextView)paramView.findViewById(R.id.bsdkPublishProjectEditFragmentEmbedDesc)).setText(paramViewGroup);
    return localView1;
  }
  
  public void setCallBack(Callbacks paramCallbacks)
  {
    callback = paramCallbacks;
  }
  
  public static abstract interface Callbacks
  {
    public abstract void onRotate(ImageModule paramImageModule);
  }
}
