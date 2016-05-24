.class public Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserConfiguration;
.super Ljava/lang/Object;
.source "AdobeUXAssetBrowserConfiguration.java"


# instance fields
.field public cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field public dataSourceFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilter;

.field public designLibraryItemFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;

.field public mimeTypeFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;

.field public options:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
