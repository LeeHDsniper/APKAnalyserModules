.class Lcom/adobe/android/ui/view/AdobeTutorialOverlay$3;
.super Ljava/lang/Object;
.source "AdobeTutorialOverlay.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->fadeOut(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

.field final synthetic val$from:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;Ljava/lang/String;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    .prologue
    .line 488
    iput-object p1, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$3;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    iput-object p2, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$3;->val$from:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 503
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 495
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$3;->val$from:Ljava/lang/String;

    if-eqz v0, :cond_b

    .line 496
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$3;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    iget-object v1, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$3;->val$from:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->trackTutorialClosed(Ljava/lang/String;)V

    .line 498
    :cond_b
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$3;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    invoke-virtual {v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->dismiss()V

    .line 499
    return-void
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 507
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 491
    return-void
.end method
