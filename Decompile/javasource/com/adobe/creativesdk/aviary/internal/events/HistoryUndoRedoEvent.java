package com.adobe.creativesdk.aviary.internal.events;

public class HistoryUndoRedoEvent
{
  public final boolean isUndo;
  
  public HistoryUndoRedoEvent(boolean paramBoolean)
  {
    isUndo = paramBoolean;
  }
}
