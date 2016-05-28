.class Lcom/adobe/creativesdk/aviary/panels/StickersPanel$3;
.super Ljava/lang/Object;
.source "StickersPanel.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->askToLeaveWithoutApply()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/StickersPanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    .prologue
    .line 816
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$3;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 819
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$3;->this$0:Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->cancel()V

    .line 820
    return-void
.end method
