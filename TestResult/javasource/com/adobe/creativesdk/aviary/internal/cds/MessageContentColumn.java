package com.adobe.creativesdk.aviary.internal.cds;

import android.database.Cursor;

public final class MessageContentColumn
{
  public static final class MessageContentCursorWrapper
    extends VersionColumns.BaseCursorWrapper
  {
    private String actionButtonText;
    private String beginDate;
    private String contentIdentifier;
    private String contentPath;
    private String contentURL;
    private String dismissButtonText;
    private String endDate;
    private String layoutStyle;
    private long messageId;
    private String paragraph;
    private boolean showNewBanner;
    private String title;
    private boolean visited;
    
    public MessageContentCursorWrapper(long paramLong1, long paramLong2)
    {
      super();
      messageId = paramLong2;
    }
    
    public static MessageContentCursorWrapper create(Cursor paramCursor)
    {
      boolean bool2 = true;
      if (VersionColumns.CursorWrapper.isValid(paramCursor))
      {
        MessageContentCursorWrapper localMessageContentCursorWrapper = new MessageContentCursorWrapper(paramCursor.getLong(paramCursor.getColumnIndex("msgcnt_id")), paramCursor.getLong(paramCursor.getColumnIndex("msgcnt_messageId")));
        int i = paramCursor.getColumnIndex("msgcnt_contentIdentifier");
        if (i > -1) {
          contentIdentifier = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("msgcnt_beginDate");
        if (i > -1) {
          beginDate = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("msgcnt_endDate");
        if (i > -1) {
          endDate = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("msgcnt_title");
        if (i > -1) {
          title = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("msgcnt_paragraph");
        if (i > -1) {
          paragraph = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("msgcnt_dismissButton");
        if (i > -1) {
          dismissButtonText = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("msgcnt_actionButton");
        if (i > -1) {
          actionButtonText = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("msgcnt_contentURL");
        if (i > -1) {
          contentURL = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("msgcnt_layoutStyle");
        if (i > -1) {
          layoutStyle = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("msgcnt_showNewBanner");
        if (i > -1)
        {
          if (paramCursor.getInt(i) == 1)
          {
            bool1 = true;
            showNewBanner = bool1;
          }
        }
        else
        {
          i = paramCursor.getColumnIndex("msgcnt_visited");
          if (i > -1) {
            if (paramCursor.getInt(i) != 1) {
              break label380;
            }
          }
        }
        label380:
        for (boolean bool1 = bool2;; bool1 = false)
        {
          visited = bool1;
          i = paramCursor.getColumnIndex("msgcnt_contentPath");
          if (i > -1) {
            contentPath = paramCursor.getString(i);
          }
          return localMessageContentCursorWrapper;
          bool1 = false;
          break;
        }
      }
      return null;
    }
    
    public Object clone()
    {
      MessageContentCursorWrapper localMessageContentCursorWrapper = new MessageContentCursorWrapper(id, messageId);
      contentIdentifier = contentIdentifier;
      beginDate = beginDate;
      endDate = endDate;
      title = title;
      paragraph = paragraph;
      dismissButtonText = dismissButtonText;
      actionButtonText = actionButtonText;
      contentURL = contentURL;
      layoutStyle = layoutStyle;
      showNewBanner = showNewBanner;
      contentPath = contentPath;
      visited = visited;
      return localMessageContentCursorWrapper;
    }
    
    public String getActionButtonText()
    {
      return actionButtonText;
    }
    
    public String getBeginDate()
    {
      return beginDate;
    }
    
    public String getContentIdentifier()
    {
      return contentIdentifier;
    }
    
    public String getContentPath()
    {
      return contentPath;
    }
    
    public String getContentURL()
    {
      return contentURL;
    }
    
    public String getDismissButtonText()
    {
      return dismissButtonText;
    }
    
    public String getEndDate()
    {
      return endDate;
    }
    
    public String getLayoutStyle()
    {
      return layoutStyle;
    }
    
    public long getMessageId()
    {
      return messageId;
    }
    
    public String getParagraph()
    {
      return paragraph;
    }
    
    public String getTitle()
    {
      return title;
    }
    
    public boolean isShowNewBanner()
    {
      return showNewBanner;
    }
  }
}
