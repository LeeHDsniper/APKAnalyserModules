.class Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;
.super Ljava/lang/Object;
.source "AdobeImageAdjustImageView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


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

.field final synthetic val$deltax:F

.field final synthetic val$newPosition:D

.field final synthetic val$srcRotation:D

.field final synthetic val$srcx:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;IFDD)V
    .registers 8
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    .prologue
    .line 285
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->val$srcx:I

    iput p3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->val$deltax:F

    iput-wide p4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->val$srcRotation:D

    iput-wide p6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->val$newPosition:D

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 10
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 288
    invoke-virtual {p1}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 290
    .local v0, "value":F
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mStraightenDrawable:Landroid/graphics/drawable/Drawable;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->val$srcx:I

    int-to-float v2, v2

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->val$deltax:F

    mul-float/2addr v3, v0

    add-float/2addr v2, v3

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget v3, v3, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleWidth:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    float-to-int v2, v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget v4, v4, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleHeight:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    float-to-int v3, v3

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->val$srcx:I

    int-to-float v4, v4

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->val$deltax:F

    mul-float/2addr v5, v0

    add-float/2addr v4, v5

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget v5, v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleWidth:I

    int-to-float v5, v5

    add-float/2addr v4, v5

    float-to-int v4, v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->imageCaptureRegion:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget v6, v6, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->handleHeight:I

    int-to-float v6, v6

    add-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 296
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->val$srcRotation:D

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->val$newPosition:D

    float-to-double v6, v0

    mul-double/2addr v4, v6

    add-double/2addr v2, v4

    # invokes: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setStraightenRotation(D)V
    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$000(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;D)V

    .line 297
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 298
    return-void
.end method
