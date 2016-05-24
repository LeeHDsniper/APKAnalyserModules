.class Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$3;
.super Ljava/lang/Object;
.source "PackDetailLayout.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->onEventMainThread(Lcom/adobe/creativesdk/aviary/internal/events/DetailPaletteEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;Landroid/app/Activity;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    .prologue
    .line 276
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$3;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 279
    invoke-virtual {p1}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 280
    .local v0, "value":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->isValidContext()Z

    move-result v1

    if-eqz v1, :cond_23

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$3;->val$activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_23

    .line 281
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$3;->val$activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 284
    :cond_23
    return-void
.end method
