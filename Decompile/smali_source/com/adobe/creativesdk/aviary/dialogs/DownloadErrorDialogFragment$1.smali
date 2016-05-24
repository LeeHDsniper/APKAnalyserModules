.class Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment$1;
.super Ljava/lang/Object;
.source "DownloadErrorDialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment$1;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 28
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment$1;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/app/ActivityCompat;->finishAfterTransition(Landroid/app/Activity;)V

    .line 29
    return-void
.end method
