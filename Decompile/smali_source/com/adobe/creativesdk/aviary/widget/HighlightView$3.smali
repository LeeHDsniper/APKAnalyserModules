.class Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;
.super Ljava/lang/Object;
.source "HighlightView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/HighlightView;->fadeIn(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

.field final synthetic val$alpha1:I

.field final synthetic val$alpha2:I

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/HighlightView;IILandroid/view/View;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .prologue
    .line 755
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->val$alpha1:I

    iput p3, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->val$alpha2:I

    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->val$view:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 6
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    const/high16 v3, 0x437f0000

    .line 758
    invoke-virtual {p1}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 759
    .local v0, "value":F
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlineFill:Landroid/graphics/Paint;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->access$200(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/Paint;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->val$alpha1:I

    int-to-float v2, v2

    mul-float/2addr v2, v0

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 760
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->access$300(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/Paint;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->val$alpha2:I

    int-to-float v2, v2

    mul-float/2addr v2, v0

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 761
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomLeft:Landroid/graphics/drawable/Drawable;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->access$400(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    mul-float v2, v0, v3

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 762
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableBottomRight:Landroid/graphics/drawable/Drawable;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->access$500(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    mul-float v2, v0, v3

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 763
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopLeft:Landroid/graphics/drawable/Drawable;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->access$600(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    mul-float v2, v0, v3

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 764
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/HighlightView;->mKnobDrawableTopRight:Landroid/graphics/drawable/Drawable;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->access$700(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    mul-float v2, v0, v3

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 766
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->val$view:Landroid/view/View;

    if-eqz v1, :cond_61

    .line 767
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/HighlightView$3;->val$view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->postInvalidate()V

    .line 769
    :cond_61
    return-void
.end method
