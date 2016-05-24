.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter;
.super Landroid/support/v4/app/FragmentStatePagerAdapter;
.source "AdobeUXPhotoAssetOneUpViewerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AdobeUXPhotoAssetViewerAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/support/v4/app/FragmentManager;)V
    .registers 2
    .param p1, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;

    .prologue
    .line 569
    invoke-direct {p0, p1}, Landroid/support/v4/app/FragmentStatePagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    .line 570
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 574
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobePhotoAssetViewerController;->count()I

    move-result v0

    return v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 579
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;->newInstance(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXPhotoAssetOneUpViewerActivity$AdobeUXPhotoAssetViewerAdapter$AdobeUXPhotoAssetViewerAssetFragment;

    move-result-object v0

    return-object v0
.end method
