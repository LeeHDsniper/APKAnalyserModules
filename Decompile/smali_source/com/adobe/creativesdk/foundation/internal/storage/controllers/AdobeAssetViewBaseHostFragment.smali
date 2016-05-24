.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;
.super Landroid/support/v4/app/Fragment;
.source "AdobeAssetViewBaseHostFragment.java"


# instance fields
.field private _shouldUseDropDownActionBar:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;->_shouldUseDropDownActionBar:Z

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 37
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 39
    return-void
.end method

.method public onDestroy()V
    .registers 1

    .prologue
    .line 63
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 64
    return-void
.end method

.method public onDestroyView()V
    .registers 1

    .prologue
    .line 58
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroyView()V

    .line 59
    return-void
.end method

.method public onResume()V
    .registers 1

    .prologue
    .line 48
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    .line 49
    return-void
.end method

.method public onStart()V
    .registers 1

    .prologue
    .line 43
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    .line 44
    return-void
.end method

.method public onStop()V
    .registers 1

    .prologue
    .line 53
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    .line 54
    return-void
.end method

.method protected setShouldUseDropDownActionBar(Z)V
    .registers 2
    .param p1, "shouldUseDropDownActionBar"    # Z

    .prologue
    .line 33
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;->_shouldUseDropDownActionBar:Z

    .line 34
    return-void
.end method

.method protected useDropDownActionBar()Z
    .registers 2

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBaseHostFragment;->_shouldUseDropDownActionBar:Z

    return v0
.end method
