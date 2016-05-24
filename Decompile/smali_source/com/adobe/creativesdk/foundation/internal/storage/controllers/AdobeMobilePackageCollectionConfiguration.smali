.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeMobilePackageCollectionConfiguration;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
.source "AdobeMobilePackageCollectionConfiguration.java"


# instance fields
.field private targetCollectionHref:Ljava/lang/String;

.field private targetParentCollectionHref:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromBundle(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 44
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->createFromBundle(Landroid/os/Bundle;)V

    .line 45
    const-string v0, "mobilePackageCollectionHref"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeMobilePackageCollectionConfiguration;->targetCollectionHref:Ljava/lang/String;

    .line 46
    const-string v0, "mobilePackageCollectionParentHref"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeMobilePackageCollectionConfiguration;->targetParentCollectionHref:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public getTargetCollectionHref()Ljava/lang/String;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeMobilePackageCollectionConfiguration;->targetCollectionHref:Ljava/lang/String;

    return-object v0
.end method

.method public getTargetParentCollectionHref()Ljava/lang/String;
    .registers 2

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeMobilePackageCollectionConfiguration;->targetParentCollectionHref:Ljava/lang/String;

    return-object v0
.end method
