.class Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment$1;
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
    .line 31
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment$1;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 34
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 35
    return-void
.end method
