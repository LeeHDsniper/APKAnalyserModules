package com.adobe.creativesdk.aviary.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap.Config;
import android.support.v7.graphics.Palette;
import android.support.v7.graphics.Palette.PaletteAsyncListener;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.adobe.creativesdk.aviary.internal.cds.Cds.ContentType;
import com.adobe.creativesdk.aviary.internal.cds.CdsDownloaderFactory;
import com.adobe.creativesdk.aviary.internal.cds.CdsDownloaderFactory.Downloader;
import com.adobe.creativesdk.aviary.internal.cds.CdsDownloaderFactory.DownloaderAsyncListener;
import com.adobe.creativesdk.aviary.internal.cds.PacksColumns.PackCursorWrapper;
import com.adobe.creativesdk.aviary.internal.cds.PacksContentColumns.ContentCursorWrapper;
import com.adobe.creativesdk.aviary.internal.events.DetailPaletteEvent;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.panels.PacksListAdapter.PaletteTransformation;
import com.adobe.creativesdk.aviary.utils.EventBusUtils;
import com.aviary.android.feather.sdk.R.dimen;
import com.aviary.android.feather.sdk.R.id;
import de.greenrobot.event.EventBus;
import it.sephiroth.android.library.picasso.Callback;
import it.sephiroth.android.library.picasso.Picasso;
import it.sephiroth.android.library.picasso.RequestCreator;
import it.sephiroth.android.library.viewrevealanimator.ViewRevealAnimator;
import java.io.File;

public class PackDetailBannerView
  extends ViewRevealAnimator
  implements Palette.PaletteAsyncListener, CdsDownloaderFactory.DownloaderAsyncListener
{
  private static LoggerFactory.Logger logger = LoggerFactory.getLogger("PackDetailBannerView");
  private boolean mAttached;
  private ImageView mDetailIconView;
  private ImageView mDetailImageView;
  private boolean mFadeDetailImage;
  private boolean mIconLoaded;
  private PacksColumns.PackCursorWrapper mPack;
  private String mPackDetailPath;
  private long mPackId;
  private Palette mPalette;
  private Picasso mPicasso;
  int mTotalAttempts = 0;
  
  public PackDetailBannerView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public PackDetailBannerView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext);
  }
  
  private void init(Context paramContext)
  {
    mPicasso = Picasso.with(paramContext);
    setAnimationDuration(getResources().getInteger(17694722));
  }
  
  private boolean isValidContext()
  {
    return (getContext() != null) && (mAttached);
  }
  
  private void loadDetailImage(final boolean paramBoolean)
  {
    logger.info("loadDetailImage(%b)", new Object[] { Boolean.valueOf(paramBoolean) });
    if (!isValidContext()) {
      logger.warn("invalid context");
    }
    if (mPack == null)
    {
      logger.warn("pack is null");
      return;
    }
    logger.verbose("detail path: %s", new Object[] { mPackDetailPath });
    int i = mTotalAttempts;
    mTotalAttempts = (i + 1);
    if (i > 4)
    {
      logger.error("too many attempts");
      return;
    }
    if (!TextUtils.isEmpty(mPackDetailPath))
    {
      final long l = mPackId;
      File localFile = new File(mPackDetailPath);
      if (localFile.exists())
      {
        mDetailImageView.setTag(mPack.getIdentifier());
        RequestCreator localRequestCreator = mPicasso.load(mPackDetailPath);
        localRequestCreator.noFade();
        localRequestCreator.skipMemoryCache();
        localRequestCreator.config(Bitmap.Config.RGB_565);
        localRequestCreator.fit(true);
        if (paramBoolean)
        {
          PacksListAdapter.PaletteTransformation localPaletteTransformation = new PacksListAdapter.PaletteTransformation(this);
          localPaletteTransformation.resize(getResources().getDimensionPixelSize(R.dimen.com_adobe_image_store_detail_icon_size));
          localRequestCreator.transform(localPaletteTransformation);
        }
        localRequestCreator.into(mDetailImageView, new Callback()
        {
          public void onError()
          {
            PackDetailBannerView.logger.error("failed to load local detail image");
            PackDetailBannerView.logger.verbose("trying to delete current invalid file..", new Object[0]);
            PackDetailBannerView.access$502(PackDetailBannerView.this, null);
            IOUtils.deleteQuietly(paramBoolean);
            if (mIconLoaded)
            {
              PackDetailBannerView.this.loadDetailImage(val$loadPalette);
              return;
            }
            PackDetailBannerView.this.loadPackIcon();
          }
          
          public void onSuccess()
          {
            if ((PackDetailBannerView.this.isValidContext()) && (l == mPackId))
            {
              PackDetailBannerView localPackDetailBannerView;
              if (getDisplayedChild() != 1)
              {
                setHideBeforeReveal(mIconLoaded);
                localPackDetailBannerView = PackDetailBannerView.this;
                if ((!mIconLoaded) && (!mFadeDetailImage)) {
                  break label94;
                }
              }
              label94:
              for (boolean bool = true;; bool = false)
              {
                localPackDetailBannerView.setDisplayedChild(1, bool);
                PackDetailBannerView.logger.error("detail image loaded");
                return;
              }
            }
            PackDetailBannerView.logger.warn("invalid context or invalid packId");
          }
        });
        return;
      }
      logger.warn("file does not exists!");
      mPackDetailPath = null;
      IOUtils.deleteQuietly(localFile);
      if (mIconLoaded)
      {
        loadDetailImage(paramBoolean);
        return;
      }
      loadPackIcon();
      return;
    }
    logger.verbose("need to download the detail image...", new Object[0]);
    CdsDownloaderFactory.create(Cds.ContentType.DETAIL_IMAGE).downloadAsync(getContext(), mPackId, this);
  }
  
  private void loadPackIcon()
  {
    logger.info("loadPackIcon");
    if (!isValidContext())
    {
      logger.warn("invalid context");
      return;
    }
    final long l = mPackId;
    RequestCreator localRequestCreator = mPicasso.load(mPack.getContent().getIconPath());
    localRequestCreator.noFade();
    localRequestCreator.skipMemoryCache();
    localRequestCreator.fit(true);
    localRequestCreator.into(mDetailIconView, new Callback()
    {
      public void onError()
      {
        PackDetailBannerView.logger.error("onError");
      }
      
      public void onSuccess()
      {
        if (l != mPackId)
        {
          PackDetailBannerView.logger.warn("different packId");
          return;
        }
        if (getDisplayedChild() != 0) {
          setDisplayedChild(0, false);
        }
        PackDetailBannerView.this.onIconLoaded();
      }
    });
  }
  
  private void onIconLoaded()
  {
    mIconLoaded = true;
    postDelayed(new Runnable()
    {
      public void run()
      {
        PackDetailBannerView localPackDetailBannerView = PackDetailBannerView.this;
        if (mPalette == null) {}
        for (boolean bool = true;; bool = false)
        {
          localPackDetailBannerView.loadDetailImage(bool);
          return;
        }
      }
    }, 600L);
  }
  
  private void onPaletteAvailable(Palette paramPalette)
  {
    if (isValidContext())
    {
      mPalette = paramPalette;
      EventBusUtils.getInstance().post(new DetailPaletteEvent(paramPalette, mPackId));
    }
  }
  
  public void clearAll()
  {
    mTotalAttempts = 0;
    mPalette = null;
    mIconLoaded = false;
    mDetailImageView.setTag(null);
    mDetailImageView.setImageBitmap(null);
    mDetailIconView.setImageBitmap(null);
    if (mPicasso != null)
    {
      mPicasso.cancelRequest(mDetailImageView);
      mPicasso.cancelRequest(mDetailIconView);
    }
    mPack = null;
    mPackId = -1L;
    mPackDetailPath = null;
    if (getDisplayedChild() != 0) {
      setDisplayedChild(0, false);
    }
  }
  
  public void load(PacksColumns.PackCursorWrapper paramPackCursorWrapper)
  {
    logger.info("load: %s", new Object[] { paramPackCursorWrapper });
    mTotalAttempts = 0;
    mPack = paramPackCursorWrapper;
    if (paramPackCursorWrapper != null)
    {
      mPackId = paramPackCursorWrapper.getId();
      mPackDetailPath = paramPackCursorWrapper.getContent().getDetailImageLocalPath();
      if ((!TextUtils.isEmpty(mPackDetailPath)) && (new File(mPackDetailPath).exists())) {
        loadDetailImage(true);
      }
    }
    else
    {
      return;
    }
    loadPackIcon();
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    mAttached = true;
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    mAttached = false;
  }
  
  public void onDownloadComplete(long paramLong, String paramString)
  {
    if ((isValidContext()) && (paramLong == mPackId) && (!TextUtils.isEmpty(paramString)))
    {
      mPackDetailPath = paramString;
      if (mPalette != null) {
        break label45;
      }
    }
    label45:
    for (boolean bool = true;; bool = false)
    {
      loadDetailImage(bool);
      return;
    }
  }
  
  protected void onFinishInflate()
  {
    super.onFinishInflate();
    mDetailIconView = ((ImageView)findViewById(R.id.image1));
    mDetailImageView = ((ImageView)findViewById(R.id.image2));
  }
  
  public void onGenerated(Palette paramPalette)
  {
    logger.info("onGenerated");
    onPaletteAvailable(paramPalette);
  }
  
  public void setFadeDetailImage(boolean paramBoolean)
  {
    logger.log("setFadeDetailImage: %b", new Object[] { Boolean.valueOf(paramBoolean) });
    mFadeDetailImage = paramBoolean;
  }
}
