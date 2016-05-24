package com.adobe.creativesdk.aviary.panels;

import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.v7.graphics.Palette;
import android.support.v7.graphics.Palette.Builder;
import android.support.v7.graphics.Palette.PaletteAsyncListener;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.adobe.android.ui.utils.UIUtils;
import com.adobe.android.ui.widget.RecyclerCursorAdapter;
import com.adobe.creativesdk.aviary.graphics.PluginDividerDrawable;
import com.adobe.creativesdk.aviary.internal.cds.Cds.PackType;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.adobe.creativesdk.aviary.internal.utils.Objects;
import com.adobe.creativesdk.aviary.utils.PackIconTransformer.Builder;
import com.adobe.creativesdk.aviary.widget.CheckableRelativeLayout;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.string;
import com.aviary.android.feather.sdk.R.style;
import com.nineoldandroids.animation.ArgbEvaluator;
import com.nineoldandroids.animation.ValueAnimator;
import com.nineoldandroids.animation.ValueAnimator.AnimatorUpdateListener;
import com.timehop.stickyheadersrecyclerview.StickyRecyclerHeadersAdapter;
import it.sephiroth.android.library.picasso.Cache;
import it.sephiroth.android.library.picasso.Callback;
import it.sephiroth.android.library.picasso.Picasso;
import it.sephiroth.android.library.picasso.RequestCreator;
import it.sephiroth.android.library.picasso.Transformation;
import java.lang.ref.SoftReference;
import java.util.HashMap;

public class PacksListAdapter
  extends RecyclerCursorAdapter<BaseViewHolder>
  implements View.OnClickListener, StickyRecyclerHeadersAdapter<SectionHeaderViewHolder>
{
  private int accentColor;
  private Cache cache;
  private OnItemClickListener caller;
  private int cellWidth;
  private int defaultPackTextBackgroundColor;
  int mCheckedItemPosition;
  int mDefaultResId;
  int mDividerResId;
  int mExternalResId;
  LayoutInflater mInflater;
  int mInternalResId;
  int mMoreResId;
  final HashMap<Integer, Long> mPackIdCache = new HashMap();
  private final HashMap<String, Integer> mPacksColorCache;
  private Cds.PackType packType;
  private Picasso picasso;
  
  public PacksListAdapter(Context paramContext, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, Cursor paramCursor)
  {
    super(paramContext, paramCursor, 0);
    mInflater = LayoutInflater.from(paramContext);
    mDefaultResId = paramInt1;
    mMoreResId = paramInt2;
    mExternalResId = paramInt3;
    mDividerResId = paramInt4;
    mInternalResId = paramInt5;
    mPacksColorCache = new HashMap();
  }
  
  private void onBitmapLoaded(final ExternalPackViewHolder paramExternalPackViewHolder, final long paramLong, String paramString)
  {
    if (paramExternalPackViewHolder.getItemId() == paramLong)
    {
      if (mPacksColorCache.containsKey(paramString))
      {
        int i = ((Integer)mPacksColorCache.get(paramString)).intValue();
        textView.setBackgroundColor(i);
        animateBackgroundColor(textView, i);
        return;
      }
      Object localObject = imageView.getDrawable();
      if ((localObject instanceof BitmapDrawable))
      {
        localObject = ((BitmapDrawable)localObject).getBitmap();
        if (localObject != null)
        {
          new Palette.Builder((Bitmap)localObject).generate(new Palette.PaletteAsyncListener()
          {
            public void onGenerated(Palette paramAnonymousPalette)
            {
              if (paramAnonymousPalette != null)
              {
                int i = paramAnonymousPalette.getVibrantColor(defaultPackTextBackgroundColor);
                if (paramExternalPackViewHolder.getItemId() == paramLong)
                {
                  animateBackgroundColor(paramExternalPackViewHoldertextView, i);
                  mPacksColorCache.put(val$identifier, Integer.valueOf(i));
                  return;
                }
                Log.e("PacksListAdapter", "invalid item id (2)");
                return;
              }
              Log.w("PacksListAdapter", "null palette");
            }
          });
          return;
        }
        Log.w("PacksListAdapter", "null bitmap");
        return;
      }
      Log.w("PacksListAdapter", localObject + " is not a BitmapDrawable");
      return;
    }
    Log.e("PacksListAdapter", "invalid item id");
  }
  
  protected void animateBackgroundColor(View paramView, int paramInt)
  {
    ColorDrawable localColorDrawable2 = (ColorDrawable)paramView.getBackground();
    final ColorDrawable localColorDrawable1 = new ColorDrawable(localColorDrawable2.getColor());
    if (ApiHelper.AT_LEAST_16) {
      paramView.setBackground(localColorDrawable1);
    }
    for (;;)
    {
      paramView = ValueAnimator.ofObject(new ArgbEvaluator(), new Object[] { Integer.valueOf(localColorDrawable2.getColor()), Integer.valueOf(paramInt) });
      paramView.setDuration(200L);
      paramView.addUpdateListener(new ValueAnimator.AnimatorUpdateListener()
      {
        public void onAnimationUpdate(ValueAnimator paramAnonymousValueAnimator)
        {
          int i = ((Integer)paramAnonymousValueAnimator.getAnimatedValue()).intValue();
          if (ApiHelper.AT_LEAST_21)
          {
            localColorDrawable1.setTint(i);
            return;
          }
          localColorDrawable1.setColor(i);
        }
      });
      paramView.start();
      return;
      paramView.setBackgroundDrawable(localColorDrawable1);
    }
  }
  
  protected void clearCaches()
  {
    super.clearCaches();
    mPackIdCache.clear();
  }
  
  public long getHeaderId(int paramInt)
  {
    if (getItemViewType(paramInt) == 0)
    {
      if (mPackIdCache.containsKey(Integer.valueOf(paramInt))) {
        return ((Long)mPackIdCache.get(Integer.valueOf(paramInt))).longValue();
      }
      long l = ((Cursor)getItem(paramInt)).getLong(9);
      mPackIdCache.put(Integer.valueOf(paramInt), Long.valueOf(l));
      return l;
    }
    return -1L;
  }
  
  public int getItemCheckedPosition()
  {
    return mCheckedItemPosition;
  }
  
  public int getItemViewTypeUnCached(int paramInt)
  {
    Cursor localCursor = (Cursor)getItem(paramInt);
    if ((localCursor != null) && (!localCursor.isBeforeFirst()) && (!localCursor.isAfterLast())) {
      return localCursor.getInt(4);
    }
    return -1;
  }
  
  protected void onBindContentViewHolder(int paramInt, final BaseViewHolder paramBaseViewHolder, final Cursor paramCursor)
  {
    String str2 = paramCursor.getString(5);
    String str1 = paramCursor.getString(3);
    Object localObject = paramCursor.getString(6);
    textView.setText(str2);
    identifier = str1;
    paramCursor = (CheckableRelativeLayout)itemView;
    boolean bool;
    if (mCheckedItemPosition == paramInt)
    {
      bool = true;
      paramCursor.setChecked(bool);
      if (packType != Cds.PackType.EFFECT) {
        break label150;
      }
    }
    for (paramCursor = "aviary_effect://" + (String)localObject + "/" + str1 + ".json";; paramCursor = paramCursor + "/" + str1 + "-small.png")
    {
      if (!Objects.equal(paramCursor, imageView.getTag())) {
        break label221;
      }
      Log.v("PacksListAdapter", "skip effect, already rendered");
      return;
      bool = false;
      break;
      label150:
      paramCursor = (Cursor)localObject;
      if (!((String)localObject).startsWith("file://")) {
        paramCursor = "file://" + (String)localObject;
      }
    }
    label221:
    imageView.setImageBitmap(null);
    localObject = picasso.load(Uri.parse(paramCursor));
    if (cache != null) {
      ((RequestCreator)localObject).withCache(cache);
    }
    if (packType == Cds.PackType.EFFECT)
    {
      ((RequestCreator)localObject).resize(cellWidth, cellWidth);
      ((RequestCreator)localObject).centerCrop();
    }
    ((RequestCreator)localObject).into(imageView, new Callback()
    {
      public void onError()
      {
        paramBaseViewHolderimageView.setTag(null);
      }
      
      public void onSuccess()
      {
        paramBaseViewHolderimageView.setTag(paramCursor);
      }
    });
  }
  
  protected void onBindExternalViewHolder(final BaseViewHolder paramBaseViewHolder, Cursor paramCursor)
  {
    String str1 = paramCursor.getString(3);
    String str2 = paramCursor.getString(5);
    Object localObject = paramCursor.getString(6);
    int i = paramCursor.getInt(8);
    final long l = paramCursor.getLong(0);
    textView.setText(str2);
    identifier = str1;
    free = i;
    paramCursor = new PaletteTransformation();
    localObject = picasso.load((String)localObject);
    ((RequestCreator)localObject).transform(paramCursor);
    if (cache != null) {
      ((RequestCreator)localObject).withCache(cache);
    }
    ((RequestCreator)localObject).into(imageView, new Callback()
    {
      public void onError()
      {
        Log.w("PacksListAdapter", "paletter generated error");
      }
      
      public void onSuccess()
      {
        PacksListAdapter.this.onBitmapLoaded((PacksListAdapter.ExternalPackViewHolder)paramBaseViewHolder, l, val$identifier);
      }
    });
  }
  
  public void onBindHeaderViewHolder(SectionHeaderViewHolder paramSectionHeaderViewHolder, int paramInt)
  {
    Object localObject = (Cursor)getItem(paramInt);
    if (localObject != null)
    {
      localObject = ((Cursor)localObject).getString(10);
      localObject = new PluginDividerDrawable(getContext(), R.style.AdobeImageWidget_ContentSectionHeaderText, (String)localObject);
      imageView.setImageDrawable((Drawable)localObject);
    }
  }
  
  protected void onBindInternalViewHolder(BaseViewHolder paramBaseViewHolder, Cursor paramCursor)
  {
    String str1 = paramCursor.getString(3);
    String str2 = paramCursor.getString(5);
    Object localObject = paramCursor.getString(6);
    int i = paramCursor.getInt(8);
    textView.setText(str2);
    identifier = str1;
    free = i;
    paramCursor = new PackIconTransformer.Builder().withResources(getContext().getResources()).withPackType(packType.toCdsString()).withPath((String)localObject).build();
    localObject = picasso.load((String)localObject);
    ((RequestCreator)localObject).transform(paramCursor);
    if (cache != null) {
      ((RequestCreator)localObject).withCache(cache);
    }
    ((RequestCreator)localObject).into(imageView);
  }
  
  public void onBindViewHolder(RecyclerView.ViewHolder paramViewHolder, int paramInt)
  {
    int i = paramViewHolder.getItemViewType();
    paramViewHolder = (BaseViewHolder)paramViewHolder;
    Cursor localCursor = (Cursor)getItem(paramInt);
    Log.i("PacksListAdapter", "onBindViewHolder: " + paramInt);
    if (i == 1) {
      onBindExternalViewHolder(paramViewHolder, localCursor);
    }
    do
    {
      return;
      if (i == 2)
      {
        onBindInternalViewHolder(paramViewHolder, localCursor);
        return;
      }
      if (i == 0)
      {
        onBindContentViewHolder(paramInt, paramViewHolder, localCursor);
        return;
      }
      if (i == 5)
      {
        itemView.getLayoutParams()).leftMargin = 0;
        return;
      }
    } while (i != 6);
    itemView.getLayoutParams()).rightMargin = 0;
  }
  
  public void onClick(View paramView)
  {
    caller.onItemClick(this, paramView);
  }
  
  protected void onContentChanged()
  {
    super.onContentChanged();
  }
  
  public SectionHeaderViewHolder onCreateHeaderViewHolder(ViewGroup paramViewGroup)
  {
    return new SectionHeaderViewHolder(mInflater.inflate(mDividerResId, paramViewGroup, false));
  }
  
  public BaseViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
  {
    Object localObject2;
    Object localObject3;
    Object localObject1;
    switch (paramInt)
    {
    case 3: 
    case 4: 
    default: 
      localObject2 = mInflater.inflate(mDefaultResId, paramViewGroup, false);
      localObject3 = new ContentPackViewHolder((View)localObject2);
      paramViewGroup = (ViewGroup)localObject3;
      localObject1 = localObject2;
      if (accentColor != 0)
      {
        UIUtils.setViewBackgroundTint(((View)localObject2).findViewById(R.id.image), accentColor);
        localObject1 = localObject2;
        paramViewGroup = (ViewGroup)localObject3;
      }
      break;
    }
    for (;;)
    {
      ((View)localObject1).setOnClickListener(this);
      return paramViewGroup;
      localObject1 = mInflater.inflate(mMoreResId, paramViewGroup, false);
      paramViewGroup = new LeftGetMoreViewHolder((View)localObject1);
      continue;
      localObject2 = mInflater.inflate(mMoreResId, paramViewGroup, false);
      localObject3 = new RightGetMoreViewHolder((View)localObject2);
      paramViewGroup = (ViewGroup)localObject3;
      localObject1 = localObject2;
      if (cellWidth * getItemCount() < caller.getOptionView().getWidth() + cellWidth * 3)
      {
        paramViewGroup = new RecyclerView.LayoutParams(0, 0);
        itemView.setLayoutParams(paramViewGroup);
        itemView.setVisibility(4);
        paramViewGroup = (ViewGroup)localObject3;
        localObject1 = localObject2;
        continue;
        localObject1 = mInflater.inflate(mInternalResId, paramViewGroup, false);
        paramViewGroup = new InternalPackViewHolder((View)localObject1);
        continue;
        localObject1 = mInflater.inflate(mExternalResId, paramViewGroup, false);
        paramViewGroup = new ExternalPackViewHolder((View)localObject1);
        continue;
        localObject1 = mInflater.inflate(mDividerResId, paramViewGroup, false);
        paramViewGroup = new SectionHeaderViewHolder((View)localObject1);
        localObject2 = new PluginDividerDrawable(getContext(), R.style.AdobeImageWidget_ContentSectionHeaderText, R.string.feather_owned);
        imageView.setImageDrawable((Drawable)localObject2);
      }
    }
  }
  
  public void setItemCheckedPosition(int paramInt, boolean paramBoolean)
  {
    Log.i("PacksListAdapter", "setItemCheckedPosition: " + paramInt + ", checked: " + paramBoolean);
    int i = mCheckedItemPosition;
    if (paramBoolean) {}
    for (;;)
    {
      mCheckedItemPosition = paramInt;
      notifyDataSetChanged();
      return;
      paramInt = -1;
    }
  }
  
  public Cursor swapCursor(Cursor paramCursor)
  {
    return super.swapCursor(paramCursor);
  }
  
  static abstract class BaseViewHolder
    extends RecyclerView.ViewHolder
  {
    ImageView imageView;
    TextView textView;
    
    public BaseViewHolder(View paramView)
    {
      super();
      imageView = ((ImageView)paramView.findViewById(R.id.image));
      textView = ((TextView)paramView.findViewById(R.id.text));
    }
  }
  
  static class Builder
  {
    private int accentColor;
    private Cache cache;
    private final PacksListAdapter.OnItemClickListener caller;
    private int cellWidth;
    private int contentResId;
    private final Context context;
    private final Cursor cursor;
    private int defaultPackTextBackgroundColor;
    private int dividerResId;
    private int externalResId;
    private int internalResId;
    private int moreResId;
    private Cds.PackType packType;
    private Picasso picasso;
    
    public Builder(Context paramContext, PacksListAdapter.OnItemClickListener paramOnItemClickListener, Cursor paramCursor)
    {
      caller = paramOnItemClickListener;
      context = paramContext;
      cursor = paramCursor;
    }
    
    public PacksListAdapter build()
    {
      PacksListAdapter localPacksListAdapter = new PacksListAdapter(context, contentResId, moreResId, externalResId, dividerResId, internalResId, cursor);
      PacksListAdapter.access$002(localPacksListAdapter, cellWidth);
      PacksListAdapter.access$102(localPacksListAdapter, packType);
      PacksListAdapter.access$202(localPacksListAdapter, picasso);
      PacksListAdapter.access$302(localPacksListAdapter, cache);
      PacksListAdapter.access$402(localPacksListAdapter, defaultPackTextBackgroundColor);
      PacksListAdapter.access$502(localPacksListAdapter, caller);
      PacksListAdapter.access$602(localPacksListAdapter, accentColor);
      return localPacksListAdapter;
    }
    
    public Builder setCellWidth(int paramInt)
    {
      cellWidth = paramInt;
      return this;
    }
    
    public Builder setContentResId(int paramInt)
    {
      contentResId = paramInt;
      return this;
    }
    
    public Builder setDefaultPackTextBackgroundColor(int paramInt)
    {
      defaultPackTextBackgroundColor = paramInt;
      return this;
    }
    
    public Builder setDividerResId(int paramInt)
    {
      dividerResId = paramInt;
      return this;
    }
    
    public Builder setExternalResId(int paramInt)
    {
      externalResId = paramInt;
      return this;
    }
    
    public Builder setInternalResId(int paramInt)
    {
      internalResId = paramInt;
      return this;
    }
    
    public Builder setPackType(Cds.PackType paramPackType)
    {
      packType = paramPackType;
      return this;
    }
    
    public Builder setPicasso(Picasso paramPicasso, Cache paramCache)
    {
      picasso = paramPicasso;
      cache = paramCache;
      return this;
    }
    
    public Builder setSupplyResId(int paramInt)
    {
      moreResId = paramInt;
      return this;
    }
    
    public Builder setTintColor(int paramInt)
    {
      accentColor = paramInt;
      return this;
    }
  }
  
  static class ContentPackViewHolder
    extends PacksListAdapter.BaseViewHolder
  {
    public String identifier;
    
    public ContentPackViewHolder(View paramView)
    {
      super();
    }
  }
  
  static class ExternalPackViewHolder
    extends PacksListAdapter.BaseViewHolder
  {
    int free;
    String identifier;
    
    public ExternalPackViewHolder(View paramView)
    {
      super();
    }
  }
  
  static class InternalPackViewHolder
    extends PacksListAdapter.ExternalPackViewHolder
  {
    public InternalPackViewHolder(View paramView)
    {
      super();
    }
  }
  
  static class LeftGetMoreViewHolder
    extends PacksListAdapter.BaseViewHolder
  {
    public LeftGetMoreViewHolder(View paramView)
    {
      super();
    }
  }
  
  public static abstract interface OnItemClickListener
    extends AbstractPanel.OptionPanel
  {
    public abstract void onItemClick(RecyclerView.Adapter paramAdapter, View paramView);
  }
  
  public static class PaletteTransformation
    implements Transformation
  {
    private final SoftReference<Palette.PaletteAsyncListener> callback;
    private int maxSize;
    public Palette palette;
    
    public PaletteTransformation()
    {
      callback = null;
      maxSize = -1;
    }
    
    public PaletteTransformation(Palette.PaletteAsyncListener paramPaletteAsyncListener)
    {
      callback = new SoftReference(paramPaletteAsyncListener);
    }
    
    public String key()
    {
      return "paletteTransformation";
    }
    
    public void resize(int paramInt)
    {
      maxSize = paramInt;
    }
    
    public Bitmap transform(Bitmap paramBitmap)
    {
      if (paramBitmap != null) {
        if (callback == null) {
          break label55;
        }
      }
      Palette.Builder localBuilder;
      label55:
      for (Palette.PaletteAsyncListener localPaletteAsyncListener = (Palette.PaletteAsyncListener)callback.get();; localPaletteAsyncListener = null)
      {
        localBuilder = Palette.from(paramBitmap);
        if (maxSize > 0) {
          localBuilder.resizeBitmapSize(maxSize);
        }
        if (localPaletteAsyncListener == null) {
          break;
        }
        localBuilder.generate(localPaletteAsyncListener);
        return paramBitmap;
      }
      palette = localBuilder.generate();
      return paramBitmap;
    }
  }
  
  static class RightGetMoreViewHolder
    extends PacksListAdapter.LeftGetMoreViewHolder
  {
    public RightGetMoreViewHolder(View paramView)
    {
      super();
    }
  }
  
  static class SectionHeaderViewHolder
    extends PacksListAdapter.BaseViewHolder
  {
    public SectionHeaderViewHolder(View paramView)
    {
      super();
    }
  }
}
