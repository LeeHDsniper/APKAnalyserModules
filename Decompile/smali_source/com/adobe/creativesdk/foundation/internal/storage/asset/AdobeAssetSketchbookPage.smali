.class public Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
.source "AdobeAssetSketchbookPage.java"


# instance fields
.field public _package:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

.field public pageNumber:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "number"    # I
    .param p3, "component"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;
    .param p4, "packageIn"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;->name:Ljava/lang/String;

    .line 21
    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;->pageNumber:I

    .line 22
    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getComponentId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;->GUID:Ljava/lang/String;

    .line 23
    invoke-virtual {p4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getHref()Ljava/net/URI;

    move-result-object v0

    if-eqz v0, :cond_63

    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getComponentId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_63

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getHref()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getComponentId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    :goto_3a
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;->href:Ljava/net/URI;

    .line 24
    invoke-virtual {p4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getHref()Ljava/net/URI;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;->parentHref:Ljava/net/URI;

    .line 25
    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getType()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;->type:Ljava/lang/String;

    .line 26
    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getEtag()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;->etag:Ljava/lang/String;

    .line 27
    invoke-virtual {p3}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXComponent;->getMd5()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;->md5Hash:Ljava/lang/String;

    .line 28
    invoke-virtual {p4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getCreationDate()Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;->creationDate:Ljava/util/Date;

    .line 29
    invoke-virtual {p4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getModificationDate()Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;->modificationDate:Ljava/util/Date;

    .line 30
    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;->_package:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .line 34
    return-void

    .line 23
    :cond_63
    const/4 v0, 0x0

    goto :goto_3a
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 39
    instance-of v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetSketchbookPage;

    if-eqz v0, :cond_9

    .line 40
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 42
    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method
