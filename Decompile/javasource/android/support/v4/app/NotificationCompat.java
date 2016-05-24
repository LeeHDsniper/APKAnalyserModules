package android.support.v4.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.graphics.Bitmap;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.widget.RemoteViews;
import java.util.ArrayList;
import java.util.Iterator;

public class NotificationCompat
{
  private static final NotificationCompatImpl IMPL = new NotificationCompatImplBase();
  
  static
  {
    if (Build.VERSION.SDK_INT >= 21)
    {
      IMPL = new NotificationCompatImplApi21();
      return;
    }
    if (Build.VERSION.SDK_INT >= 20)
    {
      IMPL = new NotificationCompatImplApi20();
      return;
    }
    if (Build.VERSION.SDK_INT >= 19)
    {
      IMPL = new NotificationCompatImplKitKat();
      return;
    }
    if (Build.VERSION.SDK_INT >= 16)
    {
      IMPL = new NotificationCompatImplJellybean();
      return;
    }
    if (Build.VERSION.SDK_INT >= 14)
    {
      IMPL = new NotificationCompatImplIceCreamSandwich();
      return;
    }
    if (Build.VERSION.SDK_INT >= 11)
    {
      IMPL = new NotificationCompatImplHoneycomb();
      return;
    }
    if (Build.VERSION.SDK_INT >= 9)
    {
      IMPL = new NotificationCompatImplGingerbread();
      return;
    }
  }
  
  private static void addActionsToBuilder(NotificationBuilderWithActions paramNotificationBuilderWithActions, ArrayList<Action> paramArrayList)
  {
    paramArrayList = paramArrayList.iterator();
    while (paramArrayList.hasNext()) {
      paramNotificationBuilderWithActions.addAction((Action)paramArrayList.next());
    }
  }
  
  private static void addStyleToBuilderJellybean(NotificationBuilderWithBuilderAccessor paramNotificationBuilderWithBuilderAccessor, Style paramStyle)
  {
    if (paramStyle != null)
    {
      if (!(paramStyle instanceof BigTextStyle)) {
        break label37;
      }
      paramStyle = (BigTextStyle)paramStyle;
      NotificationCompatJellybean.addBigTextStyle(paramNotificationBuilderWithBuilderAccessor, mBigContentTitle, mSummaryTextSet, mSummaryText, mBigText);
    }
    label37:
    do
    {
      return;
      if ((paramStyle instanceof InboxStyle))
      {
        paramStyle = (InboxStyle)paramStyle;
        NotificationCompatJellybean.addInboxStyle(paramNotificationBuilderWithBuilderAccessor, mBigContentTitle, mSummaryTextSet, mSummaryText, mTexts);
        return;
      }
    } while (!(paramStyle instanceof BigPictureStyle));
    paramStyle = (BigPictureStyle)paramStyle;
    NotificationCompatJellybean.addBigPictureStyle(paramNotificationBuilderWithBuilderAccessor, mBigContentTitle, mSummaryTextSet, mSummaryText, mPicture, mBigLargeIcon, mBigLargeIconSet);
  }
  
  public static class Action
    extends NotificationCompatBase.Action
  {
    public static final NotificationCompatBase.Action.Factory FACTORY = new NotificationCompatBase.Action.Factory() {};
    public PendingIntent actionIntent;
    public int icon;
    private final Bundle mExtras;
    private final RemoteInput[] mRemoteInputs;
    public CharSequence title;
    
    public PendingIntent getActionIntent()
    {
      return actionIntent;
    }
    
    public Bundle getExtras()
    {
      return mExtras;
    }
    
    public int getIcon()
    {
      return icon;
    }
    
    public RemoteInput[] getRemoteInputs()
    {
      return mRemoteInputs;
    }
    
    public CharSequence getTitle()
    {
      return title;
    }
  }
  
  public static class BigPictureStyle
    extends NotificationCompat.Style
  {
    Bitmap mBigLargeIcon;
    boolean mBigLargeIconSet;
    Bitmap mPicture;
    
    public BigPictureStyle() {}
  }
  
  public static class BigTextStyle
    extends NotificationCompat.Style
  {
    CharSequence mBigText;
    
    public BigTextStyle() {}
    
    public BigTextStyle bigText(CharSequence paramCharSequence)
    {
      mBigText = NotificationCompat.Builder.limitCharSequenceLength(paramCharSequence);
      return this;
    }
  }
  
  public static class Builder
  {
    public ArrayList<NotificationCompat.Action> mActions = new ArrayList();
    String mCategory;
    int mColor = 0;
    public CharSequence mContentInfo;
    PendingIntent mContentIntent;
    public CharSequence mContentText;
    public CharSequence mContentTitle;
    public Context mContext;
    Bundle mExtras;
    PendingIntent mFullScreenIntent;
    String mGroupKey;
    boolean mGroupSummary;
    public Bitmap mLargeIcon;
    boolean mLocalOnly = false;
    public Notification mNotification = new Notification();
    public int mNumber;
    public ArrayList<String> mPeople;
    int mPriority;
    int mProgress;
    boolean mProgressIndeterminate;
    int mProgressMax;
    Notification mPublicVersion;
    boolean mShowWhen = true;
    String mSortKey;
    public NotificationCompat.Style mStyle;
    public CharSequence mSubText;
    RemoteViews mTickerView;
    public boolean mUseChronometer;
    int mVisibility = 0;
    
    public Builder(Context paramContext)
    {
      mContext = paramContext;
      mNotification.when = System.currentTimeMillis();
      mNotification.audioStreamType = -1;
      mPriority = 0;
      mPeople = new ArrayList();
    }
    
    protected static CharSequence limitCharSequenceLength(CharSequence paramCharSequence)
    {
      if (paramCharSequence == null) {}
      while (paramCharSequence.length() <= 5120) {
        return paramCharSequence;
      }
      return paramCharSequence.subSequence(0, 5120);
    }
    
    private void setFlag(int paramInt, boolean paramBoolean)
    {
      if (paramBoolean)
      {
        localNotification = mNotification;
        flags |= paramInt;
        return;
      }
      Notification localNotification = mNotification;
      flags &= (paramInt ^ 0xFFFFFFFF);
    }
    
    public Notification build()
    {
      return NotificationCompat.IMPL.build(this, getExtender());
    }
    
    protected NotificationCompat.BuilderExtender getExtender()
    {
      return new NotificationCompat.BuilderExtender();
    }
    
    public Builder setAutoCancel(boolean paramBoolean)
    {
      setFlag(16, paramBoolean);
      return this;
    }
    
    public Builder setCategory(String paramString)
    {
      mCategory = paramString;
      return this;
    }
    
    public Builder setColor(int paramInt)
    {
      mColor = paramInt;
      return this;
    }
    
    public Builder setContentInfo(CharSequence paramCharSequence)
    {
      mContentInfo = limitCharSequenceLength(paramCharSequence);
      return this;
    }
    
    public Builder setContentIntent(PendingIntent paramPendingIntent)
    {
      mContentIntent = paramPendingIntent;
      return this;
    }
    
    public Builder setContentText(CharSequence paramCharSequence)
    {
      mContentText = limitCharSequenceLength(paramCharSequence);
      return this;
    }
    
    public Builder setContentTitle(CharSequence paramCharSequence)
    {
      mContentTitle = limitCharSequenceLength(paramCharSequence);
      return this;
    }
    
    public Builder setDefaults(int paramInt)
    {
      mNotification.defaults = paramInt;
      if ((paramInt & 0x4) != 0)
      {
        Notification localNotification = mNotification;
        flags |= 0x1;
      }
      return this;
    }
    
    public Builder setDeleteIntent(PendingIntent paramPendingIntent)
    {
      mNotification.deleteIntent = paramPendingIntent;
      return this;
    }
    
    public Builder setLargeIcon(Bitmap paramBitmap)
    {
      mLargeIcon = paramBitmap;
      return this;
    }
    
    public Builder setLocalOnly(boolean paramBoolean)
    {
      mLocalOnly = paramBoolean;
      return this;
    }
    
    public Builder setOngoing(boolean paramBoolean)
    {
      setFlag(2, paramBoolean);
      return this;
    }
    
    public Builder setPriority(int paramInt)
    {
      mPriority = paramInt;
      return this;
    }
    
    public Builder setProgress(int paramInt1, int paramInt2, boolean paramBoolean)
    {
      mProgressMax = paramInt1;
      mProgress = paramInt2;
      mProgressIndeterminate = paramBoolean;
      return this;
    }
    
    public Builder setSmallIcon(int paramInt)
    {
      mNotification.icon = paramInt;
      return this;
    }
    
    public Builder setStyle(NotificationCompat.Style paramStyle)
    {
      if (mStyle != paramStyle)
      {
        mStyle = paramStyle;
        if (mStyle != null) {
          mStyle.setBuilder(this);
        }
      }
      return this;
    }
    
    public Builder setSubText(CharSequence paramCharSequence)
    {
      mSubText = limitCharSequenceLength(paramCharSequence);
      return this;
    }
    
    public Builder setTicker(CharSequence paramCharSequence)
    {
      mNotification.tickerText = limitCharSequenceLength(paramCharSequence);
      return this;
    }
  }
  
  protected static class BuilderExtender
  {
    protected BuilderExtender() {}
    
    public Notification build(NotificationCompat.Builder paramBuilder, NotificationBuilderWithBuilderAccessor paramNotificationBuilderWithBuilderAccessor)
    {
      return paramNotificationBuilderWithBuilderAccessor.build();
    }
  }
  
  public static class InboxStyle
    extends NotificationCompat.Style
  {
    ArrayList<CharSequence> mTexts = new ArrayList();
    
    public InboxStyle() {}
    
    public InboxStyle addLine(CharSequence paramCharSequence)
    {
      mTexts.add(NotificationCompat.Builder.limitCharSequenceLength(paramCharSequence));
      return this;
    }
    
    public InboxStyle setSummaryText(CharSequence paramCharSequence)
    {
      mSummaryText = NotificationCompat.Builder.limitCharSequenceLength(paramCharSequence);
      mSummaryTextSet = true;
      return this;
    }
  }
  
  static abstract interface NotificationCompatImpl
  {
    public abstract Notification build(NotificationCompat.Builder paramBuilder, NotificationCompat.BuilderExtender paramBuilderExtender);
  }
  
  static class NotificationCompatImplApi20
    extends NotificationCompat.NotificationCompatImplKitKat
  {
    NotificationCompatImplApi20() {}
    
    public Notification build(NotificationCompat.Builder paramBuilder, NotificationCompat.BuilderExtender paramBuilderExtender)
    {
      NotificationCompatApi20.Builder localBuilder = new NotificationCompatApi20.Builder(mContext, mNotification, mContentTitle, mContentText, mContentInfo, mTickerView, mNumber, mContentIntent, mFullScreenIntent, mLargeIcon, mProgressMax, mProgress, mProgressIndeterminate, mShowWhen, mUseChronometer, mPriority, mSubText, mLocalOnly, mPeople, mExtras, mGroupKey, mGroupSummary, mSortKey);
      NotificationCompat.addActionsToBuilder(localBuilder, mActions);
      NotificationCompat.addStyleToBuilderJellybean(localBuilder, mStyle);
      return paramBuilderExtender.build(paramBuilder, localBuilder);
    }
  }
  
  static class NotificationCompatImplApi21
    extends NotificationCompat.NotificationCompatImplApi20
  {
    NotificationCompatImplApi21() {}
    
    public Notification build(NotificationCompat.Builder paramBuilder, NotificationCompat.BuilderExtender paramBuilderExtender)
    {
      NotificationCompatApi21.Builder localBuilder = new NotificationCompatApi21.Builder(mContext, mNotification, mContentTitle, mContentText, mContentInfo, mTickerView, mNumber, mContentIntent, mFullScreenIntent, mLargeIcon, mProgressMax, mProgress, mProgressIndeterminate, mShowWhen, mUseChronometer, mPriority, mSubText, mLocalOnly, mCategory, mPeople, mExtras, mColor, mVisibility, mPublicVersion, mGroupKey, mGroupSummary, mSortKey);
      NotificationCompat.addActionsToBuilder(localBuilder, mActions);
      NotificationCompat.addStyleToBuilderJellybean(localBuilder, mStyle);
      return paramBuilderExtender.build(paramBuilder, localBuilder);
    }
  }
  
  static class NotificationCompatImplBase
    implements NotificationCompat.NotificationCompatImpl
  {
    NotificationCompatImplBase() {}
    
    public Notification build(NotificationCompat.Builder paramBuilder, NotificationCompat.BuilderExtender paramBuilderExtender)
    {
      paramBuilderExtender = mNotification;
      paramBuilderExtender.setLatestEventInfo(mContext, mContentTitle, mContentText, mContentIntent);
      if (mPriority > 0) {
        flags |= 0x80;
      }
      return paramBuilderExtender;
    }
  }
  
  static class NotificationCompatImplGingerbread
    extends NotificationCompat.NotificationCompatImplBase
  {
    NotificationCompatImplGingerbread() {}
    
    public Notification build(NotificationCompat.Builder paramBuilder, NotificationCompat.BuilderExtender paramBuilderExtender)
    {
      paramBuilderExtender = mNotification;
      paramBuilderExtender.setLatestEventInfo(mContext, mContentTitle, mContentText, mContentIntent);
      paramBuilderExtender = NotificationCompatGingerbread.add(paramBuilderExtender, mContext, mContentTitle, mContentText, mContentIntent, mFullScreenIntent);
      if (mPriority > 0) {
        flags |= 0x80;
      }
      return paramBuilderExtender;
    }
  }
  
  static class NotificationCompatImplHoneycomb
    extends NotificationCompat.NotificationCompatImplBase
  {
    NotificationCompatImplHoneycomb() {}
    
    public Notification build(NotificationCompat.Builder paramBuilder, NotificationCompat.BuilderExtender paramBuilderExtender)
    {
      return NotificationCompatHoneycomb.add(mContext, mNotification, mContentTitle, mContentText, mContentInfo, mTickerView, mNumber, mContentIntent, mFullScreenIntent, mLargeIcon);
    }
  }
  
  static class NotificationCompatImplIceCreamSandwich
    extends NotificationCompat.NotificationCompatImplBase
  {
    NotificationCompatImplIceCreamSandwich() {}
    
    public Notification build(NotificationCompat.Builder paramBuilder, NotificationCompat.BuilderExtender paramBuilderExtender)
    {
      return paramBuilderExtender.build(paramBuilder, new NotificationCompatIceCreamSandwich.Builder(mContext, mNotification, mContentTitle, mContentText, mContentInfo, mTickerView, mNumber, mContentIntent, mFullScreenIntent, mLargeIcon, mProgressMax, mProgress, mProgressIndeterminate));
    }
  }
  
  static class NotificationCompatImplJellybean
    extends NotificationCompat.NotificationCompatImplBase
  {
    NotificationCompatImplJellybean() {}
    
    public Notification build(NotificationCompat.Builder paramBuilder, NotificationCompat.BuilderExtender paramBuilderExtender)
    {
      NotificationCompatJellybean.Builder localBuilder = new NotificationCompatJellybean.Builder(mContext, mNotification, mContentTitle, mContentText, mContentInfo, mTickerView, mNumber, mContentIntent, mFullScreenIntent, mLargeIcon, mProgressMax, mProgress, mProgressIndeterminate, mUseChronometer, mPriority, mSubText, mLocalOnly, mExtras, mGroupKey, mGroupSummary, mSortKey);
      NotificationCompat.addActionsToBuilder(localBuilder, mActions);
      NotificationCompat.addStyleToBuilderJellybean(localBuilder, mStyle);
      return paramBuilderExtender.build(paramBuilder, localBuilder);
    }
  }
  
  static class NotificationCompatImplKitKat
    extends NotificationCompat.NotificationCompatImplJellybean
  {
    NotificationCompatImplKitKat() {}
    
    public Notification build(NotificationCompat.Builder paramBuilder, NotificationCompat.BuilderExtender paramBuilderExtender)
    {
      NotificationCompatKitKat.Builder localBuilder = new NotificationCompatKitKat.Builder(mContext, mNotification, mContentTitle, mContentText, mContentInfo, mTickerView, mNumber, mContentIntent, mFullScreenIntent, mLargeIcon, mProgressMax, mProgress, mProgressIndeterminate, mShowWhen, mUseChronometer, mPriority, mSubText, mLocalOnly, mPeople, mExtras, mGroupKey, mGroupSummary, mSortKey);
      NotificationCompat.addActionsToBuilder(localBuilder, mActions);
      NotificationCompat.addStyleToBuilderJellybean(localBuilder, mStyle);
      return paramBuilderExtender.build(paramBuilder, localBuilder);
    }
  }
  
  public static abstract class Style
  {
    CharSequence mBigContentTitle;
    NotificationCompat.Builder mBuilder;
    CharSequence mSummaryText;
    boolean mSummaryTextSet = false;
    
    public Style() {}
    
    public void setBuilder(NotificationCompat.Builder paramBuilder)
    {
      if (mBuilder != paramBuilder)
      {
        mBuilder = paramBuilder;
        if (mBuilder != null) {
          mBuilder.setStyle(this);
        }
      }
    }
  }
}
