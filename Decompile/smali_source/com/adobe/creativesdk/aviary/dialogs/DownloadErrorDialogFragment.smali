.class public Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "DownloadErrorDialogFragment.java"


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

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_attention:I

    .line 21
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_error_download_image_message:I

    .line 22
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    new-instance v2, Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment$1;-><init>(Lcom/adobe/creativesdk/aviary/dialogs/DownloadErrorDialogFragment;)V

    .line 24
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method
