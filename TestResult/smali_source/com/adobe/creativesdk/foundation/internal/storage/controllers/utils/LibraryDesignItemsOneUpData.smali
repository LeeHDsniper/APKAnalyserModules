.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/LibraryDesignItemsOneUpData;
.super Ljava/lang/Object;
.source "LibraryDesignItemsOneUpData.java"


# instance fields
.field public _itemsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;",
            ">;"
        }
    .end annotation
.end field

.field public library:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

.field public startIndex:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
