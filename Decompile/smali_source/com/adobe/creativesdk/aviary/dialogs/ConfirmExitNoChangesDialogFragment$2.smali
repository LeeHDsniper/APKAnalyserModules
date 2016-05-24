.class Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment$2;
.super Ljava/lang/Object;
.source "ConfirmExitNoChangesDialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment$2;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 26
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment$2;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onBackPressed(Z)V

    .line 27
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 28
    return-void
.end method
