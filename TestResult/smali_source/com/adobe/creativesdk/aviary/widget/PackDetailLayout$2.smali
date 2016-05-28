.class Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$2;
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

.field final synthetic val$newDrawable:Landroid/graphics/drawable/ColorDrawable;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;Landroid/graphics/drawable/ColorDrawable;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    .prologue
    .line 256
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$2;->val$newDrawable:Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 259
    invoke-virtual {p1}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 260
    .local v0, "value":I
    sget-boolean v1, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_21:Z

    if-eqz v1, :cond_14

    .line 261
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$2;->val$newDrawable:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/ColorDrawable;->setTint(I)V

    .line 265
    :goto_13
    return-void

    .line 263
    :cond_14
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$2;->val$newDrawable:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/ColorDrawable;->setColor(I)V

    goto :goto_13
.end method
