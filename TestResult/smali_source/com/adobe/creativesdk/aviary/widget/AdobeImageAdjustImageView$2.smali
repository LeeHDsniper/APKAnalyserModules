.class Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;
.super Ljava/lang/Object;
.source "AdobeImageAdjustImageView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->straightenBy(DIJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

.field final synthetic val$destRotation:D

.field final synthetic val$newx:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;ID)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    .prologue
    .line 301
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->val$newx:I

    iput-wide p3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->val$destRotation:D

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 327
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 9
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    const/4 v6, 0x0

    .line 309
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->val$newx:I

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleWidth:I

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget v3, v3, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleHeight:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    float-to-int v2, v2

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->val$newx:I

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget v4, v4, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleWidth:I

    add-int/2addr v3, v4

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget v5, v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleHeight:I

    int-to-float v5, v5

    add-float/2addr v4, v5

    float-to-int v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 314
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->val$destRotation:D

    # invokes: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setStraightenRotation(D)V
    invoke-static {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$000(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;D)V

    .line 315
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iput-boolean v6, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRunning:Z

    .line 316
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 318
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->isReset:Z

    if-eqz v0, :cond_4f

    .line 319
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iput-boolean v6, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->straightenStarted:Z

    .line 320
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # invokes: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->onReset()V
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$100(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)V

    .line 322
    :cond_4f
    return-void
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 332
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 305
    return-void
.end method
