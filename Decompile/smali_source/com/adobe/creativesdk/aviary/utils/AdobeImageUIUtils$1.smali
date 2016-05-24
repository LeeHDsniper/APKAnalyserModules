.class final Lcom/adobe/creativesdk/aviary/utils/AdobeImageUIUtils$1;
.super Ljava/lang/Object;
.source "AdobeImageUIUtils.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/utils/AdobeImageUIUtils;->animateTextColor(Landroid/widget/TextView;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$textView:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;)V
    .registers 2

    .prologue
    .line 39
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/utils/AdobeImageUIUtils$1;->val$textView:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 42
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/AdobeImageUIUtils$1;->val$textView:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 43
    return-void
.end method
