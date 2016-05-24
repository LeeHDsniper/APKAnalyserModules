.class Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$4;
.super Ljava/lang/Object;
.source "PacksListAdapter.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->animateBackgroundColor(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

.field final synthetic val$newDrawable:Landroid/graphics/drawable/ColorDrawable;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Landroid/graphics/drawable/ColorDrawable;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    .prologue
    .line 486
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$4;->this$0:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$4;->val$newDrawable:Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 489
    invoke-virtual {p1}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 490
    .local v0, "value":I
    sget-boolean v1, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_21:Z

    if-eqz v1, :cond_14

    .line 491
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$4;->val$newDrawable:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/ColorDrawable;->setTint(I)V

    .line 495
    :goto_13
    return-void

    .line 493
    :cond_14
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$4;->val$newDrawable:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/ColorDrawable;->setColor(I)V

    goto :goto_13
.end method
