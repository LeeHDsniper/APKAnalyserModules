package android.support.v4.app;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build.VERSION;
import android.widget.RemoteViews;
import java.util.ArrayList;
import java.util.Iterator;

public class NotificationCompat
{
  public static final int FLAG_HIGH_PRIORITY = 128;
  private static final NotificationCompatImpl IMPL = new NotificationCompatImplBase();
  public static final int PRIORITY_DEFAULT = 0;
  public static final int PRIORITY_HIGH = 1;
  public static final int PRIORITY_LOW = -1;
  public static final int PRIORITY_MAX = 2;
  public static final int PRIORITY_MIN = -2;
  
  static
  {
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
  }
  
  public NotificationCompat() {}
  
  public static class Action
  {
    public PendingIntent actionIntent;
    public int icon;
    public CharSequence title;
    
    public Action(int paramInt, CharSequence paramCharSequence, PendingIntent paramPendingIntent)
    {
      icon = paramInt;
      title = paramCharSequence;
      actionIntent = paramPendingIntent;
    }
  }
  
  public static class BigPictureStyle
    extends NotificationCompat.Style
  {
    Bitmap mBigLargeIcon;
    boolean mBigLargeIconSet;
    Bitmap mPicture;
    
    public BigPictureStyle() {}
    
    public BigPictureStyle(NotificationCompat.Builder paramBuilder)
    {
      setBuilder(paramBuilder);
    }
    
    public BigPictureStyle bigLargeIcon(Bitmap paramBitmap)
    {
      mBigLargeIcon = paramBitmap;
      mBigLargeIconSet = true;
      return this;
    }
    
    public BigPictureStyle bigPicture(Bitmap paramBitmap)
    {
      mPicture = paramBitmap;
      return this;
    }
    
    public BigPictureStyle setBigContentTitle(CharSequence paramCharSequence)
    {
      mBigContentTitle = paramCharSequence;
      return this;
    }
    
    public BigPictureStyle setSummaryText(CharSequence paramCharSequence)
    {
      mSummaryText = paramCharSequence;
      mSummaryTextSet = true;
      return this;
    }
  }
  
  public static class BigTextStyle
    extends NotificationCompat.Style
  {
    CharSequence mBigText;
    
    public BigTextStyle() {}
    
    public BigTextStyle(NotificationCompat.Builder paramBuilder)
    {
      setBuilder(paramBuilder);
    }
    
    public BigTextStyle bigText(CharSequence paramCharSequence)
    {
      mBigText = paramCharSequence;
      return this;
    }
    
    public BigTextStyle setBigContentTitle(CharSequence paramCharSequence)
    {
      mBigContentTitle = paramCharSequence;
      return this;
    }
    
    public BigTextStyle setSummaryText(CharSequence paramCharSequence)
    {
      mSummaryText = paramCharSequence;
      mSummaryTextSet = true;
      return this;
    }
  }
  
  public static class Builder
  {
    ArrayList<NotificationCompat.Action> mActions = new ArrayList();
    CharSequence mContentInfo;
    PendingIntent mContentIntent;
    CharSequence mContentText;
    CharSequence mContentTitle;
    Context mContext;
    PendingIntent mFullScreenIntent;
    Bitmap mLargeIcon;
    Notification mNotification = new Notification();
    int mNumber;
    int mPriority;
    int mProgress;
    boolean mProgressIndeterminate;
    int mProgressMax;
    NotificationCompat.Style mStyle;
    CharSequence mSubText;
    RemoteViews mTickerView;
    boolean mUseChronometer;
    
    public Builder(Context paramContext)
    {
      mContext = paramContext;
      mNotification.when = System.currentTimeMillis();
      mNotification.audioStreamType = -1;
      mPriority = 0;
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
    
    public Builder addAction(int paramInt, CharSequence paramCharSequence, PendingIntent paramPendingIntent)
    {
      mActions.add(new NotificationCompat.Action(paramInt, paramCharSequence, paramPendingIntent));
      return this;
    }
    
    public Notification build()
    {
      return NotificationCompat.IMPL.build(this);
    }
    
    @Deprecated
    public Notification getNotification()
    {
      return NotificationCompat.IMPL.build(this);
    }
    
    public Builder setAutoCancel(boolean paramBoolean)
    {
      setFlag(16, paramBoolean);
      return this;
    }
    
    public Builder setContent(RemoteViews paramRemoteViews)
    {
      mNotification.contentView = paramRemoteViews;
      return this;
    }
    
    public Builder setContentInfo(CharSequence paramCharSequence)
    {
      mContentInfo = paramCharSequence;
      return this;
    }
    
    public Builder setContentIntent(PendingIntent paramPendingIntent)
    {
      mContentIntent = paramPendingIntent;
      return this;
    }
    
    public Builder setContentText(CharSequence paramCharSequence)
    {
      mContentText = paramCharSequence;
      return this;
    }
    
    public Builder setContentTitle(CharSequence paramCharSequence)
    {
      mContentTitle = paramCharSequence;
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
    
    public Builder setFullScreenIntent(PendingIntent paramPendingIntent, boolean paramBoolean)
    {
      mFullScreenIntent = paramPendingIntent;
      setFlag(128, paramBoolean);
      return this;
    }
    
    public Builder setLargeIcon(Bitmap paramBitmap)
    {
      mLargeIcon = paramBitmap;
      return this;
    }
    
    public Builder setLights(int paramInt1, int paramInt2, int paramInt3)
    {
      int i = 1;
      mNotification.ledARGB = paramInt1;
      mNotification.ledOnMS = paramInt2;
      mNotification.ledOffMS = paramInt3;
      Notification localNotification;
      if ((mNotification.ledOnMS != 0) && (mNotification.ledOffMS != 0))
      {
        paramInt1 = 1;
        localNotification = mNotification;
        paramInt2 = mNotification.flags;
        if (paramInt1 == 0) {
          break label88;
        }
      }
      label88:
      for (paramInt1 = i;; paramInt1 = 0)
      {
        flags = (paramInt1 | paramInt2 & 0xFFFFFFFE);
        return this;
        paramInt1 = 0;
        break;
      }
    }
    
    public Builder setNumber(int paramInt)
    {
      mNumber = paramInt;
      return this;
    }
    
    public Builder setOngoing(boolean paramBoolean)
    {
      setFlag(2, paramBoolean);
      return this;
    }
    
    public Builder setOnlyAlertOnce(boolean paramBoolean)
    {
      setFlag(8, paramBoolean);
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
    
    public Builder setSmallIcon(int paramInt1, int paramInt2)
    {
      mNotification.icon = paramInt1;
      mNotification.iconLevel = paramInt2;
      return this;
    }
    
    public Builder setSound(Uri paramUri)
    {
      mNotification.sound = paramUri;
      mNotification.audioStreamType = -1;
      return this;
    }
    
    public Builder setSound(Uri paramUri, int paramInt)
    {
      mNotification.sound = paramUri;
      mNotification.audioStreamType = paramInt;
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
      mSubText = paramCharSequence;
      return this;
    }
    
    public Builder setTicker(CharSequence paramCharSequence)
    {
      mNotification.tickerText = paramCharSequence;
      return this;
    }
    
    public Builder setTicker(CharSequence paramCharSequence, RemoteViews paramRemoteViews)
    {
      mNotification.tickerText = paramCharSequence;
      mTickerView = paramRemoteViews;
      return this;
    }
    
    public Builder setUsesChronometer(boolean paramBoolean)
    {
      mUseChronometer = paramBoolean;
      return this;
    }
    
    public Builder setVibrate(long[] paramArrayOfLong)
    {
      mNotification.vibrate = paramArrayOfLong;
      return this;
    }
    
    public Builder setWhen(long paramLong)
    {
      mNotification.when = paramLong;
      return this;
    }
  }
  
  public static class InboxStyle
    extends NotificationCompat.Style
  {
    ArrayList<CharSequence> mTexts = new ArrayList();
    
    public InboxStyle() {}
    
    public InboxStyle(NotificationCompat.Builder paramBuilder)
    {
      setBuilder(paramBuilder);
    }
    
    public InboxStyle addLine(CharSequence paramCharSequence)
    {
      mTexts.add(paramCharSequence);
      return this;
    }
    
    public InboxStyle setBigContentTitle(CharSequence paramCharSequence)
    {
      mBigContentTitle = paramCharSequence;
      return this;
    }
    
    public InboxStyle setSummaryText(CharSequence paramCharSequence)
    {
      mSummaryText = paramCharSequence;
      mSummaryTextSet = true;
      return this;
    }
  }
  
  static abstract interface NotificationCompatImpl
  {
    public abstract Notification build(NotificationCompat.Builder paramBuilder);
  }
  
  static class NotificationCompatImplBase
    implements NotificationCompat.NotificationCompatImpl
  {
    NotificationCompatImplBase() {}
    
    public Notification build(NotificationCompat.Builder paramBuilder)
    {
      Notification localNotification = mNotification;
      localNotification.setLatestEventInfo(mContext, mContentTitle, mContentText, mContentIntent);
      if (mPriority > 0) {
        flags |= 0x80;
      }
      return localNotification;
    }
  }
  
  static class NotificationCompatImplHoneycomb
    implements NotificationCompat.NotificationCompatImpl
  {
    NotificationCompatImplHoneycomb() {}
    
    public Notification build(NotificationCompat.Builder paramBuilder)
    {
      return NotificationCompatHoneycomb.add(mContext, mNotification, mContentTitle, mContentText, mContentInfo, mTickerView, mNumber, mContentIntent, mFullScreenIntent, mLargeIcon);
    }
  }
  
  static class NotificationCompatImplIceCreamSandwich
    implements NotificationCompat.NotificationCompatImpl
  {
    NotificationCompatImplIceCreamSandwich() {}
    
    public Notification build(NotificationCompat.Builder paramBuilder)
    {
      return NotificationCompatIceCreamSandwich.add(mContext, mNotification, mContentTitle, mContentText, mContentInfo, mTickerView, mNumber, mContentIntent, mFullScreenIntent, mLargeIcon, mProgressMax, mProgress, mProgressIndeterminate);
    }
  }
  
  static class NotificationCompatImplJellybean
    implements NotificationCompat.NotificationCompatImpl
  {
    NotificationCompatImplJellybean() {}
    
    public Notification build(NotificationCompat.Builder paramBuilder)
    {
      NotificationCompatJellybean localNotificationCompatJellybean = new NotificationCompatJellybean(mContext, mNotification, mContentTitle, mContentText, mContentInfo, mTickerView, mNumber, mContentIntent, mFullScreenIntent, mLargeIcon, mProgressMax, mProgress, mProgressIndeterminate, mUseChronometer, mPriority, mSubText);
      Iterator localIterator = mActions.iterator();
      while (localIterator.hasNext())
      {
        NotificationCompat.Action localAction = (NotificationCompat.Action)localIterator.next();
        localNotificationCompatJellybean.addAction(icon, title, actionIntent);
      }
      if (mStyle != null)
      {
        if (!(mStyle instanceof NotificationCompat.BigTextStyle)) {
          break label172;
        }
        paramBuilder = (NotificationCompat.BigTextStyle)mStyle;
        localNotificationCompatJellybean.addBigTextStyle(mBigContentTitle, mSummaryTextSet, mSummaryText, mBigText);
      }
      for (;;)
      {
        return localNotificationCompatJellybean.build();
        label172:
        if ((mStyle instanceof NotificationCompat.InboxStyle))
        {
          paramBuilder = (NotificationCompat.InboxStyle)mStyle;
          localNotificationCompatJellybean.addInboxStyle(mBigContentTitle, mSummaryTextSet, mSummaryText, mTexts);
        }
        else if ((mStyle instanceof NotificationCompat.BigPictureStyle))
        {
          paramBuilder = (NotificationCompat.BigPictureStyle)mStyle;
          localNotificationCompatJellybean.addBigPictureStyle(mBigContentTitle, mSummaryTextSet, mSummaryText, mPicture, mBigLargeIcon, mBigLargeIconSet);
        }
      }
    }
  }
  
  public static abstract class Style
  {
    CharSequence mBigContentTitle;
    NotificationCompat.Builder mBuilder;
    CharSequence mSummaryText;
    boolean mSummaryTextSet = false;
    
    public Style() {}
    
    public Notification build()
    {
      Notification localNotification = null;
      if (mBuilder != null) {
        localNotification = mBuilder.build();
      }
      return localNotification;
    }
    
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
