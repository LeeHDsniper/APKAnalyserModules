.class Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel$1;
.super Ljava/lang/Object;
.source "OverlaysPanel.java"

# interfaces
.implements Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;->renderEffect(Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;IF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;

    .prologue
    .line 124
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;)V
    .registers 2
    .param p1, "overlay"    # Lcom/adobe/android/ui/view/AdobeTutorialOverlay;

    .prologue
    .line 127
    invoke-virtual {p1}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;->dismiss()V

    .line 128
    return-void
.end method
