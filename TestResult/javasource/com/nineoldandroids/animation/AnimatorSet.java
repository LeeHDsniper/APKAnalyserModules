package com.nineoldandroids.animation;

import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

public final class AnimatorSet
  extends Animator
{
  private ValueAnimator mDelayAnim = null;
  private long mDuration = -1L;
  private boolean mNeedsSort = true;
  private HashMap<Animator, Node> mNodeMap = new HashMap();
  private ArrayList<Node> mNodes = new ArrayList();
  private ArrayList<Animator> mPlayingSet = new ArrayList();
  private AnimatorSetListener mSetListener = null;
  private ArrayList<Node> mSortedNodes = new ArrayList();
  private long mStartDelay = 0L;
  private boolean mStarted = false;
  boolean mTerminated = false;
  
  public AnimatorSet() {}
  
  private void sortNodes()
  {
    Object localObject1;
    int j;
    int i;
    Object localObject2;
    int k;
    int m;
    if (mNeedsSort)
    {
      mSortedNodes.clear();
      localObject1 = new ArrayList();
      j = mNodes.size();
      i = 0;
      while (i < j)
      {
        localObject2 = (Node)mNodes.get(i);
        if ((dependencies == null) || (dependencies.size() == 0)) {
          ((ArrayList)localObject1).add(localObject2);
        }
        i += 1;
      }
      localObject2 = new ArrayList();
      while (((ArrayList)localObject1).size() > 0)
      {
        k = ((ArrayList)localObject1).size();
        i = 0;
        while (i < k)
        {
          Node localNode1 = (Node)((ArrayList)localObject1).get(i);
          mSortedNodes.add(localNode1);
          if (nodeDependents != null)
          {
            m = nodeDependents.size();
            j = 0;
            while (j < m)
            {
              Node localNode2 = (Node)nodeDependents.get(j);
              nodeDependencies.remove(localNode1);
              if (nodeDependencies.size() == 0) {
                ((ArrayList)localObject2).add(localNode2);
              }
              j += 1;
            }
          }
          i += 1;
        }
        ((ArrayList)localObject1).clear();
        ((ArrayList)localObject1).addAll((Collection)localObject2);
        ((ArrayList)localObject2).clear();
      }
      mNeedsSort = false;
      if (mSortedNodes.size() != mNodes.size()) {
        throw new IllegalStateException("Circular dependencies cannot exist in AnimatorSet");
      }
    }
    else
    {
      k = mNodes.size();
      i = 0;
      while (i < k)
      {
        localObject1 = (Node)mNodes.get(i);
        if ((dependencies != null) && (dependencies.size() > 0))
        {
          m = dependencies.size();
          j = 0;
          while (j < m)
          {
            localObject2 = (Dependency)dependencies.get(j);
            if (nodeDependencies == null) {
              nodeDependencies = new ArrayList();
            }
            if (!nodeDependencies.contains(node)) {
              nodeDependencies.add(node);
            }
            j += 1;
          }
        }
        done = false;
        i += 1;
      }
    }
  }
  
  public void cancel()
  {
    mTerminated = true;
    if (isStarted())
    {
      Object localObject1 = null;
      Object localObject2;
      if (mListeners != null)
      {
        localObject2 = (ArrayList)mListeners.clone();
        Iterator localIterator = ((ArrayList)localObject2).iterator();
        for (;;)
        {
          localObject1 = localObject2;
          if (!localIterator.hasNext()) {
            break;
          }
          ((Animator.AnimatorListener)localIterator.next()).onAnimationCancel(this);
        }
      }
      if ((mDelayAnim != null) && (mDelayAnim.isRunning())) {
        mDelayAnim.cancel();
      }
      while (localObject1 != null)
      {
        localObject1 = ((ArrayList)localObject1).iterator();
        while (((Iterator)localObject1).hasNext()) {
          ((Animator.AnimatorListener)((Iterator)localObject1).next()).onAnimationEnd(this);
        }
        if (mSortedNodes.size() > 0)
        {
          localObject2 = mSortedNodes.iterator();
          while (((Iterator)localObject2).hasNext()) {
            nextanimation.cancel();
          }
        }
      }
      mStarted = false;
    }
  }
  
  public AnimatorSet clone()
  {
    AnimatorSet localAnimatorSet = (AnimatorSet)super.clone();
    mNeedsSort = true;
    mTerminated = false;
    mStarted = false;
    mPlayingSet = new ArrayList();
    mNodeMap = new HashMap();
    mNodes = new ArrayList();
    mSortedNodes = new ArrayList();
    HashMap localHashMap = new HashMap();
    Object localObject3 = mNodes.iterator();
    Object localObject2;
    Object localObject4;
    while (((Iterator)localObject3).hasNext())
    {
      localObject1 = (Node)((Iterator)localObject3).next();
      localObject2 = ((Node)localObject1).clone();
      localHashMap.put(localObject1, localObject2);
      mNodes.add(localObject2);
      mNodeMap.put(animation, localObject2);
      dependencies = null;
      tmpDependencies = null;
      nodeDependents = null;
      nodeDependencies = null;
      localObject4 = animation.getListeners();
      if (localObject4 != null)
      {
        localObject1 = null;
        Iterator localIterator = ((ArrayList)localObject4).iterator();
        while (localIterator.hasNext())
        {
          Animator.AnimatorListener localAnimatorListener = (Animator.AnimatorListener)localIterator.next();
          if ((localAnimatorListener instanceof AnimatorSetListener))
          {
            localObject2 = localObject1;
            if (localObject1 == null) {
              localObject2 = new ArrayList();
            }
            ((ArrayList)localObject2).add(localAnimatorListener);
            localObject1 = localObject2;
          }
        }
        if (localObject1 != null)
        {
          localObject1 = ((ArrayList)localObject1).iterator();
          while (((Iterator)localObject1).hasNext()) {
            ((ArrayList)localObject4).remove((Animator.AnimatorListener)((Iterator)localObject1).next());
          }
        }
      }
    }
    Object localObject1 = mNodes.iterator();
    while (((Iterator)localObject1).hasNext())
    {
      localObject3 = (Node)((Iterator)localObject1).next();
      localObject2 = (Node)localHashMap.get(localObject3);
      if (dependencies != null)
      {
        localObject3 = dependencies.iterator();
        while (((Iterator)localObject3).hasNext())
        {
          localObject4 = (Dependency)((Iterator)localObject3).next();
          ((Node)localObject2).addDependency(new Dependency((Node)localHashMap.get(node), rule));
        }
      }
    }
    return localAnimatorSet;
  }
  
  public boolean isRunning()
  {
    Iterator localIterator = mNodes.iterator();
    while (localIterator.hasNext()) {
      if (nextanimation.isRunning()) {
        return true;
      }
    }
    return false;
  }
  
  public boolean isStarted()
  {
    return mStarted;
  }
  
  public Builder play(Animator paramAnimator)
  {
    if (paramAnimator != null)
    {
      mNeedsSort = true;
      return new Builder(paramAnimator);
    }
    return null;
  }
  
  public void playSequentially(Animator... paramVarArgs)
  {
    if (paramVarArgs != null)
    {
      mNeedsSort = true;
      if (paramVarArgs.length != 1) {
        break label24;
      }
      play(paramVarArgs[0]);
    }
    for (;;)
    {
      return;
      label24:
      int i = 0;
      while (i < paramVarArgs.length - 1)
      {
        play(paramVarArgs[i]).before(paramVarArgs[(i + 1)]);
        i += 1;
      }
    }
  }
  
  public void playTogether(Animator... paramVarArgs)
  {
    if (paramVarArgs != null)
    {
      mNeedsSort = true;
      Builder localBuilder = play(paramVarArgs[0]);
      int i = 1;
      while (i < paramVarArgs.length)
      {
        localBuilder.with(paramVarArgs[i]);
        i += 1;
      }
    }
  }
  
  public AnimatorSet setDuration(long paramLong)
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("duration must be a value of zero or greater");
    }
    Iterator localIterator = mNodes.iterator();
    while (localIterator.hasNext()) {
      nextanimation.setDuration(paramLong);
    }
    mDuration = paramLong;
    return this;
  }
  
  public void setInterpolator(Interpolator paramInterpolator)
  {
    Iterator localIterator = mNodes.iterator();
    while (localIterator.hasNext()) {
      nextanimation.setInterpolator(paramInterpolator);
    }
  }
  
  public void setStartDelay(long paramLong)
  {
    mStartDelay = paramLong;
  }
  
  public void start()
  {
    mTerminated = false;
    mStarted = true;
    sortNodes();
    int k = mSortedNodes.size();
    int i = 0;
    Object localObject2;
    Object localObject3;
    while (i < k)
    {
      localObject1 = (Node)mSortedNodes.get(i);
      localObject2 = animation.getListeners();
      if ((localObject2 != null) && (((ArrayList)localObject2).size() > 0))
      {
        localObject2 = new ArrayList((Collection)localObject2).iterator();
        while (((Iterator)localObject2).hasNext())
        {
          localObject3 = (Animator.AnimatorListener)((Iterator)localObject2).next();
          if (((localObject3 instanceof DependencyListener)) || ((localObject3 instanceof AnimatorSetListener))) {
            animation.removeListener((Animator.AnimatorListener)localObject3);
          }
        }
      }
      i += 1;
    }
    Object localObject1 = new ArrayList();
    i = 0;
    int j;
    if (i < k)
    {
      localObject2 = (Node)mSortedNodes.get(i);
      if (mSetListener == null) {
        mSetListener = new AnimatorSetListener(this);
      }
      if ((dependencies == null) || (dependencies.size() == 0)) {
        ((ArrayList)localObject1).add(localObject2);
      }
      for (;;)
      {
        animation.addListener(mSetListener);
        i += 1;
        break;
        int m = dependencies.size();
        j = 0;
        while (j < m)
        {
          localObject3 = (Dependency)dependencies.get(j);
          node.animation.addListener(new DependencyListener(this, (Node)localObject2, rule));
          j += 1;
        }
        tmpDependencies = ((ArrayList)dependencies.clone());
      }
    }
    if (mStartDelay <= 0L)
    {
      localObject1 = ((ArrayList)localObject1).iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (Node)((Iterator)localObject1).next();
        animation.start();
        mPlayingSet.add(animation);
      }
    }
    mDelayAnim = ValueAnimator.ofFloat(new float[] { 0.0F, 1.0F });
    mDelayAnim.setDuration(mStartDelay);
    mDelayAnim.addListener(new AnimatorListenerAdapter()
    {
      boolean canceled = false;
      
      public void onAnimationCancel(Animator paramAnonymousAnimator)
      {
        canceled = true;
      }
      
      public void onAnimationEnd(Animator paramAnonymousAnimator)
      {
        if (!canceled)
        {
          int j = val$nodesToStart.size();
          int i = 0;
          while (i < j)
          {
            paramAnonymousAnimator = (AnimatorSet.Node)val$nodesToStart.get(i);
            animation.start();
            mPlayingSet.add(animation);
            i += 1;
          }
        }
      }
    });
    mDelayAnim.start();
    if (mListeners != null)
    {
      localObject1 = (ArrayList)mListeners.clone();
      j = ((ArrayList)localObject1).size();
      i = 0;
      while (i < j)
      {
        ((Animator.AnimatorListener)((ArrayList)localObject1).get(i)).onAnimationStart(this);
        i += 1;
      }
    }
    if ((mNodes.size() == 0) && (mStartDelay == 0L))
    {
      mStarted = false;
      if (mListeners != null)
      {
        localObject1 = (ArrayList)mListeners.clone();
        j = ((ArrayList)localObject1).size();
        i = 0;
        while (i < j)
        {
          ((Animator.AnimatorListener)((ArrayList)localObject1).get(i)).onAnimationEnd(this);
          i += 1;
        }
      }
    }
  }
  
  private class AnimatorSetListener
    implements Animator.AnimatorListener
  {
    private AnimatorSet mAnimatorSet;
    
    AnimatorSetListener(AnimatorSet paramAnimatorSet)
    {
      mAnimatorSet = paramAnimatorSet;
    }
    
    public void onAnimationCancel(Animator paramAnimator)
    {
      if ((!mTerminated) && (mPlayingSet.size() == 0) && (mListeners != null))
      {
        int j = mListeners.size();
        int i = 0;
        while (i < j)
        {
          ((Animator.AnimatorListener)mListeners.get(i)).onAnimationCancel(mAnimatorSet);
          i += 1;
        }
      }
    }
    
    public void onAnimationEnd(Animator paramAnimator)
    {
      paramAnimator.removeListener(this);
      mPlayingSet.remove(paramAnimator);
      mAnimatorSet.mNodeMap.get(paramAnimator)).done = true;
      if (!mTerminated)
      {
        paramAnimator = mAnimatorSet.mSortedNodes;
        int k = 1;
        int m = paramAnimator.size();
        int i = 0;
        for (;;)
        {
          int j = k;
          if (i < m)
          {
            if (!getdone) {
              j = 0;
            }
          }
          else
          {
            if (j == 0) {
              return;
            }
            if (mListeners == null) {
              break;
            }
            paramAnimator = (ArrayList)mListeners.clone();
            j = paramAnimator.size();
            i = 0;
            while (i < j)
            {
              ((Animator.AnimatorListener)paramAnimator.get(i)).onAnimationEnd(mAnimatorSet);
              i += 1;
            }
          }
          i += 1;
        }
        AnimatorSet.access$302(mAnimatorSet, false);
      }
    }
    
    public void onAnimationRepeat(Animator paramAnimator) {}
    
    public void onAnimationStart(Animator paramAnimator) {}
  }
  
  public class Builder
  {
    private AnimatorSet.Node mCurrentNode;
    
    Builder(Animator paramAnimator)
    {
      mCurrentNode = ((AnimatorSet.Node)mNodeMap.get(paramAnimator));
      if (mCurrentNode == null)
      {
        mCurrentNode = new AnimatorSet.Node(paramAnimator);
        mNodeMap.put(paramAnimator, mCurrentNode);
        mNodes.add(mCurrentNode);
      }
    }
    
    public Builder before(Animator paramAnimator)
    {
      AnimatorSet.Node localNode2 = (AnimatorSet.Node)mNodeMap.get(paramAnimator);
      AnimatorSet.Node localNode1 = localNode2;
      if (localNode2 == null)
      {
        localNode1 = new AnimatorSet.Node(paramAnimator);
        mNodeMap.put(paramAnimator, localNode1);
        mNodes.add(localNode1);
      }
      localNode1.addDependency(new AnimatorSet.Dependency(mCurrentNode, 1));
      return this;
    }
    
    public Builder with(Animator paramAnimator)
    {
      AnimatorSet.Node localNode2 = (AnimatorSet.Node)mNodeMap.get(paramAnimator);
      AnimatorSet.Node localNode1 = localNode2;
      if (localNode2 == null)
      {
        localNode1 = new AnimatorSet.Node(paramAnimator);
        mNodeMap.put(paramAnimator, localNode1);
        mNodes.add(localNode1);
      }
      localNode1.addDependency(new AnimatorSet.Dependency(mCurrentNode, 0));
      return this;
    }
  }
  
  private static class Dependency
  {
    public AnimatorSet.Node node;
    public int rule;
    
    public Dependency(AnimatorSet.Node paramNode, int paramInt)
    {
      node = paramNode;
      rule = paramInt;
    }
  }
  
  private static class DependencyListener
    implements Animator.AnimatorListener
  {
    private AnimatorSet mAnimatorSet;
    private AnimatorSet.Node mNode;
    private int mRule;
    
    public DependencyListener(AnimatorSet paramAnimatorSet, AnimatorSet.Node paramNode, int paramInt)
    {
      mAnimatorSet = paramAnimatorSet;
      mNode = paramNode;
      mRule = paramInt;
    }
    
    private void startIfReady(Animator paramAnimator)
    {
      if (mAnimatorSet.mTerminated) {
        return;
      }
      Object localObject2 = null;
      int j = mNode.tmpDependencies.size();
      int i = 0;
      for (;;)
      {
        Object localObject1 = localObject2;
        if (i < j)
        {
          localObject1 = (AnimatorSet.Dependency)mNode.tmpDependencies.get(i);
          if ((rule == mRule) && (node.animation == paramAnimator)) {
            paramAnimator.removeListener(this);
          }
        }
        else
        {
          mNode.tmpDependencies.remove(localObject1);
          if (mNode.tmpDependencies.size() != 0) {
            break;
          }
          mNode.animation.start();
          mAnimatorSet.mPlayingSet.add(mNode.animation);
          return;
        }
        i += 1;
      }
    }
    
    public void onAnimationCancel(Animator paramAnimator) {}
    
    public void onAnimationEnd(Animator paramAnimator)
    {
      if (mRule == 1) {
        startIfReady(paramAnimator);
      }
    }
    
    public void onAnimationRepeat(Animator paramAnimator) {}
    
    public void onAnimationStart(Animator paramAnimator)
    {
      if (mRule == 0) {
        startIfReady(paramAnimator);
      }
    }
  }
  
  private static class Node
    implements Cloneable
  {
    public Animator animation;
    public ArrayList<AnimatorSet.Dependency> dependencies = null;
    public boolean done = false;
    public ArrayList<Node> nodeDependencies = null;
    public ArrayList<Node> nodeDependents = null;
    public ArrayList<AnimatorSet.Dependency> tmpDependencies = null;
    
    public Node(Animator paramAnimator)
    {
      animation = paramAnimator;
    }
    
    public void addDependency(AnimatorSet.Dependency paramDependency)
    {
      if (dependencies == null)
      {
        dependencies = new ArrayList();
        nodeDependencies = new ArrayList();
      }
      dependencies.add(paramDependency);
      if (!nodeDependencies.contains(node)) {
        nodeDependencies.add(node);
      }
      paramDependency = node;
      if (nodeDependents == null) {
        nodeDependents = new ArrayList();
      }
      nodeDependents.add(this);
    }
    
    public Node clone()
    {
      try
      {
        Node localNode = (Node)super.clone();
        animation = animation.clone();
        return localNode;
      }
      catch (CloneNotSupportedException localCloneNotSupportedException)
      {
        throw new AssertionError();
      }
    }
  }
}
