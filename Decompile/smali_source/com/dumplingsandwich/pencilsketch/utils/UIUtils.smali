.class public Lcom/dumplingsandwich/pencilsketch/utils/UIUtils;
.super Ljava/lang/Object;
.source "UIUtils.java"


# direct methods
.method public static getLoadingIndicator(Landroid/content/Context;Ljava/lang/String;Z)Landroid/app/ProgressDialog;
    .registers 5
    .param p0, "calling_context"    # Landroid/content/Context;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cancelable"    # Z

    .prologue
    .line 10
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 11
    .local v0, "loadingIndicator":Landroid/app/ProgressDialog;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 12
    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 13
    invoke-virtual {v0, p2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 15
    return-object v0
.end method
