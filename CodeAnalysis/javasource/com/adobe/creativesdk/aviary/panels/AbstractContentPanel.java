package com.adobe.creativesdk.aviary.panels;

import android.view.LayoutInflater;
import android.view.View;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.utils.EventBusUtils;
import de.greenrobot.event.EventBus;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;

public abstract class AbstractContentPanel
  extends AbstractOptionPanel
  implements AbstractPanel.ContentPanel
{
  protected View mDrawingPanel;
  protected ImageViewTouch mImageView;
  
  public AbstractContentPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
  }
  
  protected void contentReady()
  {
    if (isActive()) {
      EventBusUtils.getInstance().post(new ContentReadyEvent(this));
    }
  }
  
  protected abstract View generateContentView(LayoutInflater paramLayoutInflater);
  
  public final View getContentView()
  {
    return mDrawingPanel;
  }
  
  public final View getContentView(LayoutInflater paramLayoutInflater)
  {
    mDrawingPanel = generateContentView(paramLayoutInflater);
    return mDrawingPanel;
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    super.setEnabled(paramBoolean);
    getContentView().setEnabled(paramBoolean);
  }
  
  public static final class ContentReadyEvent
    extends AbstractPanel.PanelEvent
  {
    protected ContentReadyEvent(AbstractPanel paramAbstractPanel)
    {
      super();
    }
  }
}
