.class public final Lcom/adobe/creativesdk/aviary/utils/AdobeImageUIUtils;
.super Ljava/lang/Object;
.source "AdobeImageUIUtils.java"


# direct methods
.method public static animateTextColor(Landroid/widget/TextView;IJ)V
    .registers 10
    .param p0, "textView"    # Landroid/widget/TextView;
    .param p1, "color"    # I
    .param p2, "duration"    # J

    .prologue
    .line 37
    new-instance v1, Lcom/nineoldandroids/animation/ArgbEvaluator;

    invoke-direct {v1}, Lcom/nineoldandroids/animation/ArgbEvaluator;-><init>()V

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->ofObject(Lcom/nineoldandroids/animation/TypeEvaluator;[Ljava/lang/Object;)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    .line 38
    .local v0, "animator":Lcom/nineoldandroids/animation/ValueAnimator;
    new-instance v1, Lcom/adobe/creativesdk/aviary/utils/AdobeImageUIUtils$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/utils/AdobeImageUIUtils$1;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 46
    invoke-virtual {v0, p2, p3}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 47
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 48
    return-void
.end method

.method public static createModalLoaderToast(Landroid/content/Context;)Lcom/adobe/android/ui/widget/AdobeCustomToast;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_modal_progress_view:I

    const/4 v2, -0x1

    invoke-static {p0, v1, v2}, Lcom/adobe/android/ui/widget/AdobeCustomToast;->make(Landroid/content/Context;II)Lcom/adobe/android/ui/widget/AdobeCustomToast;

    move-result-object v0

    .line 33
    .local v0, "mToastLoader":Lcom/adobe/android/ui/widget/AdobeCustomToast;
    return-object v0
.end method
