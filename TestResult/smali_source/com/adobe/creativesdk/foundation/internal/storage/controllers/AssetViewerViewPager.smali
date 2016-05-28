.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AssetViewerViewPager;
.super Landroid/support/v4/view/ViewPager;
.source "AssetViewerViewPager.java"


# instance fields
.field private isLocked:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Landroid/support/v4/view/ViewPager;-><init>(Landroid/content/Context;)V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AssetViewerViewPager;->isLocked:Z

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 34
    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AssetViewerViewPager;->isLocked:Z

    .line 36
    return-void
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x0

    .line 40
    iget-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AssetViewerViewPager;->isLocked:Z

    if-nez v2, :cond_9

    .line 42
    :try_start_5
    invoke-super {p0, p1}, Landroid/support/v4/view/ViewPager;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    :try_end_8
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_8} :catch_a

    move-result v1

    .line 48
    :cond_9
    :goto_9
    return v1

    .line 43
    :catch_a
    move-exception v0

    .line 44
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_9
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AssetViewerViewPager;->isLocked:Z

    if-nez v0, :cond_9

    .line 54
    invoke-super {p0, p1}, Landroid/support/v4/view/ViewPager;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 56
    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public setLocked(Z)V
    .registers 2
    .param p1, "isLocked"    # Z

    .prologue
    .line 64
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AssetViewerViewPager;->isLocked:Z

    .line 65
    return-void
.end method
