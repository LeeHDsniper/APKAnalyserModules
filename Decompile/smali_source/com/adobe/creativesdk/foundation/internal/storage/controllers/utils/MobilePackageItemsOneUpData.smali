.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/MobilePackageItemsOneUpData;
.super Ljava/lang/Object;
.source "MobilePackageItemsOneUpData.java"


# instance fields
.field public _itemsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;",
            ">;"
        }
    .end annotation
.end field

.field public _packagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

.field public startIndex:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
