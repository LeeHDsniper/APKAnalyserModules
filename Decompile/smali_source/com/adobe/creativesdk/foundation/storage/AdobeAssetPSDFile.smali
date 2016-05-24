.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSDFile;
.super Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;
.source "AdobeAssetPSDFile.java"


# instance fields
.field private _layerRenditionRequest:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

.field private _layerRenditionRequests:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;",
            ">;"
        }
    .end annotation
.end field

.field private _previewPSDCompositeRequest:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

.field private _pullPSDCompositeRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

.field private _pushPSDCompositeRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

.field private final lock:Ljava/util/concurrent/locks/Lock;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    .registers 5
    .param p1, "item"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;
    .param p2, "parentCollection"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .prologue
    const/4 v1, 0x0

    .line 811
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceItem;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 83
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSDFile;->_layerRenditionRequests:Ljava/util/LinkedHashMap;

    .line 84
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSDFile;->_layerRenditionRequest:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 85
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSDFile;->lock:Ljava/util/concurrent/locks/Lock;

    .line 962
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSDFile;->_pullPSDCompositeRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 963
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSDFile;->_pushPSDCompositeRequestHandle:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 964
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPSDFile;->_previewPSDCompositeRequest:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 812
    return-void
.end method
