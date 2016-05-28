package android.support.v7.widget;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.view.View;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class DefaultItemAnimator
  extends RecyclerView.ItemAnimator
{
  private ArrayList<RecyclerView.ViewHolder> mAddAnimations = new ArrayList();
  private ArrayList<ArrayList<RecyclerView.ViewHolder>> mAdditionsList = new ArrayList();
  private ArrayList<RecyclerView.ViewHolder> mChangeAnimations = new ArrayList();
  private ArrayList<ArrayList<ChangeInfo>> mChangesList = new ArrayList();
  private ArrayList<RecyclerView.ViewHolder> mMoveAnimations = new ArrayList();
  private ArrayList<ArrayList<MoveInfo>> mMovesList = new ArrayList();
  private ArrayList<RecyclerView.ViewHolder> mPendingAdditions = new ArrayList();
  private ArrayList<ChangeInfo> mPendingChanges = new ArrayList();
  private ArrayList<MoveInfo> mPendingMoves = new ArrayList();
  private ArrayList<RecyclerView.ViewHolder> mPendingRemovals = new ArrayList();
  private ArrayList<RecyclerView.ViewHolder> mRemoveAnimations = new ArrayList();
  
  public DefaultItemAnimator() {}
  
  private void animateAddImpl(final RecyclerView.ViewHolder paramViewHolder)
  {
    final ViewPropertyAnimatorCompat localViewPropertyAnimatorCompat = ViewCompat.animate(itemView);
    mAddAnimations.add(paramViewHolder);
    localViewPropertyAnimatorCompat.alpha(1.0F).setDuration(getAddDuration()).setListener(new VpaListenerAdapter(paramViewHolder)
    {
      public void onAnimationCancel(View paramAnonymousView)
      {
        ViewCompat.setAlpha(paramAnonymousView, 1.0F);
      }
      
      public void onAnimationEnd(View paramAnonymousView)
      {
        localViewPropertyAnimatorCompat.setListener(null);
        dispatchAddFinished(paramViewHolder);
        mAddAnimations.remove(paramViewHolder);
        DefaultItemAnimator.this.dispatchFinishedWhenDone();
      }
      
      public void onAnimationStart(View paramAnonymousView)
      {
        dispatchAddStarting(paramViewHolder);
      }
    }).start();
  }
  
  private void animateChangeImpl(final ChangeInfo paramChangeInfo)
  {
    Object localObject1 = oldHolder;
    if (localObject1 == null)
    {
      localObject1 = null;
      localObject2 = newHolder;
      if (localObject2 == null) {
        break label171;
      }
    }
    label171:
    for (Object localObject2 = itemView;; localObject2 = null)
    {
      if (localObject1 != null)
      {
        localObject1 = ViewCompat.animate((View)localObject1).setDuration(getChangeDuration());
        mChangeAnimations.add(oldHolder);
        ((ViewPropertyAnimatorCompat)localObject1).translationX(toX - fromX);
        ((ViewPropertyAnimatorCompat)localObject1).translationY(toY - fromY);
        ((ViewPropertyAnimatorCompat)localObject1).alpha(0.0F).setListener(new VpaListenerAdapter(paramChangeInfo)
        {
          public void onAnimationEnd(View paramAnonymousView)
          {
            val$oldViewAnim.setListener(null);
            ViewCompat.setAlpha(paramAnonymousView, 1.0F);
            ViewCompat.setTranslationX(paramAnonymousView, 0.0F);
            ViewCompat.setTranslationY(paramAnonymousView, 0.0F);
            dispatchChangeFinished(paramChangeInfooldHolder, true);
            mChangeAnimations.remove(paramChangeInfooldHolder);
            DefaultItemAnimator.this.dispatchFinishedWhenDone();
          }
          
          public void onAnimationStart(View paramAnonymousView)
          {
            dispatchChangeStarting(paramChangeInfooldHolder, true);
          }
        }).start();
      }
      if (localObject2 != null)
      {
        localObject1 = ViewCompat.animate((View)localObject2);
        mChangeAnimations.add(newHolder);
        ((ViewPropertyAnimatorCompat)localObject1).translationX(0.0F).translationY(0.0F).setDuration(getChangeDuration()).alpha(1.0F).setListener(new VpaListenerAdapter(paramChangeInfo)
        {
          public void onAnimationEnd(View paramAnonymousView)
          {
            val$newViewAnimation.setListener(null);
            ViewCompat.setAlpha(val$newView, 1.0F);
            ViewCompat.setTranslationX(val$newView, 0.0F);
            ViewCompat.setTranslationY(val$newView, 0.0F);
            dispatchChangeFinished(paramChangeInfonewHolder, false);
            mChangeAnimations.remove(paramChangeInfonewHolder);
            DefaultItemAnimator.this.dispatchFinishedWhenDone();
          }
          
          public void onAnimationStart(View paramAnonymousView)
          {
            dispatchChangeStarting(paramChangeInfonewHolder, false);
          }
        }).start();
      }
      return;
      localObject1 = itemView;
      break;
    }
  }
  
  private void animateMoveImpl(final RecyclerView.ViewHolder paramViewHolder, final int paramInt1, final int paramInt2, int paramInt3, int paramInt4)
  {
    Object localObject = itemView;
    paramInt1 = paramInt3 - paramInt1;
    paramInt2 = paramInt4 - paramInt2;
    if (paramInt1 != 0) {
      ViewCompat.animate((View)localObject).translationX(0.0F);
    }
    if (paramInt2 != 0) {
      ViewCompat.animate((View)localObject).translationY(0.0F);
    }
    localObject = ViewCompat.animate((View)localObject);
    mMoveAnimations.add(paramViewHolder);
    ((ViewPropertyAnimatorCompat)localObject).setDuration(getMoveDuration()).setListener(new VpaListenerAdapter(paramViewHolder)
    {
      public void onAnimationCancel(View paramAnonymousView)
      {
        if (paramInt1 != 0) {
          ViewCompat.setTranslationX(paramAnonymousView, 0.0F);
        }
        if (paramInt2 != 0) {
          ViewCompat.setTranslationY(paramAnonymousView, 0.0F);
        }
      }
      
      public void onAnimationEnd(View paramAnonymousView)
      {
        val$animation.setListener(null);
        dispatchMoveFinished(paramViewHolder);
        mMoveAnimations.remove(paramViewHolder);
        DefaultItemAnimator.this.dispatchFinishedWhenDone();
      }
      
      public void onAnimationStart(View paramAnonymousView)
      {
        dispatchMoveStarting(paramViewHolder);
      }
    }).start();
  }
  
  private void animateRemoveImpl(final RecyclerView.ViewHolder paramViewHolder)
  {
    final ViewPropertyAnimatorCompat localViewPropertyAnimatorCompat = ViewCompat.animate(itemView);
    mRemoveAnimations.add(paramViewHolder);
    localViewPropertyAnimatorCompat.setDuration(getRemoveDuration()).alpha(0.0F).setListener(new VpaListenerAdapter(paramViewHolder)
    {
      public void onAnimationEnd(View paramAnonymousView)
      {
        localViewPropertyAnimatorCompat.setListener(null);
        ViewCompat.setAlpha(paramAnonymousView, 1.0F);
        dispatchRemoveFinished(paramViewHolder);
        mRemoveAnimations.remove(paramViewHolder);
        DefaultItemAnimator.this.dispatchFinishedWhenDone();
      }
      
      public void onAnimationStart(View paramAnonymousView)
      {
        dispatchRemoveStarting(paramViewHolder);
      }
    }).start();
  }
  
  private void dispatchFinishedWhenDone()
  {
    if (!isRunning()) {
      dispatchAnimationsFinished();
    }
  }
  
  private void endChangeAnimation(List<ChangeInfo> paramList, RecyclerView.ViewHolder paramViewHolder)
  {
    int i = paramList.size() - 1;
    while (i >= 0)
    {
      ChangeInfo localChangeInfo = (ChangeInfo)paramList.get(i);
      if ((endChangeAnimationIfNecessary(localChangeInfo, paramViewHolder)) && (oldHolder == null) && (newHolder == null)) {
        paramList.remove(localChangeInfo);
      }
      i -= 1;
    }
  }
  
  private void endChangeAnimationIfNecessary(ChangeInfo paramChangeInfo)
  {
    if (oldHolder != null) {
      endChangeAnimationIfNecessary(paramChangeInfo, oldHolder);
    }
    if (newHolder != null) {
      endChangeAnimationIfNecessary(paramChangeInfo, newHolder);
    }
  }
  
  private boolean endChangeAnimationIfNecessary(ChangeInfo paramChangeInfo, RecyclerView.ViewHolder paramViewHolder)
  {
    boolean bool = false;
    if (newHolder == paramViewHolder) {
      newHolder = null;
    }
    for (;;)
    {
      ViewCompat.setAlpha(itemView, 1.0F);
      ViewCompat.setTranslationX(itemView, 0.0F);
      ViewCompat.setTranslationY(itemView, 0.0F);
      dispatchChangeFinished(paramViewHolder, bool);
      return true;
      if (oldHolder != paramViewHolder) {
        break;
      }
      oldHolder = null;
      bool = true;
    }
    return false;
  }
  
  public boolean animateAdd(RecyclerView.ViewHolder paramViewHolder)
  {
    endAnimation(paramViewHolder);
    ViewCompat.setAlpha(itemView, 0.0F);
    mPendingAdditions.add(paramViewHolder);
    return true;
  }
  
  public boolean animateChange(RecyclerView.ViewHolder paramViewHolder1, RecyclerView.ViewHolder paramViewHolder2, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    float f1 = ViewCompat.getTranslationX(itemView);
    float f2 = ViewCompat.getTranslationY(itemView);
    float f3 = ViewCompat.getAlpha(itemView);
    endAnimation(paramViewHolder1);
    int i = (int)(paramInt3 - paramInt1 - f1);
    int j = (int)(paramInt4 - paramInt2 - f2);
    ViewCompat.setTranslationX(itemView, f1);
    ViewCompat.setTranslationY(itemView, f2);
    ViewCompat.setAlpha(itemView, f3);
    if ((paramViewHolder2 != null) && (itemView != null))
    {
      endAnimation(paramViewHolder2);
      ViewCompat.setTranslationX(itemView, -i);
      ViewCompat.setTranslationY(itemView, -j);
      ViewCompat.setAlpha(itemView, 0.0F);
    }
    mPendingChanges.add(new ChangeInfo(paramViewHolder1, paramViewHolder2, paramInt1, paramInt2, paramInt3, paramInt4, null));
    return true;
  }
  
  public boolean animateMove(RecyclerView.ViewHolder paramViewHolder, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    View localView = itemView;
    paramInt1 = (int)(paramInt1 + ViewCompat.getTranslationX(itemView));
    paramInt2 = (int)(paramInt2 + ViewCompat.getTranslationY(itemView));
    endAnimation(paramViewHolder);
    int i = paramInt3 - paramInt1;
    int j = paramInt4 - paramInt2;
    if ((i == 0) && (j == 0))
    {
      dispatchMoveFinished(paramViewHolder);
      return false;
    }
    if (i != 0) {
      ViewCompat.setTranslationX(localView, -i);
    }
    if (j != 0) {
      ViewCompat.setTranslationY(localView, -j);
    }
    mPendingMoves.add(new MoveInfo(paramViewHolder, paramInt1, paramInt2, paramInt3, paramInt4, null));
    return true;
  }
  
  public boolean animateRemove(RecyclerView.ViewHolder paramViewHolder)
  {
    endAnimation(paramViewHolder);
    mPendingRemovals.add(paramViewHolder);
    return true;
  }
  
  void cancelAll(List<RecyclerView.ViewHolder> paramList)
  {
    int i = paramList.size() - 1;
    while (i >= 0)
    {
      ViewCompat.animate(getitemView).cancel();
      i -= 1;
    }
  }
  
  public void endAnimation(RecyclerView.ViewHolder paramViewHolder)
  {
    View localView = itemView;
    ViewCompat.animate(localView).cancel();
    int i = mPendingMoves.size() - 1;
    while (i >= 0)
    {
      if (mPendingMoves.get(i)).holder == paramViewHolder)
      {
        ViewCompat.setTranslationY(localView, 0.0F);
        ViewCompat.setTranslationX(localView, 0.0F);
        dispatchMoveFinished(paramViewHolder);
        mPendingMoves.remove(i);
      }
      i -= 1;
    }
    endChangeAnimation(mPendingChanges, paramViewHolder);
    if (mPendingRemovals.remove(paramViewHolder))
    {
      ViewCompat.setAlpha(localView, 1.0F);
      dispatchRemoveFinished(paramViewHolder);
    }
    if (mPendingAdditions.remove(paramViewHolder))
    {
      ViewCompat.setAlpha(localView, 1.0F);
      dispatchAddFinished(paramViewHolder);
    }
    i = mChangesList.size() - 1;
    ArrayList localArrayList;
    while (i >= 0)
    {
      localArrayList = (ArrayList)mChangesList.get(i);
      endChangeAnimation(localArrayList, paramViewHolder);
      if (localArrayList.isEmpty()) {
        mChangesList.remove(i);
      }
      i -= 1;
    }
    i = mMovesList.size() - 1;
    if (i >= 0)
    {
      localArrayList = (ArrayList)mMovesList.get(i);
      int j = localArrayList.size() - 1;
      for (;;)
      {
        if (j >= 0)
        {
          if (getholder != paramViewHolder) {
            break label293;
          }
          ViewCompat.setTranslationY(localView, 0.0F);
          ViewCompat.setTranslationX(localView, 0.0F);
          dispatchMoveFinished(paramViewHolder);
          localArrayList.remove(j);
          if (localArrayList.isEmpty()) {
            mMovesList.remove(i);
          }
        }
        i -= 1;
        break;
        label293:
        j -= 1;
      }
    }
    i = mAdditionsList.size() - 1;
    while (i >= 0)
    {
      localArrayList = (ArrayList)mAdditionsList.get(i);
      if (localArrayList.remove(paramViewHolder))
      {
        ViewCompat.setAlpha(localView, 1.0F);
        dispatchAddFinished(paramViewHolder);
        if (localArrayList.isEmpty()) {
          mAdditionsList.remove(i);
        }
      }
      i -= 1;
    }
    if ((!mRemoveAnimations.remove(paramViewHolder)) || ((!mAddAnimations.remove(paramViewHolder)) || ((!mChangeAnimations.remove(paramViewHolder)) || (mMoveAnimations.remove(paramViewHolder))))) {}
    dispatchFinishedWhenDone();
  }
  
  public void endAnimations()
  {
    int i = mPendingMoves.size() - 1;
    Object localObject1;
    Object localObject2;
    while (i >= 0)
    {
      localObject1 = (MoveInfo)mPendingMoves.get(i);
      localObject2 = holder.itemView;
      ViewCompat.setTranslationY((View)localObject2, 0.0F);
      ViewCompat.setTranslationX((View)localObject2, 0.0F);
      dispatchMoveFinished(holder);
      mPendingMoves.remove(i);
      i -= 1;
    }
    i = mPendingRemovals.size() - 1;
    while (i >= 0)
    {
      dispatchRemoveFinished((RecyclerView.ViewHolder)mPendingRemovals.get(i));
      mPendingRemovals.remove(i);
      i -= 1;
    }
    i = mPendingAdditions.size() - 1;
    while (i >= 0)
    {
      localObject1 = (RecyclerView.ViewHolder)mPendingAdditions.get(i);
      ViewCompat.setAlpha(itemView, 1.0F);
      dispatchAddFinished((RecyclerView.ViewHolder)localObject1);
      mPendingAdditions.remove(i);
      i -= 1;
    }
    i = mPendingChanges.size() - 1;
    while (i >= 0)
    {
      endChangeAnimationIfNecessary((ChangeInfo)mPendingChanges.get(i));
      i -= 1;
    }
    mPendingChanges.clear();
    if (!isRunning()) {
      return;
    }
    i = mMovesList.size() - 1;
    int j;
    while (i >= 0)
    {
      localObject1 = (ArrayList)mMovesList.get(i);
      j = ((ArrayList)localObject1).size() - 1;
      while (j >= 0)
      {
        localObject2 = (MoveInfo)((ArrayList)localObject1).get(j);
        View localView = holder.itemView;
        ViewCompat.setTranslationY(localView, 0.0F);
        ViewCompat.setTranslationX(localView, 0.0F);
        dispatchMoveFinished(holder);
        ((ArrayList)localObject1).remove(j);
        if (((ArrayList)localObject1).isEmpty()) {
          mMovesList.remove(localObject1);
        }
        j -= 1;
      }
      i -= 1;
    }
    i = mAdditionsList.size() - 1;
    while (i >= 0)
    {
      localObject1 = (ArrayList)mAdditionsList.get(i);
      j = ((ArrayList)localObject1).size() - 1;
      while (j >= 0)
      {
        localObject2 = (RecyclerView.ViewHolder)((ArrayList)localObject1).get(j);
        ViewCompat.setAlpha(itemView, 1.0F);
        dispatchAddFinished((RecyclerView.ViewHolder)localObject2);
        ((ArrayList)localObject1).remove(j);
        if (((ArrayList)localObject1).isEmpty()) {
          mAdditionsList.remove(localObject1);
        }
        j -= 1;
      }
      i -= 1;
    }
    i = mChangesList.size() - 1;
    while (i >= 0)
    {
      localObject1 = (ArrayList)mChangesList.get(i);
      j = ((ArrayList)localObject1).size() - 1;
      while (j >= 0)
      {
        endChangeAnimationIfNecessary((ChangeInfo)((ArrayList)localObject1).get(j));
        if (((ArrayList)localObject1).isEmpty()) {
          mChangesList.remove(localObject1);
        }
        j -= 1;
      }
      i -= 1;
    }
    cancelAll(mRemoveAnimations);
    cancelAll(mMoveAnimations);
    cancelAll(mAddAnimations);
    cancelAll(mChangeAnimations);
    dispatchAnimationsFinished();
  }
  
  public boolean isRunning()
  {
    return (!mPendingAdditions.isEmpty()) || (!mPendingChanges.isEmpty()) || (!mPendingMoves.isEmpty()) || (!mPendingRemovals.isEmpty()) || (!mMoveAnimations.isEmpty()) || (!mRemoveAnimations.isEmpty()) || (!mAddAnimations.isEmpty()) || (!mChangeAnimations.isEmpty()) || (!mMovesList.isEmpty()) || (!mAdditionsList.isEmpty()) || (!mChangesList.isEmpty());
  }
  
  public void runPendingAnimations()
  {
    int i;
    int j;
    label24:
    int k;
    if (!mPendingRemovals.isEmpty())
    {
      i = 1;
      if (mPendingMoves.isEmpty()) {
        break label72;
      }
      j = 1;
      if (mPendingChanges.isEmpty()) {
        break label77;
      }
      k = 1;
      label36:
      if (mPendingAdditions.isEmpty()) {
        break label82;
      }
    }
    label72:
    label77:
    label82:
    for (int m = 1;; m = 0)
    {
      if ((i != 0) || (j != 0) || (m != 0) || (k != 0)) {
        break label88;
      }
      return;
      i = 0;
      break;
      j = 0;
      break label24;
      k = 0;
      break label36;
    }
    label88:
    Object localObject1 = mPendingRemovals.iterator();
    while (((Iterator)localObject1).hasNext()) {
      animateRemoveImpl((RecyclerView.ViewHolder)((Iterator)localObject1).next());
    }
    mPendingRemovals.clear();
    Object localObject2;
    label211:
    label291:
    long l1;
    label366:
    long l2;
    if (j != 0)
    {
      localObject1 = new ArrayList();
      ((ArrayList)localObject1).addAll(mPendingMoves);
      mMovesList.add(localObject1);
      mPendingMoves.clear();
      localObject2 = new Runnable()
      {
        public void run()
        {
          Iterator localIterator = val$moves.iterator();
          while (localIterator.hasNext())
          {
            DefaultItemAnimator.MoveInfo localMoveInfo = (DefaultItemAnimator.MoveInfo)localIterator.next();
            DefaultItemAnimator.this.animateMoveImpl(holder, fromX, fromY, toX, toY);
          }
          val$moves.clear();
          mMovesList.remove(val$moves);
        }
      };
      if (i != 0) {
        ViewCompat.postOnAnimationDelayed(get0holder.itemView, (Runnable)localObject2, getRemoveDuration());
      }
    }
    else
    {
      if (k != 0)
      {
        localObject1 = new ArrayList();
        ((ArrayList)localObject1).addAll(mPendingChanges);
        mChangesList.add(localObject1);
        mPendingChanges.clear();
        localObject2 = new Runnable()
        {
          public void run()
          {
            Iterator localIterator = val$changes.iterator();
            while (localIterator.hasNext())
            {
              DefaultItemAnimator.ChangeInfo localChangeInfo = (DefaultItemAnimator.ChangeInfo)localIterator.next();
              DefaultItemAnimator.this.animateChangeImpl(localChangeInfo);
            }
            val$changes.clear();
            mChangesList.remove(val$changes);
          }
        };
        if (i == 0) {
          break label428;
        }
        ViewCompat.postOnAnimationDelayed(get0oldHolder.itemView, (Runnable)localObject2, getRemoveDuration());
      }
      if (m == 0) {
        break label436;
      }
      localObject1 = new ArrayList();
      ((ArrayList)localObject1).addAll(mPendingAdditions);
      mAdditionsList.add(localObject1);
      mPendingAdditions.clear();
      localObject2 = new Runnable()
      {
        public void run()
        {
          Iterator localIterator = val$additions.iterator();
          while (localIterator.hasNext())
          {
            RecyclerView.ViewHolder localViewHolder = (RecyclerView.ViewHolder)localIterator.next();
            DefaultItemAnimator.this.animateAddImpl(localViewHolder);
          }
          val$additions.clear();
          mAdditionsList.remove(val$additions);
        }
      };
      if ((i == 0) && (j == 0) && (k == 0)) {
        break label456;
      }
      if (i == 0) {
        break label438;
      }
      l1 = getRemoveDuration();
      if (j == 0) {
        break label444;
      }
      l2 = getMoveDuration();
      label376:
      if (k == 0) {
        break label450;
      }
    }
    label428:
    label436:
    label438:
    label444:
    label450:
    for (long l3 = getChangeDuration();; l3 = 0L)
    {
      l2 = Math.max(l2, l3);
      ViewCompat.postOnAnimationDelayed(get0itemView, (Runnable)localObject2, l1 + l2);
      return;
      ((Runnable)localObject2).run();
      break label211;
      ((Runnable)localObject2).run();
      break label291;
      break;
      l1 = 0L;
      break label366;
      l2 = 0L;
      break label376;
    }
    label456:
    ((Runnable)localObject2).run();
  }
  
  private static class ChangeInfo
  {
    public int fromX;
    public int fromY;
    public RecyclerView.ViewHolder newHolder;
    public RecyclerView.ViewHolder oldHolder;
    public int toX;
    public int toY;
    
    private ChangeInfo(RecyclerView.ViewHolder paramViewHolder1, RecyclerView.ViewHolder paramViewHolder2)
    {
      oldHolder = paramViewHolder1;
      newHolder = paramViewHolder2;
    }
    
    private ChangeInfo(RecyclerView.ViewHolder paramViewHolder1, RecyclerView.ViewHolder paramViewHolder2, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      this(paramViewHolder1, paramViewHolder2);
      fromX = paramInt1;
      fromY = paramInt2;
      toX = paramInt3;
      toY = paramInt4;
    }
    
    public String toString()
    {
      return "ChangeInfo{oldHolder=" + oldHolder + ", newHolder=" + newHolder + ", fromX=" + fromX + ", fromY=" + fromY + ", toX=" + toX + ", toY=" + toY + '}';
    }
  }
  
  private static class MoveInfo
  {
    public int fromX;
    public int fromY;
    public RecyclerView.ViewHolder holder;
    public int toX;
    public int toY;
    
    private MoveInfo(RecyclerView.ViewHolder paramViewHolder, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      holder = paramViewHolder;
      fromX = paramInt1;
      fromY = paramInt2;
      toX = paramInt3;
      toY = paramInt4;
    }
  }
  
  private static class VpaListenerAdapter
    implements ViewPropertyAnimatorListener
  {
    private VpaListenerAdapter() {}
    
    public void onAnimationCancel(View paramView) {}
    
    public void onAnimationEnd(View paramView) {}
    
    public void onAnimationStart(View paramView) {}
  }
}
