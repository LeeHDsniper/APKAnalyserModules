.class Lcom/adobe/android/ui/view/AdobeTutorialOverlay$4;
.super Ljava/lang/Object;
.source "AdobeTutorialOverlay.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->fadeIn()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;


# direct methods
.method constructor <init>(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    .prologue
    .line 518
    iput-object p1, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$4;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 534
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 526
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$4;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    const/4 v1, 0x1

    # setter for: Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->mVisible:Z
    invoke-static {v0, v1}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->access$002(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;Z)Z

    .line 527
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$4;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    invoke-virtual {v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->inAnimationCompleted()V

    .line 528
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$4;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    # invokes: Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->postActivate()V
    invoke-static {v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->access$100(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;)V

    .line 529
    return-void
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 539
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 521
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$4;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->setVisibility(I)V

    .line 522
    return-void
.end method
