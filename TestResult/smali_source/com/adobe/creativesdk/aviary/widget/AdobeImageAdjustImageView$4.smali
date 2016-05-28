.class Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;
.super Ljava/lang/Object;
.source "AdobeImageAdjustImageView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->rotateBy(DJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

.field final synthetic val$destRotation:D


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;D)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    .prologue
    .line 834
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;->val$destRotation:D

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 860
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 7
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    const/4 v4, 0x1

    .line 842
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;->val$destRotation:D

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angle360(D)D

    move-result-wide v2

    iput-wide v2, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    .line 843
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-wide v2, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    # invokes: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setImageRotation(DZ)V
    invoke-static {v0, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$200(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;DZ)V

    .line 844
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iput-boolean v4, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->initStraighten:Z

    .line 845
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRunning:Z

    .line 847
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 848
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->printDetails()V

    .line 850
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->isReset:Z

    if-eqz v0, :cond_33

    .line 851
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # invokes: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->onReset()V
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$100(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)V

    .line 855
    :goto_32
    return-void

    .line 853
    :cond_33
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$4;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    const/16 v1, 0x190

    const/16 v2, 0x12c

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->fadeInOutlines(II)V

    goto :goto_32
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 865
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 838
    return-void
.end method
