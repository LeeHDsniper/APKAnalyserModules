.class public Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;
.super Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
.source "AdobeImageViewUndoRedo.java"


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private mIsActive:Z

.field private mMaxFling:I

.field private mMinFling:I

.field private mUndoMinFling:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 16
    const-string v0, "AdobeImageViewUndoRedo"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 27
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    const/16 v0, 0x1f4

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->mUndoMinFling:I

    .line 32
    return-void
.end method

.method private isValidScale()Z
    .registers 5

    .prologue
    .line 81
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->getScale()F

    move-result v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->getMinScale()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v0, v0

    const-wide v2, 0x3fb999999999999aL

    cmpg-double v0, v0, v2

    if-gez v0, :cond_19

    const/4 v0, 0x1

    :goto_18
    return v0

    :cond_19
    const/4 v0, 0x0

    goto :goto_18
.end method


# virtual methods
.method public getIsActive()Z
    .registers 2

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->mIsActive:Z

    return v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 44
    invoke-super {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 46
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->mMinFling:I

    .line 47
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->mMaxFling:I

    .line 48
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->mMinFling:I

    int-to-double v0, v0

    const-wide/high16 v2, 0x4000000000000000L

    mul-double/2addr v0, v2

    double-to-int v0, v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->mUndoMinFling:I

    .line 50
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "minFling: %d, maxFling: %d, undoFling: %d"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->mMinFling:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->mMaxFling:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->mUndoMinFling:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 51
    return-void
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 11
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 56
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-nez v2, :cond_9

    .line 73
    :cond_8
    :goto_8
    return v0

    .line 59
    :cond_9
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->isShown()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 63
    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "onFling: %f"

    new-array v4, v1, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v4, v0

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 64
    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->mIsActive:Z

    if-eqz v2, :cond_5f

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->isValidScale()Z

    move-result v2

    if-eqz v2, :cond_5f

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->mUndoMinFling:I

    int-to-float v3, v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_5f

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_5f

    .line 65
    const/4 v2, 0x0

    cmpg-float v2, p3, v2

    if-gez v2, :cond_52

    .line 66
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v2

    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/events/HistoryUndoRedoEvent;

    invoke-direct {v3, v0}, Lcom/adobe/creativesdk/aviary/internal/events/HistoryUndoRedoEvent;-><init>(Z)V

    invoke-virtual {v2, v3}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    :goto_50
    move v0, v1

    .line 70
    goto :goto_8

    .line 68
    :cond_52
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v0

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/events/HistoryUndoRedoEvent;

    invoke-direct {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/events/HistoryUndoRedoEvent;-><init>(Z)V

    invoke-virtual {v0, v2}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    goto :goto_50

    .line 73
    :cond_5f
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v0

    goto :goto_8
.end method

.method public setIsActive(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewUndoRedo;->mIsActive:Z

    .line 36
    return-void
.end method
