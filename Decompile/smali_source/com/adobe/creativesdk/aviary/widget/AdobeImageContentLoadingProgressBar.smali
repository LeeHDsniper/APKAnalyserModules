.class public Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;
.super Landroid/widget/ProgressBar;
.source "AdobeImageContentLoadingProgressBar.java"


# instance fields
.field private final mDelayedHide:Ljava/lang/Runnable;

.field private final mDelayedShow:Ljava/lang/Runnable;

.field private mDismissed:Z

.field private mStartTime:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x0

    .line 41
    invoke-direct {p0, p1, p2, v2}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mStartTime:J

    .line 18
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mDismissed:Z

    .line 19
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    .line 26
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar$2;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar$2;-><init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    .line 42
    return-void
.end method

.method static synthetic access$002(Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;J)J
    .registers 4
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;
    .param p1, "x1"    # J

    .prologue
    .line 14
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mStartTime:J

    return-wide p1
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;

    .prologue
    .line 14
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mDismissed:Z

    return v0
.end method

.method private removeCallbacks()V
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 59
    return-void
.end method


# virtual methods
.method public hide()V
    .registers 9

    .prologue
    const-wide/16 v6, 0x1f4

    .line 67
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mDismissed:Z

    .line 68
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 69
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mStartTime:J

    sub-long v0, v2, v4

    .line 70
    .local v0, "diff":J
    cmp-long v2, v0, v6

    if-gez v2, :cond_1e

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mStartTime:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_24

    .line 74
    :cond_1e
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->setVisibility(I)V

    .line 81
    :goto_23
    return-void

    .line 79
    :cond_24
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    sub-long v4, v6, v0

    invoke-virtual {p0, v2, v4, v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_23
.end method

.method public onAttachedToWindow()V
    .registers 1

    .prologue
    .line 46
    invoke-super {p0}, Landroid/widget/ProgressBar;->onAttachedToWindow()V

    .line 47
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->removeCallbacks()V

    .line 48
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 1

    .prologue
    .line 52
    invoke-super {p0}, Landroid/widget/ProgressBar;->onDetachedFromWindow()V

    .line 53
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->removeCallbacks()V

    .line 54
    return-void
.end method

.method public show()V
    .registers 5

    .prologue
    .line 89
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mStartTime:J

    .line 90
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mDismissed:Z

    .line 91
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mDelayedHide:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 92
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->mDelayedShow:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1f4

    invoke-virtual {p0, v0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageContentLoadingProgressBar;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 93
    return-void
.end method
