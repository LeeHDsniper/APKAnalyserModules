.class Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$3;
.super Ljava/lang/Object;
.source "BlemishOverlay.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->generateInAnimation()Lcom/nineoldandroids/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$3;->this$0:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 159
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 3
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 154
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay$3;->this$0:Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;

    # invokes: Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->onAnimationComplete()V
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;->access$000(Lcom/adobe/creativesdk/aviary/overlays/BlemishOverlay;)V

    .line 155
    return-void
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 163
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 150
    return-void
.end method
