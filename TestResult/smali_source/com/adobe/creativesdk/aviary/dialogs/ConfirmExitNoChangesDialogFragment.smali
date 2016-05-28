.class public Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "ConfirmExitNoChangesDialogFragment.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 20
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_discard_edits:I

    .line 21
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_discard:I

    new-instance v2, Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment$2;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment$2;-><init>(Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;)V

    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    new-instance v2, Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment$1;-><init>(Lcom/adobe/creativesdk/aviary/dialogs/ConfirmExitNoChangesDialogFragment;)V

    .line 30
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 37
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method
