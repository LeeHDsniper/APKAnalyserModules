.class Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$1;
.super Ljava/lang/Object;
.source "DrawableHighlightView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->flipHorizontal()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

.field final synthetic val$flipped:Z


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;Z)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 604
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    iput-boolean p2, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$1;->val$flipped:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 616
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 610
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->access$000(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 611
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->mContent:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->access$000(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v1

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$1;->val$flipped:Z

    if-nez v0, :cond_17

    const/4 v0, 0x1

    :goto_13
    invoke-interface {v1, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->setHorizontalFlip(Z)V

    .line 613
    :cond_16
    return-void

    .line 611
    :cond_17
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 619
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 606
    return-void
.end method
