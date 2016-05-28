package android.support.v7.widget;

import java.util.List;

class OpReorderer
{
  final Callback mCallback;
  
  public OpReorderer(Callback paramCallback)
  {
    mCallback = paramCallback;
  }
  
  private int getLastMoveOutOfOrder(List<AdapterHelper.UpdateOp> paramList)
  {
    int j = 0;
    int i = paramList.size() - 1;
    while (i >= 0)
    {
      int k;
      if (getcmd == 3)
      {
        k = j;
        if (j != 0) {
          return i;
        }
      }
      else
      {
        k = 1;
      }
      i -= 1;
      j = k;
    }
    return -1;
  }
  
  private void swapMoveAdd(List<AdapterHelper.UpdateOp> paramList, int paramInt1, AdapterHelper.UpdateOp paramUpdateOp1, int paramInt2, AdapterHelper.UpdateOp paramUpdateOp2)
  {
    int i = 0;
    if (itemCount < positionStart) {
      i = 0 - 1;
    }
    int j = i;
    if (positionStart < positionStart) {
      j = i + 1;
    }
    if (positionStart <= positionStart) {
      positionStart += itemCount;
    }
    if (positionStart <= itemCount) {
      itemCount += itemCount;
    }
    positionStart += j;
    paramList.set(paramInt1, paramUpdateOp2);
    paramList.set(paramInt2, paramUpdateOp1);
  }
  
  private void swapMoveOp(List<AdapterHelper.UpdateOp> paramList, int paramInt1, int paramInt2)
  {
    AdapterHelper.UpdateOp localUpdateOp1 = (AdapterHelper.UpdateOp)paramList.get(paramInt1);
    AdapterHelper.UpdateOp localUpdateOp2 = (AdapterHelper.UpdateOp)paramList.get(paramInt2);
    switch (cmd)
    {
    default: 
      return;
    case 1: 
      swapMoveRemove(paramList, paramInt1, localUpdateOp1, paramInt2, localUpdateOp2);
      return;
    case 0: 
      swapMoveAdd(paramList, paramInt1, localUpdateOp1, paramInt2, localUpdateOp2);
      return;
    }
    swapMoveUpdate(paramList, paramInt1, localUpdateOp1, paramInt2, localUpdateOp2);
  }
  
  void reorderOps(List<AdapterHelper.UpdateOp> paramList)
  {
    for (;;)
    {
      int i = getLastMoveOutOfOrder(paramList);
      if (i == -1) {
        break;
      }
      swapMoveOp(paramList, i, i + 1);
    }
  }
  
  void swapMoveRemove(List<AdapterHelper.UpdateOp> paramList, int paramInt1, AdapterHelper.UpdateOp paramUpdateOp1, int paramInt2, AdapterHelper.UpdateOp paramUpdateOp2)
  {
    AdapterHelper.UpdateOp localUpdateOp = null;
    int k = 0;
    int m;
    int j;
    int i;
    if (positionStart < itemCount)
    {
      m = 0;
      j = m;
      i = k;
      if (positionStart == positionStart)
      {
        j = m;
        i = k;
        if (itemCount == itemCount - positionStart)
        {
          i = 1;
          j = m;
        }
      }
      if (itemCount >= positionStart) {
        break label215;
      }
      positionStart -= 1;
      label96:
      if (positionStart > positionStart) {
        break label284;
      }
      positionStart += 1;
      label120:
      if (i == 0) {
        break label366;
      }
      paramList.set(paramInt1, paramUpdateOp2);
      paramList.remove(paramInt2);
      mCallback.recycleUpdateOp(paramUpdateOp1);
    }
    label215:
    label284:
    label366:
    label638:
    label648:
    for (;;)
    {
      return;
      m = 1;
      j = m;
      i = k;
      if (positionStart != itemCount + 1) {
        break;
      }
      j = m;
      i = k;
      if (itemCount != positionStart - itemCount) {
        break;
      }
      i = 1;
      j = m;
      break;
      if (itemCount >= positionStart + itemCount) {
        break label96;
      }
      itemCount -= 1;
      cmd = 1;
      itemCount = 1;
      if (itemCount == 0)
      {
        paramList.remove(paramInt2);
        mCallback.recycleUpdateOp(paramUpdateOp2);
        return;
        if (positionStart >= positionStart + itemCount) {
          break label120;
        }
        k = positionStart;
        m = itemCount;
        int n = positionStart;
        localUpdateOp = mCallback.obtainUpdateOp(1, positionStart + 1, k + m - n);
        itemCount = (positionStart - positionStart);
        break label120;
        if (j != 0)
        {
          if (localUpdateOp != null)
          {
            if (positionStart > positionStart) {
              positionStart -= itemCount;
            }
            if (itemCount > positionStart) {
              itemCount -= itemCount;
            }
          }
          if (positionStart > positionStart) {
            positionStart -= itemCount;
          }
          if (itemCount > positionStart) {
            itemCount -= itemCount;
          }
          paramList.set(paramInt1, paramUpdateOp2);
          if (positionStart == itemCount) {
            break label638;
          }
          paramList.set(paramInt2, paramUpdateOp1);
        }
        for (;;)
        {
          if (localUpdateOp == null) {
            break label648;
          }
          paramList.add(paramInt1, localUpdateOp);
          return;
          if (localUpdateOp != null)
          {
            if (positionStart >= positionStart) {
              positionStart -= itemCount;
            }
            if (itemCount >= positionStart) {
              itemCount -= itemCount;
            }
          }
          if (positionStart >= positionStart) {
            positionStart -= itemCount;
          }
          if (itemCount < positionStart) {
            break;
          }
          itemCount -= itemCount;
          break;
          paramList.remove(paramInt2);
        }
      }
    }
  }
  
  void swapMoveUpdate(List<AdapterHelper.UpdateOp> paramList, int paramInt1, AdapterHelper.UpdateOp paramUpdateOp1, int paramInt2, AdapterHelper.UpdateOp paramUpdateOp2)
  {
    Object localObject1 = null;
    Object localObject2 = null;
    if (itemCount < positionStart)
    {
      positionStart -= 1;
      if (positionStart > positionStart) {
        break label161;
      }
      positionStart += 1;
      label54:
      paramList.set(paramInt2, paramUpdateOp1);
      if (itemCount <= 0) {
        break label233;
      }
      paramList.set(paramInt1, paramUpdateOp2);
    }
    for (;;)
    {
      if (localObject1 != null) {
        paramList.add(paramInt1, localObject1);
      }
      if (localObject2 != null) {
        paramList.add(paramInt1, localObject2);
      }
      return;
      if (itemCount >= positionStart + itemCount) {
        break;
      }
      itemCount -= 1;
      localObject1 = mCallback.obtainUpdateOp(2, positionStart, 1);
      break;
      label161:
      if (positionStart >= positionStart + itemCount) {
        break label54;
      }
      int i = positionStart + itemCount - positionStart;
      localObject2 = mCallback.obtainUpdateOp(2, positionStart + 1, i);
      itemCount -= i;
      break label54;
      label233:
      paramList.remove(paramInt1);
      mCallback.recycleUpdateOp(paramUpdateOp2);
    }
  }
  
  static abstract interface Callback
  {
    public abstract AdapterHelper.UpdateOp obtainUpdateOp(int paramInt1, int paramInt2, int paramInt3);
    
    public abstract void recycleUpdateOp(AdapterHelper.UpdateOp paramUpdateOp);
  }
}
