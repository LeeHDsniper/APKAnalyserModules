.class Lcom/adobe/android/ui/view/AdobeTutorialOverlay$2;
.super Ljava/lang/Object;
.source "AdobeTutorialOverlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->showDelayed(J)Z
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
    .line 412
    iput-object p1, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$2;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 415
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$2;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    invoke-virtual {v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->calculatePositions()V

    .line 416
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$2;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    invoke-virtual {v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->trackTutorialOpened()V

    .line 417
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$2;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    invoke-virtual {v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->doShow()V

    .line 418
    return-void
.end method
