package it.sephiroth.android.library.viewrevealanimator;

abstract class RevealAnimatorImpl
  implements RevealAnimator
{
  protected final ViewRevealAnimator parent;
  
  RevealAnimatorImpl(ViewRevealAnimator paramViewRevealAnimator)
  {
    parent = paramViewRevealAnimator;
  }
}
