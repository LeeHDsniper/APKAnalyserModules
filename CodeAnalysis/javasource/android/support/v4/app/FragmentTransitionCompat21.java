package android.support.v4.app;

import android.graphics.Rect;
import android.transition.Transition;
import android.transition.Transition.EpicenterCallback;
import android.transition.TransitionManager;
import android.transition.TransitionSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnPreDrawListener;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class FragmentTransitionCompat21
{
  public static void addTargets(Object paramObject, ArrayList<View> paramArrayList)
  {
    paramObject = (Transition)paramObject;
    int j;
    int i;
    if ((paramObject instanceof TransitionSet))
    {
      paramObject = (TransitionSet)paramObject;
      j = paramObject.getTransitionCount();
      i = 0;
      while (i < j)
      {
        addTargets(paramObject.getTransitionAt(i), paramArrayList);
        i += 1;
      }
    }
    if ((!hasSimpleTarget(paramObject)) && (isNullOrEmpty(paramObject.getTargets())))
    {
      j = paramArrayList.size();
      i = 0;
      while (i < j)
      {
        paramObject.addTarget((View)paramArrayList.get(i));
        i += 1;
      }
    }
  }
  
  public static void addTransitionTargets(final Object paramObject1, Object paramObject2, View paramView1, final ViewRetriever paramViewRetriever, final View paramView2, EpicenterView paramEpicenterView, final Map<String, String> paramMap, final ArrayList<View> paramArrayList1, final Map<String, View> paramMap1, ArrayList<View> paramArrayList2)
  {
    if ((paramObject1 != null) || (paramObject2 != null))
    {
      paramObject1 = (Transition)paramObject1;
      if (paramObject1 != null) {
        paramObject1.addTarget(paramView2);
      }
      if (paramObject2 != null) {
        addTargets((Transition)paramObject2, paramArrayList2);
      }
      if (paramViewRetriever != null) {
        paramView1.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener()
        {
          public boolean onPreDraw()
          {
            val$container.getViewTreeObserver().removeOnPreDrawListener(this);
            View localView = paramViewRetriever.getView();
            if (localView != null)
            {
              if (!paramMap.isEmpty())
              {
                FragmentTransitionCompat21.findNamedViews(paramMap1, localView);
                paramMap1.keySet().retainAll(paramMap.values());
                Iterator localIterator = paramMap.entrySet().iterator();
                while (localIterator.hasNext())
                {
                  Map.Entry localEntry = (Map.Entry)localIterator.next();
                  Object localObject = (String)localEntry.getValue();
                  localObject = (View)paramMap1.get(localObject);
                  if (localObject != null) {
                    ((View)localObject).setTransitionName((String)localEntry.getKey());
                  }
                }
              }
              if (paramObject1 != null)
              {
                FragmentTransitionCompat21.captureTransitioningViews(paramArrayList1, localView);
                paramArrayList1.removeAll(paramMap1.values());
                paramArrayList1.add(paramView2);
                paramObject1.removeTarget(paramView2);
                FragmentTransitionCompat21.addTargets(paramObject1, paramArrayList1);
              }
            }
            return true;
          }
        });
      }
      setSharedElementEpicenter(paramObject1, paramEpicenterView);
    }
  }
  
  public static void beginDelayedTransition(ViewGroup paramViewGroup, Object paramObject)
  {
    TransitionManager.beginDelayedTransition(paramViewGroup, (Transition)paramObject);
  }
  
  public static Object captureExitingViews(Object paramObject, View paramView1, ArrayList<View> paramArrayList, Map<String, View> paramMap, View paramView2)
  {
    Object localObject = paramObject;
    if (paramObject != null)
    {
      captureTransitioningViews(paramArrayList, paramView1);
      if (paramMap != null) {
        paramArrayList.removeAll(paramMap.values());
      }
      if (paramArrayList.isEmpty()) {
        localObject = null;
      }
    }
    else
    {
      return localObject;
    }
    paramArrayList.add(paramView2);
    addTargets((Transition)paramObject, paramArrayList);
    return paramObject;
  }
  
  private static void captureTransitioningViews(ArrayList<View> paramArrayList, View paramView)
  {
    if (paramView.getVisibility() == 0)
    {
      if (!(paramView instanceof ViewGroup)) {
        break label61;
      }
      paramView = (ViewGroup)paramView;
      if (!paramView.isTransitionGroup()) {
        break label33;
      }
      paramArrayList.add(paramView);
    }
    for (;;)
    {
      return;
      label33:
      int j = paramView.getChildCount();
      int i = 0;
      while (i < j)
      {
        captureTransitioningViews(paramArrayList, paramView.getChildAt(i));
        i += 1;
      }
    }
    label61:
    paramArrayList.add(paramView);
  }
  
  public static void cleanupTransitions(View paramView1, final View paramView2, final Object paramObject1, final ArrayList<View> paramArrayList1, final Object paramObject2, final ArrayList<View> paramArrayList2, final Object paramObject3, final ArrayList<View> paramArrayList3, final Object paramObject4, final ArrayList<View> paramArrayList4, final Map<String, View> paramMap)
  {
    paramObject1 = (Transition)paramObject1;
    paramObject2 = (Transition)paramObject2;
    paramObject3 = (Transition)paramObject3;
    paramObject4 = (Transition)paramObject4;
    if (paramObject4 != null) {
      paramView1.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener()
      {
        public boolean onPreDraw()
        {
          val$sceneRoot.getViewTreeObserver().removeOnPreDrawListener(this);
          if (paramObject1 != null)
          {
            paramObject1.removeTarget(paramView2);
            FragmentTransitionCompat21.removeTargets(paramObject1, paramArrayList1);
          }
          if (paramObject2 != null) {
            FragmentTransitionCompat21.removeTargets(paramObject2, paramArrayList2);
          }
          if (paramObject3 != null) {
            FragmentTransitionCompat21.removeTargets(paramObject3, paramArrayList3);
          }
          Iterator localIterator = paramMap.entrySet().iterator();
          while (localIterator.hasNext())
          {
            Map.Entry localEntry = (Map.Entry)localIterator.next();
            ((View)localEntry.getValue()).setTransitionName((String)localEntry.getKey());
          }
          int j = paramArrayList4.size();
          int i = 0;
          while (i < j)
          {
            paramObject4.excludeTarget((View)paramArrayList4.get(i), false);
            i += 1;
          }
          paramObject4.excludeTarget(paramView2, false);
          return true;
        }
      });
    }
  }
  
  public static Object cloneTransition(Object paramObject)
  {
    Object localObject = paramObject;
    if (paramObject != null) {
      localObject = ((Transition)paramObject).clone();
    }
    return localObject;
  }
  
  public static void excludeTarget(Object paramObject, View paramView, boolean paramBoolean)
  {
    ((Transition)paramObject).excludeTarget(paramView, paramBoolean);
  }
  
  public static void findNamedViews(Map<String, View> paramMap, View paramView)
  {
    if (paramView.getVisibility() == 0)
    {
      String str = paramView.getTransitionName();
      if (str != null) {
        paramMap.put(str, paramView);
      }
      if ((paramView instanceof ViewGroup))
      {
        paramView = (ViewGroup)paramView;
        int j = paramView.getChildCount();
        int i = 0;
        while (i < j)
        {
          findNamedViews(paramMap, paramView.getChildAt(i));
          i += 1;
        }
      }
    }
  }
  
  private static Rect getBoundsOnScreen(View paramView)
  {
    Rect localRect = new Rect();
    int[] arrayOfInt = new int[2];
    paramView.getLocationOnScreen(arrayOfInt);
    localRect.set(arrayOfInt[0], arrayOfInt[1], arrayOfInt[0] + paramView.getWidth(), arrayOfInt[1] + paramView.getHeight());
    return localRect;
  }
  
  public static String getTransitionName(View paramView)
  {
    return paramView.getTransitionName();
  }
  
  private static boolean hasSimpleTarget(Transition paramTransition)
  {
    return (!isNullOrEmpty(paramTransition.getTargetIds())) || (!isNullOrEmpty(paramTransition.getTargetNames())) || (!isNullOrEmpty(paramTransition.getTargetTypes()));
  }
  
  private static boolean isNullOrEmpty(List paramList)
  {
    return (paramList == null) || (paramList.isEmpty());
  }
  
  public static Object mergeTransitions(Object paramObject1, Object paramObject2, Object paramObject3, boolean paramBoolean)
  {
    boolean bool2 = true;
    Transition localTransition = (Transition)paramObject1;
    paramObject1 = (Transition)paramObject2;
    paramObject3 = (Transition)paramObject3;
    boolean bool1 = bool2;
    if (localTransition != null)
    {
      bool1 = bool2;
      if (paramObject1 != null) {
        bool1 = paramBoolean;
      }
    }
    if (bool1)
    {
      paramObject2 = new TransitionSet();
      if (localTransition != null) {
        paramObject2.addTransition(localTransition);
      }
      if (paramObject1 != null) {
        paramObject2.addTransition(paramObject1);
      }
      if (paramObject3 != null) {
        paramObject2.addTransition(paramObject3);
      }
      return paramObject2;
    }
    paramObject2 = null;
    if ((paramObject1 != null) && (localTransition != null)) {
      paramObject1 = new TransitionSet().addTransition(paramObject1).addTransition(localTransition).setOrdering(1);
    }
    while (paramObject3 != null)
    {
      paramObject2 = new TransitionSet();
      if (paramObject1 != null) {
        paramObject2.addTransition(paramObject1);
      }
      paramObject2.addTransition(paramObject3);
      return paramObject2;
      if (paramObject1 == null)
      {
        paramObject1 = paramObject2;
        if (localTransition != null) {
          paramObject1 = localTransition;
        }
      }
    }
    return paramObject1;
  }
  
  public static void removeTargets(Object paramObject, ArrayList<View> paramArrayList)
  {
    paramObject = (Transition)paramObject;
    int i;
    if ((paramObject instanceof TransitionSet))
    {
      paramObject = (TransitionSet)paramObject;
      int j = paramObject.getTransitionCount();
      i = 0;
      while (i < j)
      {
        removeTargets(paramObject.getTransitionAt(i), paramArrayList);
        i += 1;
      }
    }
    if (!hasSimpleTarget(paramObject))
    {
      List localList = paramObject.getTargets();
      if ((localList != null) && (localList.size() == paramArrayList.size()) && (localList.containsAll(paramArrayList)))
      {
        i = paramArrayList.size() - 1;
        while (i >= 0)
        {
          paramObject.removeTarget((View)paramArrayList.get(i));
          i -= 1;
        }
      }
    }
  }
  
  public static void setEpicenter(Object paramObject, View paramView)
  {
    ((Transition)paramObject).setEpicenterCallback(new Transition.EpicenterCallback()
    {
      public Rect onGetEpicenter(Transition paramAnonymousTransition)
      {
        return val$epicenter;
      }
    });
  }
  
  private static void setSharedElementEpicenter(Transition paramTransition, EpicenterView paramEpicenterView)
  {
    if (paramTransition != null) {
      paramTransition.setEpicenterCallback(new Transition.EpicenterCallback()
      {
        private Rect mEpicenter;
        
        public Rect onGetEpicenter(Transition paramAnonymousTransition)
        {
          if ((mEpicenter == null) && (val$epicenterView.epicenter != null)) {
            mEpicenter = FragmentTransitionCompat21.getBoundsOnScreen(val$epicenterView.epicenter);
          }
          return mEpicenter;
        }
      });
    }
  }
  
  public static class EpicenterView
  {
    public View epicenter;
    
    public EpicenterView() {}
  }
  
  public static abstract interface ViewRetriever
  {
    public abstract View getView();
  }
}
