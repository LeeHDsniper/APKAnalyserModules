.class public Lcom/adobe/creativesdk/aviary/widget/NonSwipeableViewPager;
.super Landroid/support/v4/view/ViewPager;
.source "NonSwipeableViewPager.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 10
    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;-><init>(Landroid/content/Context;)V

    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 14
    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 15
    return-void
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "arg0"    # Landroid/view/MotionEvent;

    .prologue
    .line 20
    const/4 v0, 0x0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 26
    const/4 v0, 0x0

    return v0
.end method

.method public shouldDelayChildPressedState()Z
    .registers 2

    .prologue
    .line 31
    const/4 v0, 0x0

    return v0
.end method
