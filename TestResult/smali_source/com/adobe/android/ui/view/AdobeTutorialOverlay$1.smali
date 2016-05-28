.class Lcom/adobe/android/ui/view/AdobeTutorialOverlay$1;
.super Ljava/lang/Object;
.source "AdobeTutorialOverlay.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->postActivate()V
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
    .line 360
    iput-object p1, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$1;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 363
    iget-object v0, p0, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$1;->this$0:Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    invoke-virtual {v0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->onActivate()V

    .line 364
    return-void
.end method
